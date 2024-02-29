`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2022 03:54:42 PM
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
    input clk,
    input rst,
    output reg out,
    output [1:0]annode
    );
    
    
    localparam terminalcount1 = (50000 - 1);
    reg [15:0] count;
    wire tc;
    
    assign annode = count[9:8];

    
    assign tc = (count == terminalcount1);
    
    always@(posedge(clk),posedge(rst))
    begin
    if(rst || (count > terminalcount1))
        count<=0;
    else
        count <= count +1;
    end
    
    always @ (posedge(tc))
    begin
    if (rst) out <= 0;
    else out = !out;
    end	// T-FF with tc as input signal
    endmodule
