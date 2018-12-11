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


module decoder(
    input [3:0] JCC,
    input clk,
    output [15:0] led,
    output [3:0] JCR
    );
    wire slclk;
    divider(clk, slclk);
    
    numpad(slclk, JCC, JCR, led);
    
    
endmodule
