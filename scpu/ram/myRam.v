`timescale 1ns / 1ps

module myRam(
    input clk,
    input we,
    input [63:0] write_data,
    input [31:0] myraminput_inst,
    input [9:0] address,
    output [63:0] read_data
);

    reg [7:0] ram [0:1023];
    wire [6:0] opcode = myraminput_inst[6:0];
    wire [2:0] funct3 = myraminput_inst[14:12];
    reg [63:0] read_data_reg;

    // store instruction
    always @(posedge clk) begin
        if (we == 1) begin
            case (opcode)
                7'b0100011: begin // store
                    case(funct3)
                        3'b000: begin // sb
                            ram[address] = write_data[7:0];
                        end
                        3'b001: begin // sh
                            ram[address] = write_data[7:0];
                            ram[address+1] = write_data[15:8];
                        end
                        3'b010: begin // sw
                            ram[address] = write_data[7:0];
                            ram[address+1] = write_data[15:8];
                            ram[address+2] = write_data[23:16];
                            ram[address+3] = write_data[31:24];
                        end
                        3'b011: begin // sd
                            ram[address] = write_data[7:0];
                            ram[address+1] = write_data[15:8];
                            ram[address+2] = write_data[23:16];
                            ram[address+3] = write_data[31:24];
                            ram[address+4] = write_data[39:32];
                            ram[address+5] = write_data[47:40];
                            ram[address+6] = write_data[55:48];
                            ram[address+7] = write_data[63:56];
                        end
                        default: begin 
                            ram[address] = ram[address];
                        end
                    endcase
                end
                default: begin
                    ram[address] = ram[address];
                end
            endcase            
        end else begin
            ram[address] = ram[address];
        end   
    end

    always @(posedge clk) begin
        case(funct3)
            3'b000: begin //lb
                read_data_reg = {ram[address][7]==1?56'hffffffffffffff:56'b0, ram[address]};
            end
            3'b100: begin //lbu
                read_data_reg = {56'b0, ram[address]};
            end
            3'b011: begin //ld
                read_data_reg = {ram[address+7], ram[address+6], ram[address+5], ram[address+4], ram[address+3], ram[address+2], ram[address+1], ram[address]};
            end
            3'b001: begin //lh
                read_data_reg = {ram[address+1][7]==1?48'hffffffffffff:48'b0, ram[address+1], ram[address]};
            end
            3'b101: begin //lhu
                read_data_reg = {48'b0, ram[address+1], ram[address]};
            end
            3'b010: begin //lw
                read_data_reg = {ram[address+3][7]==1?32'hffffffff:32'b0, ram[address+3], ram[address+2], ram[address+1], ram[address]};
            end
            3'b110: begin //lwu
                read_data_reg = {32'b0, ram[address+3], ram[address+2], ram[address+1], ram[address]};
            end
            default: begin // nothing to do
                read_data_reg = 0;
            end
        endcase
    end

    assign read_data = read_data_reg;

endmodule
