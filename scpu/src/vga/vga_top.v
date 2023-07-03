`timescale 1ns / 1ps

module vga_top(
    input CLK50MHZ,
    input CPU_RESETN,

    output VGA_HS_O,
    output VGA_VS_O,
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B
);

    wire    vga_clk;
    wire    [9:0]   pixel_x;
    wire    [9:0]   pixel_y; 
    wire            video_on;

    wire [31:0] test;

    reg [7:0] string_buffer[35:0]; // 十二个字符一行，共三行

    initial begin
        string_buffer[0] = 8'b01000001; // "A"
        string_buffer[1] = 8'b01000010; // "B"
        string_buffer[2] = 8'b01000011; // "C"
        string_buffer[3] = 8'b01000100; // "D"
        string_buffer[4] = 8'b01000101; // "E"
        string_buffer[5] = 8'b01000110; // "F"
        string_buffer[6] = 8'b01000111; // "G"
        string_buffer[7] = 8'b01001000; // "H"
        string_buffer[8] = 8'b01001001; // "I"
        string_buffer[9] = 8'b01001010; // "J"
        string_buffer[10] = 8'b01001011; // "K"
        string_buffer[11] = 8'b01001100; // "L"
        string_buffer[12] = 8'b01001101; // "M"
        string_buffer[13] = 8'b01001110; // "N"
        string_buffer[14] = 8'b01001111; // "O"
        string_buffer[15] = 8'b01010000; // "P"
        string_buffer[16] = 8'b01010001; // "Q"
        string_buffer[17] = 8'b01010010; // "R"
        string_buffer[18] = 8'b01010011; // "S"
        string_buffer[19] = 8'b01010100; // "T"
        string_buffer[20] = 8'b01010101; // "U"
        string_buffer[21] = 8'b01010110; // "V"
        string_buffer[22] = 8'b01010111; // "W"
        string_buffer[23] = 8'b01011000; // "X"
        string_buffer[24] = 8'b01011001; // "Y"
        string_buffer[25] = 8'b01011010; // "Z"
        string_buffer[26] = 8'b00110000; // "0"
        string_buffer[27] = 8'b00110001; // "1"
        string_buffer[28] = 8'b00110010; // "2"
        string_buffer[29] = 8'b00110011; // "3"
        string_buffer[30] = 8'b00110100; // "4"
        string_buffer[31] = 8'b00110101; // "5"
        string_buffer[32] = 8'b00110110; // "6"
        string_buffer[33] = 8'b00110111; // "7"
        string_buffer[34] = 8'b00111000; // "8"
        string_buffer[35] = 8'b00111001; // "9"
    end

    vga_sync     u_vga_sync (
        .clk                     ( CLK50MHZ        ),
        .rst_n                   ( CPU_RESETN           ),

        .hsync                   ( VGA_HS_O        ),
        .vsync                   ( VGA_VS_O        ),
        .video_on                ( video_on        ),
        .p_tick                  ( vga_clk         ),
        .pixel_x                 ( pixel_x   [9:0] ),
        .pixel_y                 ( pixel_y   [9:0] )
    );

    vga_gen_grafic     u_rgb_out  (
        .clk(CLK50MHZ),
        .rst_n(CPU_RESETN),
        .char_1(string_buffer[0]),
        .char_2(string_buffer[1]),
        .char_3(string_buffer[2]),
        .char_4(string_buffer[3]),
        .char_5(string_buffer[4]),
        .char_6(string_buffer[5]),
        .char_7(string_buffer[6]),
        .char_8(string_buffer[7]),
        .char_9(string_buffer[8]),
        .char_10(string_buffer[9]),
        .char_11(string_buffer[10]),
        .char_12(string_buffer[11]),
        .char_13(string_buffer[12]),
        .char_14(string_buffer[13]),
        .char_15(string_buffer[14]),
        .char_16(string_buffer[15]),
        .char_17(string_buffer[16]),
        .char_18(string_buffer[17]),
        .char_19(string_buffer[18]),
        .char_20(string_buffer[19]),
        .char_21(string_buffer[20]),
        .char_22(string_buffer[21]),
        .char_23(string_buffer[22]),
        .char_24(string_buffer[23]),
        .char_25(string_buffer[24]),
        .char_26(string_buffer[25]),
        .char_27(string_buffer[26]),
        .char_28(string_buffer[27]),
        .char_29(string_buffer[28]),
        .char_30(string_buffer[29]),
        .char_31(string_buffer[30]),
        .char_32(string_buffer[31]),
        .char_33(string_buffer[32]),
        .char_34(string_buffer[33]),
        .char_35(string_buffer[34]),
        .char_36(string_buffer[35]),
        .vga_clk(vga_clk),
        .pixel_x(pixel_x),
        .pixel_y(pixel_y),
        .video_on(video_on),
        .vga_r(VGA_R),
        .vga_b(VGA_B),
        .vga_g(VGA_G)
    );

endmodule 