//`include "traditional_systolic.v"
//`include "smart_mac.v"


module smart_systolic_arr_inner_sheath
#(
    parameter WORD_SIZE = 16, 
    parameter CELL_HEIGHT = 4,         
    parameter CELL_WIDTH = 4
)(
    clk,
    rst,

    ctl_stat_bit_in, 
    ctl_dummy_fsm_op2_select_in,
    ctl_dummy_fsm_out_select_in,

    capture_smart_top_select_in,
    capture_smart_left_select_in,
    latch_smart_bottom_select_in,
    latch_smart_right_select_in,

    top_in_bus,
    left_in_bus,
    bottom_out_bus,
    right_out_bus, 

    hor_smart_bus_in,
    ver_smart_bus_in,
    hor_smart_bus_out,
    ver_smart_bus_out
);

input clk;
input rst;

input ctl_stat_bit_in; 
input ctl_dummy_fsm_op2_select_in;
input ctl_dummy_fsm_out_select_in;

input capture_smart_top_select_in;
input capture_smart_left_select_in;
input latch_smart_bottom_select_in;
input latch_smart_right_select_in;

input [CELL_WIDTH  * WORD_SIZE - 1 : 0] top_in_bus;
input [CELL_HEIGHT * WORD_SIZE - 1 : 0] left_in_bus;
output [CELL_WIDTH * WORD_SIZE - 1 : 0] bottom_out_bus;
output [CELL_HEIGHT * WORD_SIZE - 1 : 0] right_out_bus;

input [ CELL_HEIGHT * WORD_SIZE - 1 : 0] hor_smart_bus_in;
input [ CELL_WIDTH * WORD_SIZE - 1 : 0] ver_smart_bus_in;
output [CELL_HEIGHT * WORD_SIZE - 1 : 0] hor_smart_bus_out;
output [CELL_WIDTH * WORD_SIZE - 1 : 0] ver_smart_bus_out;

localparam ARR_ROWS = CELL_HEIGHT - 2;
localparam ARR_COLS = CELL_WIDTH  - 2;

// Local interconnects
// Systolic array specific border interconnects
wire [ARR_COLS * WORD_SIZE - 1: 0] sys_arr_bottom_out_bus;
wire [ARR_ROWS * WORD_SIZE - 1: 0] sys_arr_right_out_bus;

// For using on the top row
wire [ARR_COLS * WORD_SIZE - 1: 0] top_row_right_out_bus;
wire [ARR_COLS * WORD_SIZE - 1: 0] top_row_bottom_out_bus;
wire [ARR_COLS * WORD_SIZE - 1: 0] top_row_ver_smart_bus_out;
wire [ARR_COLS * WORD_SIZE - 1: 0] top_row_hor_smart_bus_out;

// For using on the bottom row
wire [ARR_COLS * WORD_SIZE - 1: 0] bot_row_right_out_bus;
wire [ARR_COLS * WORD_SIZE - 1: 0] bot_row_bottom_out_bus;
wire [ARR_COLS * WORD_SIZE - 1: 0] bot_row_ver_smart_bus_out;
wire [ARR_COLS * WORD_SIZE - 1: 0] bot_row_hor_smart_bus_out;

// For using on the left col
wire [ARR_ROWS * WORD_SIZE - 1: 0] left_col_right_out_bus;
wire [ARR_ROWS * WORD_SIZE - 1: 0] left_col_bottom_out_bus;
wire [ARR_ROWS * WORD_SIZE - 1: 0] left_col_ver_smart_bus_out;
wire [ARR_ROWS * WORD_SIZE - 1: 0] left_col_hor_smart_bus_out;

// For using on the right col
wire [ARR_ROWS * WORD_SIZE - 1: 0] right_col_right_out_bus;
wire [ARR_ROWS * WORD_SIZE - 1: 0] right_col_bottom_out_bus;
wire [ARR_ROWS * WORD_SIZE - 1: 0] right_col_ver_smart_bus_out;
wire [ARR_ROWS * WORD_SIZE - 1: 0] right_col_hor_smart_bus_out;

