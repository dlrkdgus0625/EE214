`timescale 1ns / 1ps


module seg(
        input [15:0] clk,
        input reset,
        
        output reg [6:0] out,
        output reg [3:0] X,
        output [1:0] annode_active
        );
        
        reg [3:0] bcd_digit;
        reg [3:0] bcd_digit2;
        reg [3:0] bcd_digit3;
        reg [3:0] bcd_digit4;
        

    always @ (posedge(clk),posedge(reset))
    begin
    if(reset == 1)
    begin
        bcd_digit <= 0;
        bcd_digit2 <= 0;
        bcd_digit3 <= 0;
        bcd_digit4 <= 0;
        end
    else if(bcd_digit == 4'b1001)begin
        bcd_digit <= 0;
        if(bcd_digit2 == 4'b1001)begin
            bcd_digit2 <= 0;
            if(bcd_digit3 == 4'b1001)begin
                bcd_digit3 <= 0;
                if(bcd_digit4 == 4'b1001)begin
                    bcd_digit4 <= 0;
                end
                else bcd_digit4 <= bcd_digit4+1;
            end
            else bcd_digit3 <= bcd_digit3+1;
        end
        else bcd_digit2 <= bcd_digit2+1;
    end    
    else
        bcd_digit <= bcd_digit+1;
    end 

reg [3:0] num;
always @ * begin
    case(annode_active)
        2'b00: begin
            X = 4'b1110;
            if(reset)
            begin
            num = 0;
            end
            else
            num = bcd_digit;
        end
        2'b01: begin
            X = 4'b1101;
            if(reset)
            begin
            num = 0;
            end
            else
            num = bcd_digit2;
        end
        2'b10:begin
            X = 4'b1011;
            if(reset)
            begin
            num = 0;
            end
            else
            num = bcd_digit3;
        end
        2'b11:begin
            X = 4'b0111;
            if(reset)
            begin
            num = 0;
            end
            else
            num = bcd_digit4;
        end
    endcase
end

always@(num)
begin
    case(num)
        0: out <= 7'b1000000;
        1: out <= 7'b1001111;
        2: out <= 7'b0100100;
        3: out <= 7'b0110000;
        4: out <= 7'b0011001;
        5: out <= 7'b0010010;
        6: out <= 7'b0000010;
        7: out <= 7'b1111000;
        8: out <= 7'b0000000;
        9: out <= 7'b0010000;
        default: out <= 7'b1000000;
        endcase
        
        
end
        
        endmodule
