//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2018 11:22:01 AM
// Design Name: 
// Module Name: decoder
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


module btn_decoder(
    input clk,
    input [3:0] JCC,
    output [3:0] JCR,
    output reg [3:0] value,
    output reg press
    );
    wire slclk;
    wire [15:0] tactile_sw;
    divider(clk, slclk);
    initial value = 0;
    
    numpad(slclk, JCC, JCR, tactile_sw);
    
    always @(posedge clk) begin
        if(tactile_sw > 0) press = 1;
        else press = 0;
        case(tactile_sw)
            16'b0000_0000_0000_0001: value = 1;
            16'b0000_0000_0000_0010: value = 2;
            16'b0000_0000_0000_0100: value = 3;
            16'b0000_0000_0001_0000: value = 4;
            16'b0000_0000_0010_0000: value = 5;
            16'b0000_0000_0100_0000: value = 6;
            0: value = value;
            default: value = 0;
        endcase
    end
endmodule
