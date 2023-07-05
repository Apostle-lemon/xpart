module mem_valid(
    input [31:0] mem_inst,
    output reg mem_valid
);

always @(*) begin
    if(mem_inst[6:0] == 7'b0000011) begin
        mem_valid = 1;
    end else if(mem_inst[6:0] == 7'b0100011) begin
        mem_valid = 1;
    end else begin
        mem_valid = 0;
    end
end

endmodule