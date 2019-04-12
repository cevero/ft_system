module control
#(
    parameter ADDR_WIDTH = 5
)
(
    input  logic                  clk,
    input  logic                  error_i,
    output logic                  done_o,
    output logic [ADDR_WIDTH-1:0] replay_addr_o
);

    localparam NUM_REG = 2**ADDR_WIDTH;

    logic                  done;
    logic                  state;
    logic [ADDR_WIDTH-1:0] temp;
    logic [ADDR_WIDTH-1:0] addr;

    always_comb 
        if (error_i)
            state <= error_i;
        else if (done)
            state <= 0;

    initial done = 1;

    genvar i;
    generate
    for (i = 1; i < NUM_REG; i++)
        always_ff @(posedge clk)
            // error detected - init replay system
            if (state && done) begin
                temp <= 1;
                done <= 0;
            // replay
            end else if (temp < NUM_REG) begin
                addr = i;
                temp = temp + 1;
            // complete
            end else if (temp == NUM_REG)
                done <= 1;
    endgenerate

    assign replay_addr_o = addr;
    assign done_o = done;
endmodule
