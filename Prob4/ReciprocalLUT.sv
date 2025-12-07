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
            4'b0000: outTW = 16'b0111110000111100;
            4'b0001: outTW = 16'b0111010100011111;
            4'b0010: outTW = 16'b0110111011001000;
            4'b0011: outTW = 16'b0110100100011000;
            4'b0100: outTW = 16'b0110001111110110;
            4'b0101: outTW = 16'b0101111101001110;
            4'b0110: outTW = 16'b0101101100010001;
            4'b0111: outTW = 16'b0101011100110000;
            4'b1000: outTW = 16'b0101001110100000;
            4'b1001: outTW = 16'b0101000001011000;
            4'b1010: outTW = 16'b0100110101001111;
            4'b1011: outTW = 16'b0100101001111111;
            4'b1100: outTW = 16'b0100011111100001;
            4'b1101: outTW = 16'b0100010101110001;
            4'b1110: outTW = 16'b0100001100101010;
            4'b1111: outTW = 16'b0100000100001000;
        endcase

endmodule
