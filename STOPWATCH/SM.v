`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/28 08:45:47
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
    input stop,
    input add,
    input rst,
    input clk,
    
    //output out,
    output [1:0] Cen
    );
    
    // Define State Codes
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;
    //localparam S4 = 3'b110;
    //localparam S5 = 3'b111;
    
    reg [1:0] pState, nState;
    
    always@(pState, start, stop, add)
    begin
        case(pState)
            S0: begin
                if(start == 1'b0 && stop == 1'b0 && add == 1'b0)
                    nState = S0;
                else if(start == 1'b0 && stop == 1'b0 && add == 1'b1)
                    nState = S2;
                else if(start == 1'b1 && stop == 1'b0 && add == 1'b0)
                    nState = S1;
                end
            S1:
                if(start == 1'b0 && (stop == 1'b1 || add == 1'b1))
                    nState = S0;
                else
                    nState = S1;
            S2:
            /*
                if(start == 1'b0 && stop == 1'b0 && add == 1'b0)
                    nState = S0;
                else
                */ 
                if(start == 1'b1 && stop == 1'b0 && add == 1'b0)
                    nState = S1;
                else if(add == 1'b1)
                    nState = S3;
            S3: 
            
                if(start == 1'b0 && stop == 1'b0 && add == 1'b1)
                    nState = S3;
                    
                else if(start == 1'b0 && stop == 1'b0 && add == 1'b0)
                    nState = S0;
            default:
                nState = S0;         
        endcase
    end
    
    always@(posedge(clk),posedge(rst))
    begin
        if(rst)
            pState <= S0;
        else
            pState <= nState;
    end
    
    assign Cen = pState;
    
endmodule
