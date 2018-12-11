`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2018 01:33:26 AM
// Design Name: 
// Module Name: savetime
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


module savetime(
        input [10:0] timer,
        input enable,
        output reg [10:0] out
    );
    always @ (enable) begin
        if (enable == 1) begin
            out <= timer;
        end
    end
endmodule
