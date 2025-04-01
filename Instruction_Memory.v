module Instruction_Memory(reset, read_add, instruction_out);
input reset;
input [31:0] read_add;
output [31:0] instruction_out;

//making memort of 32 bits
reg [31:0] Memory [63:0];

assign instruction_out = Memory[read_add[5:0]]; //yeh address read ek pointer ki trh hota h to a specofic command and instrcution_out stores the addreess of the memory
integer k;
always @ (posedge reset)
begin

for (k=0; k<64; k=k+1)
begin
Memory[k] = 32'h00000000;
end
end
endmodule
