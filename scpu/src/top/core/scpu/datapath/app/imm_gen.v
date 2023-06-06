// get the immediate number from the riscv instruction
module ImmGen(
    input [31:0] inst,
    output [63:0] im
);

    // get the immediate number according to the instruction type
    reg [63:0] imm = 0;
    always @(*)
    begin
        case (inst[6:0])
            // addi,slti,andi,ori
            // signal extension
            //7'b0010011: imm = inst[31:20];
            7'b0010011: imm = {inst[31]==1?52'hfffffffffffff:52'b0, inst[31:20]};
            // lui
            7'b0110111: imm = {inst[31]==1?32'hffffffff:32'b0,inst[31:12],12'h000};
            // jal
            7'b1101111: imm = {inst[31]==1?44'hfffffffffff:44'b0, inst[31],inst[19:12],inst[20],inst[30:21]};
            // beq,bne // 注意这里并没有写错，因为在 ex_add 里边有一个移位操作
            7'b1100011: imm = {inst[31]==1?52'hfffffffffffff:52'b0,inst[31],inst[7],inst[30:25],inst[11:8]};
            // lw
            7'b0000011: imm = {inst[31]==1?52'hfffffffffffff:52'b0, inst[31:20]};
            // sw
            7'b0100011: imm = {52'b0, inst[31:25], inst[11:7]};
            // jalr
            7'b1100111: imm = {inst[31]==1?52'hfffffffffffff:52'b0, inst[31:20]};
            // auipc
            7'b0010111: imm = {inst[31]==1?32'hffffffff:32'b0,inst[31:12],12'h000};
            default: imm = 0;
        endcase
    end
    assign im = imm;
endmodule