`include "../sgpr/rtl/sgpr.sv"
`include "../control/rtl/control.sv"
`include "../comparator/rtl/comparator.sv"

module ft_system
#(
    parameter ADDR_WIDTH = 5,
    parameter DATA_WIDTH = 32
)
(
    input  logic                  clk_i,

    // comparator inputs
    input  logic                  we_a_i,
    input  logic                  we_b_i,
    input  logic [ADDR_WIDTH-1:0] addr_a_i,
    input  logic [ADDR_WIDTH-1:0] addr_b_i,
    input  logic [DATA_WIDTH-1:0] data_a_i,
    input  logic [DATA_WIDTH-1:0] data_b_i,
    output logic [ADDR_WIDTH-1:0] addr_o,
    output logic [DATA_WIDTH-1:0] data_o,

    // fetch_block_signal
    output logic                  fetch_block_o
);

    comparator comparator_module
    (
        .we_a_i         (we_a_i      ),
        .we_b_i         (we_b_i      ),
        .addr_a_i       (addr_a_i    ),
        .addr_b_i       (addr_b_i    ),
        .data_a_i       (data_a_i    ),
        .data_b_i       (data_b_i    ),
        .addr_o         (addr_o      ),
        .data_o         (data_o      ),
        .signal         (signal      )
    );

    sgpr sgpr_module
    (
        .clk            (clk_i       ),
        .rst_n          (rst_n       ),
        .test_en_i      (test_en_i   ),
        .raddr_a_i      (raddr_a_i   ),
        .rdata_a_o      (rdata_a_o   ),
        .raddr_b_i      (raddr_b_i   ),
        .rdata_b_o      (rdata_b_o   ),
        .waddr_a_i      (addr        ),
        .wdata_a_i      (data        ),
        .we_a_i         (!signal     )
    );

    control control_module
    (
        .clk           (clk_i        ),
        .error_i       (error_i      ),
        .replay_addr_o (replay_addr_o),
        .fetch_block_o (fetch_block_o)
    );

endmodule