module SignExtend ( input[11:0] in, output[15:0] out );
  
  assign out = { in[11], in[11], in[11], in[11], in[11], in[10], in[9], in[8], in[7], in[6], in[5], in[4],
                 in[3], in[2], in[1], in[0] };
   
endmodule