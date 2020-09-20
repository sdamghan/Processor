
module PC ( input[11:0] in, input clk, output reg [11:0] instAddr );
  
  always @ ( posedge clk )
    
    assign instAddr = in;
    
endmodule
