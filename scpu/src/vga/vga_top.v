`timescale 1ns / 1ps

module vga_top(
    input CLK50MHZ,
    input CPU_RESETN,

    input [7:0] string_buffer_0,
    input [7:0] string_buffer_1,
    input [7:0] string_buffer_2,
    input [7:0] string_buffer_3,
    input [7:0] string_buffer_4,
    input [7:0] string_buffer_5,
    input [7:0] string_buffer_6,
    input [7:0] string_buffer_7,
    input [7:0] string_buffer_8,
    input [7:0] string_buffer_9,
    input [7:0] string_buffer_10,
    input [7:0] string_buffer_11,
    input [7:0] string_buffer_12,
    input [7:0] string_buffer_13,
    input [7:0] string_buffer_14,
    input [7:0] string_buffer_15,
    input [7:0] string_buffer_16,
    input [7:0] string_buffer_17,
    input [7:0] string_buffer_18,
    input [7:0] string_buffer_19,
    input [7:0] string_buffer_20,
    input [7:0] string_buffer_21,
    input [7:0] string_buffer_22,
    input [7:0] string_buffer_23,
    input [7:0] string_buffer_24,
    input [7:0] string_buffer_25,
    input [7:0] string_buffer_26,
    input [7:0] string_buffer_27,
    input [7:0] string_buffer_28,
    input [7:0] string_buffer_29,
    input [7:0] string_buffer_30,
    input [7:0] string_buffer_31,
    input [7:0] string_buffer_32,
    input [7:0] string_buffer_33,
    input [7:0] string_buffer_34,
    input [7:0] string_buffer_35,

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
        .char_1(string_buffer_0),
        .char_2(string_buffer_1),
        .char_3(string_buffer_2),
        .char_4(string_buffer_3),
        .char_5(string_buffer_4),
        .char_6(string_buffer_5),
        .char_7(string_buffer_6),
        .char_8(string_buffer_7),
        .char_9(string_buffer_8),
        .char_10(string_buffer_9),
        .char_11(string_buffer_10),
        .char_12(string_buffer_11),
        .char_13(string_buffer_12),
        .char_14(string_buffer_13),
        .char_15(string_buffer_14),
        .char_16(string_buffer_15),
        .char_17(string_buffer_16),
        .char_18(string_buffer_17),
        .char_19(string_buffer_18),
        .char_20(string_buffer_19),
        .char_21(string_buffer_20),
        .char_22(string_buffer_21),
        .char_23(string_buffer_22),
        .char_24(string_buffer_23),
        .char_25(string_buffer_24),
        .char_26(string_buffer_25),
        .char_27(string_buffer_26),
        .char_28(string_buffer_27),
        .char_29(string_buffer_28),
        .char_30(string_buffer_29),
        .char_31(string_buffer_30),
        .char_32(string_buffer_31),
        .char_33(string_buffer_32),
        .char_34(string_buffer_33),
        .char_35(string_buffer_34),
        .char_36(string_buffer_35),
        .vga_clk(vga_clk),
        .pixel_x(pixel_x),
        .pixel_y(pixel_y),
        .video_on(video_on),
        .vga_r(VGA_R),
        .vga_b(VGA_B),
        .vga_g(VGA_G)
    );

endmodule 