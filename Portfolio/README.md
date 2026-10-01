# VLSI / Digital Logic Design — eYRC Logic Quest 26-27

Verilog RTL designs built for the **Logic Quest** theme of e-Yantra Robotics Competition (Team ID `eYRC#2432`), targeting an Intel/Altera **Cyclone IV E (EP4CE22F17C6)** FPGA. Each design was written, simulated, and synthesized in **Intel Quartus Prime**, with functional verification in **ModelSim**.

This folder contains only the curated, resume-ready source — one canonical copy per design, cleaned of Quartus build artifacts and duplicate drafts. The full project history (Quartus projects, waveform captures, synthesis reports) lives in the parent repository.

## Contents

### [`task0_digital_building_blocks/`](task0_digital_building_blocks)
Foundational combinational and sequential circuits:

| Design | Description |
|---|---|
| [`and_gate`](task0_digital_building_blocks/and_gate) | Basic 2-input AND gate |
| [`alu`](task0_digital_building_blocks/alu) | 8-bit ALU — 16 operations (arithmetic, logic, shift, rotate) with carry/zero flags |
| [`full_adder`](task0_digital_building_blocks/full_adder) | 1-bit full adder |
| [`ripple_carry_adder`](task0_digital_building_blocks/ripple_carry_adder) | Multi-bit ripple carry adder built from full adders |
| [`seven_segment_decoder`](task0_digital_building_blocks/seven_segment_decoder) | BCD-to-seven-segment display decoder |
| [`two_way_switch`](task0_digital_building_blocks/two_way_switch) | Two-way (SPDT) switch logic |
| [`traffic_light_controller`](task0_digital_building_blocks/traffic_light_controller) | FSM-based traffic light sequencer |
| [`universal_shift_register`](task0_digital_building_blocks/universal_shift_register) | Shift register supporting left/right shift and parallel load |
| [`sequence_detector`](task0_digital_building_blocks/sequence_detector) | FSM that detects the sequence `{1, 0, 9, 4}` on a 4-bit input stream |

### [`task1a_frequency_scaling_pwm/`](task1a_frequency_scaling_pwm)
A combined design that derives a scaled clock and a variable-duty-cycle PWM signal from a 50 MHz source clock:
- `frequency_scaling.v` — divides 50 MHz down to 5 MHz
- `pwm_generator.v` — generates a 500 Hz PWM output with a 5-bit programmable pulse width
- `top_module.v` — top-level module wiring the two blocks together
- `testbench.v` — the official (non-editable) competition testbench used for grading

## Tools
- **HDL:** Verilog
- **Synthesis / Place & Route:** Intel Quartus Prime
- **Simulation:** ModelSim
- **Target device:** Cyclone IV E, EP4CE22F17C6
