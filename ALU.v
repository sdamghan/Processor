module ALU ( input[15:0] a, b, input[2:0] ALUop, output reg zero, output reg [15:0] y );
  
  always @ (1) begin
    
    if ( ALUop == 000 )
      assign y = a&b;
  
    else if ( ALUop == 001 )
      assign y = a|b;
    
    else if ( ALUop == 010 )  begin
      assign y = a+b;
      if ( y == 0 )
        assign zero = 0;
      end
    
    else if ( ALUop == 110 ) begin
      assign y = a-b;
      if ( y == 0 )
        assign zero = 0;
      end
  end

endmodule
  