module dataMemory ( input[15:0] addr, input [15:0] writeData, input clk, mem_write, mem_read, output reg [15:0] readData );

  reg [15:0] datas [4095:0];
  
  always @ (posedge clk) begin
    
    if ( mem_write )
        datas[addr] = writeData;
        
    else if ( mem_read )
        assign readData = datas[addr];
      
    end

endmodule