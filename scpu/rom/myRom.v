`timescale 1ns / 1ps

module myRom(
    input [10:0] address,
    output [31:0] out
);
    reg [31:0] rom [0:2047];


    localparam FILE_PATH = "C:/Users/ethereal/Desktop/university/3-00ZJUcourse/computer_systemIII/xpart/scpu/rom/kernel_normal2.sim";
    // localparam FILE_PATH = "C:/Users/ethereal/Desktop/university/3-00ZJUcourse/computer_systemIII/xpart/test/result.txt";
    initial begin
        $readmemh(FILE_PATH, rom);
    end

    assign out = rom[address];
endmodule
