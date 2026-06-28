# Traffic Light Controller using FSM — Verilog HDL

## About This Project
This is one of my internship projects where I had to design a Traffic Light 
Controller using the concept of Finite State Machine (FSM) in Verilog HDL. 
I chose this because traffic light systems are one of the most real-world 
applications of FSM and it really helped me understand how sequential logic 
works in digital design.

The idea is simple — a traffic light always follows a fixed sequence:
RED → GREEN → YELLOW → RED and so on. This repeating behavior is exactly 
what an FSM is built for.

## What I Learned From This
- How to define states and transitions in an FSM
- Difference between combinational and sequential always blocks
- How to write a proper testbench and verify outputs
- How timing works in simulation using clock cycles
- How to map this kind of design to an FPGA board

## Tools I Used
- Verilog HDL for coding the design
- ModelSim for simulation and waveform verification
- Xilinx Vivado for synthesis and FPGA implementation

## FSM State Diagram
    ------------------------------
    │                             │
    |                             │
    [RED STATE] ─10 cycles─> [GREEN STATE] ─10 cycles─> [YELLOW STATE]

       |                                                         │
       |                                                         |
       ----------------------10 cycles----------------------------
## Files in This Repository
| File Name | What it does |
|-----------|-------------|
| traffic_light.v | Main FSM design with state logic and output logic |
| traffic_light_tb.v | Testbench to simulate and verify all 3 states |

## How the FSM Works
The controller has 3 states:

**RED STATE**
- Red light turns ON, others OFF
- Vehicles must stop
- Stays for 10 clock cycles then moves to GREEN

**GREEN STATE**
- Green light turns ON, others OFF
- Vehicles can go
- Stays for 10 clock cycles then moves to YELLOW

**YELLOW STATE**
- Yellow light turns ON, others OFF
- Vehicles must slow down
- Stays for 10 clock cycles then goes back to RED

## How to Run Simulation
1. Download both .v files
2. Open ModelSim
3. Compile traffic_light.v first then traffic_light_tb.v
4. Run simulation
5. Open the .vcd file to see waveforms
6. Verify RED, GREEN, YELLOW signals are switching correctly

## Challenges I Faced
- Understanding the difference between next_state logic and output logic 
  took me some time
- Getting the counter timing right for state transitions was tricky 
  at first
- Writing the testbench from scratch was new to me but I figured it out

## What Can Be Improved
- Add pedestrian crossing signal
- Implement different timing for each light (real traffic has RED longer 
  than YELLOW)
- Add emergency vehicle override signal
- Deploy on actual Basys3 FPGA board and test with LEDs

## About Me
2nd Year ECE Student - VLSI Technology stream  
Gitam University  
Currently doing internship in VLSI Domain       