wire tie_high = 1'b1;
wire tie_low = 1'b0;


// connect the wires: BOTTOM OUT 
assign bottom_out_bus[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE] = right_col_bottom_out_bus[ARR_COLS * WORD_SIZE - 1 -: WORD_SIZE];
assign bottom_out_bus[(CELL_WIDTH - 1) * WORD_SIZE -1 : WORD_SIZE] = bot_row_bottom_out_bus;
assign bottom_out_bus[WORD_SIZE - 1: 0] = left_col_bottom_out_bus[ARR_COLS * WORD_SIZE - 1 -: WORD_SIZE];

// connect the wires: RIGHT OUT
assign right_out_bus[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE] = bot_row_right_out_bus[ARR_ROWS * WORD_SIZE - 1 -: WORD_SIZE];
assign right_out_bus[(CELL_HEIGHT - 1) * WORD_SIZE -1 : WORD_SIZE] = right_col_right_out_bus;
assign right_out_bus[WORD_SIZE - 1: 0] = top_row_right_out_bus[ARR_ROWS * WORD_SIZE - 1 -: WORD_SIZE];

// connect the wires: VER SMART BUS OUT 
assign ver_smart_bus_out[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE] = right_col_ver_smart_bus_out[ARR_COLS * WORD_SIZE - 1 -: WORD_SIZE];
assign ver_smart_bus_out[(CELL_WIDTH - 1) * WORD_SIZE -1 : WORD_SIZE] = bot_row_ver_smart_bus_out;
assign ver_smart_bus_out[WORD_SIZE - 1: 0] = left_col_ver_smart_bus_out[ARR_COLS * WORD_SIZE - 1 -: WORD_SIZE];

// connect the wires: HOR SMART BUS OUT 
assign hor_smart_bus_out[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE] = bot_row_hor_smart_bus_out[ARR_ROWS * WORD_SIZE - 1 -: WORD_SIZE];
assign hor_smart_bus_out[(CELL_WIDTH - 1) * WORD_SIZE -1 : WORD_SIZE] = right_col_hor_smart_bus_out;
assign hor_smart_bus_out[WORD_SIZE - 1: 0] = top_row_hor_smart_bus_out[ARR_ROWS * WORD_SIZE - 1 -: WORD_SIZE];

traditional_systolic_array
#(
    .ROWS(ARR_ROWS),
    .COLS(ARR_COLS),
    .WORD_SIZE(WORD_SIZE)

) internal_arr (
    .clk(clk),
    .rst(rst),

    .ctl_stat_bit_in(ctl_stat_bit_in), 
    .ctl_dummy_fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
    .ctl_dummy_fsm_out_select_in(ctl_dummy_fsm_out_select_in),

    .left_in_bus(left_col_right_out_bus),
    .top_in_bus(top_row_bottom_out_bus),
    .bottom_out_bus(sys_arr_bottom_out_bus),
    .right_out_bus(sys_arr_right_out_bus)
);

