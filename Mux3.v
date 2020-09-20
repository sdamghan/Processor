
module mux3input ( input[15:0] in1, in2, in3, input select, output reg [15:0] result );

  always @ (1) begin
    
    if ( select == 0 )
      assign result = in1;
  
    else if ( select == 1 )
      assign result = in2;
      
    else
     assign result = in3;
      
  end
endmodule

