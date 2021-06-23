module key_buffer(clk,rst,press,scan_code,buf_flag,key_buf_code);
	input clk,rst,press;
	input [3:0] scan_code;
	output [5:0] buf_flag;
	output [23:0] key_buf_code;
	
	reg [5:0] buf_flag;
	reg [23:0] key_buf_code;
	
	always@(posedge clk or posedge rst) begin
		if(rst)begin
			buf_flag = 6'b000000;
			key_buf_code = 24'h000000;
		end
		else
			if(press == 1'b1) begin
				buf_flag = {buf_flag[4:0],1'b1};
				key_buf_code[23:0] = {key_buf_code[19:0],scan_code};
			end
	
	end
endmodule 