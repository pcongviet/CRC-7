`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:11 04/30/2023 
// Design Name: 
// Module Name:    CRC_Encoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module encode(
	 input clk,
	 input reset,
	 input [15:0] data_in,
	 input en_data,
	 input en_crc,
	 output reg [22:0] data_out,
	 output reg [6:0] crc_out,
	 output reg crc_ready
	 );
	 reg [7:0] CRC;
	 reg [7:0] CRCcal;
	 reg [14:0] data_in_CRC;
	 initial begin
	 CRC<=8'b10001001;
	 end
	 always @(posedge clk)
	 begin
	 if(reset) begin
		data_out <=23'b0;
		crc_out<=7'b0;
		CRCcal<=8'b0;
		crc_ready<=1'b0;
		data_in_CRC<=23'b0;
		
	 end
	 else
		if(en_data ==1'b1)
			begin
			data_in_CRC<={data_in[7:0],7'b0};
			CRCcal<=data_in[15:8];
			crc_out<=7'b0;
			crc_ready<=1'b0;	
			data_out <=23'b0; 
			end
		else
			if(en_crc==1'b0)
				begin
				crc_out<=CRCcal[7:1];
				data_out<={data_in,CRCcal[7:1]};
				crc_ready<=1'b1;
				end
			else
				if(CRCcal[7] ==1'b1)
					begin
					CRCcal<={CRCcal[6:0]^CRC[6:0],data_in_CRC[14]};
					data_in_CRC<=data_in_CRC<<1;
					end
				else
					begin
					CRCcal<={CRCcal[6:0],data_in_CRC[14]};
					data_in_CRC<=data_in_CRC<<1;
					end		

				
	 end
endmodule
	 