# Blinky and Switch

First hands-on design on the DE1-SoC: slide switch SW0 drives red LED LEDR0. It is a single concurrent assignment (`led <= sw;`), so there is no clock and no stored state. The output follows the switch as soon as it moves.

## Pins

| Signal | Direction | Board label | FPGA pin | I/O standard |
|---|---|---|---|---|
| `sw`  | in  | SW0   | PIN_AB12 | 3.3-V LVTTL |
| `led` | out | LEDR0 | PIN_V16  | 3.3-V LVTTL |

## Files

- `BlinkyandSwitch.vhd`: design source
- `BlinkyandSwitch.qpf` / `.qsf`: Quartus project and settings (device, pin assignments)
- `output_files/BlinkyandSwitch.sof`: compiled bitstream, ready to program

Resource use after fitting: 1 ALM, 0 registers, 2 of 457 pins.

Step-by-step guide: [`../docs/Blinky_and_Switch_Project_Guide.pdf`](../docs/Blinky_and_Switch_Project_Guide.pdf)
