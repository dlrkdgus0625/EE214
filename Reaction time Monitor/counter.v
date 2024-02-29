`timescale 1ns / 1ps

module counter(
    input clk,
    input [1:0] Cen,
    //input start_count,
    input [12:0] random,
    //input rst,
    
    output [15:0] out,
    output reg led,
    output reg reset,
    output reg start_count
    //output reg reset
    );
    
    reg [15:0] count;
    //reg [15:0] rCount;
    //reg [15:0] random;
    
    
    reg [12:0] counter;
    
    always @ (posedge clk) begin
    case(Cen)
    2'b00 : begin
        count <= 0;
        counter = 0;
        led <= 1'b0;
        reset <= 1;
        start_count <= 0;
        end
    2'b01 : begin
//        if(start_count == 1)
//            led <= 1'b1;

        if(counter == random) begin
            start_count <= 1;
        end
        else
            counter <= counter +1;
            end
    2'b10 : begin
        reset <= 0;
        count <= count +1;
        led <= 1'b1;
    end
    2'b11 : begin
        count <= count;
        led <= 1'b0;
        end
    endcase
    end
    
//    if(Cen == 2'b10&&!rst)
//    count <= count + 1;
//    else
//    count = 0;
//    end
    assign out = count;
            
endmodule
