# inputs
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports EN]
# clock
set_property PACKAGE_PIN W5 [get_ports CLK]
 set_property IOSTANDARD LVCMOS33 [get_ports CLK]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]
 # async
set_property PACKAGE_PIN V17 [get_ports RESET_N]
 set_property IOSTANDARD LVCMOS33 [get_ports RESET_N]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets RESET_N_IBUF]
# outputs
set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports A]
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports B]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports C]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports D]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports E]
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports F]
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports G]
