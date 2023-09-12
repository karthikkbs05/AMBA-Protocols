module apb( clk,rst,paddr,pwrite,pwdata,pen,psel,pready, prdata);
  parameter idle=2'b00,
            setup=2'b01,
            access=2'b10;
  parameter datawidth=32;
  parameter addwidth=32;
  input clk,rst,pen,psel,pwrite;
  output pready;
  reg[1:0] apb_st,nxt_st;
  input [datawidth-1:0] pwdata;
  output reg[datawidth-1:0] prdata;
  input [addwidth-1:0] paddr;
  reg busy=0;
  
  reg[datawidth-1:0]mem[addwidth-1:0];
  
  always@(posedge clk or negedge rst)begin
    if(!rst) apb_st<=idle;
    else apb_st<=nxt_st;
      end
  
  always@(psel,pen,apb_st)begin
    case(apb_st)
        idle:begin
          if(psel==1 && pen==0)
            nxt_st=setup;
          else nxt_st=idle;
        end
      
      setup: begin 
        if(psel==1 && pen==1)
               nxt_st=access;
        else if(psel==1 && pen==0)
          nxt_st=setup;
        else nxt_st=idle;
      end
     
       
        access: begin
          if(psel==1 && pen==1)
            nxt_st=access;
          else if(psel==1 && pen==0)
            nxt_st=setup;
          else nxt_st=idle;
        end
      endcase
    
  end
  
  always@(*)begin
    if(apb_st==access)begin
      if(pwrite==1 && psel==1 && pready==1)
        mem[paddr]=pwdata;
      else if(pwrite==0 && psel==1 && pready==1)
        prdata=mem[paddr];
    end
  end
  assign pready=(busy==0) ? 1: 0;
  
endmodule
  
  
  
  
  
          
        
