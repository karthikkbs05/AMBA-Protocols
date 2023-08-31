`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2023 12:38:56
// Design Name: 
// Module Name: apb
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


module apb(
input PCLK, PRESETn,
output [31:0]PADDR,PWDATA,
input [31:0]PRDATA,
output PWRITE,PENABLE,PSELx,
input PREADY,

input [1:0]DWREQ //00-no operation, 01-read, 11-write, 10-nop
    );
    parameter [2:0]IDLE=2'b100,SETUP=2'b010,ACCESS=2'b001;
    reg [2:0]current_state,
             next_state=IDLE;
    reg [31:0]DADDR=32'd16,DDATA;       
             
    always@(posedge PCLK,negedge PRESETn)
    begin
    if(~PRESETn)
      current_state <= IDLE;
    else 
      current_state <= next_state;
    end
    
    
    always@(current_state,DWREQ,PREADY)
    begin
    case(current_state)
      IDLE : begin
               if(DWREQ[0])
                 next_state <= SETUP;
               else 
                 next_state <= IDLE;
             end
      SETUP : begin
                next_state <= ACCESS;
              end
      ACCESS : begin
                 if(PREADY)
                   begin
                   if(DWREQ[1])
                     next_state <= IDLE;
                   else
                     begin
                       DDATA = PRDATA; 
                       DDATA <= DDATA+1; 
                       next_state <= IDLE;
                     end  
                   end
                 else 
                   next_state <= ACCESS;
               end
    endcase
    end
    
    assign PADDR = DWREQ[0] ? DADDR : 32'd0;
    assign PWDATA = DWREQ[1] ? DDATA: 32'd0;
    assign PSELx = (current_state == SETUP || current_state == ACCESS);
    assign PENABLE = (current_state == ACCESS);
    assign PWRITE = (DWREQ[1] && PSELx);
endmodule
