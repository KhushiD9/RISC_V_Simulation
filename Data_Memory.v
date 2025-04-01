module Data_Memory(clk, reset, MemWrite, MemRead, Address, write_data, Read_data);

input clk, reset, MemWrite, MemRead;
input [31:0] Address, write_data;
output [31:0] Read_data;

reg [31:0] Dmemory [63:0];

assign Read_data = (MemRead) ? Dmemory[Address[5:0]] : 32'h0;
integer k;

always @ (posedge clk)
begin
if(reset == 1'b1)
begin 
for(k=0; k<64; k=k+1)
begin
Dmemory[k] = 32'h0;
end
end
else
if(MemWrite)begin 
Dmemory[Address[5:0]] = write_data;
end
end
endmodule
