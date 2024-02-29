`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/24 07:37:20
// Design Name: 
// Module Name: counter1
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


module counter1(
    input start,
    input add,
    input clk,
    input rst,
    input stop,
    output reg out,
    output [1:0]annode
    );
    
    
    localparam terminalcount1 = (50000 - 1);
    reg [15:0] count;
    wire tc;
    
    assign annode = count[9:8];

    
    assign tc = (count == terminalcount1);
    
    always@(start, stop, add, rst)
    begin
    if(rst || (count > terminalcount1))
        count<=0;
    else if(start)
        count <= count +1;
    else if(stop)
        count <= count;
    else if(add)
    count <= count +1;
    end

    
    always @ (posedge(tc))
    begin
    if (rst) out <= 0;
    else out = !out;
    end	// T-FF with tc as input signal
    endmodule
