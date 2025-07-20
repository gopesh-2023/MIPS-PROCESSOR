module concatinate(CIN26,CIN4,OUT);

// PORT DECLARATION

output [31:0] OUT;
input [25:0] CIN26;
input [3:0] CIN4;

// INTERNAL VARIABLE DECLARATION

reg [31:0] OUT;

//OUT= CIN4 || CIN26 ||00
always @(CIN26,CIN4)         //triggered off input change
begin
  OUT[1:0]=2'b00;              //first two bits are constant '00'
  OUT[27:2]=CIN26[25:0];
  OUT[31:28]=CIN4[3:0];
  end
endmodule