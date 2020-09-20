module mux2input_3bit ( input[2:0] in1, in2, input select, output reg [2:0] result );

  always @ (1) begin
    
    if ( select == 0 )
      assign result = in1;
  
    else
      assign result = in2;
      
  end
endmodule

