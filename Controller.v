
module controller ( input[8:0] func, input zero, input[3:0] opcode, input clk, go,
                    output reg sel_write_reg, sel_B_ALU, mem_write, mem_read, reg_write,
                    output reg [2:0] sel_write_data, ALU_op, output reg [1:0] sel_PC );



  parameter[3:0] Load = 4'b0000, Store = 4'b0001, Jump = 4'b0010, BranchZ = 0100,
                 TypeC = 1000, Addi = 1100, Subi = 1101, Andi = 1110, Ori = 1111;
                 
  parameter[8:0] Clear = 9'b000000001, MoveTo = 9'b000000010, MoveFrom = 9'b000000100, Add = 9'b000001000,
                 Sub = 9'b000010000, And = 9'b000100000, Or = 9'b001000000, Not = 9'b010000000, Nop = 9'b100000000;
                 
                 
  always @ ( posedge clk ) begin
  
    sel_write_reg = 0;
    sel_B_ALU = 0;
    mem_write = 0;
    mem_read = 0;
    reg_write = 0;
    sel_write_data = 0;
    ALU_op = 0;
    sel_PC = 0;
  
  
  
  
    case(opcode) 
      
      Load: begin
        sel_write_data = 3'b000;
        sel_PC = 2'b10;
        mem_read = 1'b1;
        reg_write = 1'b1;
      end
      
      Store: begin
        sel_PC = 2'b10;
        mem_write = 1'b1;
      end
      
      Jump: begin
        sel_PC = 2'b00;
      end
      
      BranchZ: begin
        sel_B_ALU = 1'b0;
        if ( zero == 1 )
          sel_PC = 2'b01;
        else
          sel_PC = 2'b10;
        ALU_op = 3'b110;
      end
          
      TypeC: begin
        
        case ( func )
        
          Clear: begin
            sel_write_reg = 1'b1;
            sel_write_data = 3'b101;
            sel_PC = 2'b10;
            reg_write = 1'b1;
          end
          
          MoveTo: begin
            sel_write_reg = 1'b1;
            sel_write_data = 3'b001;
            sel_PC = 2'b10;
            reg_write = 1'b1;
          end
          
          MoveFrom: begin
            sel_write_data = 3'b010;
            sel_PC = 2'b10;
            reg_write = 1'b1;
          end
          
          Add: begin
           sel_write_data = 3'b100;
           sel_PC = 2'b10;
           reg_write = 1'b1;
           ALU_op = 3'b010;
          end
          
          Sub: begin
            sel_write_data = 3'b100;
            sel_PC = 2'b10;
            reg_write = 1'b1;
            ALU_op = 3'b110;
          end
          
          And: begin
            sel_write_data = 3'b100;
            sel_PC = 2'b10;
            reg_write = 1'b1;
            ALU_op = 3'b000;
          end
        
          Or: begin
            sel_write_data = 3'b100;
            sel_PC = 2'b10;
            reg_write = 1'b1;
            ALU_op = 3'b001;
          end
          
          Not: begin
            sel_write_data = 3'b011;
            sel_PC = 2'b10;
            reg_write = 1'b1;
          end
          
          Nop: begin
            sel_PC = 2'b10;
          end      
        
        endcase
      end
      
      Addi: begin
        sel_B_ALU = 1'b1;
        sel_write_data = 3'b100;
        sel_PC = 2'b10;
        reg_write = 1'b1;
        ALU_op = 3'b010;
      end
      
      Subi: begin
        sel_B_ALU = 1'b1;
        sel_write_data = 3'b100;
        sel_PC = 2'b10;
        reg_write = 1'b1;
        ALU_op = 3'b110;
      end
      
      Andi: begin
        sel_B_ALU = 1'b1;
        sel_write_data = 3'b100;
        sel_PC = 2'b10;
        reg_write = 1'b1;
        ALU_op = 3'b000;
      end
      
      Ori: begin
        sel_B_ALU = 1'b1;
        sel_write_data = 3'b100;
        sel_PC = 2'b10;
        reg_write = 1'b1;
        ALU_op = 3'b001;
      end
      
      
    endcase
    
  end
  
endmodule
    
    
    
    
  
  
  
  
