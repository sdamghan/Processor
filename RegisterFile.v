module RF ( input[2:0] readReg1, readReg2, writeReg, input[15:0] writeData, input reg_Write, clk,
            output reg [15:0] readData1, readData2 );
  
  reg [15:0] RF [7:0];
  
  always @ ( posedge clk ) begin
    
    assign readData1 = RF[readReg1];
    assign readData2 = RF[readReg2];
    
    if ( reg_Write )
      RF[writeReg] = writeData;
      
    end
  
endmodule