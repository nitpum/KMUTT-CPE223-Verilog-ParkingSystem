`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2018 03:52:22 AM
// Design Name: 
// Module Name: checkinout
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



module checkinout(
    input free,
    input press,
    input [3:0] selector,
    input [10:0] timer,
    output reg [10:0] p1, p2, p3, p4, p5, p6, /* Parking check in time */
    output [10:0] fee
    );
    reg [10:0] use_time;
    initial begin
        p1 = 0;
        p2 = 0;
        p3 = 0;
        p4 = 0;
        p5 = 0;
        p6 = 0;
    end
    always @ (posedge press) begin
        if (free) 
            begin
                case (selector)
                    1: p1 <= timer;
                    2: p2 <= timer;
                    3: p3 <= timer;
                    4: p4 <= timer;
                    5: p5 <= timer;
                    6: p6 <= timer;
                endcase
            end
        else 
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
    assign fee = use_time;
endmodule
