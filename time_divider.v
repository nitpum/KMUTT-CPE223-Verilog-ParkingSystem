`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2018 06:52:08 PM
// Design Name: 
// Module Name: time_divider
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


module time_divider(
    input [10:0] timer,
    output [6:0] min_decimal, min_unit, sec_deciaml, sec_unit
    );
    assign min_decimal = timer / 60 / 10;
    assign min_unit = timer / 60 % 10;
    assign sec_decimal = timer % 60 / 10;
    assign sec_unit = timer % 10;
endmodule
