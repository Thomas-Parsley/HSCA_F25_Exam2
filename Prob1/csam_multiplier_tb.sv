module testbench ();
    logic clk;
   logic reset;
   logic [15:0] a;
   logic [11:0] b; 
   logic [27:0]sum, expected;
   logic [31:0] vectornum, errors;
   logic [55:0] testvectors[10000:0];
  
   integer 	handle3;
   
   // instantiate device under test
   csam_multiplier dut1(sum, a, b);
   
   // generate clock
   always 
     begin
	clk = 1; #5; clk = 0; #5;
     end
   
   // at start of test, load vectors and pulse reset
   initial
     begin
        handle3 = $fopen("csam.out");	
        $readmemb("csam.tv", testvectors);
        vectornum = 0; errors = 0;
        reset = 1; #22; reset = 0;
     end
   
   // apply test vectors on rising edge of clk
   always @(posedge clk)
     begin
	#1; {a, b, expected} = testvectors[vectornum];
     end
   
   // check results on falling edge of clk
   always @(negedge clk)
     if (~reset) begin // skip during reset
	$fdisplay(handle3, "|| A: %h | B: %h || Sum: %h | Epected: %h || Correct: %b | Left2: %b | Right3: %b ||", 
		  a, b, sum, expected, sum == expected, sum[27:20] == expected[27:20], sum[11:0] == expected[11:0]);/**/
	
	if (sum != expected) begin  // check result
           //$display("Error: inputs = %h", {a, b});
           //$display("  outputs = %h (%h expected)",sum, expected);
           errors = errors + 1;
	end
	vectornum = vectornum + 1;
	if (testvectors[vectornum] === 56'bx) begin 
           $display("|| Output | %d tests completed with %d errors ||", 
	            vectornum, errors);
           $stop;
	end
     end
endmodule