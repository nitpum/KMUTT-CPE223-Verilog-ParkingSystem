module selectstate(
    input ms,
    input isOut,
    input press, 
    output reg [2:0] state,
    output activateSave
);
    reg [10:0] counter;
    initial counter = 0;
    
    always @(posedge ms) begin
        if(press == 1) counter = 2000;
        else if(counter > 0) begin
            state = (isOut)?2:1;
            counter = counter - 1;
        end
        else if(state == 2) state = 3;
        else state = 0;
    end
    
    assign activateSave = counter == 1;
endmodule