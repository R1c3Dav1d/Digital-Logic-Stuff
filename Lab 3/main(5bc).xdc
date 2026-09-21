# clock
set_property PACKAGE_PIN T18 [get_ports CLK]
 set_property IOSTANDARD LVCMOS33 [get_ports CLK]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]
# async
set_property PACKAGE_PIN V17 [get_ports RESET_N]
 set_property IOSTANDARD LVCMOS33 [get_ports RESET_N]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets RESET_N_IBUF]
# outputs
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports A]
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports B]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports C]
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports D]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports E]
