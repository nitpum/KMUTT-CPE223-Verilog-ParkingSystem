`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2018 07:40:35 PM
// Design Name: 
// Module Name: divider
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


module divider(
    input in,
    output reg out
    );
    reg [27:0] counter;
    initial counter = 0;
    always @(posedge in) begin
        if(counter == 100_000) counter = 0;
        else counter = counter + 1;
    end
    always @(counter) begin
        if(counter == 100_000) out = 1;
        else out = 0;
    end
endmodule
