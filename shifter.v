`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2022 12:49:38 PM
// Design Name: 
// Module Name: shifter
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


module shifter (
    input [7:0] I, //data inputs, and I for control signals
    input [1:0] S, //shift amount
    input D, //direction
    input R, //rotate/shift R=0 shift R=1 rotate
    input F,//fill
    input En, //enable signal
    output reg [7:0] Y //output of the shifter
);

always @ (I, En,S)
begin
    if (En == 0)
        Y <= I;
    else begin
        
          if(S == 2'b01)
          begin
          if (R == 0)      
              Y <= (D == 0) ? {I[6:0], F} : {F, I[7:1]};  
          else if(R == 1)
               Y <= (D == 0) ? {I[6:0], I[7]} : {I[0], I[7:1]};
        end
        if(S==2'b10) begin
            if(R == 0)     
            Y <= (D == 0) ? {I[5:0], F, F} : {F, F, I[7:2]};  
             else if(R == 1)
            Y <= (D == 0) ? {I[5:0], I[7], I[6]} : {I[0],I[1], I[7:2]};
            end
         if(S == 2'b11) begin
            if(R == 0)     
            Y <= (D == 0) ? {I[4:0], F, F, F} : {F, F, F, I[7:3]};  
             else if(R == 1)
            Y <= (D == 0) ? {I[4:0], I[7], I[6], I[5]} : {I[0],I[1],I[2],I[7:3]};
            end
     end
     
end

endmodule