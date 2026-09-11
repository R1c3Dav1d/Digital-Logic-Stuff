#inputs
set_property PACKAGE_PIN R2 [get_ports D]
 set_property IOSTANDARD LVCMOS33 [get_ports D]
 #output
set_property PACKAGE_PIN L1 [get_ports Q]
 set_property IOSTANDARD LVCMOS33 [get_ports Q]

#clock
set_property PACKAGE_PIN U17 [get_ports CLK]
 set_property IOSTANDARD LVCMOS33 [get_ports CLK]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]
 