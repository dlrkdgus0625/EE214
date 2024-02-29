`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/09 03:18:06
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input register,
    input [2:0] Cen,
    input [12:0] random,
    
    output [15:0] out,
    output reg led,
    output reg avgLed,
    output reg reset,
    output reg start_count,
    output reg average_total
    );
    
    reg reg_en;
    reg [15:0] count;
    reg [15:0] regCount;
    reg [12:0] counter;
    
    reg [3:0] save_count;
    
//    always@(register)
//    begin
//        if(register)
//        begin
//            reg_en <= 1;
//            save_count <= save_count +1;
//            
//        end
//    end
    always@(posedge(clk))
    begin  
        case(Cen)
            3'b000 : 
            begin
                count <= 0;
                counter <= 0;
                led <= 1'b0;
                avgLed <= 1'b0;
                reset <= 1;
                //reg_en <= 0;
                start_count <= 0;
                
            end
            
            3'b001 : 
            begin    
                if(counter == random)
                    start_count <= 1;
                else
                    counter <= counter +1;
            end
            
            3'b010 :
            begin
                reset <= 0;
                count <= count +1;
                led <= 1'b1;
            end
            
            3'b011 :
            begin
                count <= count;
                led <= 1'b0;
            end
            
            3'b111 :
            begin
                //if(reg_en == 1)
                regCount <= regCount + count;
                save_count <= save_count +1;
                if(save_count == 8)
                begin
                   avgLed <= 1'b1;
                   average_total <= 1; 
                   count <= regCount >> 3;
                end
            end
            
            3'b101 :
                count <= regCount >> 3;//regCount/16'd8;
                
            3'b110 : begin
                regCount <= 0;
                save_count <= 0;
                end
        endcase 
    end       
    
    
    assign out = count;   
endmodule
