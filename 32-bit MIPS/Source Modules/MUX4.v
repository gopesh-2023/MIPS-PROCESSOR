module mux4(a,b,c,d,sel,OUT);
 input[31:0]a,b,c,d;
 input[1:0]sel;
 output reg[31:0] OUT;
 always@(a,b,c,d,sel)
  begin
  case(sel)
  0: OUT=a;
  1: OUT=b;
  2: OUT=c;
  3: OUT=d;
  endcase
  end
  endmodule