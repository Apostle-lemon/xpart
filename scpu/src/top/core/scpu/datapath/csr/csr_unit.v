module CSR_UNIT(
    input csrin_write,
    input clk,
    input rst,
    input [63:0] csrin_write_data,
    input [31:0] csrin_id_inst,
    input [31:0] csrin_ex_inst,
    input [31:0] csrin_pc_out, // ecall 指令的地址
    output [63:0] csrout_csr_data,
    output [63:0] mtvec_data,
    output [63:0] mepc_data,
    output [63:0] mstatus_data,
    output [63:0] mcause_data,

    output [63:0] stvec_data,
    output [63:0] sepc_data,
    output [63:0] sstatus_data,
    output [63:0] scause_data,
    output [63:0] satp_data
);

// 在每次 postedg 时，读取对应 csr 的值放到 csrout_csr_data
// 在每次 negedge 时，根据 csrin_write 使能信号，确定是否写入 csr

reg [63:0] csrout_csr_data_reg;

    `include "csr_name.vh"

// parameter mtvec = 12'h305,
//           mepc  = 12'h341,
//           mstatus = 12'h300;

reg [63:0] mtvec_reg;
reg [63:0] mepc_reg;
reg [63:0] mstatus_reg;
reg [63:0] mcause_reg;
reg [63:0] stvec_reg;
reg [63:0] sepc_reg;
reg [63:0] sstatus_reg;
reg [63:0] scause_reg;
reg [63:0] satp_reg;

// 读操作
always @(posedge clk) begin
    case(csrin_id_inst[31:20])
        mtvec: csrout_csr_data_reg = mtvec_reg;
        mepc: csrout_csr_data_reg = mepc_reg;
        mstatus: csrout_csr_data_reg = mstatus_reg;
        mcause: csrout_csr_data_reg = mcause_reg;
        stvec: csrout_csr_data_reg = stvec_reg;
        sepc: csrout_csr_data_reg = sepc_reg;
        sstatus: csrout_csr_data_reg = sstatus_reg;
        scause: csrout_csr_data_reg = scause_reg;
        satp: csrout_csr_data_reg = satp_reg;
        default: csrout_csr_data_reg = 64'h0;
    endcase
end

// 写入
// 若源通用寄存器为x0或立即数0不会进行写入CSR操作。
always @(negedge clk) begin
    if(csrin_write) begin // 如果存在写入操作
        case(csrin_ex_inst[31:20]) // 根据写入的地址，确定写入的寄存器
            mtvec: mtvec_reg = csrin_write_data==0 ? mtvec_reg : csrin_write_data;
            mepc: mepc_reg = csrin_write_data==0 ? mepc_reg : csrin_write_data;
            mstatus: mstatus_reg = csrin_write_data==0 ? mstatus_reg : csrin_write_data;
            mcause: mcause_reg = csrin_write_data==0 ? mcause_reg : csrin_write_data;
            stvec: stvec_reg = csrin_write_data==0 ? stvec_reg : csrin_write_data;
            sepc: sepc_reg = csrin_write_data==0 ? sepc_reg : csrin_write_data;
            sstatus: sstatus_reg = csrin_write_data==0 ? sstatus_reg : csrin_write_data;
            scause: scause_reg = csrin_write_data==0 ? scause_reg : csrin_write_data;
            satp: satp_reg = csrin_write_data==0 ? satp_reg : csrin_write_data;
            12'hc00: begin 
                if (csrin_ex_inst == 32'hc0001073) begin // unimp
                    mepc_reg = csrin_pc_out; // 将 mepc 寄存器的值更新为 unimp 的地址
                    mcause_reg = {1'b0,31'd2};
                    sepc_reg = csrin_pc_out; // 将 sepc 寄存器的值更新为 unimp 的地址
                    scause_reg = {1'b0,31'd2};
                end else begin
                    csrout_csr_data_reg = csrout_csr_data_reg; // 读的内容不变，不然会影响传入 EXMEM 的数据
                end
            end
            12'b0: begin
                if (csrin_ex_inst == 32'h73) begin // ecall
                    mepc_reg = csrin_pc_out; // 将 mepc 寄存器的值更新为 ecall 的地址
                    mcause_reg = {1'b0,31'd11};
                    sepc_reg = csrin_pc_out;
                    scause_reg = {1'b0,31'd11};
                end else begin
                    csrout_csr_data_reg = csrout_csr_data_reg; // 读的内容不变，不然会影响传入 EXMEM 的数据
                end
            end
            default: csrout_csr_data_reg = csrout_csr_data_reg; // 读的内容不变
        endcase
    end
end

always @(posedge rst) begin
    mtvec_reg <= 64'h0;
    mepc_reg <= 64'h0;
    mstatus_reg <= 64'h0;
    mcause_reg <= 64'h0;
    stvec_reg <= 64'h0;
    sepc_reg <= 64'h0;
    sstatus_reg <= 64'h0;
    scause_reg <= 64'h0;
    satp_reg <= 64'h0;
end

assign csrout_csr_data = csrout_csr_data_reg;
assign mtvec_data = mtvec_reg;
assign mepc_data = mepc_reg;
assign mstatus_data = mstatus_reg;
assign mcause_data = mcause_reg;
assign stvec_data = stvec_reg;
assign sepc_data = sepc_reg;
assign sstatus_data = sstatus_reg;
assign scause_data = scause_reg;
assign satp_data = satp_reg;

endmodule