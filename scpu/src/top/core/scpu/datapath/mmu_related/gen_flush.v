module gen_flush(
    input [31:0] mem_inst,
    output flush
);

    wire [11:0] mem_11_0 = mem_inst[11:0];
    wire [6:0] mem_31_25 = mem_inst[31:25];

    reg flush_reg;

    always@(*) begin
        if(mem_11_0==12'b000000001110011 && mem_31_25==7'b0001001) begin
            flush_reg = 1;
        end else begin
            flush_reg = 0;
        end
    end

    assign flush = flush_reg;

endmodule