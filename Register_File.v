module Register_File(clk, reset, Rs1, Rs2, Rd, Write_data, RegWrite, Read_data1, Read_data2);

input clk, reset, RegWrite;
//input [19:15] Rs1; //5bit
//input [24:20] Rs2; //5bit
//input [11:7] Rd; //5bit
input [4:0] Rs1; //5bit
input [4:0] Rs2; //5bit
input [4:0] Rd; //5bit

input [31:0] Write_data;

output [31:0] Read_data1, Read_data2;

reg [31:0] Registers [31:0]; //32 registers each of 32 bits
integer k;

assign Read_data1 = Registers[Rs1];
assign Read_data2 = Registers[Rs2];

always @ (posedge clk) begin
	if(reset==1'b1) begin
		for (k=0; k<32; k=k+1) begin
			Registers[k] = 32'h0;
		end
	end
	else if (RegWrite == 1'b1) begin
		Registers[Rd] = Write_data;
	end
end
endmodule
