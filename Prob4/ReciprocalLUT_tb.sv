//doesnt work because I do not know how to do U1.15 in system verilog.
module testbench ();
    logic clk;
   logic reset;
   logic [3:0] invector;
   logic [15:0] outvector;
   logic [31:0] vectornum, errors;
   logic [3:0] testvectors[10000:0];
   logic decimalout; //I am confused with this one
   integer 	handle3;
   
   // instantiate device under test
   ReciprocalLUT dut1(invector, outvector);
   
   // generate clock
   always 
     begin
	clk = 1; #5; clk = 0; #5;
     end
   
   // at start of test, load vectors and pulse reset
   initial
     begin
        handle3 = $fopen("ReciprocalLUT.out");	
        $readmemb("ReciprocalLUT.tv", testvectors);
        vectornum = 0; errors = 0;
        reset = 1; #22; reset = 0;
     end
   
   // apply test vectors on rising edge of clk
   always @(posedge clk)
     begin
	#1; {invector} = testvectors[vectornum];
     end
   
   // check results on falling edge of clk
   always @(negedge clk)
     if (~reset) begin // skip during reset
     assign decimalout = outvector[14:0] / 32768.0;
	$fdisplay(handle3, "|| Output: %d.%d ||", 
		  outvector[15],decimalout);/**/
	
	/*if (sum != correct) begin  // check result
           //$display("Error: inputs = %h", {a, b});
           //$display("  outputs = %h (%h expected)",sum, expected);
           errors = errors + 1;
	end*/
	vectornum = vectornum + 1;
	if (testvectors[vectornum] === 4'bx) begin 
           $display("|| Output | %d tests completed with %d errors ||", 
	            vectornum, errors);
           $stop;
	end
     end
endmodule