`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2022 10:41:39 AM
// Design Name: 
// Module Name: SecCount
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


module SecCount(
    input clk,
    input start,
    input rst,
    output reg out,
    output [12:0] random
    );
    
    localparam terminalcount = (50000000-1);
    wire tc;
    reg [15:0] count;
    
    assign tc = (count == terminalcount);
    reg [12:0] rand;
    
    //rand = count[6:4];
    assign random = rand;
    
    always@(posedge(start))
    begin
        rand = count[12:0];
    end
    
    always@(posedge(clk))
    begin
    if(tc)
        count<=0;
    else
        count <= count +1;
        end
        
    always @ (posedge (tc))
    begin
    if (rst) out <= 0;
    else out = !out;	// T-FF with tc as input signal
    end
    endmodule
