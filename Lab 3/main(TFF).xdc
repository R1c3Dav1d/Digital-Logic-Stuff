#inputs
set_property PACKAGE_PIN R2 [get_ports T]
 set_property IOSTANDARD LVCMOS33 [get_ports T]

#async
set_property PACKAGE_PIN V16 [get_ports PRS_N]
 set_property IOSTANDARD LVCMOS33 [get_ports PRS_N]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets PRS_N_IBUF]
set_property PACKAGE_PIN V17 [get_ports CLR_N]
 set_property IOSTANDARD LVCMOS33 [get_ports CLR_N]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLR_N_IBUF]
#output
set_property PACKAGE_PIN L1 [get_ports Q]
 set_property IOSTANDARD LVCMOS33 [get_ports Q]
set_property PACKAGE_PIN V3 [get_ports Q_N]
 set_property IOSTANDARD LVCMOS33 [get_ports Q_N]

#clock
set_property PACKAGE_PIN U17 [get_ports CLK]
 set_property IOSTANDARD LVCMOS33 [get_ports CLK]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]
