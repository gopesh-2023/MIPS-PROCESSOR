module scale_reg(DATA,CLK,OUT);
parameter REG_SIZE=32; //scalable register size.Default width is 32 bits.

//Port declaration
output[REG_SIZE-1:0]OUT;
input [REG_SIZE-1:0]DATA;
input CLK;

//Internal variable declarations
reg [REG_SIZE-1:0]OUT;

//Model of register
always @(posedge CLK) begin

OUT<=DATA;  //store new value 
end
endmodule