`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2018 04:30:19 PM
// Design Name: 
// Module Name: ir
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


module ir(
    input IR,
    input clk,
    output reg [1:0] led
);
    wire clkms;
    always @(IR) led[1] = IR;
    divider(clk, clkms);
    
    reg[15:0] counter;
    always @(posedge clkms) begin
        if(IR == 0) begin
            counter = 0;
        end
        else begin
            if(counter < 100) begin
                counter = counter + 1;
            end
        end
    end
    
    always @(counter) begin
        led[0] = counter == 100;
    end
endmodule
