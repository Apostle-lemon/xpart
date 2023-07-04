`timescale 1ns / 1ps

module vga_gen_grafic(
        input               clk,
        input               rst_n,

        input [7:0] char_1,
        input [7:0] char_2,
        input [7:0] char_3,
        input [7:0] char_4,
        input [7:0] char_5,
        input [7:0] char_6,
        input [7:0] char_7,
        input [7:0] char_8,
        input [7:0] char_9,
        input [7:0] char_10,
        input [7:0] char_11,
        input [7:0] char_12,
        input [7:0] char_13,
        input [7:0] char_14,
        input [7:0] char_15,
        input [7:0] char_16,
        input [7:0] char_17,
        input [7:0] char_18,
        input [7:0] char_19,
        input [7:0] char_20,
        input [7:0] char_21,
        input [7:0] char_22,
        input [7:0] char_23,
        input [7:0] char_24,
        input [7:0] char_25,
        input [7:0] char_26,
        input [7:0] char_27,
        input [7:0] char_28,
        input [7:0] char_29,
        input [7:0] char_30,
        input [7:0] char_31,
        input [7:0] char_32,
        input [7:0] char_33,
        input [7:0] char_34,
        input [7:0] char_35,
        input [7:0] char_36,

        input   [9:0]       pixel_x,
        input   [9:0]       pixel_y,
        input               video_on,
        input               vga_clk,

        output  reg     [3:0]       vga_r,
        output  reg     [3:0]       vga_g,
        output  reg     [3:0]       vga_b        
    );


    	// 显示器可显示区域
	// parameter UP_BOUND = 31;
	// parameter DOWN_BOUND = 510;
	parameter START_DISPLAY_COLUMN = 5;
	parameter INTERNAL_SPACE = 3;

	parameter LEFT_BOUND = 4;
	parameter RIGHT_BOUND = 783;
    
    parameter left_pos = 144;
    parameter right_pos = 783;

    parameter up_pos_row1 = 41;
    parameter down_pos_row1 = 110;

    parameter up_pos_row2 = 171;
    parameter down_pos_row2 = 240;

    parameter up_pos_row3 = 311;
    parameter down_pos_row3 = 380;

	wire [69:0] row1_char [59:0];
	wire [69:0] row2_char [59:0];
	wire [69:0] row3_char [59:0];

vga_gen_col col_row1_char1(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_1),
	.col_reg_0(row1_char[0]),
	.col_reg_10(row1_char[1]),
	.col_reg_20(row1_char[2]),
	.col_reg_30(row1_char[3]),
	.col_reg_40(row1_char[4])
);


vga_gen_col col_row1_char2(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_2),
	.col_reg_0(row1_char[5]),
	.col_reg_10(row1_char[6]),
	.col_reg_20(row1_char[7]),
	.col_reg_30(row1_char[8]),
	.col_reg_40(row1_char[9])
);


vga_gen_col col_row1_char3(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_3),
	.col_reg_0(row1_char[10]),
	.col_reg_10(row1_char[11]),
	.col_reg_20(row1_char[12]),
	.col_reg_30(row1_char[13]),
	.col_reg_40(row1_char[14])
);


vga_gen_col col_row1_char4(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_4),
	.col_reg_0(row1_char[15]),
	.col_reg_10(row1_char[16]),
	.col_reg_20(row1_char[17]),
	.col_reg_30(row1_char[18]),
	.col_reg_40(row1_char[19])
);


vga_gen_col col_row1_char5(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_5),
	.col_reg_0(row1_char[20]),
	.col_reg_10(row1_char[21]),
	.col_reg_20(row1_char[22]),
	.col_reg_30(row1_char[23]),
	.col_reg_40(row1_char[24])
);


vga_gen_col col_row1_char6(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_6),
	.col_reg_0(row1_char[25]),
	.col_reg_10(row1_char[26]),
	.col_reg_20(row1_char[27]),
	.col_reg_30(row1_char[28]),
	.col_reg_40(row1_char[29])
);


vga_gen_col col_row1_char7(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_7),
	.col_reg_0(row1_char[30]),
	.col_reg_10(row1_char[31]),
	.col_reg_20(row1_char[32]),
	.col_reg_30(row1_char[33]),
	.col_reg_40(row1_char[34])
);


vga_gen_col col_row1_char8(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_8),
	.col_reg_0(row1_char[35]),
	.col_reg_10(row1_char[36]),
	.col_reg_20(row1_char[37]),
	.col_reg_30(row1_char[38]),
	.col_reg_40(row1_char[39])
);


vga_gen_col col_row1_char9(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_9),
	.col_reg_0(row1_char[40]),
	.col_reg_10(row1_char[41]),
	.col_reg_20(row1_char[42]),
	.col_reg_30(row1_char[43]),
	.col_reg_40(row1_char[44])
);


vga_gen_col col_row1_char10(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_10),
	.col_reg_0(row1_char[45]),
	.col_reg_10(row1_char[46]),
	.col_reg_20(row1_char[47]),
	.col_reg_30(row1_char[48]),
	.col_reg_40(row1_char[49])
);


vga_gen_col col_row1_char11(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_11),
	.col_reg_0(row1_char[50]),
	.col_reg_10(row1_char[51]),
	.col_reg_20(row1_char[52]),
	.col_reg_30(row1_char[53]),
	.col_reg_40(row1_char[54])
);


vga_gen_col col_row1_char12(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_12),
	.col_reg_0(row1_char[55]),
	.col_reg_10(row1_char[56]),
	.col_reg_20(row1_char[57]),
	.col_reg_30(row1_char[58]),
	.col_reg_40(row1_char[59])
);


vga_gen_col col_row2_char1(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_13),
	.col_reg_0(row2_char[0]),
	.col_reg_10(row2_char[1]),
	.col_reg_20(row2_char[2]),
	.col_reg_30(row2_char[3]),
	.col_reg_40(row2_char[4])
);


vga_gen_col col_row2_char2(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_14),
	.col_reg_0(row2_char[5]),
	.col_reg_10(row2_char[6]),
	.col_reg_20(row2_char[7]),
	.col_reg_30(row2_char[8]),
	.col_reg_40(row2_char[9])
);


vga_gen_col col_row2_char3(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_15),
	.col_reg_0(row2_char[10]),
	.col_reg_10(row2_char[11]),
	.col_reg_20(row2_char[12]),
	.col_reg_30(row2_char[13]),
	.col_reg_40(row2_char[14])
);


vga_gen_col col_row2_char4(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_16),
	.col_reg_0(row2_char[15]),
	.col_reg_10(row2_char[16]),
	.col_reg_20(row2_char[17]),
	.col_reg_30(row2_char[18]),
	.col_reg_40(row2_char[19])
);


vga_gen_col col_row2_char5(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_17),
	.col_reg_0(row2_char[20]),
	.col_reg_10(row2_char[21]),
	.col_reg_20(row2_char[22]),
	.col_reg_30(row2_char[23]),
	.col_reg_40(row2_char[24])
);


vga_gen_col col_row2_char6(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_18),
	.col_reg_0(row2_char[25]),
	.col_reg_10(row2_char[26]),
	.col_reg_20(row2_char[27]),
	.col_reg_30(row2_char[28]),
	.col_reg_40(row2_char[29])
);


vga_gen_col col_row2_char7(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_19),
	.col_reg_0(row2_char[30]),
	.col_reg_10(row2_char[31]),
	.col_reg_20(row2_char[32]),
	.col_reg_30(row2_char[33]),
	.col_reg_40(row2_char[34])
);


vga_gen_col col_row2_char8(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_20),
	.col_reg_0(row2_char[35]),
	.col_reg_10(row2_char[36]),
	.col_reg_20(row2_char[37]),
	.col_reg_30(row2_char[38]),
	.col_reg_40(row2_char[39])
);


vga_gen_col col_row2_char9(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_21),
	.col_reg_0(row2_char[40]),
	.col_reg_10(row2_char[41]),
	.col_reg_20(row2_char[42]),
	.col_reg_30(row2_char[43]),
	.col_reg_40(row2_char[44])
);


vga_gen_col col_row2_char10(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_22),
	.col_reg_0(row2_char[45]),
	.col_reg_10(row2_char[46]),
	.col_reg_20(row2_char[47]),
	.col_reg_30(row2_char[48]),
	.col_reg_40(row2_char[49])
);


vga_gen_col col_row2_char11(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_23),
	.col_reg_0(row2_char[50]),
	.col_reg_10(row2_char[51]),
	.col_reg_20(row2_char[52]),
	.col_reg_30(row2_char[53]),
	.col_reg_40(row2_char[54])
);


vga_gen_col col_row2_char12(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_24),
	.col_reg_0(row2_char[55]),
	.col_reg_10(row2_char[56]),
	.col_reg_20(row2_char[57]),
	.col_reg_30(row2_char[58]),
	.col_reg_40(row2_char[59])
);


vga_gen_col col_row3_char1(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_25),
	.col_reg_0(row3_char[0]),
	.col_reg_10(row3_char[1]),
	.col_reg_20(row3_char[2]),
	.col_reg_30(row3_char[3]),
	.col_reg_40(row3_char[4])
);


vga_gen_col col_row3_char2(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_26),
	.col_reg_0(row3_char[5]),
	.col_reg_10(row3_char[6]),
	.col_reg_20(row3_char[7]),
	.col_reg_30(row3_char[8]),
	.col_reg_40(row3_char[9])
);


vga_gen_col col_row3_char3(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_27),
	.col_reg_0(row3_char[10]),
	.col_reg_10(row3_char[11]),
	.col_reg_20(row3_char[12]),
	.col_reg_30(row3_char[13]),
	.col_reg_40(row3_char[14])
);


vga_gen_col col_row3_char4(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_28),
	.col_reg_0(row3_char[15]),
	.col_reg_10(row3_char[16]),
	.col_reg_20(row3_char[17]),
	.col_reg_30(row3_char[18]),
	.col_reg_40(row3_char[19])
);


vga_gen_col col_row3_char5(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_29),
	.col_reg_0(row3_char[20]),
	.col_reg_10(row3_char[21]),
	.col_reg_20(row3_char[22]),
	.col_reg_30(row3_char[23]),
	.col_reg_40(row3_char[24])
);


vga_gen_col col_row3_char6(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_30),
	.col_reg_0(row3_char[25]),
	.col_reg_10(row3_char[26]),
	.col_reg_20(row3_char[27]),
	.col_reg_30(row3_char[28]),
	.col_reg_40(row3_char[29])
);


vga_gen_col col_row3_char7(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_31),
	.col_reg_0(row3_char[30]),
	.col_reg_10(row3_char[31]),
	.col_reg_20(row3_char[32]),
	.col_reg_30(row3_char[33]),
	.col_reg_40(row3_char[34])
);


vga_gen_col col_row3_char8(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_32),
	.col_reg_0(row3_char[35]),
	.col_reg_10(row3_char[36]),
	.col_reg_20(row3_char[37]),
	.col_reg_30(row3_char[38]),
	.col_reg_40(row3_char[39])
);


vga_gen_col col_row3_char9(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_33),
	.col_reg_0(row3_char[40]),
	.col_reg_10(row3_char[41]),
	.col_reg_20(row3_char[42]),
	.col_reg_30(row3_char[43]),
	.col_reg_40(row3_char[44])
);


vga_gen_col col_row3_char10(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_34),
	.col_reg_0(row3_char[45]),
	.col_reg_10(row3_char[46]),
	.col_reg_20(row3_char[47]),
	.col_reg_30(row3_char[48]),
	.col_reg_40(row3_char[49])
);


vga_gen_col col_row3_char11(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_35),
	.col_reg_0(row3_char[50]),
	.col_reg_10(row3_char[51]),
	.col_reg_20(row3_char[52]),
	.col_reg_30(row3_char[53]),
	.col_reg_40(row3_char[54])
);


vga_gen_col col_row3_char12(
	.clk(clk),
	.rst_n(rst_n),
	.input_ascii(char_36),
	.col_reg_0(row3_char[55]),
	.col_reg_10(row3_char[56]),
	.col_reg_20(row3_char[57]),
	.col_reg_30(row3_char[58]),
	.col_reg_40(row3_char[59])
);


integer temp;
integer current_char;
integer offset;

	always @ (posedge vga_clk or negedge rst_n)
	begin
		if (!rst_n) begin
			vga_r <= 0;
			vga_g <= 0;
			vga_b <= 0;
		end
		else 
            if (pixel_x>=LEFT_BOUND) begin // && pixel_x<=RIGHT_BOUND && pixel_y>=UP_BOUND && pixel_y<=DOWN_BOUND) begin // 如果是在显示区域
                if (pixel_y>=up_pos_row1 && pixel_y<=down_pos_row1) begin
                    temp = pixel_x - START_DISPLAY_COLUMN;
					current_char = temp / (INTERNAL_SPACE + 50);
					offset = temp % (INTERNAL_SPACE + 50);
					if (offset>=50) begin // space
						vga_r <= 3'b000;
						vga_g <= 3'b000;
						vga_b <= 3'b000;
					end else begin
						offset = offset / 10;
						offset = current_char * 5 + offset;
						if (row1_char[offset][69-(pixel_y-up_pos_row1)]) begin
							vga_r <= 3'b111;
							vga_g <= 3'b111;
							vga_b <= 3'b111;
						end
						else begin
							vga_r <= 3'b000;
							vga_g <= 3'b000;
							vga_b <= 3'b000;
						end
					end
                end

                else if (pixel_y>=up_pos_row2 && pixel_y<=down_pos_row2) begin
					temp = pixel_x - START_DISPLAY_COLUMN;
					current_char = temp / (INTERNAL_SPACE + 50);
					offset = temp % (INTERNAL_SPACE + 50);
					if (offset>=50) begin // space
						vga_r <= 3'b000;
						vga_g <= 3'b000;
						vga_b <= 3'b000;
					end else begin
						offset = offset / 10;
						offset = current_char * 5 + offset;
						if (row2_char[offset][69-(pixel_y-up_pos_row2)]) begin
							vga_r <= 3'b111;
							vga_g <= 3'b111;
							vga_b <= 3'b111;
						end
						else begin
							vga_r <= 3'b000;
							vga_g <= 3'b000;
							vga_b <= 3'b000;
						end
					end
                end

                else if (pixel_y>=up_pos_row3 && pixel_y<=down_pos_row3) begin
					temp = pixel_x - START_DISPLAY_COLUMN;
					current_char = temp / (INTERNAL_SPACE + 50);
					offset = temp % (INTERNAL_SPACE + 50);
					if (offset>=50) begin // space
						vga_r <= 3'b000;
						vga_g <= 3'b000;
						vga_b <= 3'b000;
					end else begin
						offset = offset / 10;
						offset = current_char * 5 + offset;
						if (row3_char[offset][69-(pixel_y-up_pos_row3)]) begin
							vga_r <= 3'b111;
							vga_g <= 3'b111;
							vga_b <= 3'b111;
						end
						else begin
							vga_r <= 3'b000;
							vga_g <= 3'b000;
							vga_b <= 3'b000;
						end
					end
				end
                else begin
                    vga_r <= 3'b000;
                    vga_g <= 3'b000;
                    vga_b <= 3'b000;
                end
            end
            else begin
                vga_r <= 3'b000;
                vga_g <= 3'b000;
                vga_b <= 3'b000;
            end
	end

endmodule
