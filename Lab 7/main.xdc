## Clock signal (100 MHz board clock)
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports { BOARDCLK }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { BOARDCLK }];

## Switches (DATA [15:0])
set_property -dict { PACKAGE_PIN V17  IOSTANDARD LVCMOS33 } [get_ports { DATA[0] }];
set_property -dict { PACKAGE_PIN V16  IOSTANDARD LVCMOS33 } [get_ports { DATA[1] }];
set_property -dict { PACKAGE_PIN W16  IOSTANDARD LVCMOS33 } [get_ports { DATA[2] }];
set_property -dict { PACKAGE_PIN W17  IOSTANDARD LVCMOS33 } [get_ports { DATA[3] }];
set_property -dict { PACKAGE_PIN W15  IOSTANDARD LVCMOS33 } [get_ports { DATA[4] }];
set_property -dict { PACKAGE_PIN V15  IOSTANDARD LVCMOS33 } [get_ports { DATA[5] }];
set_property -dict { PACKAGE_PIN W14  IOSTANDARD LVCMOS33 } [get_ports { DATA[6] }];
set_property -dict { PACKAGE_PIN W13  IOSTANDARD LVCMOS33 } [get_ports { DATA[7] }];
set_property -dict { PACKAGE_PIN V2   IOSTANDARD LVCMOS33 } [get_ports { DATA[8] }];
set_property -dict { PACKAGE_PIN T3   IOSTANDARD LVCMOS33 } [get_ports { DATA[9] }];
set_property -dict { PACKAGE_PIN T2   IOSTANDARD LVCMOS33 } [get_ports { DATA[10] }];
set_property -dict { PACKAGE_PIN R3   IOSTANDARD LVCMOS33 } [get_ports { DATA[11] }];
set_property -dict { PACKAGE_PIN W2   IOSTANDARD LVCMOS33 } [get_ports { DATA[12] }];
set_property -dict { PACKAGE_PIN U1   IOSTANDARD LVCMOS33 } [get_ports { DATA[13] }];
set_property -dict { PACKAGE_PIN T1   IOSTANDARD LVCMOS33 } [get_ports { DATA[14] }];
set_property -dict { PACKAGE_PIN R2   IOSTANDARD LVCMOS33 } [get_ports { DATA[15] }];

## Push Button (EN)
set_property -dict { PACKAGE_PIN U18  IOSTANDARD LVCMOS33 } [get_ports { EN }];

## Seven-Segment Display Segments (Cathodes a - g)
set_property -dict { PACKAGE_PIN W7   IOSTANDARD LVCMOS33 } [get_ports { A }];
set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports { B }];
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports { C }];
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports { D }];
set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports { E }];
set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports { F }];
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports { G }];

## Seven-Segment Display Digit Anodes (ONECOLD [3:0])
# Maps ONECOLD[3], [2], [1], [0] to pins W4, V4, U4, U2 respectively
set_property -dict { PACKAGE_PIN W4   IOSTANDARD LVCMOS33 } [get_ports { ONECOLD[3] }];
set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports { ONECOLD[2] }];
set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports { ONECOLD[1] }];
set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports { ONECOLD[0] }];
