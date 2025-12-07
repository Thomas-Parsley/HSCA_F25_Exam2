module ReciprocalLUT(
    input logic [3:0] inTW,
    output logic [15:0] outTW
);
 
    //U0.4 input !!!!
    //all the inputs are after 1.
    //so since 1 is 10000, input is 0000. 1.0625 is 10001, input is 0001, etc.
    //This makes so much sense now

    //U1.15 output
    //the output then includes the the 
    always_comb
        priority case(inTW)
            4'b0000: outTW = 16'b1000000000000000;
            4'b0001: outTW = 16'b0111100001111000;
            4'b0010: outTW = 16'b0111000111000111;
            4'b0011: outTW = 16'b0110101111001010;
            4'b0100: outTW = 16'b0110011001100110;
            4'b0101: outTW = 16'b0110000110000110;
            4'b0110: outTW = 16'b0101110100010111;
            4'b0111: outTW = 16'b0101100100001011;
            4'b1000: outTW = 16'b0101010101010101;
            4'b1001: outTW = 16'b0101000111101011;
            4'b1010: outTW = 16'b0100111011000100;
            4'b1011: outTW = 16'b0100101111011010;
            4'b1100: outTW = 16'b0100100100100100;
            4'b1101: outTW = 16'b0100011010011110;
            4'b1110: outTW = 16'b0100010001000100;
            4'b1111: outTW = 16'b0100001000010000;
        endcase

endmodule
