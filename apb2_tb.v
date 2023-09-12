module apb_tb;
 
  parameter datawidth=32;
  parameter addwidth=32;
  reg clk,rst,pen,psel,pwrite;
  wire pready;
  reg [datawidth-1:0] pwdata;
  wire[datawidth-1:0] prdata;
  reg [addwidth-1:0] paddr;
  
  initial begin
    clk=0;
    rst=1'b0;
    #10 rst=1'b1;
  end
  always #20 clk=~clk;
  
  apb ao( clk,rst,paddr,pwrite,pwdata,pen,psel,pready, prdata);
  
  task read(integer count);
    for(integer i=0; i<count;i=i+1) begin
 
      @(negedge clk);
      psel=1;
      paddr=i;
      pwrite=0;
      pen=0;
      
      @(negedge clk);
      pen=1;
      
     end
  endtask
  

  task write(integer count);
    for(integer i=0; i<count;i=i+1) begin
         
    @(negedge clk);
    psel = 1;
    paddr = i;
    pen = 0;
    pwrite = 1;
    pwdata=$random;
      
      @(negedge clk)
      pen=1;
    end
  endtask
  
  initial begin
    repeat(3) @(negedge clk);
    write(3);
    @(negedge clk);
    read(2);
   
  end

  initial #500 $finish;
endmodule
  
    
  
  
      
