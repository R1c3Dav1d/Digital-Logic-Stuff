## Inputs
# Switch 0 (SW0): Synchronous input P
set_property PACKAGE_PIN V17 [get_ports P]
 set_property IOSTANDARD LVCMOS33 [get_ports P]

## Asynchronous Inputs
# Switch 1 (SW1): Asynchronous Active-Low Reset (RESET_N)
set_property PACKAGE_PIN V16 [get_ports RESET_N]
 set_property IOSTANDARD LVCMOS33 [get_ports RESET_N]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets RESET_N_IBUF]

## Output
# LED 0 (LD0): Sequence detected output Z
set_property PACKAGE_PIN U16 [get_ports Z]
 set_property IOSTANDARD LVCMOS33 [get_ports Z]

## Clock
# Center Pushbutton (BTNC): Manual clock input CLK
set_property PACKAGE_PIN U18 [get_ports CLK]
 set_property IOSTANDARD LVCMOS33 [get_ports CLK]
 set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]
