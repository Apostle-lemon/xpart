`timescale 1ns / 1ps

module Core(
    input  wire        clk,
    input  wire        aresetn,
    input  wire        step,
    input  wire        debug_mode,
    input  wire [4:0]  debug_reg_addr, 

    output wire [31:0] address,       // 我并没有管这个信号
    output wire [31:0] data_out,      // 我也没有管这个信号
    input  wire [31:0] data_in,       // 这个信号我也没有管
    input  wire [31:0] chip_debug_in, // 我并没有管这个信号
    
    output wire [31:0] chip_debug_out0, // pc
    output wire [31:0] chip_debug_out1, // addr_out, 是写入内存的地址
    output wire [31:0] chip_debug_out2, // the register data of reg[debug_reg_addr], that is 寄存器数�?
    output wire [31:0] chip_debug_out3  // the instruction of the current pc
    
);
    wire rst, mem_write, mem_clk, cpu_clk;
    wire [31:0] inst;

    wire [31:0] addr_out, pc_out;
    wire [63:0] core_data_out,core_data_in;
    reg  [31:0] clk_div;
    wire [63:0] debug_reg_data;
    wire [31:0] myram_input_inst;
    
    reg[31:0] pc_out_div=0;
    always @(pc_out)
    begin
        pc_out_div <= pc_out/4;
    end

    reg[31:0] addr_out_div=0;
    always @(addr_out)
    begin
        addr_out_div <= addr_out/4;
    end

    
    assign rst = ~aresetn;
    SCPU cpu(
        .clk(cpu_clk),  // 50MHz
        .rst(rst),      // 代表复位信号
        .inst(inst),    // 从内存读出的指令
        .data_in(core_data_in),      // 从内存读出的数据
        .debug_reg_addr(debug_reg_addr),

        .addr_out(addr_out),         // 写入内存的地址
        .data_out(core_data_out),    // 写入内存的数据
        .pc_out(pc_out),             // PC寄存器的值
        .scpu_output_mem_inst(myram_input_inst), // 写入内存的指令
        .mem_write(mem_write),       // 写入内存的使能信号
        .debug_reg_data(debug_reg_data)
    );
    
    always @(posedge clk) begin
        if(rst) clk_div <= 0;
        else clk_div <= clk_div + 1;
    end
    
    assign mem_clk = ~clk_div[0]; // 50mhz
    assign cpu_clk = debug_mode ? clk_div[0] : step;
    
    // instruction memory
    myRom rom_unit(
        .address(pc_out_div), // 地址输入
        .out(inst) // 命令输出
    );

    // data memory
    myRam ram_unit (
        .clk(mem_clk), // 时钟输入
        .we(mem_write), // 写使能输入
        .write_data(core_data_out), // 数据输入
        .myraminput_inst(myram_input_inst), // mem 阶段此时的指令
        .address(addr_out[10:0]), // 地址输入，这次不用/4
        .read_data(core_data_in) // 数据输出
    );

    assign chip_debug_out0 = pc_out;
    assign chip_debug_out1 = addr_out;
    assign chip_debug_out2 = debug_reg_data;
    assign chip_debug_out3 = inst;

endmodule
