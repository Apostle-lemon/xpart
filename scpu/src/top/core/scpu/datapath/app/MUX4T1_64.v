// `timescale 1ns / 1ps

module MUX4T1_64(
    input [63:0]  data_in_0,
    input [63:0]  data_in_1,
    input [63:0]  data_in_2,
    input [63:0]  data_in_3,
    input [1:0] sel,
    output [63:0] data_out
);
    reg[63:0] output_data = 0;
    always @(*) begin
        case(sel)
            2'b00: output_data = data_in_0;
            2'b01: output_data = data_in_1;
            2'b10: output_data = data_in_2;
            2'b11: output_data = data_in_3;
            default : output_data = data_in_0;
        endcase
    end
    assign data_out = output_data;
    
endmodule