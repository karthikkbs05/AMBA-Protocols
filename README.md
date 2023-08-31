# AMBA-Protocols
AMBA (Advanced Microcontroller Bus Architecture) is a widely used and well-established set of protocols developed by ARM (now part of NVIDIA) for designing and interfacing components in a System-on-Chip (SoC) environment. AMBA protocols facilitate efficient communication between various IP (Intellectual Property) blocks within an SoC, such as processors, memory controllers, peripherals, and more.
The 2 protocols that I have designed using verilog RTL :
* APB (Advanced Peripheral Bus)
* AXI (Advanced eXtensible Interface)
# Quick Links 
.
.
.
.
# APB (Advanced Peripheral Bus) Protocol 
APB is a lower-performance protocol designed for connecting slower peripheral devices, such as simple I/O peripherals and control interfaces. It operates at a slower clock speed compared to AXI and is intended for components that do not require high bandwidth.
APB features include:
* A simpler and lower-overhead protocol compared to AXI.
* Single-channel interface with fewer signal lines.
* Designed for low-power and simpler peripherals.
* Suitable for peripherals that do not require high-speed data transfers.
## APB master operations 
- Write :
     - In an APB transaction, a write operation involves sending a request to a peripheral to write data to a specific register or memory location. The below timing diagram shows how the operartion is performed.

       <img width="356" alt="image" src="https://github.com/karthikkbs05/AMBA-Protocols/assets/129792064/e8302965-448d-4859-8c75-08e9856e4f51">

- Read :
     - Read operation refers to the process of reading data from a peripheral component connected to an APB bus by a master.

       <img width="343" alt="image" src="https://github.com/karthikkbs05/AMBA-Protocols/assets/129792064/a00a2bff-4d21-4dea-8300-0127df152e8a">

## Design uisng verilog RTL
