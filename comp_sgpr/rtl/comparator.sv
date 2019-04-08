module comparator
#(
	parameter DATA_WIDTH = 32
)
(
	input  logic                  we_a_i,
	input  logic                  we_b_i,
	input  logic [4:0]            addr_a_i,
	input  logic [4:0]            addr_b_i,
	input  logic [DATA_WIDTH-1:0] data_a_i,
	input  logic [DATA_WIDTH-1:0] data_b_i,
	output logic [4:0]            addr_o,
	output logic [DATA_WIDTH-1:0] data_o,
	output logic                  signal
);

	always_comb
		if (we_a_i == we_b_i && addr_a_i == addr_b_i && data_a_i == data_b_i) begin
			addr_o <= addr_a_i;
			data_o <= data_a_i;
			signal <= 1'b0;
		end else
			signal <= 1'b1;
endmodule
