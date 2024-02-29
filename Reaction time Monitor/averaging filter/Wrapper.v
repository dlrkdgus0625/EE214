`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/09 02:36:12
// Design Name: 
// Module Name: Wrapper
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


module Wrapper(
    input start,
    input react,
    input register,
    input clk,
    
    output [3:0] led,
    output avgLed,
    output [6:0] value,
    output [3:0] X
    );
    
    wire result;
    wire OneHz;
    wire [2:0] Cen;
    wire reset;
    wire [1:0] annode;
    wire [15:0] counterResult;
    
    wire start_count;
    wire average_total;
    
    wire [12:0] random;
    
    assign led[3:1] = Cen;
    
        clkdivider thousandHz(
        .clk(clk),
        .out(result),
        .annode(annode)
        );
        
        clkdivider2 hundredMHz(
        .start(start),
        .clk(result),
        .out(OneHz),
        .random(random)
        );
        
        SM SM(
        .clk(result),
        .OneHz(OneHz),
        .start(start),
        .register(register),
        .average(average),
        .react(react),
        .Cen(Cen), 
        .start_count(start_count),
        .average_total(average_total)
        ); 
       
       counter counter(
        .clk(result),
        .register(register),
        .Cen(Cen),
        .start_count(start_count),
        .average_total(average_total),
        .reset(reset),
        .random(random),
        .out(counterResult),
        .led(led[0]),
        .avgLed(avgLed)
        );
        
        
    seg seg(
        .clk(counterResult),
        .reset(reset),
        .out(value),
        .X(X),
        .annode_active(annode)
        ); 
        
endmodule
