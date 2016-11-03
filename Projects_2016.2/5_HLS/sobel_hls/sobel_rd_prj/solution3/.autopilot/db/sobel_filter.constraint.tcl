set clock_constraint { \
    name clk \
    module sobel_filter \
    port ap_clk \
    period 40 \
    uncertainty 5 \
}

set all_path {}

set false_path {}

