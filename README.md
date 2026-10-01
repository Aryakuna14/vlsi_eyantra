# Learning VLSI — a journey in Verilog

This repo is where I'm teaching myself digital design from the ground up — RTL in Verilog, synthesis and simulation in **Intel Quartus Prime**, functional verification in **ModelSim**, targeting a real **Cyclone IV E (EP4CE22F17C6)** FPGA. It started as coursework for the **eYRC Logic Quest** theme (Team `eYRC#2432`) and turned into the place I keep building on as I go deeper into VLSI.

I'm not a finished product here, and neither is this repo. Some folders are clean, finished designs; others are drafts, dead ends, and "let me try it this other way" attempts I kept around on purpose — that's part of the record. If you want the curated version, start with **[`Portfolio/`](Portfolio)**.

## The journey so far

**Task 0 — the basics.** Gates, combinational logic, FSMs. Getting comfortable with `always` blocks, blocking vs. non-blocking assignment, and why a missing `else` quietly turns into a latch. Designs: an AND gate, an 8-bit ALU, a full adder, a ripple-carry adder, a seven-segment decoder, a two-way switch, a traffic light controller, a universal shift register, and a sequence detector FSM.

**Task 1A — combining modules, thinking about timing.** A frequency scaler (50 MHz → 5 MHz) feeding a PWM generator (500 Hz, programmable duty cycle), wired together as one top-level design. This is where clock domains and counter-based timing started actually mattering, not just compiling.

**Task 1B — in progress.** A RISC-V CPU, started under `eYRC_26-27_Logic-Quest/Task_1/Task_1B/`. Still has unfinished pieces — I'm leaving it in the repo rather than hiding it, because that's an honest snapshot of where I am.

## How this repo is laid out

- **[`Portfolio/`](Portfolio)** — one clean, final copy of each completed design. No build artifacts, no drafts. This is what I'd point someone to if they just want to see the work.
- **`Task_0/`** — the individual Quartus projects behind each Task 0 design (source, testbenches, waveforms, the official submission bundle).
- **`Task_1A/`** — every iteration of the frequency-scaling/PWM design as I worked through it, including a few parallel attempts.
- **`eYRC_26-27_Logic-Quest/`** — the official competition template/repo, including the in-progress RISC-V CPU.
- Quartus-generated build caches (`db/`, `output_files/`, `simulation/`, `incremental_db/`) are gitignored — they're regenerated on every compile, so there's no point tracking them.

## Tools
- **HDL:** Verilog
- **Synthesis / place & route:** Intel Quartus Prime
- **Simulation:** ModelSim
- **Target device:** Cyclone IV E, EP4CE22F17C6

## What's next
Finishing the Task 1B RISC-V CPU, then picking up more advanced topics — pipelining, memory interfacing, maybe a first look at timing closure and constraints. I'll keep adding to `Portfolio/` as designs get to a state I'm happy calling "done."
