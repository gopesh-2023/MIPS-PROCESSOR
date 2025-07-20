module pc(Dout, RST_n , CLK, Din, LD);
 
 
   output [31:0] Dout;
   input [31:0] Din;
   input RST_n , CLK, LD;
     
	 
	 
   reg [31:0] Dout;
   
   
   always @(posedge CLK or negedge RST_n)
   begin 
     if(!RST_n)
	 Dout <= 32'b0;
	 else if (LD)
	 Dout <= Din;
	 else 
	 Dout <= Dout;
	end

endmodule 