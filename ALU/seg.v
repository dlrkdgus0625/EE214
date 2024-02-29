`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2022 01:08:39 PM
// Design Name: 
// Module Name: seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seg(
input clk,
input rst,
input [15:0] result,
output reg [6:0] out,
output reg [3:0] X,
output [1:0] annode_active
);

reg [3:0] bcd_digit;
reg [3:0] bcd_digit2;
reg [3:0] bcd_digit3;
reg [3:0] bcd_digit4;

always@(result)
begin
bcd_digit <= result[3:0];
bcd_digit2 <= result[7:4];
bcd_digit3 <= result[11:8];
bcd_digit4 <= result[15:12];
end

/*
always@(result[3:0])bcd_digit <= result[3:0];
always@(result[7:4]) bcd_digit2 <= result[7:4];
always@(result[11:8]) bcd_digit3 <= result;
always@(result[15:12]) bcd_digit4 <= result;
*/
 
 reg [3:0] num;
always @ * begin
    case(annode_active)
        2'b00: begin
            X = 4'b1110;
            num = bcd_digit;
        end
        2'b01: begin
            X = 4'b1101;
            num = bcd_digit2;
        end
        2'b10:begin
            X = 4'b1011;
            num = bcd_digit3;
        end
        2'b11:begin
            X = 4'b0111;
            num = bcd_digit4;
        end
    endcase
end

always@(num)
begin
    case(num)
        1: out <= 7'b1001111;
        2: out <= 7'b0100100;
        3: out <= 7'b0110000;
        4: out <= 7'b0011001;
        5: out <= 7'b0010010;
        6: out <= 7'b0000010;
        7: out <= 7'b1111000;
        8: out <= 7'b0000000;
        9: out <= 7'b0010000;
        default: out <= 7'b1000000;
        endcase
        
end
    
endmodule
