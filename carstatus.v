`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2018 09:21:56 PM
// Design Name: 
// Module Name: carstatus
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


module carstatus(
    input clk,
    input [5:0] ir,
    output [5:0] led
);
    wire [5:0] status;
    ir(clk, ir[0], status[0]);
    ir(clk, ir[1], status[1]);
    ir(clk, ir[2], status[2]);
    ir(clk, ir[3], status[3]);
    ir(clk, ir[4], status[4]);
    ir(clk, ir[5], status[5]);
    assign led = ~status;
endmodule
