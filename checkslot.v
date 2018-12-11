module checkslot(
    input [10:0] s1, s2, s3, s4, s5, s6,
    input [3:0] select,
    output reg out
);
    always @(*) begin
        case(select)
            1: out = s1 > 0;
            2: out = s2 > 0;
            3: out = s3 > 0;
            4: out = s4 > 0;
            5: out = s5 > 0;
            6: out = s6 > 0;
            default out = 0;
        endcase
    end
endmodule