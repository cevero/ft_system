`include "../sgpr/rtl/sgpr.sv"
`include "../comparator/rtl/comparator.sv"

module comp_sgpr
#(
    parameter ADDR_WIDTH = 5,
    parameter DATA_WIDTH = 32
)
(
    // comparator inputs
    input  logic                  we_a_i,
    input  logic                  we_b_i,
    input  logic [ADDR_WIDTH-1:0] addr_a_i,
    input  logic [ADDR_WIDTH-1:0] addr_b_i,
    input  logic [DATA_WIDTH-1:0] data_a_i,
    input  logic [DATA_WIDTH-1:0] data_b_i,

    // register file inputs
    input  logic                  clk,
    input  logic                  rst_n,

    //Read port R1
    input  logic [ADDR_WIDTH-1:0] raddr_a_i,
    output logic [DATA_WIDTH-1:0] rdata_a_o,
    
    //Read port R2
    input  logic [ADDR_WIDTH-1:0] raddr_b_i,
    output logic [DATA_WIDTH-1:0] rdata_b_o,

    output logic                  signal
);
    
    logic                  test_en_i;

    logic [ADDR_WIDTH-1:0] addr;
    logic [DATA_WIDTH-1:0] data;

    comparator 
    #(
        .ADDR_WIDTH(5)
    )
    analyzer
    (
        .we_a_i(we_a_i),
        .we_b_i(we_b_i),
        .addr_a_i(addr_a_i),
        .addr_b_i(addr_b_i),
        .data_a_i(data_a_i),
        .data_b_i(data_b_i),
        .addr_o(addr),
        .data_o(data),
        .signal(signal)
    );

    zeroriscy_register_file sgpr
    (
        .clk(clk),
        .rst_n(rst_n),
        .test_en_i(test_en_i),
        .raddr_a_i(raddr_a_i),
        .rdata_a_o(rdata_a_o),
        .raddr_b_i(raddr_b_i),
        .rdata_b_o(rdata_b_o),
        .waddr_a_i(addr),
        .wdata_a_i(data),
        .we_a_i(!signal)
    );

endmodule
