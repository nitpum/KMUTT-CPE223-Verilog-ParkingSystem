`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2018 01:46:33 AM
// Design Name: 
// Module Name: charge
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


module charge(
    input enable,
    input [10:0] start_time, 
    input [10:0] end_time,
    input [6:0] price, // Max price 64
    output reg [10:0] value // Max value 1024 value = (end_time - start_time) / 60 * price
    );
    always @ (posedge enable)
        begin
            if (enable)
                begin
                    value <= (end_time - start_time) / 60 * price;
                end
            else
                value = 0;   
        end
endmodule
