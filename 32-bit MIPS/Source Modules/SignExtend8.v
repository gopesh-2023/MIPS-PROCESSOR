module sign_extend8(BYTE_IN, OUT);

// Port declaration
	output [31:0] OUT;
	input [7:0] BYTE_IN;
	
// Internal variable declarations
	reg [31:0] OUT;
	
//Model of sign extender
	always @(BYTE_IN)		//triggererd off input change
	begin
	 OUT[7:0] = BYTE_IN[7:0];		 //first 8 bits stay the same
	 OUT[31:8] = {24{BYTE_IN[7]}}; //sign extend remaining 24 bits
	end
 endmodule