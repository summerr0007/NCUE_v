module key_buffer(clk,rst,press,scan_code,buf_flag,key_buf_code,key_buf_code_2,key_buf_code_3,key_buf_code_4);
	input clk,rst,press;
	input [3:0] scan_code;
	output [5:0] buf_flag;
	output [23:0] key_buf_code;
	output [23:0] key_buf_code_2;
	output [31:0] key_buf_code_3;
	output [31:0] key_buf_code_4;
	
	reg [5:0] buf_flag;
	reg [23:0] key_buf_code;
	reg [23:0] key_buf_code_2;
	reg [31:0] key_buf_code_3;
	reg [31:0] key_buf_code_4;
	
	always@(posedge clk or posedge rst) begin
		if(rst)begin
			buf_flag = 6'b000000;
			key_buf_code = 24'h000000;
			key_buf_code_2 = 24'h000000;
			key_buf_code_3 = 32'h00000000;
			key_buf_code_4 = 32'h00000000;
		end
		else
			if(press == 1'b1) begin
				buf_flag = {buf_flag[4:0],1'b1};
				key_buf_code[23:0] = {key_buf_code[19:0],scan_code};
				key_buf_code_3[31:0] = {key_buf_code_3[27:0],scan_code};
				key_buf_code_4[31:0] = {key_buf_code_4[27:0],scan_code};
				if(scan_code == 4'b0001 || scan_code == 4'b0011 || scan_code == 4'b0101 || scan_code == 4'b0111 || scan_code == 4'b1001)begin
					key_buf_code_2[23:0] = {key_buf_code_2[19:0],scan_code};
				end
				if(scan_code == 4'b1111)begin
					key_buf_code_4 = 32'h00000000;
				end
				
				
			end
	
	end
endmodule 