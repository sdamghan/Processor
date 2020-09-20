
module tb();
   
  reg clk, go=0;
  
  wire ZERO;
  wire [11:0] PC_OUT,BRANCHZ_PC, ADDED_PC, NEXT_PC;
  wire [15:0] INST_OUT, WRITE_REG, READ_DATA1, READ_DATA2, RI, WRITE_DATA,
              ALU_RESULT, MEM_ADDR, MEM_READ_DATA;  
  
  
  DATA_PATH UUT ( clk, go, 
                  ZERO, PC_OUT,BRANCHZ_PC, ADDED_PC, NEXT_PC, INST_OUT, WRITE_REG, READ_DATA1,
                  READ_DATA2, RI, WRITE_DATA, ALU_RESULT, MEM_ADDR, MEM_READ_DATA );
  
  always #1000 clk = ~clk;
  
  initial begin
  
  clk = 0;
  #50 go = 1;
  #50 go = 0;
  #5000
  $stop;
   
  
  end
  
  
endmodule
