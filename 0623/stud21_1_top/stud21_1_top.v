module stud21_1_top(clk,rst,kc_sel,kr_sel,press,scan_code,buf_flag,key_buf_code_1);
	input clk,rst;
	input [3:0] kc_sel;
	output [3:0] kr_sel;
	output press;
	output [3:0]scan_code;
	output [5:0]buf_flag;
	output [23:0] key_buf_code_1;
	
	kr_scan m1(clk,rst,kr_sel);
	keyboard m2(kr_sel,kc_sel,press,scan_code);
	key_buffer m3(clk,rst,press,scan_code,buf_flag,key_buf_code_1);
endmodule 