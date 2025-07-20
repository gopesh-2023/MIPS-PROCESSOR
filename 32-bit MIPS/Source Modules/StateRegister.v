module StateReg(Present_State, Next_State, CLK, RST_n);

    output [2:0] Present_State;
    input [2:0] Next_State;
    input CLK, RST_n;


    reg [2:0] Present_State;

    always @(posedge CLK or negedge RST_n)
    begin
     if(!RST_n)
     Present_State <= 3'b000;
     else
     Present_State <= Next_State;
    end
endmodule