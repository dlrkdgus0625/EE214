`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/08 17:41:20
// Design Name: 
// Module Name: led_sw
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

module led_sw(

    input [3:0] btn,
    input [11:0] sw,
    //output [11:0] led,
    output [7:0] seg,
    output [3:0] an
);


//assign led = sw;
assign an = btn;
assign seg = sw;


endmodule
