`timescale 1ns / 1ps

module vga_gen_col(
	input clk,
	input rst_n,
	input [7:0] input_ascii,
	output [69:0] col_reg_0,
    output [69:0] col_reg_1,
    output [69:0] col_reg_2,
    output [69:0] col_reg_3,
    output [69:0] col_reg_4,
    output [69:0] col_reg_5,
    output [69:0] col_reg_6,
    output [69:0] col_reg_7,
    output [69:0] col_reg_8,
    output [69:0] col_reg_9,
    output [69:0] col_reg_10,
    output [69:0] col_reg_11,
    output [69:0] col_reg_12,
    output [69:0] col_reg_13,
    output [69:0] col_reg_14,
    output [69:0] col_reg_15,
    output [69:0] col_reg_16,
    output [69:0] col_reg_17,
    output [69:0] col_reg_18,
    output [69:0] col_reg_19,
    output [69:0] col_reg_20,
    output [69:0] col_reg_21,
    output [69:0] col_reg_22,
    output [69:0] col_reg_23,
    output [69:0] col_reg_24,
    output [69:0] col_reg_25,
    output [69:0] col_reg_26,
    output [69:0] col_reg_27,
    output [69:0] col_reg_28,
    output [69:0] col_reg_29,
    output [69:0] col_reg_30,
    output [69:0] col_reg_31,
    output [69:0] col_reg_32,
    output [69:0] col_reg_33,
    output [69:0] col_reg_34,
    output [69:0] col_reg_35,
    output [69:0] col_reg_36,
    output [69:0] col_reg_37,
    output [69:0] col_reg_38,
    output [69:0] col_reg_39,
    output [69:0] col_reg_40,
    output [69:0] col_reg_41,
    output [69:0] col_reg_42,
    output [69:0] col_reg_43,
    output [69:0] col_reg_44,
    output [69:0] col_reg_45,
    output [69:0] col_reg_46,
    output [69:0] col_reg_47,
    output [69:0] col_reg_48,
    output [69:0] col_reg_49
	);

    // col_reg1~9 is the coopy of col_reg0
    // col_reg11~19 is the coopy of col_reg10
    // etc.

    // col_reg bit 1~9 is the coopy of col_reg bit 0
    // col_reg bit 11~19 is the coopy of col_reg bit 10
    // etc.

	integer i;
    integer j;

    reg [6:0] char_A_reg [4:0];
    reg [6:0] char_B_reg [4:0];
    reg [6:0] char_C_reg [4:0];
    reg [6:0] char_D_reg [4:0];
    reg [6:0] char_E_reg [4:0];
    reg [6:0] char_F_reg [4:0];
    reg [6:0] char_G_reg [4:0];
    reg [6:0] char_H_reg [4:0];
    reg [6:0] char_I_reg [4:0];
    reg [6:0] char_J_reg [4:0];
    reg [6:0] char_K_reg [4:0];
    reg [6:0] char_L_reg [4:0];
    reg [6:0] char_M_reg [4:0];
    reg [6:0] char_N_reg [4:0];
    reg [6:0] char_O_reg [4:0];
    reg [6:0] char_P_reg [4:0];
    reg [6:0] char_Q_reg [4:0];
    reg [6:0] char_R_reg [4:0];
    reg [6:0] char_S_reg [4:0];
    reg [6:0] char_T_reg [4:0];
    reg [6:0] char_U_reg [4:0];
    reg [6:0] char_V_reg [4:0];
    reg [6:0] char_W_reg [4:0];
    reg [6:0] char_X_reg [4:0];
    reg [6:0] char_Y_reg [4:0];
    reg [6:0] char_Z_reg [4:0];
    reg [6:0] char_0_reg [4:0];
    reg [6:0] char_1_reg [4:0];
    reg [6:0] char_2_reg [4:0];
    reg [6:0] char_3_reg [4:0];
    reg [6:0] char_4_reg [4:0];
    reg [6:0] char_5_reg [4:0];
    reg [6:0] char_6_reg [4:0];
    reg [6:0] char_7_reg [4:0];
    reg [6:0] char_8_reg [4:0];
    reg [6:0] char_9_reg [4:0];

    initial begin
        char_A_reg[0] = 7'b0111111;
        char_A_reg[1] = 7'b1001000;
        char_A_reg[2] = 7'b1001000;
        char_A_reg[3] = 7'b1001000;
        char_A_reg[4] = 7'b0111111;

        char_B_reg[0] = 7'b1111111;
        char_B_reg[1] = 7'b1001001;
        char_B_reg[2] = 7'b1001001;
        char_B_reg[3] = 7'b1001001;
        char_B_reg[4] = 7'b0110110;

        char_C_reg[0] = 7'b0111110;
        char_C_reg[1] = 7'b1000001;
        char_C_reg[2] = 7'b1000001;
        char_C_reg[3] = 7'b1000001;
        char_C_reg[4] = 7'b0100010;

        char_D_reg[0] = 7'b1111111;
        char_D_reg[1] = 7'b1000001;
        char_D_reg[2] = 7'b1000001;
        char_D_reg[3] = 7'b1000001;
        char_D_reg[4] = 7'b0111110;

        char_E_reg[0] = 7'b1111111;
        char_E_reg[1] = 7'b1001001;
        char_E_reg[2] = 7'b1001001;
        char_E_reg[3] = 7'b1001001;
        char_E_reg[4] = 7'b1000001;

        char_F_reg[0] = 7'b1111111;
        char_F_reg[1] = 7'b1001000;
        char_F_reg[2] = 7'b1001000;
        char_F_reg[3] = 7'b1001000;
        char_F_reg[4] = 7'b1000000;

        char_G_reg[0] = 7'b0111110;
        char_G_reg[1] = 7'b1000001;
        char_G_reg[2] = 7'b1001001;
        char_G_reg[3] = 7'b1001001;
        char_G_reg[4] = 7'b0101110;
        
        char_H_reg[0] = 7'b1111111;
        char_H_reg[1] = 7'b0001000;
        char_H_reg[2] = 7'b0001000;
        char_H_reg[3] = 7'b0001000;
        char_H_reg[4] = 7'b1111111;

        char_I_reg[0] = 7'b0000000;
        char_I_reg[1] = 7'b1000001;
        char_I_reg[2] = 7'b1111111;
        char_I_reg[3] = 7'b1000001;
        char_I_reg[4] = 7'b0000000;

        char_J_reg[0] = 7'b0000010;
        char_J_reg[1] = 7'b0000001;
        char_J_reg[2] = 7'b1000001;
        char_J_reg[3] = 7'b1111110;
        char_J_reg[4] = 7'b1000000;

        char_K_reg[0] = 7'b1111111;
        char_K_reg[1] = 7'b0001000;
        char_K_reg[2] = 7'b0010100;
        char_K_reg[3] = 7'b0100010;
        char_K_reg[4] = 7'b1000001;

        char_L_reg[0] = 7'b1111111;
        char_L_reg[1] = 7'b0000001;
        char_L_reg[2] = 7'b0000001;
        char_L_reg[3] = 7'b0000001;
        char_L_reg[4] = 7'b0000001;

        char_M_reg[0] = 7'b1111111;
        char_M_reg[1] = 7'b0100000;
        char_M_reg[2] = 7'b0011000;
        char_M_reg[3] = 7'b0100000;
        char_M_reg[4] = 7'b1111111;

        char_N_reg[0] = 7'b1111111;
        char_N_reg[1] = 7'b0100000;
        char_N_reg[2] = 7'b0011000;
        char_N_reg[3] = 7'b0000100;
        char_N_reg[4] = 7'b1111111;

        char_O_reg[0] = 7'b0111110;
        char_O_reg[1] = 7'b1000001;
        char_O_reg[2] = 7'b1000001;
        char_O_reg[3] = 7'b1000001;
        char_O_reg[4] = 7'b0111110;

        char_P_reg[0] = 7'b1111111;
        char_P_reg[1] = 7'b1001000;
        char_P_reg[2] = 7'b1001000;
        char_P_reg[3] = 7'b1001000;
        char_P_reg[4] = 7'b0110000;

        char_Q_reg[0] = 7'b0111100;
        char_Q_reg[1] = 7'b1000010;
        char_Q_reg[2] = 7'b1000010;
        char_Q_reg[3] = 7'b1000010;
        char_Q_reg[4] = 7'b0111101;

        char_R_reg[0] = 7'b1111111;
        char_R_reg[1] = 7'b1001000;
        char_R_reg[2] = 7'b1001000;
        char_R_reg[3] = 7'b1001100;
        char_R_reg[4] = 7'b0110011;

        char_S_reg[0] = 7'b0110010;
        char_S_reg[1] = 7'b1001001;
        char_S_reg[2] = 7'b1001001;
        char_S_reg[3] = 7'b1001001;
        char_S_reg[4] = 7'b0100110;

        char_T_reg[0] = 7'b1000000;
        char_T_reg[1] = 7'b1000000;
        char_T_reg[2] = 7'b1111111;
        char_T_reg[3] = 7'b1000000;
        char_T_reg[4] = 7'b1000000;

        char_U_reg[0] = 7'b1111110;
        char_U_reg[1] = 7'b0000001;
        char_U_reg[2] = 7'b0000001;
        char_U_reg[3] = 7'b0000001;
        char_U_reg[4] = 7'b1111110;

        char_V_reg[0] = 7'b1111100;
        char_V_reg[1] = 7'b0000010;
        char_V_reg[2] = 7'b0000001;
        char_V_reg[3] = 7'b0000010;
        char_V_reg[4] = 7'b1111100;

        char_W_reg[0] = 7'b1111111;
        char_W_reg[1] = 7'b0000010;
        char_W_reg[2] = 7'b0001100;
        char_W_reg[3] = 7'b0000010;
        char_W_reg[4] = 7'b1111111;

        char_X_reg[0] = 7'b1100011;
        char_X_reg[1] = 7'b0010100;
        char_X_reg[2] = 7'b0001000;
        char_X_reg[3] = 7'b0010100;
        char_X_reg[4] = 7'b1100011;

        char_Y_reg[0] = 7'b1110000;
        char_Y_reg[1] = 7'b0001000;
        char_Y_reg[2] = 7'b0000111;
        char_Y_reg[3] = 7'b0001000;
        char_Y_reg[4] = 7'b1110000;

        char_Z_reg[0] = 7'b1000011;
        char_Z_reg[1] = 7'b1000101;
        char_Z_reg[2] = 7'b1001001;
        char_Z_reg[3] = 7'b1010001;
        char_Z_reg[4] = 7'b1100001;

        char_0_reg[0] = 7'b0111110;
        char_0_reg[1] = 7'b1000101;
        char_0_reg[2] = 7'b1001001;
        char_0_reg[3] = 7'b1010001;
        char_0_reg[4] = 7'b0111110;

        char_1_reg[0] = 7'b0010001;
        char_1_reg[1] = 7'b0100001;
        char_1_reg[2] = 7'b1111111;
        char_1_reg[3] = 7'b0000001;
        char_1_reg[4] = 7'b0000001;

        char_2_reg[0] = 7'b0100001;
        char_2_reg[1] = 7'b1000011;
        char_2_reg[2] = 7'b1000101;
        char_2_reg[3] = 7'b1001001;
        char_2_reg[4] = 7'b0110001;

        char_3_reg[0] = 7'b0100010;
        char_3_reg[1] = 7'b1000001;
        char_3_reg[2] = 7'b1001001;
        char_3_reg[3] = 7'b1001001;
        char_3_reg[4] = 7'b0110110;

        char_4_reg[0] = 7'b0001100;
        char_4_reg[1] = 7'b0010100;
        char_4_reg[2] = 7'b0100100;
        char_4_reg[3] = 7'b1111111;
        char_4_reg[4] = 7'b0000100;

        char_5_reg[0] = 7'b1110010;
        char_5_reg[1] = 7'b1010001;
        char_5_reg[2] = 7'b1010001;
        char_5_reg[3] = 7'b1010001;
        char_5_reg[4] = 7'b1001110;

        char_6_reg[0] = 7'b0111110;
        char_6_reg[1] = 7'b1001001;
        char_6_reg[2] = 7'b1001001;
        char_6_reg[3] = 7'b1001001;
        char_6_reg[4] = 7'b0100110;

        char_7_reg[0] = 7'b1000000;
        char_7_reg[1] = 7'b1000111;
        char_7_reg[2] = 7'b1001000;
        char_7_reg[3] = 7'b1010000;
        char_7_reg[4] = 7'b1100000;

        char_8_reg[0] = 7'b0110110;
        char_8_reg[1] = 7'b1001001;
        char_8_reg[2] = 7'b1001001;
        char_8_reg[3] = 7'b1001001;
        char_8_reg[4] = 7'b0110110;

        char_9_reg[0] = 7'b0110010;
        char_9_reg[1] = 7'b1001001;
        char_9_reg[2] = 7'b1001001;
        char_9_reg[3] = 7'b1001001;
        char_9_reg[4] = 7'b0111110;

    end

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
                                        col_reg[i*10][j*10] = char_A_reg[i][j];
                                    end
                                end
							end
                        8'b1000010: // "B"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_B_reg[i][j];
                                    end
                                end
                            end
                        8'b1000011: // "C"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_C_reg[i][j];
                                    end
                                end
                            end
                        8'b1000100: // "D"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_D_reg[i][j];
                                    end
                                end
                            end
                        8'b1000101: // "E"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_E_reg[i][j];
                                    end
                                end
                            end
                        8'b1000110: // "F"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_F_reg[i][j];
                                    end
                                end
                            end
                        8'b1000111: // "G"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_G_reg[i][j];
                                    end
                                end
                            end
                        8'b1001000: // "H"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_H_reg[i][j];
                                    end
                                end
                            end
                        8'b1001001: // "I"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_I_reg[i][j];
                                    end
                                end
                            end
                        8'b1001010: // "J"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_J_reg[i][j];
                                    end
                                end
                            end
                        8'b1001011: // "K"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_K_reg[i][j];
                                    end
                                end
                            end
                        8'b1001100: // "L"
                        begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_L_reg[i][j];
                                    end
                                end
                            end
                        8'b1001101: // "M"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_M_reg[i][j];
                                    end
                                end
                            end
                        8'b1001110: // "N"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_N_reg[i][j];
                                    end
                                end
                            end
                        8'b1001111: // "O"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_O_reg[i][j];
                                    end
                                end
                            end
                        8'b1010000: // "P"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_P_reg[i][j];
                                    end
                                end
                            end
                        8'b1010001: // "Q"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_Q_reg[i][j];
                                    end
                                end
                            end
                        8'b1010010: // "R"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_R_reg[i][j];
                                    end
                                end
                            end
                        8'b1010011: // "S"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_S_reg[i][j];
                                    end
                                end
                            end
                        8'b1010100: // "T"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_T_reg[i][j];
                                    end
                                end
                            end
                        8'b1010101: // "U"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_U_reg[i][j];
                                    end
                                end
                            end
                        8'b1010110: // "V"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_V_reg[i][j];
                                    end
                                end
                            end
                        8'b1010111: // "W"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_W_reg[i][j];
                                    end
                                end
                            end
                        8'b1011000: // "X"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_X_reg[i][j];
                                    end
                                end
                            end
                        8'b1011001: // "Y"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_Y_reg[i][j];
                                    end
                                end
                            end
                        8'b1011010: // "Z"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_Z_reg[i][j];
                                    end
                                end
                            end
                        8'b0110000: // "0"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_0_reg[i][j];
                                    end
                                end
                            end
                        8'b0110001: // "1"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_1_reg[i][j];
                                    end
                                end
                            end
                        8'b0110010: // "2"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_2_reg[i][j];
                                    end
                                end
                            end
                        8'b0110011: // "3"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_3_reg[i][j];
                                    end
                                end
                            end
                        8'b0110100: // "4"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_4_reg[i][j];
                                    end
                                end
                            end
                        8'b0110101: // "5"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_5_reg[i][j];
                                    end
                                end
                            end
                        8'b0110110: // "6"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_6_reg[i][j];
                                    end
                                end
                            end
                        8'b0110111: // "7"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_7_reg[i][j];
                                    end
                                end
                            end
                        8'b00111000: // "8"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_8_reg[i][j];
                                    end
                                end
                            end
                        8'b00111001: // "9"
                            begin
                                for(i=0;i<=4;i=i+1) begin
                                    for(j=0;j<=6;j=j+1) begin
                                        col_reg[i*10][j*10] = char_9_reg[i][j];
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
                        col_reg[i*10+1] = col_reg[i*10];
                        col_reg[i*10+2] = col_reg[i*10];
                        col_reg[i*10+3] = col_reg[i*10];
                        col_reg[i*10+4] = col_reg[i*10];
                        col_reg[i*10+5] = col_reg[i*10];
                        col_reg[i*10+6] = col_reg[i*10];
                        col_reg[i*10+7] = col_reg[i*10];
                        col_reg[i*10+8] = col_reg[i*10];
                        col_reg[i*10+9] = col_reg[i*10];
                    end

				end
		end

    assign col_reg_0 = col_reg[0];
    assign col_reg_1 = col_reg[1];
    assign col_reg_2 = col_reg[2];
    assign col_reg_3 = col_reg[3];
    assign col_reg_4 = col_reg[4];
    assign col_reg_5 = col_reg[5];
    assign col_reg_6 = col_reg[6];
    assign col_reg_7 = col_reg[7];
    assign col_reg_8 = col_reg[8];
    assign col_reg_9 = col_reg[9];
    assign col_reg_10 = col_reg[10];
    assign col_reg_11 = col_reg[11];
    assign col_reg_12 = col_reg[12];
    assign col_reg_13 = col_reg[13];
    assign col_reg_14 = col_reg[14];
    assign col_reg_15 = col_reg[15];
    assign col_reg_16 = col_reg[16];
    assign col_reg_17 = col_reg[17];
    assign col_reg_18 = col_reg[18];
    assign col_reg_19 = col_reg[19];
    assign col_reg_20 = col_reg[20];
    assign col_reg_21 = col_reg[21];
    assign col_reg_22 = col_reg[22];
    assign col_reg_23 = col_reg[23];
    assign col_reg_24 = col_reg[24];
    assign col_reg_25 = col_reg[25];
    assign col_reg_26 = col_reg[26];
    assign col_reg_27 = col_reg[27];
    assign col_reg_28 = col_reg[28];
    assign col_reg_29 = col_reg[29];
    assign col_reg_30 = col_reg[30];
    assign col_reg_31 = col_reg[31];
    assign col_reg_32 = col_reg[32];
    assign col_reg_33 = col_reg[33];
    assign col_reg_34 = col_reg[34];
    assign col_reg_35 = col_reg[35];
    assign col_reg_36 = col_reg[36];
    assign col_reg_37 = col_reg[37];
    assign col_reg_38 = col_reg[38];
    assign col_reg_39 = col_reg[39];
    assign col_reg_40 = col_reg[40];
    assign col_reg_41 = col_reg[41];
    assign col_reg_42 = col_reg[42];
    assign col_reg_43 = col_reg[43];
    assign col_reg_44 = col_reg[44];
    assign col_reg_45 = col_reg[45];
    assign col_reg_46 = col_reg[46];
    assign col_reg_47 = col_reg[47];
    assign col_reg_48 = col_reg[48];
    assign col_reg_49 = col_reg[49];

endmodule