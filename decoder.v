`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2022 12:36:48 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [1:0] a,
    input [3:0] b,
    input En,
    output reg[3:0] y
    );
    
    always@(a,b,En)
    begin
     
        if(a == 2'b00 & b == 4'b0001)
            y=4'b0001;
        else if(a==2'b01 & b==4'b0010)
            y=4'b0010;
        else if(a==2'b10 & b==4'b0100)
            y=4'b0100;
        else if(a==2'b11 & b==4'b1000)
            y=4'b1000;
        else
            y=4'b0000;
       // else y=4'b1111;
           
    end
   
endmodule
