`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2018 02:03:19 AM
// Design Name: 
// Module Name: checkin
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


module checkin(
    input avail,
    input [3:0] selector,
    input [10:0] timer,
    input [5:0] time_saver,
    output reg [10:0] p1, p2, p3, p4, p5, p6 /* Parking check in time */
    );
    initial begin
        p1 = 0;
        p2 = 0;
        p3 = 0;
        p4 = 0;
        p5 = 0;
        p6 = 0;
    end
    always @ (selector) begin
        if (avail) 
            begin
                case (selector)
                    1: p1 <= timer;
                    2: p2 <= timer;
                    3: p3 <= timer;
                    4: p4 <= timer;
                    5: p5 <= timer;
                    6: p6 <= timer;
                endcase
            end
    end 
endmodule
