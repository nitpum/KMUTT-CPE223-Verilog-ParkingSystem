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
    reg [6:0] seg1, seg2, seg3, seg4;
    wire [6:0] min_decimal, min_unit, sec_decimal, sec_unit;
    wire [10:0] parking_time1;
    wire [10:0] timer;
    wire [6:0] seg_temp;
    reg [3:0] seg_dot;
    wire [15:0] num;
    reg [6:0] prev;
    divide_sec(clk, clk_sec);
    time_counter(clk_sec, 0, timer);
    timeto7seg(timer, min_decimal, min_unit, sec_decimal, sec_unit);
//    decoder(JCC,clk,num,JCR);
    bcdto7seg(num[3:0],seg_temp);
    always @ (sw) begin
            case (sw)
                default: begin
                    seg1 = min_decimal;
                    seg2 = min_unit;
                    seg3 = sec_decimal;
                    seg4 = sec_unit;
                    seg_dot = 4'b1011;    
                end
                1: begin
                    seg1 = 7'b1111001;
                    seg2 = 7'b0101011;
                    seg3 = 7'b1111111;
                    seg4 = prev;
                    seg_dot = 4'b1111;    
                end
                2: begin
                    seg1 = 7'b1000000;
                    seg2 = 7'b1100011;
                    seg3 = 7'b0000111;
                    seg4 = prev;
                    seg_dot = 4'b1111; 
                end
                3: begin
                    
                end
            endcase
    end
    display(clk, seg_dot, seg1, seg2, seg3, seg4, seg, an, dp);
endmodule