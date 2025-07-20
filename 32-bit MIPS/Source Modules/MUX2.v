module mux2(a,b,sel,OUT);
input[31:0]a,b;
 input sel;
 output reg[31:0] OUT;
 always@(a,b,sel)
  begin
  case(sel)
  0: OUT=a;
  1: OUT=b;
  endcase
  end
  endmodule