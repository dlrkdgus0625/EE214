`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2022 12:11:35 PM
// Design Name: 
// Module Name: bin2seg
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


module bin2seg(
    input [3:0] in1,
    input [3:0] in2,
    input [1:0] btn,
    output reg [6:0] out,
    output reg [3:0] X 
    
    );
    always@(in1, in2)
    begin
    if(btn == 1) begin
        case(in1)
        1: out <= 7'b1001111;
        2: out <= 7'b0100100;
        3: out <= 7'b0110000;
        4: out <= 7'b0011001;
        5: out <= 7'b0010010;
        6: out <= 7'b0000010;
        7: out <= 7'b1111000;
        8: out <= 7'b0000000;
        9: out <= 7'b0010000;
        10: out <= 7'b0001000;
        11: out <= 7'b0000011;
        12: out <= 7'b1000110;
        13: out <= 7'b0100001;
        14: out <= 7'b0000110;
        15: out <= 7'b0001110;
        default: out <= 7'b1000000;
        endcase
        X <= 4'b1101;
        end
    else begin
        case(in2)
        1: out <= 7'b1001111;
        2: out <= 7'b0100100;
        3: out <= 7'b0110000;
        4: out <= 7'b0011001;
        5: out <= 7'b0010010;
        6: out <= 7'b0000010;
        7: out <= 7'b1111000;
        8: out <= 7'b0000000;
        9: out <= 7'b0010000;
        10: out <= 7'b0001000;
        11: out <= 7'b0000011;
        12: out <= 7'b1000110;
        13: out <= 7'b0100001;
        14: out <= 7'b0000110;
        15: out <= 7'b0001110;
        default: out <= 7'b1000000;
     endcase    
        X <= 4'b1110;
     end
     end
endmodule
