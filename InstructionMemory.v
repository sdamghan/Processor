module InstMem ( input[15:0] instAddr, output[15:0] instruction );
  
  reg [15:0] Registers [4095:0];
	 assign instruction = Registers[instAddr];
	 initial
		  $readmemb("Instructions.txt", Registers);

endmodule