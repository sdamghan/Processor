module mux2input_16bit ( input[15:0] in1, in2, input select, output reg [15:0] result );

  always @ (1) begin
    
    if ( select == 0 )
      assign result = in1;
  
    else
      assign result = in2;
      
  end
endmodule