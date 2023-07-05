module virtual_valid(
    input [63:0] satp_value,
    output reg virtual_valid
);

initial begin
    virtual_valid = 0;
end

always @(*) begin
    if(satp_value[63:44] == 20'b0) begin
        virtual_valid = 0;
    end else begin
        virtual_valid = 1;
    end
end

endmodule