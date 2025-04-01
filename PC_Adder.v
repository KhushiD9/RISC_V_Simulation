module PC_Adder(fromPC, PCplusFour);

  input [31:0] fromPC;      // Current PC value
  output [31:0] PCplusFour; // Next PC value after adding 4

  assign PCplusFour = fromPC + 4; // Increment PC by 4 for next instruction

endmodule

