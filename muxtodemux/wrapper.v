`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2022 01:22:12 AM
// Design Name: 
// Module Name: wrapper
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


module wrapper(
    input [7:0] sw,
    input clk,
    input [2:0] btn,
    
  //  output RGB_led_A,
    output [7:0] led,
    output X
    );
    
wire sdata;
wire [2:0] count;

mux input_mux(
    .I(sw),
    .S(count),
    .Y(sdata),
    .X(X)
);

demux output_demux(
    .EN(sdata),
    .I(count),
    .Y(led)
    
);

counter out (
    .B(count),
    .clk(clk)
);

endmodule
