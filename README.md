# AMBA-Protocols
AMBA (Advanced Microcontroller Bus Architecture) is a widely used and well-established set of protocols developed by ARM (now part of NVIDIA) for designing and interfacing components in a System-on-Chip (SoC) environment. AMBA protocols facilitate efficient communication between various IP (Intellectual Property) blocks within an SoC, such as processors, memory controllers, peripherals, and more.
The 2 protocols that I have designed using verilog RTL :
* APB (Advanced Peripheral Bus)
* AXI (Advanced eXtensible Interface)
# Quick Links 
- Files
   - [APB Design file](apb.v)
   - [APB Testbench](apb_tb.v)
   - [AXI slave design file](axi_slave.v)
   - [AXI testbench](axi_slave_tb.v)
- Navigation through the report
   - [Introduction to APB](#apb-advanced-peripheral-bus-protocol)
   - [APB master operation](#apb-master-operations)
   - [APB design using verilog RTL](#design-uisng-verilog-rtl)
   - [APB Simulation results](#simulation-using-xilinx-vivado)
   - [Introduction to AXI](#axi-advanced-extensible-interface-protocol)
   - [AXI slave operation](#axi-slave-operation)
   - [AXI slave design using verilog RTL](#axi-slave-design-using-verilog-rtl)
   - [AXI simulation results](#simulation-results)

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

## AXI slave design using verilog RTL
- [axi_slave.v](axi_slave.v) : AXI slave interface design file
    - Read channel
        - `ARADDR` : Specifies the address for a read transaction.
        - `ARLEN` : Indicates the number of data transfers within a read burst.
        - `ARSIZE` : Specifies the size of each data transfer in a read burst.
        - `ARBURST` : Specifies the type of read burst (e.g., incrementing, wrapping).
        - `ARVALID` : Indicates that valid read address information is available.
        - `ARREADY` : Indicates that the slave is ready to accept the read address.
        - `RDATA` : Carries the data read from the slave.
        - `RRESP` : Indicates the response status of the read transaction (e.g., OKAY[1], ERROR[0]).
        - `RLAST` : Indicates the last data beat in a read burst.
        - `RVALID` : Indicates that valid read data is available.
        - `RREADY` : Indicates that the master is ready to accept the read data.
   - Write channel
       - `AWADDR` : Specifies the address for a write transaction.
       - `AWLEN` : Indicates the number of data transfers within a write burst.
       - `AWSIZE` : Specifies the size of each data transfer in a write burst.
       - `AWBURST` : Specifies the type of write burst (e.g., incrementing, wrapping).
       - `AWVALID` : Indicates that valid write address information is available.
       - `AWREADY` : Indicates that the slave is ready to accept the write address.
       - `WDATA` : Carries the data to be written by the master.
       - `WLAST` : Indicates the last data beat in a write burst.
       - `WVALID` : Indicates that valid write data is available.
       - `WREADY` : Indicates that the slave is ready to accept the write data.
       - `BRESP` : Indicates the response status of the write transaction (e.g., OKAY, ERROR).
       - `BVALID` : Indicates that a valid write response is available.
       - `BREADY` : Indicates that the master is ready to accept the write response.
- [axi_slave_tb.v](axi_slave_tb.v) : Testbench file.

## Simulation Results 
Simulation results from Xilinx Vivado 2014.4

<img width="744" alt="image" src="https://github.com/karthikkbs05/AMBA-Protocols/assets/129792064/e3ada7d6-4bab-4818-9bfc-2829ae37affa">
<img width="745" alt="image" src="https://github.com/karthikkbs05/AMBA-Protocols/assets/129792064/951d4861-5df0-4098-8d35-bc670f27d3dc">








