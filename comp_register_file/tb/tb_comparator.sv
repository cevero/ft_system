module tb_comparator();

	logic        w_en1;
	logic        w_en2;
	logic        error;
	logic [4:0]  w_addr1;
	logic [4:0]  w_addr2;
	logic [31:0] w_data1;
	logic [31:0] w_data2;
	logic [31:0] data;  
	
	comparator dut
	(
		.w_en1   ( w_en1   ),
		.w_en2   ( w_en2   ),
		.w_addr1 ( w_addr1 ),
		.w_addr2 ( w_addr2 ),
		.w_data1 ( w_data1 ),
		.w_data2 ( w_data2 ),
		.error   ( error   ),
		.data    ( data    )
	);
	
	initial begin
		$display("time | data | error");
		$monitor("%g\t %d\t %b", $time, data, error);

		w_en1   <= 1;
		w_en2   <= 1;
		w_addr1 <= 5'd10;
		w_addr2 <= 5'd10;
		w_data1 <= 32'd100;
		w_data2 <= 32'd100;
		#5  
		w_en1   <= 1;
		#5
		w_addr2 <= 5'd11;
		#5
		w_data1 <= 32'd101;
		#5 $finish;
	end
endmodule
