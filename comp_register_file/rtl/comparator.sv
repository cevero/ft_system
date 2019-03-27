module comparator
(
	input         w_en1,
	input         w_en2,
	input  [4:0]  w_addr1,
	input  [4:0]  w_addr2,
	input  [31:0] w_data1,
	input  [31:0] w_data2,

	output logic        error,
	output logic [31:0] data
);

	always_comb
		if ((w_en1 == w_en2) == 1'b1 && w_addr1 == w_addr2 && w_data1 == w_data2)
			data <= w_data1;
		else
			error <= 1'b1;
endmodule
