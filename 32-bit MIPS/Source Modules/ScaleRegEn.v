module scale_reg_en(DATA,EN,CLK,OUT);
parameter REG_SIZE=32; //scalable register size.Default width is 32 bits.

//Port declaration
output[REG_SIZE-1:0]OUT;
input [REG_SIZE-1:0]DATA;
input EN,CLK;

//Internal variable declarations
reg [REG_SIZE-1:0]OUT;

//Model of register
always @(posedge CLK) begin
if (EN)
OUT<=DATA;  //store new value only when EN is true
else
OUT<=OUT;
end
endmodule