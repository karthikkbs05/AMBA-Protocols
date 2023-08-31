`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2023 17:16:39
// Design Name: 
// Module Name: apb_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module apb_tb;
reg PCLK,PRESETn;
wire [31:0]PADDR,PWDATA;
reg [31:0]PRDATA;
wire PWRITE,PENABLE,PSELx;
reg PREADY;

reg [1:0]DWREQ;

apb a(PCLK,PRESETn,PADDR,PWDATA,PRDATA,PWRITE,PENABLE,PSELx,PREADY,DWREQ);
initial 
begin
PCLK = 0;
PRESETn = 0;
DWREQ = 2'b00;
PREADY = 0;
end
always #5 PCLK = ~PCLK;

initial
begin
#5 PRESETn = 1;
#10 DWREQ = 2'b01;PRDATA = 32'd16;
#10; 
#10 PREADY = 1;
#10 PREADY = 0;PRDATA = 32'd0;DWREQ=2'b00;
#10;
#10 DWREQ =2'b11;
#10
#10 PREADY = 1;
#10 PREADY = 0;DWREQ = 2'b00;
#20 PRESETn = 0;
$finish;

end
endmodule
