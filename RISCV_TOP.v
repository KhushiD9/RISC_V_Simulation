/*module RISCV_TOP(
input clk, reset
);

//need to make a wire jisme pc out instruction memory ka rad address wala input hoga

//isturction memory is being feeded ih the datapath


wire [31:0] instructionTop, instruction_outTop, read_data1Top, read_data2Top, ALUresultTop, PCNextTop;
wire [31:0] ALUControlTop;
wire RegWriteTop, MemWriteTop, MemReadTop, MemtoReg, ALUScr, branch;
wire [1:0] ALUOpTop;
wire [31:0] Read_data;//added
wire [31:0] WriteDataTop;//added
assign WriteDataTop = (MemtoReg) ? Read_data : ALUresultTop;//added

Program_Counter Program_Counter //adding the program counter
(.clk(clk),
.reset(reset),
.PC_in(PCNextTop),
.PC_out(instructionTop)
);

Indtruction_Memory Instruction_Memory
(
.reset(reset),
.read_add(instructionTop),
.instruction_out(instruction_outTop)
);

Register_File Register_File
(
.clk(clk),
. reset(reset),
. Rs1(instruction_outTop),
. Rs2(instruction_outTop),
. Rd(instruction_outTop),
. Write_data(ALUresultTop),
. RegWrite(RegWriteTop),
. Read_data1(read_data1Top),
. Read_data2(read_data2Top)
);

ALU ALU
(
.A(read_data1Top),
.B(read_data2Top),
.zero(), 
.ALUControl_in(ALUControlTop), 
.ALU_result(ALUresultTop)
);

Data_Memory Data_Memeory(
.clk(clk), 
.reset(reset), 
.MemWrite(MemWriteTop), 
.MemRead(MemReadTop), 
.Address(ALUresultTop), 
.write_data(read_data2Top), 
.Read_data(Read_data)
);


ALUControl ALUControl(
.ALUop_in(ALUOpTop), 
.func7(instruction_outTop), 
.func3(instruction_outTop), 
.ALUControl_out(ALUControlTop)
);

PC_Adder PC_Adder(
.fromPC(intructionTop),
.PCplusFour(PCNextTop)
);

Control_Unit Control_Unit(
.OPcode(intruction_outTop), 
.branch(branch), 
.MemRead(MemReadTop), 
.MemtoReg(MemtoReg), 
.MemWrite(MemWriteTop), 
.ALUScr(ALUScr), 
.RegWrite(RegWriteTop), 
.ALUOp_out(ALUOpTop)
);


endmodule*/

module RISCV_TOP(input clk, reset);

// Wires for interconnections
wire [31:0] instruction, PC_out, PC_in;
wire [31:0] read_data1, read_data2, ALU_result, Read_data, Write_data;
wire [4:0] Rs1, Rs2, Rd;
wire branch, MemRead, MemWrite, MemtoReg, ALUSrc, RegWrite;
wire [1:0] ALUOp;
wire [3:0] ALUControl_out;

// Program Counter
Program_Counter PC (
    .clk(clk),
    .reset(reset),
    .PC_in(PC_in),
    .PC_out(PC_out)
);

// Instruction Memory
Instruction_Memory IM (
    .reset(reset),
    .read_add(PC_out),
    .instruction_out(instruction)
);

// Control Unit
Control_Unit CU (
    .OPcode(instruction[6:0]),
    .branch(branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .ALUOp_out(ALUOp)
);

// Register File
assign Rs1 = instruction[19:15];
assign Rs2 = instruction[24:20];
assign Rd = instruction[11:7];

Register_File RF (
    .clk(clk),
    .reset(reset),
    .Rs1(Rs1),
    .Rs2(Rs2),
    .Rd(Rd),
    .Write_data(Write_data),
    .RegWrite(RegWrite),
    .Read_data1(read_data1),
    .Read_data2(read_data2)
);

// ALU Control
ALUControl AC (
    .ALUop_in(ALUOp),
    .func7(instruction[31:25]),
    .func3(instruction[14:12]),
    .ALUControl_out(ALUControl_out)
);

// ALU
ALU ALU (
    .A(read_data1),
    .B(ALUSrc ? {{20{instruction[31]}}, instruction[31:20]} : read_data2),
    .zero(),
    .ALUControl_in(ALUControl_out),
    .ALU_result(ALU_result)
);

// Data Memory
Data_Memory DM (
    .clk(clk),
    .reset(reset),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .Address(ALU_result),
    .write_data(read_data2),
    .Read_data(Read_data)
);

// Write-back to Register File
assign Write_data = MemtoReg ? Read_data : ALU_result;

// Next PC Logic (PC + 4)
assign PC_in = PC_out + 4;

endmodule