// Top row of SMART mac units
genvar c;
generate
    for (c =0; c < ARR_COLS; c = c +1)
    begin:TOP_ROW_SMART_MACS

        if (c == 0) begin:FIRST_SMART_MAC_TOP_ROW
            smart_mac #( 
                .WORD_SIZE(WORD_SIZE)
            ) top_row_mac(
                .clk(clk),
                .rst(rst), 

                .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                .stat_bit_in(ctl_stat_bit_in),

                .select_left_in_smart(tie_low),                        // left in always from peer
                .select_top_in_smart(capture_smart_top_select_in),

                .select_right_out_smart(tie_low),
                .select_bottom_out_smart(tie_low),

                .left_in(left_in_bus[WORD_SIZE - 1 : 0]),
                .top_in(top_in_bus[(c+2) * WORD_SIZE - 1 -: WORD_SIZE]),
                .right_out(top_row_right_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .bottom_out(top_row_bottom_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]), 

                .vertical_smart_bus_in(ver_smart_bus_in[(c+2) * WORD_SIZE - 1 -: WORD_SIZE]),           // Top in bus is CELL_WIDTH * WORD_SIZE wide
                .horizontal_smart_bus_in(hor_smart_bus_in[WORD_SIZE - 1 : 0]),
                .vertical_smart_bus_out(top_row_ver_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_out(top_row_hor_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE])
            );
        end
        else begin
    
            smart_mac #( 
                .WORD_SIZE(WORD_SIZE)
            ) top_row_mac(
                .clk(clk),
                .rst(rst), 

                .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                .stat_bit_in(ctl_stat_bit_in),

                .select_left_in_smart(tie_low),                        // left in always from peer
                .select_top_in_smart(capture_smart_top_select_in),

                .select_right_out_smart(tie_low),
                .select_bottom_out_smart(tie_low),

                .left_in(top_row_right_out_bus[ c * WORD_SIZE - 1 -: WORD_SIZE]),
                .top_in(top_in_bus[(c+2) * WORD_SIZE - 1 -: WORD_SIZE]),
                .right_out(top_row_right_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .bottom_out(top_row_bottom_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]), 

                .vertical_smart_bus_in(ver_smart_bus_in[(c+2) * WORD_SIZE - 1 -: WORD_SIZE]),           // Top in bus is CELL_WIDTH * WORD_SIZE wide
                .horizontal_smart_bus_in(top_row_hor_smart_bus_out[c * WORD_SIZE - 1 -: WORD_SIZE]),
                .vertical_smart_bus_out(top_row_ver_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_out(top_row_hor_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE])
            );
        end
    end
endgenerate

