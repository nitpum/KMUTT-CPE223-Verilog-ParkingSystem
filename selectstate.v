module selectstate(
    input ms,
    input press, 
    output reg [2:0] state
);
    reg [10:0] counter;
    initial counter = 0;
    
    always @(posedge ms) begin
        if(press == 1) counter = 1000;
        else if(counter > 0) begin
            state = 1;
            counter = counter - 1;
        end
        else state = 0;
    end
endmodule