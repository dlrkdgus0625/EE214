`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/09 02:53:37
// Design Name: 
// Module Name: SM
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


module SM(
    input start,
    input react,
    input register,
    input average,
    
    input clk,
    input OneHz,
    
    input led,
    input start_count,
    input average_total,
    
    output [2:0] Cen

    );
    
    localparam S0 = 3'b000; //reset default state
    localparam S1 = 3'b001; // random set state
    localparam S2 = 3'b010; // count state
    localparam S3 = 3'b011; //react state
    localparam S4 = 3'b100; // after react state save state
    localparam S5 = 3'b101; // average state if it has been saved 8 times
    localparam S6 = 3'b110; // reset 
    localparam S7 = 3'b111; // reset 
    
    reg [2:0] pState, nState;
    reg [31:0] count;
    
    always@(posedge(clk))
    begin
        case(pState)
            S0: begin
                if(start == 1'b1)
                    nState = S1;
                else
                    nState = S0;
                end 
            
            S1: begin
                if(start_count == 1'b1)
                    nState = S2;
                else
                    nState = S1;
                end     
            S2: begin
                if(react == 1'b1)
                    nState = S3;
                else
                    nState = S2;
                end
                
            S3: begin
                if(register == 1'b1)
                    nState = S7;
                else
                    nState = S3;
                end
                
            S4: begin
                if(average_total==1 && average == 1)
                    nState = S5;
                else if(start)
                    nState = S0;
                else
                    nState = S4;
                end
            
            S5:
                nState <= S6;
            S6: 
                nState <= S0;
            S7:
               nState <=S4;      
        endcase        
    end   
    
    always@(posedge(clk))
        pState <= nState;
        
   assign Cen = pState;     
   
endmodule