// Bottom row of smart mac units 
generate
    for (c =0; c < ARR_COLS; c = c +1)
    begin:BOTTOM_ROW_SMART_MACS

        if (c == 0) begin
            smart_mac #( 
                .WORD_SIZE(WORD_SIZE)
            ) top_row_mac(
                .clk(clk),
                .rst(rst), 

                .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                .stat_bit_in(ctl_stat_bit_in),

                .select_left_in_smart(tie_low),                        
                .select_top_in_smart(tie_low),

                .select_right_out_smart(tie_low),
                .select_bottom_out_smart(latch_smart_bottom_select_in),

                .left_in(left_in_bus[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE]),
                .top_in(sys_arr_bottom_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .right_out(bot_row_right_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .bottom_out(bot_row_bottom_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]), 

                .vertical_smart_bus_in(top_row_ver_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),           
                .horizontal_smart_bus_in(hor_smart_bus_in[CELL_HEIGHT * WORD_SIZE - 1 -: WORD_SIZE]),
                .vertical_smart_bus_out(bot_row_ver_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_out(bot_row_hor_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE])
            );
        end
        else begin
    
            smart_mac #( 
                .WORD_SIZE(WORD_SIZE)
            ) top_row_mac(
                .clk(clk),
                .rst(rst), 

                .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                .stat_bit_in(ctl_stat_bit_in),

                .select_left_in_smart(tie_low),                        
                .select_top_in_smart(tie_low),

                .select_right_out_smart(tie_low),
                .select_bottom_out_smart(latch_smart_bottom_select_in),

                .left_in(bot_row_right_out_bus[ c * WORD_SIZE - 1 -: WORD_SIZE]),
                .top_in(sys_arr_bottom_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .right_out(bot_row_right_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .bottom_out(bot_row_bottom_out_bus[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]), 

                .vertical_smart_bus_in(top_row_ver_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),           
                .horizontal_smart_bus_in(bot_row_hor_smart_bus_out[c * WORD_SIZE - 1 -: WORD_SIZE]),
                .vertical_smart_bus_out(bot_row_ver_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_out(bot_row_hor_smart_bus_out[(c+1) * WORD_SIZE - 1 -: WORD_SIZE])
            );
        end
    end
endgenerate

// Left col
genvar r;
generate
    for (r =0; r < ARR_ROWS; r = r + 1)
    begin
        if (r == 0) begin
            smart_mac #( 
                .WORD_SIZE(WORD_SIZE)
            ) top_row_mac(
                .clk(clk),
                .rst(rst), 

                .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                .stat_bit_in(ctl_stat_bit_in),

                .select_left_in_smart(capture_smart_left_select_in),                        
                .select_top_in_smart(tie_low),

                .select_right_out_smart(tie_low),
                .select_bottom_out_smart(tie_low),

                .left_in(left_in_bus[(r+2) * WORD_SIZE - 1 -: WORD_SIZE]),
                .top_in(top_in_bus[WORD_SIZE - 1: 0]),
                .right_out(left_col_right_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .bottom_out(left_col_bottom_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),

                .vertical_smart_bus_in(ver_smart_bus_in[WORD_SIZE - 1 : 0]),
                .horizontal_smart_bus_in(hor_smart_bus_in[(r+2) * WORD_SIZE - 1 -: WORD_SIZE]),
                .vertical_smart_bus_out(left_col_ver_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_out(left_col_hor_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE])
            );
        end
        else begin
    
            smart_mac #( 
                .WORD_SIZE(WORD_SIZE)
            ) top_row_mac(
                .clk(clk),
                .rst(rst), 

                .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                .stat_bit_in(ctl_stat_bit_in),

                .select_left_in_smart(capture_smart_left_select_in),                        
                .select_top_in_smart(tie_low),

                .select_right_out_smart(tie_low),
                .select_bottom_out_smart(tie_low),

                .left_in(left_in_bus[(r+2) * WORD_SIZE - 1 -: WORD_SIZE]),
                .top_in(left_col_bottom_out_bus[r * WORD_SIZE - 1 -: WORD_SIZE]),
                .right_out(left_col_right_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .bottom_out(left_col_bottom_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),

                .vertical_smart_bus_in(left_col_ver_smart_bus_out[ r * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_in(hor_smart_bus_in[(r+2) * WORD_SIZE - 1 -: WORD_SIZE]),
                .vertical_smart_bus_out(left_col_ver_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_out(left_col_hor_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE])
                
            );
        end
    end
endgenerate

// Right col
generate
    for (r =0; r < ARR_ROWS; r = r + 1)
    begin
        if (r == 0) begin
            smart_mac #( 
                .WORD_SIZE(WORD_SIZE)
            ) top_row_mac(
                .clk(clk),
                .rst(rst), 

                .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                .stat_bit_in(ctl_stat_bit_in),

                .select_left_in_smart(tie_low),                        
                .select_top_in_smart(tie_low),

                .select_right_out_smart(latch_smart_right_select_in),
                .select_bottom_out_smart(tie_low),

                .left_in(sys_arr_right_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .top_in(top_in_bus[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),
                .right_out(right_col_right_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .bottom_out(right_col_bottom_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),

                .vertical_smart_bus_in(ver_smart_bus_in[CELL_WIDTH * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_in(left_col_hor_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .vertical_smart_bus_out(right_col_ver_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_out(right_col_hor_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE])
            );
        end
        else begin
            smart_mac #( 
                .WORD_SIZE(WORD_SIZE)
            ) top_row_mac(
                .clk(clk),
                .rst(rst), 

                .fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .fsm_out_select_in(ctl_dummy_fsm_out_select_in),
                .stat_bit_in(ctl_stat_bit_in),

                .select_left_in_smart(tie_low),                        
                .select_top_in_smart(tie_low),

                .select_right_out_smart(latch_smart_right_select_in),
                .select_bottom_out_smart(tie_low),

                .left_in(sys_arr_right_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .top_in(right_col_bottom_out_bus[r * WORD_SIZE - 1 -: WORD_SIZE]),
                .right_out(right_col_right_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .bottom_out(right_col_bottom_out_bus[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),

                .vertical_smart_bus_in(right_col_ver_smart_bus_out[r*WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_in(left_col_hor_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .vertical_smart_bus_out(right_col_ver_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE]),
                .horizontal_smart_bus_out(right_col_hor_smart_bus_out[(r+1) * WORD_SIZE - 1 -: WORD_SIZE])
            );
        end
    end
endgenerate

endmodule 
