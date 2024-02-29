`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2022 11:56:28 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0] sw,
    input [2:0] funcLoad,
    input [1:0] btn,
    input clk,
    
    output [6:0] out,
    output [3:0] X,
    output led
    );
    
    //counter
    wire timing;
    wire [1:0] annode;
    //bin2bcd
    wire [16:0] bcdresult;
    
    counter counter(
        .clk(clk),
        .rst(rst),
        .out(timing),
        .annode(annode)
        );
        
    wire [15:0] S;
    
    functions func(
        .sw(sw),
        .btn(btn),
        .funcLoad(funcLoad),
        .S(S),
        .led(led)
    );
        bin2bcd bin2bcd(
        .bin(S),
        .bcd(bcdresult)
        );
        
        seg seg(
        .clk(timing),
        .rst(rst),
        .result(bcdresult),
        .out(out),
        .X(X),
        .annode_active(annode)
        );
    
    
endmodule
