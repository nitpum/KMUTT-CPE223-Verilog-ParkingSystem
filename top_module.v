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
    input [4:0] JB,
    output [4:0] JA,
    output dp
    );
    wire clk_sec, checkout;
    reg start_ct;
    wire [2:0] state;
    reg [6:0] seg1, seg2, seg3, seg4;
    wire [6:0] min_decimal, min_unit, sec_decimal, sec_unit;
    reg [10:0] checkout_time;
    wire [10:0] parking_time1, parking_time2, parking_time3, parking_time4, parking_time5, parking_time6;
    reg [5:0] time_saver, slot;
    wire [10:0] timer, delay_state;
    reg [3:0] seg_dot;
    wire [3:0] selector;
    wire [6:0] selector7seg;
    wire [17:0] checkout_price;
    divide_sec(clk, clk_sec);
    wire clkms;
    divider(clk, clkms);
    time_counter(clk_sec, 0, timer);

    //timeto7seg(timer, min_decimal, min_unit, sec_decimal, sec_unit);
    timeto7seg(timer, min_decimal, min_unit, sec_decimal, sec_unit);
    
    wire btn_press;
    bcdto7seg(selector, selector7seg);
    btn_decoder(clk, JCC, JCR, selector, btn_press);
    
    /* Time */
    savetime(time_saver[0], timer, parking_time1);
    savetime(time_saver[1], timer, parking_time2);
    savetime(time_saver[2], timer, parking_time3);
    savetime(time_saver[3], timer, parking_time4);
    savetime(time_saver[4], timer, parking_time5);
    savetime(time_saver[5], timer, parking_time6);
    
    price_calculator(checkout, checkout_time, timer, 5, checkout_price);
    
    
    selectstate(clkms, slotavail, btn_press, state);
    wire slotavail;
    checkslot(parking_time1, parking_time2, parking_time3, parking_time4, parking_time5, parking_time6, selector, slotavail);
    
    
    carstatus(clk, JB, JA);
    always @ (state) begin
            case (state)
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