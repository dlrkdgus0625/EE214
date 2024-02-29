`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2022 03:11:25 AM
// Design Name: 
// Module Name: PIPO
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


module PIPO(
    input [7:0] sw,
   // input Clk,
    //input Sel,
    input [1:0] btn,
    input clk,
    output reg [7:0] led
    );
    
    reg [7:0] x;
    
    

    always@(posedge(clk))
    begin   
        if(btn[0] == 1)
            led = x;
        else if(btn[1] ==1)
            x = sw;
        else
            led = sw;
     
            
    end
    
endmodule
