`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2018 01:55:42 PM
// Design Name: 
// Module Name: debounce_btn
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


module debounce_btn(
    input clk,
    input in,
    output reg out
);
    reg [3:0] counter;
    initial counter = 0;
    
    always @(posedge clk) begin
        if(in == 0) begin
            counter = 0;
        end
        else begin
            if(counter < 10) begin
                counter = counter + 1;
            end
        end
    end
    
    always @(counter) begin
        if(counter == 10) out = 1;
        else out = 0;
    end
endmodule
