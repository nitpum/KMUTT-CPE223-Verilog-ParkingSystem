`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2018 06:20:19 PM
// Design Name: 
// Module Name: numpad
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


module numpad(
    input clkms,
    input [3:0] col,
    output reg [3:0] row,
    output [15:0] num
);
    always @(posedge clkms) begin
        case(row)
            4'b0001: begin
                row = 4'b0010;
            end
            4'b0010: begin
                row = 4'b0100;
            end
            4'b0100: begin
                row = 4'b1000;
            end
            default : begin
                row = 4'b0001;
            end
        endcase
    end
    
    debounce_btn(row[0], col[0], num[0]);
    debounce_btn(row[0], col[1], num[1]);
    debounce_btn(row[0], col[2], num[2]);
    debounce_btn(row[0], col[3], num[3]);
    
    debounce_btn(row[1], col[0], num[4]);
    debounce_btn(row[1], col[1], num[5]);
    debounce_btn(row[1], col[2], num[6]);
    debounce_btn(row[1], col[3], num[7]);
    
    debounce_btn(row[2], col[0], num[8]);
    debounce_btn(row[2], col[1], num[9]);
    debounce_btn(row[2], col[2], num[10]);
    debounce_btn(row[2], col[3], num[11]);
        
    debounce_btn(row[3], col[0], num[12]);
    debounce_btn(row[3], col[1], num[13]);
    debounce_btn(row[3], col[2], num[14]);
    debounce_btn(row[3], col[3], num[15]);
endmodule
