`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2018 06:45:49 PM
// Design Name: 
// Module Name: timeto7seg
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


module timeto7seg(
    input [10:0] timer, 
    input [6:0] seg1, seg2, seg3, seg4
    );
    bcdto7seg(timer / 60 / 10, seg1);
    bcdto7seg(timer / 60 % 10, seg2);
    bcdto7seg(timer % 60 / 10, seg3);
    bcdto7seg(timer % 10, seg4); 
endmodule
