`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2022 01:21:37 AM
// Design Name: 
// Module Name: mux
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


module mux(
    input [7:0] I,
    input [2:0] S,
    output Y,
    output X
    );
    
    reg tmp;

    always@(I,S) begin
        case(S)
        3'b000: tmp <= I[0];
        3'b001: tmp <= I[1];
        3'b010: tmp <= I[2];
        3'b011: tmp <= I[3];
        3'b100: tmp <= I[4];
        3'b101: tmp <= I[5];
        3'b110: tmp <= I[6];
        3'b111: tmp <= I[7];
        default: tmp<= 1'b0;
        endcase
    end
    assign Y = tmp;
    assign X = tmp;
   
    
endmodule
