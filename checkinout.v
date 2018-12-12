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
    input avail,
    input firstInteract,
    input active,
    input [3:0] selector,
    input [10:0] timer,
    output reg [10:0] p1, p2, p3, p4, p5, p6, /* Parking check in time */
    output reg [10:0] fee
    );
    reg [10:0] use_time;
    reg [10:0] firstTime;
    initial begin
        p1 = 0;
        p2 = 0;
        p3 = 0;
        p4 = 0;
        p5 = 0;
        p6 = 0;
        firstTime = 0;
        use_time = 0;
    end
    always @ (posedge firstInteract) begin
        firstTime <= timer; /* Save time on press btn */
        if (avail)
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
                        use_time = firstTime - p1;              
                        p1 = 0;
                    end
                    2: begin
                        use_time = firstTime - p2;              
                        p2 = 0;
                    end
                    3: begin
                        use_time = firstTime - p3;              
                        p3 = 0;
                    end
                    4: begin
                        use_time = firstTime - p4;              
                        p4 = 0;
                    end
                    5: begin
                        use_time = firstTime - p5;              
                        p5 = 0;
                    end
                    6: begin
                        use_time = firstTime - p6;              
                        p6 = 0;
                    end
               endcase
               fee = use_time;
            end
    end

endmodule
