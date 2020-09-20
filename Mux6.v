

module mux6input ( input[15:0] in1, in2, in3, in4, in5, in6, input select, output reg [15:0] result );

  always @ (1) begin
    
    if ( select == 0 )
      assign result = in1;
  
    else if ( select == 1 )
      assign result = in2;
      
    else if ( select == 2 )
      assign result = in3;
     
    else if ( select == 3 )
      assign result = in4;
     
    else if ( select == 4 )
      assign result = in5;
     
     else
       assign result = in6;
      
  end
endmodule

