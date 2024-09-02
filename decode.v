module decode(
	 input clk,
	 input reset,
	 input en_data,
	 input en_check,
	 input [22:0] data_in,
	 output reg [15:0] data_out,
	 output reg check_error
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
		data_out <=16'b0;
		CRCcal<=8'b0;
		check_error<=1'b0;
		data_in_CRC<=15'b0;
		
	 end
	 else
		if(en_data ==1'b1)
			begin
			data_in_CRC<=data_in[14:0];
			CRCcal<=data_in[22:15];
			data_out <=16'b0;	
			check_error<=1'b0;			
			end
		else
			if(en_check==1'b0)
				if(CRCcal==8'b0)
					begin
					data_out<=data_in[22:7];
					check_error<=1'b0;
					end
				else
					begin
					data_out<=16'b0;
					check_error<=1'b1;
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
