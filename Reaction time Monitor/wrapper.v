`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/30 12:22:51
// Design Name: 
// Module Name: wrapper
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


module wrapper(
    input start,
    input react,
    input clk,
    input rst,
    output led,
    output [6:0] value,
    output [3:0] X
    );
    
    wire result;
    wire OneHz;
    wire [1:0] Cen;
    wire reset;
    wire [1:0] annode;
    wire [15:0] counterResult;
    wire start_count;
    wire [12:0] random;
    //wire [15:0] random;
    
    
        clkdivider thousandHz(
        .clk(clk),
        .rst(rst),
        .out(result),
        .annode(annode)
        
        );
        
        SecCount hundredMHz(
        .start(start),
        .clk(result),
        .rst(rst),
        .out(OneHz),
        .random(random)
        );
        
    SM SM(
        .clk(result),
        .OneHz(OneHz),
        .start(start),
        .react(react),
        .Cen(Cen), 
        .start_count(start_count), 
        .rst(reset),
        //.random(random),
        .led(led)
        );
        
    counter counter(
        .clk(result),
        .Cen(Cen),
        .start_count(start_count),
        //.rst(rst),
        .reset(reset),
        .random(random),
        .out(counterResult),
        .led(led)
        );
        
        
    seg seg(
        .clk(counterResult),
        .reset(reset),
        .out(value),
        .X(X),
        .annode_active(annode)
        );        
        
endmodule
