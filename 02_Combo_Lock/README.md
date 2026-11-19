# Combo Lock (final project)

A 3-bit combination lock. Set the code on SW2–SW0 and press KEY0 (Enter):

- Code matches `101` (SW2 up, SW1 down, SW0 up): LEDR9 turns on (unlocked).
- Any other code: LEDR0 turns on (wrong code).

The result stays latched until KEY0 is pressed again. Inputs are sampled on the rising edge of the 50 MHz board clock. The DE1-SoC push-buttons are active-low (they read `0` when pressed), so the logic checks for `btn = '0'`.

## Pins

| Signal | Direction | Board label | FPGA pin |
|---|---|---|---|
| `clk`      | in  | CLOCK_50 | PIN_AF14 |
| `btn`      | in  | KEY0     | PIN_AA14 |
| `sw[0]`    | in  | SW0      | PIN_AB12 |
| `sw[1]`    | in  | SW1      | PIN_AC12 |
| `sw[2]`    | in  | SW2      | PIN_AF9  |
| `led_lock` | out | LEDR9    | PIN_Y21  |
| `led_err`  | out | LEDR0    | PIN_V16  |

## Files

- `Combo_Lock.vhd`: design source
- `Combo_Lock.qpf` / `.qsf`: Quartus project and settings (device, pin assignments)
- `output_files/Combo_Lock.sof`: compiled bitstream, ready to program

Resource use after fitting: 2 ALMs, 2 registers, 7 of 457 pins.

## Notes for a next revision

- KEY0 goes straight into the clocked logic. The port comment mentions debouncing, but the design has no debounce or two-flip-flop synchronizer. That works here because the result only depends on the switches at the moment of the press, but a proper version would add both.
- The `.qsf` doesn't set an I/O standard for these pins, so Quartus used its 2.5 V default. The guide (and the Blinky project) use 3.3-V LVTTL to match the board.

Step-by-step guide: [`../docs/Combo_Lock_Project_Guide.pdf`](../docs/Combo_Lock_Project_Guide.pdf)
Demo video: [`../media/combo_lock_demo.mp4`](../media/combo_lock_demo.mp4)
