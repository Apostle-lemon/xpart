`timescale 1ns / 1ps

module vga_dma (
    input clk,
    input aresetn,
    input [63:0] cpu_addr_out,
    input [63:0] vga_dma_data_in,

    output VGA_HS_O,
    output VGA_VS_O,
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B
);

    reg [7:0] dma_ram [0:35]; // 36个字符，每个字符8位

    integer i;

    initial begin
        dma_ram[0] = 8'b00000000; // "*"
        dma_ram[1] = 8'b01001000; // "H"
        dma_ram[2] = 8'b01000101; // "E"
        dma_ram[3] = 8'b01001100; // "L"
        dma_ram[4] = 8'b01001100; // "L"
        dma_ram[5] = 8'b01001111; // "O"
        dma_ram[6] = 8'b00000000; // "*"
        dma_ram[7] = 8'b01010111; // "W"
        dma_ram[8] = 8'b01001111; // "O"
        dma_ram[9] = 8'b01010010; // "R"
        dma_ram[10] = 8'b01001100; // "L"
        dma_ram[11] = 8'b01000100; // "D"
        dma_ram[12] = 8'b00000000; // "*"
        dma_ram[13] = 8'b00000000; // "*"
        dma_ram[14] = 8'b01000111; // "G"
        dma_ram[15] = 8'b01010010; // "R"
        dma_ram[16] = 8'b01001111; // "O"
        dma_ram[17] = 8'b01010101; // "U"
        dma_ram[18] = 8'b01010000; // "P"
        dma_ram[19] = 8'b00000000; // "*"
        dma_ram[20] = 8'b00110100; // "4"
        dma_ram[21] = 8'b00000000; // "*"
        dma_ram[22] = 8'b00000000; // "*"
        dma_ram[23] = 8'b00000000; // "*"
        dma_ram[24] = 8'b00000000; // "*"
        dma_ram[25] = 8'b00000000; // "*"
        dma_ram[26] = 8'b00000000; // "*"
        dma_ram[27] = 8'b01010000; // "P"
        dma_ram[28] = 8'b01001001; // "I"
        dma_ram[29] = 8'b01000100; // "D"
        dma_ram[30] = 8'b00000000; // "*"
        dma_ram[31] = 8'b00110000; // "0"
        dma_ram[32] = 8'b00000000; // "*"
        dma_ram[33] = 8'b00000000; // "*"
        dma_ram[34] = 8'b00000000; // "*"
        dma_ram[35] = 8'b00000000; // "*"
    end

    always @(posedge clk or negedge aresetn) begin
        if(!aresetn) begin
            for (i=0; i<36; i=i+1) begin
                dma_ram[0] = 8'b00000000; // "*"
                dma_ram[1] = 8'b01001000; // "H"
                dma_ram[2] = 8'b01000101; // "E"
                dma_ram[3] = 8'b01001100; // "L"
                dma_ram[4] = 8'b01001100; // "L"
                dma_ram[5] = 8'b01001111; // "O"
                dma_ram[6] = 8'b00000000; // "*"
                dma_ram[7] = 8'b01010111; // "W"
                dma_ram[8] = 8'b01001111; // "O"
                dma_ram[9] = 8'b01010010; // "R"
                dma_ram[10] = 8'b01001100; // "L"
                dma_ram[11] = 8'b01000100; // "D"
                dma_ram[12] = 8'b00000000; // "*"
                dma_ram[13] = 8'b00000000; // "*"
                dma_ram[14] = 8'b01000111; // "G"
                dma_ram[15] = 8'b01010010; // "R"
                dma_ram[16] = 8'b01001111; // "O"
                dma_ram[17] = 8'b01010101; // "U"
                dma_ram[18] = 8'b01010000; // "P"
                dma_ram[19] = 8'b00000000; // "*"
                dma_ram[20] = 8'b00110100; // "4"
                dma_ram[21] = 8'b00000000; // "*"
                dma_ram[22] = 8'b00000000; // "*"
                dma_ram[23] = 8'b00000000; // "*"
                dma_ram[24] = 8'b00000000; // "*"
                dma_ram[25] = 8'b00000000; // "*"
                dma_ram[26] = 8'b00000000; // "*"
                dma_ram[27] = 8'b01010000; // "P"
                dma_ram[28] = 8'b01001001; // "I"
                dma_ram[29] = 8'b01000100; // "D"
                dma_ram[30] = 8'b00000000; // "*"
                dma_ram[31] = 8'b00110000; // "0"
                dma_ram[32] = 8'b00000000; // "*"
                dma_ram[33] = 8'b00000000; // "*"
                dma_ram[34] = 8'b00000000; // "*"
                dma_ram[35] = 8'b00000000; // "*"
            end
        end else if ( cpu_addr_out >= 32'h0b000000 && cpu_addr_out <= 32'h0b0000ff ) begin
            dma_ram[cpu_addr_out[5:0]] <= vga_dma_data_in[7:0];
        end
    end

    vga_top lemon_vga_top(
        .CLK50MHZ(clk),
        .CPU_RESETN(aresetn),

        .string_buffer_0(dma_ram[0]),
        .string_buffer_1(dma_ram[1]),
        .string_buffer_2(dma_ram[2]),
        .string_buffer_3(dma_ram[3]),
        .string_buffer_4(dma_ram[4]),
        .string_buffer_5(dma_ram[5]),
        .string_buffer_6(dma_ram[6]),
        .string_buffer_7(dma_ram[7]),
        .string_buffer_8(dma_ram[8]),
        .string_buffer_9(dma_ram[9]),
        .string_buffer_10(dma_ram[10]),
        .string_buffer_11(dma_ram[11]),
        .string_buffer_12(dma_ram[12]),
        .string_buffer_13(dma_ram[13]),
        .string_buffer_14(dma_ram[14]),
        .string_buffer_15(dma_ram[15]),
        .string_buffer_16(dma_ram[16]),
        .string_buffer_17(dma_ram[17]),
        .string_buffer_18(dma_ram[18]),
        .string_buffer_19(dma_ram[19]),
        .string_buffer_20(dma_ram[20]),
        .string_buffer_21(dma_ram[21]),
        .string_buffer_22(dma_ram[22]),
        .string_buffer_23(dma_ram[23]),
        .string_buffer_24(dma_ram[24]),
        .string_buffer_25(dma_ram[25]),
        .string_buffer_26(dma_ram[26]),
        .string_buffer_27(dma_ram[27]),
        .string_buffer_28(dma_ram[28]),
        .string_buffer_29(dma_ram[29]),
        .string_buffer_30(dma_ram[30]),
        .string_buffer_31(dma_ram[31]),
        .string_buffer_32(dma_ram[32]),
        .string_buffer_33(dma_ram[33]),
        .string_buffer_34(dma_ram[34]),
        .string_buffer_35(dma_ram[35]),

        .VGA_HS_O(VGA_HS_O),
        .VGA_VS_O(VGA_VS_O),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B)
    );

endmodule