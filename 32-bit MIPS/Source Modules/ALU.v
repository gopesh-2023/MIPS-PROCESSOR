module alu(A,B,CNRL,SHAMT,ALU_OUT,NF_OUT,ZF_OUT,OF_OUT,BF_OUT);
  
//OPCODE Parameters
localparam CNRL_AND =4'b0000,
           CNRL_OR= 4'b0001,
           CNRL_ADD= 4'b0010,
           CNRL_XOR= 4'b0011,
           CNRL_NOR= 4'b0100,
           CNRL_SLTU=4'b0101,
           CNRL_SUB=4'b0110,
           CNRL_SLT=4'b0111,
           CNRL_SLL=4'b1000,
           CNRL_SLL_VAR=4'b1001,
           CNRL_SRL=4'b1010,
           CNRL_SRL_VAR=4'b1011,
           CNRL_SRA=4'b1100,
           CNRL_SRA_VAR=4'b1101;
  
output signed [31:0] ALU_OUT;
output NF_OUT,ZF_OUT,OF_OUT,BF_OUT;
input signed [31:0] A;
input signed [31:0] B;
input [3:0] CNRL;
input [4:0] SHAMT;  

// register declarations
reg signed [31:0] ALU_OUT;
reg NF_OUT,ZF_OUT,OF_OUT,BF_OUT;
reg [31:0] B_TEMP;
wire [31:0] unsigned_A;
wire [31:0] unsigned_B;

assign unsigned_A=A;
assign unsigned_B=B;
  
always@ (A,B,CNRL,SHAMT) begin
    
  case (CNRL)
      
    CNRL_AND: begin
      ALU_OUT = A & B;    // and
      BF_OUT  =1'b0;      // disable opcode invalid flag
      OF_OUT  =1'b0;      // disable overflow flag
      end
    
    CNRL_OR:  begin
       ALU_OUT = A | B;  // for
       BF_OUT  =1'b0;    // disable opcode invalid flag
       OF_OUT  =1'b0;    // disable overflow flag
       end
    
    CNRL_ADD:  begin
       ALU_OUT =A + B;   // add
       BF_OUT  =1'b0;    // disable opcode invalid flag
      // produce overflow flag
      if ((A[31] && B[31]) && !ALU_OUT[31])  OF_OUT=1'b1;
      else if ((!A[31] && !B[31]) && ALU_OUT[31]) OF_OUT=1'b1;
      else OF_OUT =1'b0;  // disable overflow flag
      end
    
    CNRL_XOR:  begin
       ALU_OUT = A ^ B;  // xor
       BF_OUT= 1'b0;     //  disable opcode invalid flag
       OF_OUT =1'b0;     // disable overflow flag
       end
    
    CNRL_NOR: begin
      ALU_OUT = ~(A | B); // nor
      BF_OUT =1'b0;       //  disable opcode invalid flag
      OF_OUT=1'b0;        // disable overflow flag
      end
    
    CNRL_SLTU: begin
      if (unsigned_A < unsigned_B) ALU_OUT =32'b1; // less than unsigned
      else ALU_OUT =32'b0;
      BF_OUT =1'b0;       //  disable opcode invalid flag
      OF_OUT=1'b0;        // disable overflow flag
      end
    
    CNRL_SUB: begin       // subtraction
      BF_OUT=1'b0;        // disable opcode invalid flag
      B_TEMP= ~B + 1;     //2's compliment of input B to facilitate subtraction
      ALU_OUT= A + B_TEMP; // same as A-B
      // produce overflow flag
      if ((A[31] && B_TEMP[31]) && !ALU_OUT[31]) OF_OUT = 1'b1;
      else if ((!A[31] && !B_TEMP[31]) && ALU_OUT[31]) OF_OUT = 1'b1;
      else OF_OUT = 1'b0;
      end
    
    CNRL_SLT: begin
      if (A < B) ALU_OUT = 32'b1;  // set if less than
      else ALU_OUT = 32'b0;
      BF_OUT =1'b0;       //  disable opcode invalid flag
      OF_OUT=1'b0;        // disable overflow flag
      end
    
    CNRL_SLL: begin
      ALU_OUT = B << SHAMT;  // Shift left logic
      BF_OUT =1'b0;       //  disable opcode invalid flag
      OF_OUT=1'b0;        // disable overflow flag
      end
    
    CNRL_SLL_VAR: begin
      ALU_OUT = B << A;    // Shift left logic by variable
      BF_OUT =1'b0;       //  disable opcode invalid flag
      OF_OUT=1'b0;        // disable overflow flag
      end
    
    CNRL_SRL: begin
      ALU_OUT = B >> SHAMT; // Shift right logic
      BF_OUT =1'b0;       //  disable opcode invalid flag
      OF_OUT=1'b0;        // disable overflow flag
      end
    
    CNRL_SRL_VAR: begin
      ALU_OUT = B >> A;    // Shift right logic by variable
      BF_OUT =1'b0;       //  disable opcode invalid flag
      OF_OUT=1'b0;        // disable overflow flag
      end
    
    CNRL_SRA: begin
      ALU_OUT = B >> SHAMT; // Shift right arithmetic
      BF_OUT =1'b0;       //  disable opcode invalid flag
      OF_OUT=1'b0;        // disable overflow flag
      end
    
    CNRL_SRA_VAR: begin
      ALU_OUT = B >> A;    // Shift right arithmetic by variable
      BF_OUT =1'b0;       //  disable opcode invalid flag
      OF_OUT=1'b0;        // disable overflow flag
      end
    
    default:
       begin  BF_OUT = 1'b1;  // set flag is opcode is invalid
       end
  endcase
  
end
  
always@ (ALU_OUT) begin
    if (!ALU_OUT) ZF_OUT=1'b1;   // produce zero flag in all operations
    else ZF_OUT=1'b0;
  
    if (ALU_OUT[31]) NF_OUT= 1'b1;  // produce negative flag in all operations
    else NF_OUT = 1'b0;
end
  
endmodule