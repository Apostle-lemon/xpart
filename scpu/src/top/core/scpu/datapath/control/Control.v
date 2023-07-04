`timescale 1ns / 1ps

module CONTROL(
  input [6:0]  op_code,
  input [2:0]  funct3,
  input [31:0] inst,
  input funct7_5,

  // Outputs
  output [4:0] id_ex,
  output [2:0] id_m,
  output [2:0] id_wb
  );

  reg reg_write_reg;
  reg alu_src_b_reg;
  reg[3:0] alu_op_reg;
  reg[1:0] mem_to_reg_reg;
  reg mem_write_reg;
  reg branch_reg;
  reg b_type_reg;

  always @* begin
    reg_write_reg = 0;
    alu_src_b_reg = 0;
    mem_to_reg_reg = 0;
    mem_write_reg = 0;
    branch_reg = 0;
    b_type_reg = 1'b0;

    case (op_code)
        //ADDI
        7'b0010011: begin 
          reg_write_reg = 1'b1; 
          alu_src_b_reg = 1'b1;
          alu_op_reg = {1'b0, funct3};
          mem_to_reg_reg = 2'b00; // from alu_result
          end
        //sw
        7'b0100011: begin 
          reg_write_reg = 1'b0; // not write register 
          alu_src_b_reg = 1'b1; // from imm
          alu_op_reg = 4'b0000; // add
          mem_to_reg_reg = 2'b01; //arbitrary 
          mem_write_reg = 1'b1;
          end
        //lw
        7'b0000011: begin 
          reg_write_reg = 1'b1; 
          alu_src_b_reg = 1'b1; // from imm
          alu_op_reg = 4'b0000;
          mem_to_reg_reg = 2'b11; 
          end
        // bne, beq
        7'b1100011: begin
          branch_reg = 1'b1;
          reg_write_reg = 1'b0;
          alu_src_b_reg = 1'b0;
          alu_op_reg = 4'b1000;
          mem_to_reg_reg = 2'b00; //arbitrary
          if(funct3 == 3'b000) begin
            // beq
            b_type_reg = 1'b1;
          end
          else begin
            b_type_reg = 1'b0;
          end
          end
        // lui
        7'b0110111: begin
          reg_write_reg = 1'b1;
          alu_src_b_reg = 1'b1;//from imm
          alu_op_reg = 4'b0000;//arbitrary
          mem_to_reg_reg = 2'b01; 
          end
        //jal
        7'b1101111: begin
          reg_write_reg = 1'b1;
          alu_src_b_reg = 1'b0;//arbitrary
          alu_op_reg = 4'b0000;//arbitrary
          mem_to_reg_reg = 2'b10; 
          end
        //jalr
        7'b1100111: begin
          reg_write_reg = 1'b1;
          alu_src_b_reg = 1'b1;
          alu_op_reg = 4'b0000;//arbitrary
          mem_to_reg_reg = 2'b10; 
          end
        // sll, slt, sltu xor, etc.
        7'b0110011: begin
          reg_write_reg = 1'b1;
          alu_src_b_reg = 1'b0;
          alu_op_reg = {funct7_5,funct3}; // 根据 funct7_5 才能决定 add 还是 sub
          mem_to_reg_reg = 2'b00;
          end
        // auipc
        7'b0010111: begin
          reg_write_reg = 1'b1;
          alu_src_b_reg = 1'b1;//from imm
          alu_op_reg = 4'b0000;//arbitrary
          mem_to_reg_reg = 2'b00;// from alu_result
          end
        // csrr, csrs, csrc 
        7'b1110011: begin
          reg_write_reg = 1'b1; // write_enable
          mem_to_reg_reg = 2'b00; // from alu_result
          alu_op_reg = 4'b0000;
        end
        // addw
        7'b0111011: begin
          reg_write_reg = 1'b1;
          alu_src_b_reg = 1'b0;//from reg
          alu_op_reg = {1'b1,funct3};//1000, 代表 ADDW
          mem_to_reg_reg = 2'b00;// from alu_result
        end
        // addiw, slliw
        7'b0011011: begin
          reg_write_reg = 1'b1;
          alu_src_b_reg = 1'b1;//from imm, 对于 slliw 会在 alu 中自己取立即数
          alu_op_reg = {1'b1,funct3};//arbitrary 
          mem_to_reg_reg = 2'b00;// from alu_result
        end
        default: alu_op_reg = 0;
    endcase
end

    assign id_ex = {alu_src_b_reg, alu_op_reg};
    assign id_m = {branch_reg, b_type_reg, mem_write_reg};
    assign id_wb = {reg_write_reg, mem_to_reg_reg};

endmodule




