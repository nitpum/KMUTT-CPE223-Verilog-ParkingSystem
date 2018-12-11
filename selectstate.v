module selectstate(
    input ms,
    input isOut,
    input press, 
    output reg [2:0] state
);
    reg [11:0] counter;
    initial counter = 0;
    
    always @(posedge ms) begin
        if(press == 1) counter = (isOut)?4000:2000;
        else if(counter > 0) begin
            state = (isOut)?(counter > 2000)?2:3:1;
            counter = counter - 1;
        end
        else state = 0;
    end
endmodule