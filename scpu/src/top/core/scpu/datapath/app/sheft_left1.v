module SHEFT_LEFT1(
    input [63:0] in_data,
    output [63:0] out_data
);
    assign out_data = in_data<<1;
endmodule