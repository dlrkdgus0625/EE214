`timescale 1ns / 1ps

module clkdivider(
    input clk,
    input rst,
    output reg out,
    //output [9:0] rand,
    output [1:0] annode
   // output [15:0] random
    );
    
    
    localparam terminalcount1 = (50000 - 1);
    reg [15:0] count;
    //reg [9:0] rand;
    //reg clk2;
    wire tc;
    
    assign tc = (count == terminalcount1);
    
    //assign random = count[15:0];
    
    always@(posedge(clk))
    begin
        if(tc)
            count <= 0;
        else
        count <= count + 1;
    end
    
    
    always@(posedge(tc))
    begin
    if(rst)
        out <= 0;
    else 
        out <= !out;
    end
    assign annode = count [9:8];
    
endmodule