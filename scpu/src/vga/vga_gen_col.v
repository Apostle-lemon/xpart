`timescale 1ns / 1ps

module vga_gen_col(
	input clk,
	input rst_n,
	input [7:0] input_ascii,
	output [69:0] col_reg_0,
    output [69:0] col_reg_10,
    output [69:0] col_reg_20,
    output [69:0] col_reg_30,
    output [69:0] col_reg_40
	);

    // col_reg1~9 is the coopy of col_reg0
    // col_reg11~19 is the coopy of col_reg10
    // etc.

    // col_reg bit 1~9 is the coopy of col_reg bit 0
    // col_reg bit 11~19 is the coopy of col_reg bit 10
    // etc.

	integer i;
    integer j;

    wire [6:0] char_A_wire [4:0];
    wire [6:0] char_B_wire [4:0];
    wire [6:0] char_C_wire [4:0];
    wire [6:0] char_D_wire [4:0];
    wire [6:0] char_E_wire [4:0];
    wire [6:0] char_F_wire [4:0];
    wire [6:0] char_G_wire [4:0];
    wire [6:0] char_H_wire [4:0];
    wire [6:0] char_I_wire [4:0];
    wire [6:0] char_J_wire [4:0];
    wire [6:0] char_K_wire [4:0];
    wire [6:0] char_L_wire [4:0];
    wire [6:0] char_M_wire [4:0];
    wire [6:0] char_N_wire [4:0];
    wire [6:0] char_O_wire [4:0];
    wire [6:0] char_P_wire [4:0];
    wire [6:0] char_Q_wire [4:0];
    wire [6:0] char_R_wire [4:0];
    wire [6:0] char_S_wire [4:0];
    wire [6:0] char_T_wire [4:0];
    wire [6:0] char_U_wire [4:0];
    wire [6:0] char_V_wire [4:0];
    wire [6:0] char_W_wire [4:0];
    wire [6:0] char_X_wire [4:0];
    wire [6:0] char_Y_wire [4:0];
    wire [6:0] char_Z_wire [4:0];
    wire [6:0] char_0_wire [4:0];
    wire [6:0] char_1_wire [4:0];
    wire [6:0] char_2_wire [4:0];
    wire [6:0] char_3_wire [4:0];
    wire [6:0] char_4_wire [4:0];
    wire [6:0] char_5_wire [4:0];
    wire [6:0] char_6_wire [4:0];
    wire [6:0] char_7_wire [4:0];
    wire [6:0] char_8_wire [4:0];
    wire [6:0] char_9_wire [4:0];

        assign char_A_wire[0] = 7'b0111111;
        assign char_A_wire[1] = 7'b1001000;
        assign char_A_wire[2] = 7'b1001000;
        assign char_A_wire[3] = 7'b1001000;
        assign char_A_wire[4] = 7'b0111111;

        assign char_B_wire[0] = 7'b1111111;
        assign char_B_wire[1] = 7'b1001001;
        assign char_B_wire[2] = 7'b1001001;
        assign char_B_wire[3] = 7'b1001001;
        assign char_B_wire[4] = 7'b0110110;

        assign char_C_wire[0] = 7'b0111110;
        assign char_C_wire[1] = 7'b1000001;
        assign char_C_wire[2] = 7'b1000001;
        assign char_C_wire[3] = 7'b1000001;
        assign char_C_wire[4] = 7'b0100010;

        assign char_D_wire[0] = 7'b1111111;
        assign char_D_wire[1] = 7'b1000001;
        assign char_D_wire[2] = 7'b1000001;
        assign char_D_wire[3] = 7'b1000001;
        assign char_D_wire[4] = 7'b0111110;

        assign char_E_wire[0] = 7'b1111111;
        assign char_E_wire[1] = 7'b1001001;
        assign char_E_wire[2] = 7'b1001001;
        assign char_E_wire[3] = 7'b1001001;
        assign char_E_wire[4] = 7'b1000001;

        assign char_F_wire[0] = 7'b1111111;
        assign char_F_wire[1] = 7'b1001000;
        assign char_F_wire[2] = 7'b1001000;
        assign char_F_wire[3] = 7'b1001000;
        assign char_F_wire[4] = 7'b1000000;

        assign char_G_wire[0] = 7'b0111110;
        assign char_G_wire[1] = 7'b1000001;
        assign char_G_wire[2] = 7'b1001001;
        assign char_G_wire[3] = 7'b1001001;
        assign char_G_wire[4] = 7'b0101110;
        
        assign char_H_wire[0] = 7'b1111111;
        assign char_H_wire[1] = 7'b0001000;
        assign char_H_wire[2] = 7'b0001000;
        assign char_H_wire[3] = 7'b0001000;
        assign char_H_wire[4] = 7'b1111111;

        assign char_I_wire[0] = 7'b0000000;
        assign char_I_wire[1] = 7'b1000001;
        assign char_I_wire[2] = 7'b1111111;
        assign char_I_wire[3] = 7'b1000001;
        assign char_I_wire[4] = 7'b0000000;

        assign char_J_wire[0] = 7'b0000010;
        assign char_J_wire[1] = 7'b0000001;
        assign char_J_wire[2] = 7'b1000001;
        assign char_J_wire[3] = 7'b1111110;
        assign char_J_wire[4] = 7'b1000000;

        assign char_K_wire[0] = 7'b1111111;
        assign char_K_wire[1] = 7'b0001000;
        assign char_K_wire[2] = 7'b0010100;
        assign char_K_wire[3] = 7'b0100010;
        assign char_K_wire[4] = 7'b1000001;

        assign char_L_wire[0] = 7'b1111111;
        assign char_L_wire[1] = 7'b0000001;
        assign char_L_wire[2] = 7'b0000001;
        assign char_L_wire[3] = 7'b0000001;
        assign char_L_wire[4] = 7'b0000001;

        assign char_M_wire[0] = 7'b1111111;
        assign char_M_wire[1] = 7'b0100000;
        assign char_M_wire[2] = 7'b0011000;
        assign char_M_wire[3] = 7'b0100000;
        assign char_M_wire[4] = 7'b1111111;

        assign char_N_wire[0] = 7'b1111111;
        assign char_N_wire[1] = 7'b0100000;
        assign char_N_wire[2] = 7'b0011000;
        assign char_N_wire[3] = 7'b0000100;
        assign char_N_wire[4] = 7'b1111111;

        assign char_O_wire[0] = 7'b0111110;
        assign char_O_wire[1] = 7'b1000001;
        assign char_O_wire[2] = 7'b1000001;
        assign char_O_wire[3] = 7'b1000001;
        assign char_O_wire[4] = 7'b0111110;

        assign char_P_wire[0] = 7'b1111111;
        assign char_P_wire[1] = 7'b1001000;
        assign char_P_wire[2] = 7'b1001000;
        assign char_P_wire[3] = 7'b1001000;
        assign char_P_wire[4] = 7'b0110000;

        assign char_Q_wire[0] = 7'b0111100;
        assign char_Q_wire[1] = 7'b1000010;
        assign char_Q_wire[2] = 7'b1000010;
        assign char_Q_wire[3] = 7'b1000010;
        assign char_Q_wire[4] = 7'b0111101;

        assign char_R_wire[0] = 7'b1111111;
        assign char_R_wire[1] = 7'b1001000;
        assign char_R_wire[2] = 7'b1001000;
        assign char_R_wire[3] = 7'b1001100;
        assign char_R_wire[4] = 7'b0110011;

        assign char_S_wire[0] = 7'b0110010;
        assign char_S_wire[1] = 7'b1001001;
        assign char_S_wire[2] = 7'b1001001;
        assign char_S_wire[3] = 7'b1001001;
        assign char_S_wire[4] = 7'b0100110;

        assign char_T_wire[0] = 7'b1000000;
        assign char_T_wire[1] = 7'b1000000;
        assign char_T_wire[2] = 7'b1111111;
        assign char_T_wire[3] = 7'b1000000;
        assign char_T_wire[4] = 7'b1000000;

        assign char_U_wire[0] = 7'b1111110;
        assign char_U_wire[1] = 7'b0000001;
        assign char_U_wire[2] = 7'b0000001;
        assign char_U_wire[3] = 7'b0000001;
        assign char_U_wire[4] = 7'b1111110;

        assign char_V_wire[0] = 7'b1111100;
        assign char_V_wire[1] = 7'b0000010;
        assign char_V_wire[2] = 7'b0000001;
        assign char_V_wire[3] = 7'b0000010;
        assign char_V_wire[4] = 7'b1111100;

        assign char_W_wire[0] = 7'b1111111;
        assign char_W_wire[1] = 7'b0000010;
        assign char_W_wire[2] = 7'b0001100;
        assign char_W_wire[3] = 7'b0000010;
        assign char_W_wire[4] = 7'b1111111;

        assign char_X_wire[0] = 7'b1100011;
        assign char_X_wire[1] = 7'b0010100;
        assign char_X_wire[2] = 7'b0001000;
        assign char_X_wire[3] = 7'b0010100;
        assign char_X_wire[4] = 7'b1100011;

        assign char_Y_wire[0] = 7'b1110000;
        assign char_Y_wire[1] = 7'b0001000;
        assign char_Y_wire[2] = 7'b0000111;
        assign char_Y_wire[3] = 7'b0001000;
        assign char_Y_wire[4] = 7'b1110000;

        assign char_Z_wire[0] = 7'b1000011;
        assign char_Z_wire[1] = 7'b1000101;
        assign char_Z_wire[2] = 7'b1001001;
        assign char_Z_wire[3] = 7'b1010001;
        assign char_Z_wire[4] = 7'b1100001;

        assign char_0_wire[0] = 7'b0111110;
        assign char_0_wire[1] = 7'b1000101;
        assign char_0_wire[2] = 7'b1001001;
        assign char_0_wire[3] = 7'b1010001;
        assign char_0_wire[4] = 7'b0111110;

        assign char_1_wire[0] = 7'b0010001;
        assign char_1_wire[1] = 7'b0100001;
        assign char_1_wire[2] = 7'b1111111;
        assign char_1_wire[3] = 7'b0000001;
        assign char_1_wire[4] = 7'b0000001;

        assign char_2_wire[0] = 7'b0100001;
        assign char_2_wire[1] = 7'b1000011;
        assign char_2_wire[2] = 7'b1000101;
        assign char_2_wire[3] = 7'b1001001;
        assign char_2_wire[4] = 7'b0110001;

        assign char_3_wire[0] = 7'b0100010;
        assign char_3_wire[1] = 7'b1000001;
        assign char_3_wire[2] = 7'b1001001;
        assign char_3_wire[3] = 7'b1001001;
        assign char_3_wire[4] = 7'b0110110;

        assign char_4_wire[0] = 7'b0001100;
        assign char_4_wire[1] = 7'b0010100;
        assign char_4_wire[2] = 7'b0100100;
        assign char_4_wire[3] = 7'b1111111;
        assign char_4_wire[4] = 7'b0000100;

        assign char_5_wire[0] = 7'b1110010;
        assign char_5_wire[1] = 7'b1010001;
        assign char_5_wire[2] = 7'b1010001;
        assign char_5_wire[3] = 7'b1010001;
        assign char_5_wire[4] = 7'b1001110;

        assign char_6_wire[0] = 7'b0111110;
        assign char_6_wire[1] = 7'b1001001;
        assign char_6_wire[2] = 7'b1001001;
        assign char_6_wire[3] = 7'b1001001;
        assign char_6_wire[4] = 7'b0100110;

        assign char_7_wire[0] = 7'b1000000;
        assign char_7_wire[1] = 7'b1000111;
        assign char_7_wire[2] = 7'b1001000;
        assign char_7_wire[3] = 7'b1010000;
        assign char_7_wire[4] = 7'b1100000;

        assign char_8_wire[0] = 7'b0110110;
        assign char_8_wire[1] = 7'b1001001;
        assign char_8_wire[2] = 7'b1001001;
        assign char_8_wire[3] = 7'b1001001;
        assign char_8_wire[4] = 7'b0110110;

        assign char_9_wire[0] = 7'b0110010;
        assign char_9_wire[1] = 7'b1001001;
        assign char_9_wire[2] = 7'b1001001;
        assign char_9_wire[3] = 7'b1001001;
        assign char_9_wire[4] = 7'b0111110;

    reg [69:0] col_reg [49:0];

	always @(posedge clk or negedge rst_n)
        begin
			if (!rst_n)
				begin
                    for (i = 0; i < 50; i = i + 1)
                        begin
                            col_reg[i] = 70'h0;
                        end
				end
			else
				begin
					case (input_ascii)
                        8'b1000001: // "A"
							begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_A_wire[i][j];
                                    end
                                end
							end
                        8'b1000010: // "B"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_B_wire[i][j];
                                    end
                                end
                            end
                        8'b1000011: // "C"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_C_wire[i][j];
                                    end
                                end
                            end
                        8'b1000100: // "D"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_D_wire[i][j];
                                    end
                                end
                            end
                        8'b1000101: // "E"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_E_wire[i][j];
                                    end
                                end
                            end
                        8'b1000110: // "F"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_F_wire[i][j];
                                    end
                                end
                            end
                        8'b1000111: // "G"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_G_wire[i][j];
                                    end
                                end
                            end
                        8'b1001000: // "H"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_H_wire[i][j];
                                    end
                                end
                            end
                        8'b1001001: // "I"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_I_wire[i][j];
                                    end
                                end
                            end
                        8'b1001010: // "J"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_J_wire[i][j];
                                    end
                                end
                            end
                        8'b1001011: // "K"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_K_wire[i][j];
                                    end
                                end
                            end
                        8'b1001100: // "L"
                        begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_L_wire[i][j];
                                    end
                                end
                            end
                        8'b1001101: // "M"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_M_wire[i][j];
                                    end
                                end
                            end
                        8'b1001110: // "N"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_N_wire[i][j];
                                    end
                                end
                            end
                        8'b1001111: // "O"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_O_wire[i][j];
                                    end
                                end
                            end
                        8'b1010000: // "P"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_P_wire[i][j];
                                    end
                                end
                            end
                        8'b1010001: // "Q"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_Q_wire[i][j];
                                    end
                                end
                            end
                        8'b1010010: // "R"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_R_wire[i][j];
                                    end
                                end
                            end
                        8'b1010011: // "S"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_S_wire[i][j];
                                    end
                                end
                            end
                        8'b1010100: // "T"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_T_wire[i][j];
                                    end
                                end
                            end
                        8'b1010101: // "U"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_U_wire[i][j];
                                    end
                                end
                            end
                        8'b1010110: // "V"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_V_wire[i][j];
                                    end
                                end
                            end
                        8'b1010111: // "W"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_W_wire[i][j];
                                    end
                                end
                            end
                        8'b1011000: // "X"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_X_wire[i][j];
                                    end
                                end
                            end
                        8'b1011001: // "Y"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_Y_wire[i][j];
                                    end
                                end
                            end
                        8'b1011010: // "Z"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_Z_wire[i][j];
                                    end
                                end
                            end
                        8'b0110000: // "0"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_0_wire[i][j];
                                    end
                                end
                            end
                        8'b0110001: // "1"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_1_wire[i][j];
                                    end
                                end
                            end
                        8'b0110010: // "2"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_2_wire[i][j];
                                    end
                                end
                            end
                        8'b0110011: // "3"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_3_wire[i][j];
                                    end
                                end
                            end
                        8'b0110100: // "4"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_4_wire[i][j];
                                    end
                                end
                            end
                        8'b0110101: // "5"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_5_wire[i][j];
                                    end
                                end
                            end
                        8'b0110110: // "6"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_6_wire[i][j];
                                    end
                                end
                            end
                        8'b0110111: // "7"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_7_wire[i][j];
                                    end
                                end
                            end
                        8'b00111000: // "8"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_8_wire[i][j];
                                    end
                                end
                            end
                        8'b00111001: // "9"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_9_wire[i][j];
                                    end
                                end
                            end
						default: // "*"
							begin
                                for (i = 0; i < 50; i = i + 1)
                                    begin
                                        col_reg[i] = 70'h0;
                                    end
							end
					endcase

                    for(i=0;i<=4;i=i+1)begin
                        for(j=0;j<=6;j=j+1)begin
                            col_reg[i*10][j*10+1] = col_reg[i*10][j*10];
                            col_reg[i*10][j*10+2] = col_reg[i*10][j*10];
                            col_reg[i*10][j*10+3] = col_reg[i*10][j*10];
                            col_reg[i*10][j*10+4] = col_reg[i*10][j*10];
                            col_reg[i*10][j*10+5] = col_reg[i*10][j*10];
                            col_reg[i*10][j*10+6] = col_reg[i*10][j*10];
                            col_reg[i*10][j*10+7] = col_reg[i*10][j*10];
                            col_reg[i*10][j*10+8] = col_reg[i*10][j*10];
                            col_reg[i*10][j*10+9] = col_reg[i*10][j*10];
                        end
                    end
				end
            
		end

    assign col_reg_0 = col_reg[0];
    assign col_reg_10 = col_reg[10];
    assign col_reg_20 = col_reg[20];
    assign col_reg_30 = col_reg[30];
    assign col_reg_40 = col_reg[40];

endmodule