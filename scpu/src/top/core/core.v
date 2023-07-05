`timescale 1ns / 1ps

module Core(
    input  wire        clk,
    input  wire        aresetn,
    input  wire        step,
    input  wire        debug_mode,
    input  wire [4:0]  debug_reg_addr, 

    output wire [31:0] address,       // 我并没有管这个信�?
    output wire [31:0] data_out,      // 我也没有管这个信�?
    input  wire [31:0] data_in,       // 这个信号我也没有�?
    input  wire [31:0] chip_debug_in, // 我并没有管这个信�?
    
    output wire [31:0] chip_debug_out0, // pc
    output wire [31:0] chip_debug_out1, // addr_out, 是写入内存的地址
    output wire [31:0] chip_debug_out2, // the register data of reg[debug_reg_addr], that is 寄存器数�??
    output wire [31:0] chip_debug_out3,  // the instruction of the current pc

    output VGA_HS_O,
    output VGA_VS_O,
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B
);
    wire rst, mem_write, mem_clk, cpu_clk;
    wire [31:0] inst;

    wire [63:0] addr_out;
    wire [31:0] pc_out;
    wire [63:0] core_data_out,core_data_in;
    reg  [31:0] clk_div;
    wire [63:0] debug_reg_data;
    wire [31:0] mmu_input_inst;
    
    reg[31:0] pc_out_div=0;
    always @(pc_out)
    begin
        pc_out_div = pc_out/4;
    end

    reg[63:0] addr_out_div=0;
    always @(addr_out)
    begin
        addr_out_div = addr_out/4;
    end


    wire flush;
    wire [63:0] satp_data;
    wire write_mem_valid;
    wire vir_valid;
    wire mem_valid;

    wire mmu_data_ready;
    
    assign rst = ~aresetn;
    SCPU cpu(
        .clk(cpu_clk),  // 50MHz
        .rst(rst),      // 代表复位信号
        .inst(inst),    // 从内存读出的指令
        .data_in(core_data_in),      // 从内存读出的数据
        .debug_reg_addr(debug_reg_addr),

        .addr_out(addr_out),         // 写入内存的地�?
        .data_out(core_data_out),    // 写入内存的数�?
        .pc_out(pc_out),             // PC寄存器的�?
        .scpu_output_mem_inst(mmu_input_inst), // 写入内存的指�?
        .mem_write(mem_write),       // 写入内存的使能信�?
        .debug_reg_data(debug_reg_data),

        .flush(flush),
        .satp_data(satp_data),
        .write_mem_valid(write_mem_valid),
        .vir_valid(vir_valid),
        .mem_valid(mem_valid),

        .mmu_data_ready(mmu_data_ready)
    );
    
    always @(posedge clk) begin
        if(rst) clk_div = 0;
        else clk_div = clk_div + 1;
    end
    
    assign mem_clk = ~clk_div[0]; // 50mhz
    assign cpu_clk = debug_mode ? clk_div[0] : step;
    
    wire [31:0] mmu_input_inst;
    wire [31:0] mmu_output_inst;

    wire [63:0] ram_unit_data_output;

    wire [63:0] ram_unit_input_addr;
    wire [63:0] ram_unit_input_data;
    wire ram_mem_write;

    mmu u_mmu(
        .clk(mem_clk),
        .rst(rst),
        .flush(flush),

        .mem_addr(addr_out),
        .satp_val(satp_data),
        .data_to_write(core_data_out),
        .write_mem_valid(write_mem_valid),
        .mem_valid(mem_valid),
        .vir_valid(vir_valid),
        .datapath_mem_inst(mmu_input_inst),

        .data_from_mem(ram_unit_data_output),

        .mem_read_addr(ram_unit_input_addr),
        .mem_data(ram_unit_input_data),
        .mem_write_signal(ram_mem_write),

        .mem_content(core_data_in),
        .finish(mmu_data_ready),
        .mem_inst(mmu_output_inst)
    );


    // instruction memory
    myRom rom_unit(
        .address(pc_out_div), // 地址输入
        .out(inst) // 命令输出
    );

    // data memory
    myRam ram_unit (
        .clk(mem_clk), // 时钟输入
        .we(ram_mem_write), // 写使能输�?
        .write_data(ram_unit_input_data), // 数据输入
        .myraminput_inst(mmu_output_inst), // mem 阶段此时的指�?
        .address(ram_unit_input_addr), // 地址输入，这次不�?/4
        .read_data(ram_unit_data_output) // 数据输出
    );

    vga_dma lemon_vga_dma(
        .clk(clk),
        .aresetn(aresetn),
        .cpu_addr_out(addr_out),
        .vga_dma_data_in(core_data_out),
        .VGA_HS_O(VGA_HS_O),
        .VGA_VS_O(VGA_VS_O),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B)
    );

    assign chip_debug_out0 = pc_out;
    assign chip_debug_out1 = addr_out;
    assign chip_debug_out2 = debug_reg_data;
    assign chip_debug_out3 = inst;



endmodule
