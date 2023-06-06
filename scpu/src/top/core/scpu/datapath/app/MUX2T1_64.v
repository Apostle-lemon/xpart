`timescale 1ns / 1ps

// select 1 from 2 32bit input
module MUX2T1_64(
    input [63:0] in_data_1,
    input [63:0] in_data_2,
    input sel,
    output [63:0] out_data
);
    assign out_data = (sel == 0) ? in_data_1 : in_data_2;

endmodule