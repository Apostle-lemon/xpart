// this is a ALU module
module ALU(
    input [63:0] a,
    input [63:0] b,
    input [3:0] alu_op,
    input [31:0] inst,
    input [31:0] pc,
    output [63:0] res,
    output wire zero
);
    `include "alu_op.vh"

    reg [63:0] res_reg;
    reg [63:0] temp_reg;

    always @(*) begin
        temp_reg = 0;
        if(inst[6:0] == 7'b0110111) begin //lui
            res_reg = {inst[31]==1?32'hffffffff:32'b0,inst[31:12], 12'b0};
        end else if(inst[6:0] == 7'b0011011) begin // addiw, slliw
            case(inst[14:12])
                3'b000: begin // addiw
                    temp_reg = a[31:0] + b[31:0];
                    res_reg = {temp_reg[31] == 1 ? 32'hffffffff:32'b0, temp_reg[31:0]};
                end
                3'b001: begin // slliw
                    temp_reg = inst[25:20]; // shamt
                    res_reg = a << temp_reg;
                    temp_reg = res_reg[31:0];
                    res_reg = {temp_reg[31] == 1 ? 32'hffffffff:32'b0, temp_reg[31:0]};
                end
                default : begin
                    res_reg = 0;
                end
            endcase
        end else begin
            case (alu_op)
                ADD: 
                    case(inst[6:0])
                        7'b0010111: // auipc 
                            res_reg = pc + b;
                        default:
                            res_reg = a + b;
                    endcase
                SUB: res_reg = a - b;
                SLL: res_reg = a << b;
                SLT: res_reg = ($signed(a)< $signed(b)) ? 1 : 0;
                SLTU: res_reg = ($unsigned(a)<$unsigned(b)) ? 1 : 0;
                XOR: res_reg = a ^ b;
                SRL: res_reg = a >> b;
                SRA: res_reg = a >>> b;
                OR: res_reg = a | b;
                AND: res_reg = a & b;
                ADDW: begin
                    temp_reg = a[63:0] + b[63:0];
                    res_reg = {temp_reg[31] == 1 ? 32'hffffffff:32'b0, temp_reg[31:0]};
                end
                default: res_reg = 0;
            endcase
        end

        // 对 srli 进行特殊处理
        if(inst[6:0] == 7'b0010011 && inst[14:12] == 3'b101) begin // srli
            temp_reg = inst[25:20]; // shamt
            res_reg = a >> temp_reg;
        end

    end

    assign res = res_reg;
    assign zero = (res == 0) ? 1 : 0;

endmodule
