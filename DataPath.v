module DATA_PATH ( input clk, go, 
                   output reg ZERO,
                   output reg [11:0] PC_OUT,BRANCHZ_PC, ADDED_PC, NEXT_PC,
                   output reg [15:0] INST_OUT, WRITE_REG, READ_DATA1, READ_DATA2, RI, WRITE_DATA,
                          ALU_RESULT, MEM_ADDR, MEM_READ_DATA );


  
  wire[15:0] pc_out, instructionMem_out, writeData, readData1, readData2, B_ALU_in, ALU_result,
             memoryAddr, memReadData, added_pc, next_pc;
  wire[15:0] BranchZ_pc;
  assign BranchZ_pc = { pc_out[11], pc_out[10], pc_out[9],
                        instructionMem_out[8], instructionMem_out[7], instructionMem_out[6],
                        instructionMem_out[5], instructionMem_out[4], instructionMem_out[3],
                        instructionMem_out[2], instructionMem_out[1], instructionMem_out[0] };
  wire[2:0] writeReg, ALU_op;
  wire sel_writeReg, regWrite, sel_B_ALU, zero, memWrite, memRead, sel_WriteData, sel_pc;

  reg Ri;

  PC pc ( ProgramCounter, clk, pc_out );
  InstMem instructionMemory ( pc_out, instructionMem_out );
  mux2input_3bit writeReg_mux ( 0, instructionMem_out[11:9], sel_writeReg, writeReg );
  RF registerFile ( 0, instructionMem_out[11:9], writeReg, writeData, regWrite, readData1, readData2 );
  always @ (posedge clk)  assign Ri = readData2;
  SignExtend se ( instructionMem_out[11:0], memoryAddr);
  mux2input_16bit B_in_mux ( Ri, memoryAddr, sel_B_ALU, B_ALU_in);
  ALU alu ( readData1, B_ALU_in, ALU_op, zero, ALU_result );
  dataMemory memory ( imemoryAddr, readData1, clk, memWrite, memRead, memReadData );
  mux6input RF_writeData_mux ( memReadData, readData1, Ri, ~Ri, ALU_result, 0, sel_WriteData, writeData );
  Adder pc_adder ( 4, pc_out, added_pc );
  mux3input pc_mux ( instructionMem_out[11:0], BranchZ_pc, added_pc, sel_pc, next_pc );
  
  controller controllUnit ( instructionMem_out[8:0], zero, instructionMem_out[15:12], clk, go,
                            sel_writeReg, sel_B_ALU, memWrite, memRead, regWrite,
                            sel_WriteData, ALU_op, sel_pc );
                        
  always @ ( posedge clk ) begin
    
    assign PC_OUT = pc_out;
    assign INST_OUT = instructionMem_out;
    assign WRITE_REG = writeReg;
    assign READ_DATA1 = readData1;
    assign READ_DATA2 = readData2;
    assign RI = Ri;
    assign WRITE_DATA = writeData;
    assign ALU_RESULT = ALU_result;
    assign ZERO = zero;
    assign MEM_ADDR = memoryAddr;
    assign MEM_READ_DATA = memReadData;
    assign BRANCHZ_PC = BranchZ_pc;
    assign ADDED_PC = added_pc;
    assign NEXT_PC = next_pc;
    
  end  
                              
endmodule
