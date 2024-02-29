`timescale 1ns / 1ps


module demux(
    input  EN,
    input [2:0] I,
    output reg [7:0] Y
    
    );
    
    always@(I,EN)
    begin
        case(I)
            3'b000: begin
                Y[0] <= EN;
                Y[7:1] = 0;
               
            end
            3'b001: begin
                Y[1] <= EN;
                Y[0] = 0;
                Y[7:2] = 0;
               
            end
            3'b010: begin
                Y[2] <= EN;
                Y[1:0] = 0;
                Y[7:3] = 0;
           
            end
            3'b011: begin
            Y[3] <= EN;
            Y[2:0] = 0;
            Y[7:4] = 0;
         
            end
            3'b100: begin
            Y[4] <= EN;
            Y[3:0] = 0;
            Y[7:5] = 0;
         
            end
            3'b101: begin
            Y[5] <= EN;
            Y[7:6] = 0;
            Y[4:0] = 0;
          
            end
            3'b110: begin
            Y[6] <= EN;
            Y[7] = 0;
            Y[5:0] = 0;
         
            end
            3'b111: begin
            Y[7] <= EN;
            Y[6:0] = 0;
    
            end
            default: Y[0] = 0;
        endcase
    end

    
endmodule
