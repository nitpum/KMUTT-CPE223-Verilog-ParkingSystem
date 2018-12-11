`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2018 02:28:20 AM
// Design Name: 
// Module Name: checkout
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


module checkout(
    input have,
    input enable,
    input [3:0] selector,
    input [10:0] timer,
    output reg [10:0] p1, p2, p3, p4, p5, p6,
    output [10:0] fee
    );
    reg use_time;
    always @ (posedge enable) begin
        if (have) 
            begin
               case (selector)
                    1: begin
                        use_time = timer - p1;              
                        p1 = 0;
                    end
                    2: begin
                        use_time = timer - p2;              
                        p2 = 0;
                    end
                    3: begin
                        use_time = timer - p3;              
                        p3 = 0;
                    end
                    4: begin
                        use_time = timer - p4;              
                        p4 = 0;
                    end
                    5: begin
                        use_time = timer - p5;              
                        p5 = 0;
                    end
                    6: begin
                        use_time = timer - p6;              
                        p6 = 0;
                    end
               endcase 
            end
    end
    assign fee = (use_time % 60 == 0)? (use_time / 60) * 10: (use_time / 60) + 1;
endmodule
