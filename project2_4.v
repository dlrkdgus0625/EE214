`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/16 12:31:04
// Design Name: 
// Module Name: project2_4
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


module project2_4(
    input [3:0] sw,
    output [2:0] RGB_led_A,
    output [2:0] RGB_led_B
    );
    
    //CT = sw[0] 
    //CL = sw[1]
    //OT = sw[2]
    //OL = sw[3]
    
    //CL = 1, OL = 1, OT & ~OL CT & OL
    assign RGB_led_A[1] = (~sw[0] & sw[1] & ~sw[2] & ~sw[3]) | (~sw[0] & ~sw[1] & ~sw[2] & sw[3]) | (~sw[0] & ~sw[1] & sw[2] & ~sw[3]) | (sw[0] & ~sw[1] & ~sw[2] & sw[3]);
    assign RGB_led_B[0] = (sw[0] & sw[1] & ~sw[2] & ~sw[3]) | (~sw[0] & ~sw[1] & sw[2] & sw[3]) | (sw[0] & ~sw[1] & sw[2] & ~sw[3]) | (sw[0] & sw[1] & ~sw[2] & sw[3]);
endmodule
