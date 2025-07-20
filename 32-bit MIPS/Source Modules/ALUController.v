module alu_cont(FUNCT, CNRL, OUT);
  output [3:0] OUT;
  input [5:0] FUNCT;
  input [2:0] CNRL;
  
  reg [3:0] OUT;
  
  always @(FUNCT, CNRL)
    begin
      case(CNRL)
        3'b000:OUT=4'b0010;
        3'b001:OUT=4'b0110;
        3'b010:
          case(FUNCT)
            6'b001001: OUT=4'b0010;
            6'b100000: OUT=4'b0010;
            6'b100001: OUT=4'b0010;
            6'b100010: OUT=4'b0110;
            6'b100011: OUT=4'b0110;
            6'b100100: OUT=4'b0000;
            6'b100101: OUT=4'b0001;
            6'b100110: OUT=4'b0011;
            6'b100111: OUT=4'b0100;
            6'b000000: OUT=4'b1000;
            6'b000100: OUT=4'b1001;
            6'b000010: OUT=4'b1010;
            6'b000110: OUT=4'b1011;
            6'b000011: OUT=4'b1100;
            6'b000111: OUT=4'b1101;
            6'b101001: OUT=4'b0101;
            6'b101010: OUT=4'b0111;
            default: OUT=4'bxxxx;
          endcase
        3'b011:OUT=4'b0111;
        3'b100:OUT=4'b0000;
        3'b101:OUT=4'b0001;
        3'b110:OUT=4'b0011;
        default:OUT=4'bxxxx;
      endcase
    end
endmodule

