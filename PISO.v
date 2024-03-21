`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2022 01:12:44 AM
// Design Name: 
// Module Name: PISO
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


module PISO(
    input [7:0] sw,
    input clk,
    input save,
    //input load,

    
    output reg [15:0] Y
    );
    
    reg [25:0] cntr;
    reg load;
    //reg [15:0] tmp;
    
    always@(posedge(clk))
    begin
    cntr <= cntr + 1;
    end
    
    always@(posedge(cntr[25]))
    begin 
    if (save == 1)
        load = 1;
    if (load == 1)
        Y = {Y[14:0], Y[15]};
    else
        Y = sw;
    
    end
   
endmodule
