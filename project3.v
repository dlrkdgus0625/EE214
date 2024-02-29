`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 11:21:22 AM
// Design Name: 
// Module Name: project3
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


module project3(

    input [4:0] sw,
    output [1:0] led
    );
    
    assign led[0] = sw[0] ^ sw[1] ^ sw[2] ^ sw[3] ^ sw[4];
//    (~sw[0] & ~sw[1] & ~sw[2] & ~sw[3] & sw[4]) | 
//                 (~sw[0] & ~sw[1] & ~sw[2] & sw[3] & ~sw[4]) |
//                 (~sw[0] & ~sw[1] & sw[2] & ~sw[3] & ~sw[4]) |
//                 (~sw[0] & ~sw[1] & sw[2] & sw[3] & sw[4])   |
//                 //
//                 (~sw[0] & sw[1] & ~sw[2] & ~sw[3] & ~sw[4]) |
//                 (~sw[0] & sw[1] & ~sw[2] & sw[3] & sw[4]) |
//                 (~sw[0] & sw[1] & sw[2] & ~sw[3] & sw[4]) |
//                 (~sw[0] & sw[1] & sw[2] & sw[3] & ~sw[4]) |
//                 //
//                 (sw[0] & ~sw[1] & ~sw[2] & ~sw[3] & ~sw[4])|
//                 (sw[0] & ~sw[1] & ~sw[2] & sw[3] & sw[4]) |
//                 (sw[0] & ~sw[1] & sw[2] & ~sw[3] & sw[4]) |
//                 (sw[0] & ~sw[1] & sw[2] & sw[3] & ~sw[4]) |
//                 //
//                 (sw[0] & sw[1] & ~sw[2] & ~sw[3] & sw[4]) |
//                 (sw[0] & sw[1] & ~sw[2] & sw[3] & ~sw[4]) |
//                 (sw[0] & sw[1] & sw[2] & ~sw[3] & ~sw[4]) |
//                 (sw[0] & sw[1] & sw[2] & sw[3] & sw[4]);
                 
endmodule
