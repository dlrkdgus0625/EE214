`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/24 07:37:30
// Design Name: 
// Module Name: counter2
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


module counter2(
    input start,
    input add,
    input clk,
    input rst,
    output reg out
    );
    
    localparam terminalcount = (500-1);
    wire tc;
    reg [15:0] count;
    
    assign tc = (count == terminalcount);
    always@(posedge(clk))
    begin
    if(rst || (count > terminalcount))
        count<=0;
    else if(start)
        count <= count +1;
        end
        
   always@(add) begin
    count <= count +1;
    end
        
    always @ (posedge (tc))
    begin
    if (rst) out <= 0;
    else out = !out;	// T-FF with tc as input signal
    end
    endmodule
