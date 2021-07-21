module mac #(
    parameter WORD_SIZE = 8
) (
    clk,
    rst,
    stat_df_bit_in,             // This bit determines if the dataflow used is stationary and is used to set muxes for inputs to mult and adder
    left_in,
    top_in,
    right_out,
    bottom_out,
    res_in,
    res_out
);

localparam INTERNAL_WORD_SIZE = 2 * WORD_SIZE;

input clk;
input rst;
input stat_df_bit_in;

input [INTERNAL_WORD_SIZE - 1: 0] left_in;
input [INTERNAL_WORD_SIZE - 1: 0] top_in;
input [INTERNAL_WORD_SIZE -1: 0] res_in;

output [INTERNAL_WORD_SIZE - 1: 0] right_out;
output [INTERNAL_WORD_SIZE - 1: 0] bottom_out;
output [INTERNAL_WORD_SIZE - 1: 0] res_out;

wire [255:0] tie_low;
wire [INTERNAL_WORD_SIZE - 1 : 0] top_mux_out;
wire [INTERNAL_WORD_SIZE - 1: 0] adder_op_mux_out;
wire [INTERNAL_WORD_SIZE - 1: 0] mult_res;
wire [INTERNAL_WORD_SIZE - 1: 0] addr_res;

reg [IINTERNAL_NTERNAL_WORD_SIZE - 1: 0] stat_reg;
reg [INTERNAL_WORD_SIZE - 1: 0] left_in_reg;
reg [INTERNAL_WORD_SIZE - 1: 0] top_in_reg;
reg [INTERNAL_WORD_SIZE - 1: 0] res_out_reg;

assigINTERNAL_n tie_low = 256'b0;
assign right_out = left_in_reg;
assign bottom_out = top_in_reg;
assign res_out = res_out_reg;

// TODO : How to set the stationary values?
assign top_mux_out = (stat_df_bit_in == 1'b1) ? stat_reg : top_in_reg;
assign adder_op_mux_out = (stat_df_bit_in == 1'b1) ? res_in : res_out_reg;

assign mult_res = left_in_reg * top_mux_out; 
assign addr_res = mult_res + adder_op_mux_out; 

always @(posedge clk, posedge rst)
begin
    if (rst == 1'b1)
    begin
        left_in_reg <= tie_low[INTERNAL_WORD_SIZE - 1: 0]; 
        top_in_reg  <= tie_low[INTERNAL_WORD_SIZE - 1: 0]; 
    end
    else begin
        left_in_reg <= left_in; 
        top_in_reg <= top_in; 
    end
end

always @(posedge clk, posedge rst)
begin
    if (rst == 1'b1)
    begin
        res_out_reg <= tie_low[INTERNAL_WORD_SIZE - 1: 0];
    end
    else begin
        res_out_reg <= addr_res;
    end
end

endmodule
