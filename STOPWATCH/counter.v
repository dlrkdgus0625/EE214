`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/28 19:16:15
// Design Name: 
// Module Name: counter
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


module counter(
    input rst,
    input clk,
    input [1:0] Cen,
    
    output reg [15:0] count,
    output [1:0] annode
    );
    
    
    //reg [15:0] count;
    
    always@(posedge(clk),posedge(rst))
    begin
        if(rst)
            count <= 0;
        case(Cen)
        2'b00 : count <= count;
        2'b01 : count <= count+1;
        2'b10 : count <= count+1;
        2'b11 : count <= count;
        default :  count <= count;
        endcase
    end
    
    //assign out = count;
    
    
endmodule
