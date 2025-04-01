module Control_Unit(OPcode, branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOp_out);

input [6:0] OPcode;
output reg branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
output reg [1:0] ALUOp_out;

always @(*) begin
case(OPcode)
7'b0110011:
begin
branch <= 0;
MemRead <= 0;
MemtoReg <= 0;
MemWrite <= 0;
ALUSrc <= 0;
RegWrite <= 1;
ALUOp_out <= 2'b10;
end
endcase
end
endmodule
