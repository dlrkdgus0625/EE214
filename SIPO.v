`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2022 03:38:39 AM
// Design Name: 
// Module Name: SIPO
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


module SIPO(
    input [7:0] sw,
    input clk,
    input En,
    
    output reg [15:0] Y
    );
    
    
    reg change;
    always @ (posedge(En))
    begin
       
        if(En == 1)
            Y = {Y[14:0], sw[0]};
            end
        
endmodule
