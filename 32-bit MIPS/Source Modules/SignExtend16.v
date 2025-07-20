module sign_extend16(BYTE_IN, OUT);

// Port declaration
	output [31:0] OUT;
	input [15:0] BYTE_IN;
	
// Internal variable declarations
	reg [31:0] OUT;
	
//Model of sign extender
	always @(BYTE_IN)		//triggererd off input change
	begin
	 OUT[15:0] = BYTE_IN[15:0];		 //first 16 bits stay the same
	 OUT[31:16] = {16{BYTE_IN[15]}}; //sign extend remaining 16 bits
	end
 endmodule