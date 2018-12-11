`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2018 05:35:17 PM
// Design Name: 
// Module Name: countdown
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


module countdown(
    input clk, start,
    input [6:0] countdown_time,
    output reg timer
    );
    reg started;
    always @ (posedge start) begin
        started <= 1;
        timer <= countdown_time;
    end
    always @ (posedge clk) begin
        if (started) begin
            if (timer <= 0) begin
                timer <= 0;
                started <= 0;
                end
            else begin
                timer <= timer - 1;
            end
        end
    end
endmodule
