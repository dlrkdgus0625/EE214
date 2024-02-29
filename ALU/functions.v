`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2022 12:06:46 PM
// Design Name: 
// Module Name: functions
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


module functions(
    input [7:0] sw,
    input [2:0] funcLoad,
    input [1:0] btn,
    
    output reg [15:0] S,
    output reg led
    );
    
    reg [7:0] op1, op2, temp;
    
    always@(btn,funcLoad) begin
        if(btn[0]) op1 <= sw;
        if(btn[1]) op2 <= sw;
 
    end
    
    
    always@(funcLoad)begin
    
        case(funcLoad)
        3'b000 : S <= op1 + op2;
        3'b001 : S <= op1 + 1;
        3'b010 : begin 
        if(op2 > op1)begin
            S <= op2 - op1;
            led=1;
            end
            else begin
            S <= op1 - op2;
            led=0;
            end
        end
        3'b011 : S <= op1 ^ op2; 
        3'b100 : S <= op1 | op2;
        3'b101 : S <= op1 & op2;
        endcase
    end
    
endmodule
