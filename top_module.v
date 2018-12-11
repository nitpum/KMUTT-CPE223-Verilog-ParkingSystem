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
    input [3:0] JCC,
    output [3:0] JCR,
    output dp
    );
    wire clk_sec;
    reg [6:0] seg1, seg2, seg3, seg4;
    wire [6:0] min_decimal, min_unit, sec_decimal, sec_unit;
    wire [10:0] show_time, parking_time1, parking_time2, parking_time3, parking_time4, parking_time5, parking_time6;
    wire [6:0] min1, min2, sec1, sec2;
    reg [5:0] time_saver;
    wire [10:0] timer;
    reg [3:0] seg_dot;
    wire [3:0] selector;
    wire [6:0] selector7seg;
    divide_sec(clk, clk_sec);
    time_counter(clk_sec, 0, timer);

    timeto7seg(timer, min_decimal, min_unit, sec_decimal, sec_unit);
    timeto7seg(show_time, min1, min2, sec1, sec2); /* time to show when in and out */
    bcdto7seg(selector, selector7seg);
    btn_decoder(clk, JCC, JCR, selector);
    
    savetime(time_saver[0], timer, parking_time1);
    savetime(time_saver[1], timer, parking_time2);
    savetime(time_saver[2], timer, parking_time3);
    savetime(time_saver[3], timer, parking_time4);
    savetime(time_saver[4], timer, parking_time5);
    savetime(time_saver[5], timer, parking_time6);
    
    /* Temp save timing */
    always @ (posedge selector) begin
        case (selector)
            default: time_saver = 6'b000000;
            1: time_saver = 6'b000001;
            2: time_saver = 6'b000010;
            3: time_saver = 6'b000100;
            4: time_saver = 6'b001000;
            5: time_saver = 6'b010000;
            6: time_saver = 6'b100000;
        endcase
    end
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
                seg4 = selector7seg; /* print tactile */
                seg_dot = 4'b1111;    
            end
            2: begin
                seg1 = 7'b1000000;
                seg2 = 7'b1100011;
                seg3 = 7'b0000111;
                seg4 = selector7seg; /* print tactile */
                seg_dot = 4'b1111; 
            end
        endcase
    end
    display(clk, seg_dot, seg1, seg2, seg3, seg4, seg, an, dp);
endmodule