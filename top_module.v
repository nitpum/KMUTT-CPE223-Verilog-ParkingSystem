module top_module(
input [3:0] JCC,
    input clk,
    output [15:0] led,
    output reg [3:0] JCR,
    output reg [6:0] seg
    );
    endmodule
=======
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2018 01:54:59 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk,
    input [4:0] sw,    
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    wire clk_sec;
    reg [6:0] seg1;
    reg [6:0] seg2;
    reg [6:0] seg3;
    reg [6:0] seg4;
    wire [6:0] timer1;
    wire [6:0] timer2;
    wire [6:0] timer3;
    wire [6:0] timer4;
    wire [10:0] timer;
    reg [3:0] dot;
    divide_sec(clk, clk_sec);
    time_counter(clk_sec, 0, timer);
    bcdto7seg(timer / 60 / 10, timer1);
    bcdto7seg(timer / 60 % 10, timer2);
    bcdto7seg(timer % 60 / 10, timer3);
    bcdto7seg(timer % 10, timer4);
    always @ (sw) begin
        case (sw)
            default: begin
                seg1 = timer1;
                seg2 = timer2;
                seg3 = timer3;
                seg4 = timer4;
                dot = 4'b1011;    
            end
            1: begin
                seg1 = 7'b1111001;
                seg2 = 7'b0101011;
                seg3 = 7'b1111111;
                seg4 = 7'b1111001;
                dot = 4'b1111;    
            end
            2: begin
                seg1 = 7'b1000000;
                seg2 = 7'b1100011;
                seg3 = 7'b0000111;
                seg4 = 7'b1111001;
                dot = 4'b1111; 
            end
        endcase
    end
    display(clk, dot, seg1, seg2, seg3, seg4, seg, an, dp);
endmodule
>>>>>>> 48737695cbd5422eeca9f19c771411b08e05b466
