module MEMWBREG (
    input clk,
    input rst,
    input [2:0] memwbin_wb,
    input [63:0] memwbin_mem_data_in,
    input [63:0] memwbin_mem_alu_result,
    input [4:0] memwbin_mem_rd_addr,
    input [63:0] memwbin_mem_imm,
    input [31:0] memwbin_mem_pc_addr0,
    input [31:0] memwbin_mem_inst,
    input [31:0] memwbin_mem_pc_out,

    output [2:0] memwbout_wb_wb,
    output [63:0] memwbout_wb_data_in,
    output [63:0] memwbout_wb_alu_result,
    output [63:0] memwbout_wb_imm,
    output [4:0] memwbout_wb_rd_addr,
    output [31:0] memwbout_wb_pc_addr0,
    output [31:0] memwbout_wb_inst,
    output [31:0] memwbout_wb_pc_out
);

    reg [2:0] memwbout_wb_wb_reg;
    reg [63:0] memwbout_wb_data_in_reg;
    reg [63:0] memwbout_wb_alu_result_reg;
    reg [63:0] memwbout_wb_imm_reg;
    reg [4:0] memwbout_wb_rd_addr_reg;
    reg [31:0] memwbout_wb_pc_addr0_reg;
    reg [31:0] memwbout_wb_inst_reg;
    reg [31:0] memwbout_wb_pc_out_reg;

    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            memwbout_wb_wb_reg <= 4'b0000;
            memwbout_wb_data_in_reg <= 64'b0;
            memwbout_wb_alu_result_reg <= 64'b0;
            memwbout_wb_imm_reg <= 64'b0;
            memwbout_wb_rd_addr_reg <= 5'b0;
            memwbout_wb_pc_addr0_reg <= 32'b0;
            memwbout_wb_inst_reg <= 32'h00000013;
            memwbout_wb_pc_out_reg <= 32'h00000000;
        end
        else
        begin
            memwbout_wb_wb_reg <= memwbin_wb;
            memwbout_wb_data_in_reg <= memwbin_mem_data_in;
            memwbout_wb_alu_result_reg <= memwbin_mem_alu_result;
            memwbout_wb_imm_reg <= memwbin_mem_imm;
            memwbout_wb_rd_addr_reg <= memwbin_mem_rd_addr;
            memwbout_wb_pc_addr0_reg <= memwbin_mem_pc_addr0;
            memwbout_wb_inst_reg <= memwbin_mem_inst;
            memwbout_wb_pc_out_reg <= memwbin_mem_pc_out;
        end
    end

    assign memwbout_wb_wb = memwbout_wb_wb_reg;
    assign memwbout_wb_data_in = memwbout_wb_data_in_reg;
    assign memwbout_wb_alu_result = memwbout_wb_alu_result_reg;
    assign memwbout_wb_imm = memwbout_wb_imm_reg;
    assign memwbout_wb_rd_addr = memwbout_wb_rd_addr_reg;
    assign memwbout_wb_pc_addr0 = memwbout_wb_pc_addr0_reg;
    assign memwbout_wb_inst = memwbout_wb_inst_reg;
    assign memwbout_wb_pc_out = memwbout_wb_pc_out_reg;

endmodule