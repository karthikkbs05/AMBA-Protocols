# AMBA-Protocols
AMBA (Advanced Microcontroller Bus Architecture) is a widely used and well-established set of protocols developed by ARM (now part of NVIDIA) for designing and interfacing components in a System-on-Chip (SoC) environment. AMBA protocols facilitate efficient communication between various IP (Intellectual Property) blocks within an SoC, such as processors, memory controllers, peripherals, and more.
The 2 protocols that I have designed using verilog RTL :
* APB (Advanced Peripheral Bus)
* AXI (Advanced eXtensible Interface)
# Quick Links 
- Files
   - [APB Design file](apb.v)
   - [APB Testbench](apb_tb.v)
- Navigation through the report
   - [Introduction to APB](#apb-advanced-peripheral-bus-protocol)
   - [APB master operation](#apb-master-operations)
   - [APB design using verilog RTL](#design-uisng-verilog-rtl)
   - [APB Simulation results](#simulation-using-xilinx-vivado)

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
- [apb.v](apb.v) : Design file
     - `PCLK` : The clock signal for synchronizing data transfers between the master and peripheral.
     - `PSEL` : Indicates whether the peripheral is selected for a read or write operation.
     - `PENABLE` : Signals that the data on the bus is valid and can be captured by the peripheral.
     - `PWRITE` : Specifies whether the operation is a read (0) or write (1).
     - `PWDATA` : Carries the data to be written to the peripheral during a write operation.
     - `PRDATA` : Contains the data read from the peripheral during a read operation.
     - `PADDR` : Specifies the address of the peripheral register to be accessed.
     - `PREADY` : Indicates that the peripheral is ready to accept data during a write operation or that valid data is available during a read operation. 

- [apb_tb.v](apb_tb.v) : Testbench file
- Operating states :
     - Shows the operating states of the APB interface.

       <img width="271" alt="image" src="https://github.com/karthikkbs05/AMBA-Protocols/assets/129792064/c94bed88-7d0f-49cc-a593-c5591ee1de8f">

## Simulation using Xilinx Vivado
- Simulation output :
     - Behavioural Simulation.

       <img width="744" alt="waveform" src="https://github.com/karthikkbs05/AMBA-Protocols/assets/129792064/9b64dafe-c8db-415d-8788-79517d35d2a7">

       
# AXI (Advanced eXtensible Interface) protocol 
AXI is a high-performance, high-bandwidth protocol designed for connecting high-performance IP components, such as processors and memory controllers. It is designed to support the needs of high-frequency, high-throughput systems while providing features to ensure data integrity and minimize latency. AXI has several versions, including AXI4 and AXI4-Lite, each with specific characteristics.
AXI features include:
* Separate read and write channels to allow concurrent data transfers.
* Support for out-of-order transactions to improve efficiency.
* Burst transfers for efficient data movement.
* Multiple transaction types (read, write, exclusive, etc.).
* Support for multiple outstanding transactions to maximize throughput.

## AXI slave operation 
- Write :
    - write operation timing diagram.

      <img width="341" alt="image" src="https://github.com/karthikkbs05/AMBA-Protocols/assets/129792064/46f83d64-3927-44bb-866b-a490fca5dbb0">

- Read :
    - read operation timing diagram.

      <img width="342" alt="image" src="https://github.com/karthikkbs05/AMBA-Protocols/assets/129792064/fcc3da14-5469-49a3-9508-d881a8b45a2f">









