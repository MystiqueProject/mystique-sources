`include "./traditional_smart_mac.v"

module traditional_smart_systolic_array
#(
    parameter ROWS = 8,
    parameter COLS = 8,
    parameter WORD_SIZE = 16

) (
    clk,
    rst,

    hor_ssr_bus_in,
    ver_ssr_bus_in,

    ctl_stat_bit_in, 
    ctl_dummy_fsm_op2_select_in,
    ctl_dummy_fsm_out_select_in,

    left_in_bus,
    top_in_bus,
    bottom_out_bus
);

localparam MAX_VER_SSR = ROWS;
localparam MAX_HOR_SSR = COLS;

input clk;
input rst;

input [ROWS * MAX_HOR_SSR - 1 : 0] hor_ssr_bus_in;
input [COLS * MAX_VER_SSR - 1 : 0] ver_ssr_bus_in;

input [ROWS * WORD_SIZE - 1: 0] left_in_bus;
input [COLS * WORD_SIZE - 1: 0] top_in_bus;
output [ROWS * WORD_SIZE - 1: 0] bottom_out_bus; 

input ctl_stat_bit_in; 
input ctl_dummy_fsm_op2_select_in;
input ctl_dummy_fsm_out_select_in;

wire [ROWS * COLS * WORD_SIZE - 1: 0] hor_interconnect;
wire [COLS * ROWS * WORD_SIZE - 1: 0] ver_interconnect;

wire [ROWS * ROWS * COLS - 1: 0] hor_ssr_interconnect;
wire [COLS * COLS * ROWS - 1: 0] ver_ssr_interconnect;


genvar r, c;

generate
for (r = 0; r < ROWS; r = r + 1)
begin

    for(c = 0; c < COLS; c = c+1)
    begin
        //always @(*)
        //begin
            if ((r == 0) && (c==0))
            begin
                
                localparam HOR_SSR = MAX_HOR_SSR;
                localparam VER_SSR = MAX_VER_SSR;

                localparam VER_SSR_LINK_START = (r+1) * (c+1) * MAX_VER_SSR - (r+1) -1;
                localparam VER_SSR_LINK_STOP  = (r+1) * (c) * MAX_VER_SSR;
                localparam HOR_SSR_LINK_START = (c+1) * (r+1) * MAX_HOR_SSR - (c+1) -1;
                localparam HOR_SSR_LINK_STOP  = (c+1) * (r) * MAX_HOR_SSR;

                traditional_smart_mac #(
                    .WORD_SIZE(WORD_SIZE),
                    .NUM_VER_SSR(VER_SSR),
                    .NUM_HOR_SSR(HOR_SSR)

                ) u_mac_top_left(
                    .clk(clk),
                    .rst(rst),
                    .hor_ssr_bits_in(hor_ssr_bus_in[MAX_HOR_SSR -1 -: HOR_SSR]),
                    .ver_ssr_bits_in(ver_ssr_bus_in[MAX_VER_SSR -1 -: VER_SSR]),
                    .hor_ssr_bits_out(hor_ssr_interconnect[HOR_SSR_LINK_START: HOR_SSR_LINK_STOP]),
                    .ver_ssr_bits_out(ver_ssr_interconnect[VER_SSR_LINK_START: VER_SSR_LINK_STOP]),
                    .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                    .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                    .stat_bit_in(ctl_stat_bit_in),
                    .left_in(left_in_bus[(r+1) * WORD_SIZE -1 -: WORD_SIZE]),
                    .top_in(top_in_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .right_out(hor_interconnect[(c+1) * (r+1) * WORD_SIZE -1 -: WORD_SIZE]),
                    .bottom_out(ver_interconnect[(r+1) * (c+1) * WORD_SIZE -1 -: WORD_SIZE])
                );
            end
            else if (c==0)
            begin
                localparam HOR_SSR = MAX_HOR_SSR;
                localparam VER_SSR = MAX_VER_SSR - r;

                localparam VER_SSR_LINK_START = (r+1) * (c+1) * MAX_VER_SSR - (r+1) -1;
                localparam VER_SSR_LINK_STOP  = (r+1) * (c) * MAX_VER_SSR;
                localparam HOR_SSR_LINK_START = (c+1) * (r+1) * MAX_HOR_SSR - (c+1) -1;
                localparam HOR_SSR_LINK_STOP  = (c+1) * (r) * MAX_HOR_SSR;

                localparam VER_SSR_IN_LINK_START = r * (c+1) * MAX_VER_SSR - r - 1;
                localparam VER_SSR_IN_LINK_STOP = r * c * MAX_VER_SSR;

                traditional_smart_mac #(
                    .WORD_SIZE(WORD_SIZE),
                    .NUM_VER_SSR(VER_SSR),
                    .NUM_HOR_SSR(HOR_SSR)

                ) u_mac_left_col(
                    .clk(clk),
                    .rst(rst),
                    .hor_ssr_bits_in(hor_ssr_bus_in[(r+1) * MAX_HOR_SSR -1 -: HOR_SSR]),
                    .ver_ssr_bits_in(ver_ssr_interconnect[VER_SSR_IN_LINK_START: VER_SSR_IN_LINK_STOP]),
                    .hor_ssr_bits_out(hor_ssr_interconnect[HOR_SSR_LINK_START: HOR_SSR_LINK_STOP]),
                    .ver_ssr_bits_out(ver_ssr_interconnect[VER_SSR_LINK_START: VER_SSR_LINK_STOP]),
                    .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                    .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                    .stat_bit_in(ctl_stat_bit_in),
                    .left_in(left_in_bus[(r+1) * WORD_SIZE -1 -: WORD_SIZE]),
                    .top_in(ver_interconnect[ r * (c+1) * WORD_SIZE -1 -: WORD_SIZE]),
                    .right_out(hor_interconnect[(c+1) * (r+1) * WORD_SIZE -1 -: WORD_SIZE]),
                    .bottom_out(ver_interconnect[(r+1) * (c+1) * WORD_SIZE -1 -: WORD_SIZE])
                );
            end
            else if (r==0)
            begin
                localparam HOR_SSR = MAX_HOR_SSR -c;
                localparam VER_SSR = MAX_VER_SSR;

                localparam VER_SSR_LINK_START = (r+1) * (c+1) * MAX_VER_SSR - (r+1) -1;
                localparam VER_SSR_LINK_STOP  = (r+1) * (c) * MAX_VER_SSR;
                localparam HOR_SSR_LINK_START = (c+1) * (r+1) * MAX_HOR_SSR - (c+1) -1;
                localparam HOR_SSR_LINK_STOP  = (c+1) * (r) * MAX_HOR_SSR;

                localparam HOR_SSR_IN_LINK_START = (c) * (r+1) * MAX_HOR_SSR - (c) -1;
                localparam HOR_SSR_IN_LINK_STOP  = (c) * (r) * MAX_HOR_SSR;

                traditional_smart_mac #(
                    .WORD_SIZE(WORD_SIZE),
                    .NUM_VER_SSR(VER_SSR),
                    .NUM_HOR_SSR(HOR_SSR)

                ) u_mac_top_row(
                    .clk(clk),
                    .rst(rst),
                    .hor_ssr_bits_in(hor_ssr_interconnect[HOR_SSR_IN_LINK_START: HOR_SSR_IN_LINK_STOP]),
                    .ver_ssr_bits_in(ver_ssr_bus_in[(c+1) * MAX_VER_SSR - 1 -: VER_SSR]),
                    .hor_ssr_bits_out(hor_ssr_interconnect[HOR_SSR_LINK_START: HOR_SSR_LINK_STOP]),
                    .ver_ssr_bits_out(ver_ssr_interconnect[VER_SSR_LINK_START: VER_SSR_LINK_STOP]),
                    .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                    .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                    .stat_bit_in(ctl_stat_bit_in),
                    .left_in(hor_interconnect[c * (r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .top_in(top_in_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .right_out(hor_interconnect[(c+1) * (r+1) * WORD_SIZE -1 -: WORD_SIZE]),
                    .bottom_out(ver_interconnect[(r+1) * (c+1) * WORD_SIZE -1 -: WORD_SIZE])
                );
            end
            else
            begin
                localparam HOR_SSR = MAX_HOR_SSR - c;
                localparam VER_SSR = MAX_VER_SSR - r;

                localparam VER_SSR_LINK_START = (r+1) * (c+1) * MAX_VER_SSR - (r+1) -1;
                localparam VER_SSR_LINK_STOP  = (r+1) * (c) * MAX_VER_SSR;
                localparam HOR_SSR_LINK_START = (c+1) * (r+1) * MAX_HOR_SSR - (c+1) -1;
                localparam HOR_SSR_LINK_STOP  = (c+1) * (r) * MAX_HOR_SSR;

                localparam VER_SSR_IN_LINK_START = r * (c+1) * MAX_VER_SSR - r - 1;
                localparam VER_SSR_IN_LINK_STOP = r * c * MAX_VER_SSR;
                localparam HOR_SSR_IN_LINK_START = (c) * (r+1) * MAX_HOR_SSR - (c) -1;
                localparam HOR_SSR_IN_LINK_STOP  = (c) * (r) * MAX_HOR_SSR;


                traditional_smart_mac #(
                    .WORD_SIZE(WORD_SIZE),
                    .NUM_VER_SSR(VER_SSR),
                    .NUM_HOR_SSR(HOR_SSR)

                ) u_mac_rest(
                    .clk(clk),
                    .rst(rst),
                    .hor_ssr_bits_in(hor_ssr_interconnect[HOR_SSR_IN_LINK_START: HOR_SSR_IN_LINK_STOP]),
                    .ver_ssr_bits_in(ver_ssr_interconnect[VER_SSR_IN_LINK_START: VER_SSR_IN_LINK_STOP]),
                    .hor_ssr_bits_out(hor_ssr_interconnect[HOR_SSR_LINK_START: HOR_SSR_LINK_END]),
                    .ver_ssr_bits_out(ver_ssr_interconnect[VER_SSR_LINK_START: VER_SSR_LINK_END]),
                    .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                    .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                    .stat_bit_in(ctl_stat_bit_in),
                    .left_in(hor_interconnect[c * (r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                    .top_in(ver_interconnect[ r * (c+1) * WORD_SIZE -1 -: WORD_SIZE]),
                    .right_out(hor_interconnect[(c+1) * (r+1) * WORD_SIZE -1 -: WORD_SIZE]),
                    .bottom_out(ver_interconnect[(r+1) * (c+1) * WORD_SIZE -1 -: WORD_SIZE])
                );
            end
        //end
    end
end
endgenerate

endmodule
