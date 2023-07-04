`timescale 1ns / 1ps

module SCPU(
    input         clk,
    input         rst,
    input  [31:0] inst,
    input  [63:0] data_in,  // data from data memory
    input [4:0] debug_reg_addr,

    // outputs
    output [63:0] addr_out, // data memory address
    output [63:0] data_out, // data to data memory
    output [31:0] pc_out,   // connect to instruction memory
    output [31:0] scpu_output_mem_inst,
    output        mem_write,
    output[63:0] debug_reg_data
);

    Datapath datapath (
        .clk(clk),
        .rst(rst),

        .inst_in(inst),
        .data_in(data_in),

        // output
        .addr_out(addr_out),
        .data_out(data_out),
        .pc_out(pc_out),
        .datapathoutput_mem_inst(scpu_output_mem_inst),
        .mem_write(mem_write),
        .debug_reg_addr(debug_reg_addr),
        .debug_reg_data(debug_reg_data)
    );
    
endmodule
