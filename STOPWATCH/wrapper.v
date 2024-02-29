`timescale 1ns / 1ps

module wrapper(
    input clk,
    input rst,
    input start,
    input stop,
    input add,
    
    output [6:0] value,
    output [3:0] X
    );
    
    wire result;
   //wire result2;
    wire [1:0] Cen;
    wire [1:0] annode;
    wire [15:0] counterResult;
    
    clkdivider clkdiv(
        .clk(clk),
        .rst(rst),
        .out(result),
        .annode(annode)
        );
     
     SM state_machine(
        .clk(result),
        .start(start),
        .stop(stop),
        .add(add),
        .rst(rst),
        .Cen(Cen)
        );
        
     counter counter(
        .clk(result),
        .Cen(Cen),
        .rst(rst),
        .count(counterResult)
        );
       
        
     seg seg(
        .rst(rst),
        .clk(counterResult),
        .out(value),
        .X(X),
        .annode_active(annode)
        );
        
endmodule
