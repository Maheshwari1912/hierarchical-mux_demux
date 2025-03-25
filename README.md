# hierarchical-mux_demux
🎯 Introduction
In digital design, hierarchical circuits are built by combining smaller, reusable modules to create larger, more complex systems. This approach improves readability, scalability, and debugging.

Two essential combinational circuits built hierarchically are:

Multiplexer (MUX): Selects one of many inputs and forwards it to the output.

Demultiplexer (DEMUX): Takes a single input and directs it to one of many outputs based on select lines.

🛠️ Hierarchical 4:1 MUX Design
📌 Key Idea
A 4:1 MUX can be built from three 2:1 MUXes:

First stage: Two 2:1 MUXes to handle 4 inputs.

Second stage: One more 2:1 MUX to finalize the output.

![image](https://github.com/user-attachments/assets/d6c2a6a9-6c87-4cc3-92bb-70f3973644bb)


Inputs: A, B, C, D — 4 data inputs

Select lines: S0, S1 — 2 select lines control which input reaches the output

Output: Z — the final output

🔧 How it works:
The first level contains two 2:1 MUXes:

First MUX selects between A and B based on S0.

Second MUX selects between C and D based on S0.

The second level has one more 2:1 MUX:

It selects between the outputs of the first-level MUXes, controlled by S1.


For example:

If S0=0 and S1=0, output Z = A.

If S0=1 and S1=0, output Z = B.

If S0=0 and S1=1, output Z = C.

If S0=1 and S1=1, output Z = D.

✨ Key takeaway:
This design reuses smaller MUXes to create a larger, more complex 4:1 MUX, demonstrating modularity and scalability in digital design.
🛠️ Hierarchical 1:4 DEMUX Design
📌 Key Idea
A 1:4 DEMUX can be constructed from three 1:2 DEMUXes:

First stage: One DEMUX splits the input into two paths.

Second stage: Two more DEMUXes split those paths into four outputs.

![image](https://github.com/user-attachments/assets/dffdb39a-4b18-495c-ab45-46ba4d3db72f)


🎯 What’s happening here?

Data Input (D): A single data input that gets routed to one of four outputs.

Enable (En): Controls whether the demux operates or remains inactive.

Select Lines (S1, S0): Control which specific output gets the data.

Outputs (Y0, Y1, Y2, Y3): Four output lines where the data appears based on the select lines.

🔧 How it works (Step-by-step):

First Level (1 Demux):

The first 1:2 Demux takes the data input D and uses select line S1 to choose between its two outputs Y0 and Y1.

These outputs become the data inputs for the second-level demuxes.

Second Level (2 Demuxes):

Each of the two second-level 1:2 Demuxes receives its input from the first-level outputs Y0 and Y1.

The second-level demuxes use S0 to decide which of their outputs to activate (Y0/Y1).

This way, the original data D is routed to one of the 4 outputs (Y0, Y1, Y2, Y3).

🔍 Select Line Breakdown:

For S1, S0 combinations:

S1	S0	Active Output
0  	0     	Y0
0	  1	      Y1
1	  0	      Y2
1	  1	      Y3

🌟 Key Takeaways:

Hierarchical design: Breaks a larger demux into smaller, manageable 1:2 demuxes, improving reusability and modularity.

Scalability: This structure easily extends to 1:8, 1:16, etc.

Enable signal: Controls whether the demux works or remains idle — useful in complex circuits.

