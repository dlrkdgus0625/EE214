`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2022 10:30:47 AM
// Design Name: 
// Module Name: project2_1
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


module project2_1(

    //project2_1 
    input [7:0] sw,
    output [2:0] led

    );
    
    //project2_1 SOP version
    assign led[0] = (sw[0] & ~sw[1]) | (~sw[0] & sw[1]);
    assign led[1] = (~sw[1] & ~sw[2] & ~sw[3]) | (sw[1] & sw[2] & ~sw[3]) | (sw[1] & ~sw[2] & sw[3]);// you must write this statement
    assign led[2] = (sw[4] & ~sw[5] & ~sw[6] & ~sw[7]) | (sw[4] & sw[5] & ~sw[6] & ~sw[7]) | (~sw[4] & ~sw[5] & sw[6] & ~sw[7]) | (sw[4] & sw[5] & sw[6] & sw[7]);// and this one too
    
    //project2_1 POS
    // assign led[0] = (sw[0] | sw[1]) & (~sw[0] | ~sw[1]);
   // assign led[1] = (sw[1] & sw[2] | sw[1] & sw[3]) | (~sw[1] & ~sw[2] & ~sw[3]) ;
    //assign led[2] = (sw[4] & sw[5]) | sw[4] | sw[6] | (sw[4] &  sw[5] & sw[6] & sw[7]);

   
 
    
    
endmodule
