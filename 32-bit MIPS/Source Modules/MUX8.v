module mux8(A,B,C,D,E,F,G,H,sel,OUT);
 input [31:0] A,B,C,D,E,F,G,H;
 input [2:0] sel;
 output reg[31:0] OUT;
 
 always @(A,B,C,D,E,F,G,H,sel)
  begin
  case(sel)
  0: OUT=A;
  1: OUT=B;
  2: OUT=C;
  3: OUT=D;
  4: OUT=E;
  5: OUT=F;
  6: OUT=G;
  7: OUT=H;
  endcase
  end
  endmodule
  