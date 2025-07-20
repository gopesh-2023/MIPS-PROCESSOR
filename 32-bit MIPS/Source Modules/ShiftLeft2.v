module shift_left2(SHIFT_IN , SHIFT_OUT);

//Port declaration
output [31:0] SHIFT_OUT ;
input [31:0] SHIFT_IN ;

// Internal variable declarations
reg [31:0]  SHIFT_OUT ;

//Model of shift register
always  @ (SHIFT_IN)  //Triggered off input change
begin
SHIFT_OUT[1:0] = 2'b00;   //output two LSBs get filled with zeros
SHIFT_OUT[31:2] = SHIFT_IN[29:0] ;   //shift left by two
end
endmodule