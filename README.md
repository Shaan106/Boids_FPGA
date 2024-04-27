# Final Project - Boid Hardware
> Tate Staples and Shaan Yadav

## Overview
The goal of this project was to build an efficient low level implementation of the [Boid Algorithm](https://en.wikipedia.org/wiki/Boids). The Boid Algorithm is a simple algorithm that simulates the flocking behavior of birds. The algorithm is based on three simple rules:
1. **Separation**: Boids will avoid collisions with other boids.
2. **Alignment**: Boids will try to align their velocities with other boids.
3. **Cohesion**: Boids will try to move towards the center of mass of other boids.

## Demo

Here is a link to a brief demo of our project: [https://youtu.be/ht7rk9lN3hA?si=nm8mqO105J0s3qD8](https://www.youtube.com/embed/ht7rk9lN3hA?si=ShflnYgObScCwDLL)

[![IMAGE ALT TEXT HERE](images/demo_link.png)](https://www.youtube.com/embed/ht7rk9lN3hA?si=ShflnYgObScCwDLL)

## Table of Contents
- [Overview](#overview)
- [Demo](#demo)
- [Software](#software)
    - [Boid Algorithm](#boid-algorithm)
    - [Pygame Boids](#pygame-boids)
    - [C Boids](#c-boids)
    - [Compiling](#compiling)
    - [MIPS Simulator](#mips-simulator)
- [Hardware](#hardware)
    - [BPU Interface](#bpu-interface)
    - [Canvas RAM](#canvas-ram)
    - [VGA](#vga)
    - [Timing of components](#timing-of-components)
    - [Iverilog](#iverilog)
- [CPU](#cpu)
- [Future Work](#future-work)
    - [Compiler Optimization](#compiler-optimization)
    - [Parallel BPU Implementation](#parallel-bpu-implementation)
- [Bloopers (Challenges)](#bloopers-challenges)
- [Media](#media)


## Software
This project was very software heavy, as our project was implementing an algorithm. Due to the complexity of the algorithm, we decided to iterate through multiple implementations to find the most efficient one. 

### Boid Algorithm

The algorithm is simple to implement and can be run in parallel, making it a good candidate for hardware acceleration. We then created a asynchronous double buffer graphics processor to display the boids on a VGA monitor.

![B](images/boids.png)

### Pygame Boids
![Python](images/pygame_boids2.png)

We started with a simple python implementation. This served the purpose of providing the deepest understanding of the algoirthm, allowed us to discover high level logic errors and do some hyperparameter tuning.

This was a good starting platform because both of us had familiarity with python and the pygame library. This allowed us to quickly prototype the boids algorithm and get a feel for how the boids should behave.

Additionally there were plenty of online resources that provided starter methods and allowed for reference.
### C Boids
![C](images/C_boids2.png)

We then moved to a C implementation. The C implementation guided us to a more hardware friendly implementation that mapped more directly due assembly. Additionally in this stage we attempted to remove all multiplication and division as an early step towards are full hardware implementation.

C was a good middle ground between python and assembly. It allowed us to write code that was closer to the hardware, but still had the ease of use of a high level language. We found a graphics library in C with close enough parity to pygame for a swift and bug free transition.

#### Stripped C implmentation
The C GUI library we used was great for tuning the algorithm, but wasn't available in the hardware. To this end we created a stripped down version of the C implementation that only contained the boids algorithm and used no libraries.
### Compiling
![comp](images/compilation.png)
In order to map our rapid C iteration to hardware, we needed to compile our C code to MIPS assembly. We used the online compiler [Godbolt](https://godbolt.org/) to compile our C code to MIPS assembly. This allowed us to see the assembly code that was generated by the C code. 

We then wrote a python script, [*more_compiles.py*](BPU/more_compiles.py) that took the MIPS assembly code and converted it to a format that could be read by our MIPS assembler. This allowed us to take our C code and convert it to a format that could be read by our MIPS assembler. This involved:
- Converting real MIPS syntax into Duke's reduced instruction set
- Allocating .space commands into stack allocation
- Removing all assembler flags (which .asm doesn't support)
- renaming registers
- supporting lui and li with addi instructinos
- implementing slt and beq from blt and bne
### MIPS Simulator
![MIPS](images/simulation.png)
The MIPS simulator was a simple MIPS interpreter that I built in Python to debug the MIPS assembly code. The interpreter was built with a debug mode that would permit running a fixed numebr of lines or up to a breakpoint. This was useful for debugging the MIPS assembly code and ensuring that the code was running as expected. It helped catch numerous errors in both the compiler and final processor implementation.

## Hardware
Our initial plan was to create the boids algorithm using parallel computation, and so our hardware is laid out in a way to support GPU-like computation of the boids, where each boid has its own "BPU" - Boid Processing Unit. The layout allows for parallel computation and updates of the boids, with each BPU being responsible for a single boid.

In order to comply with the final project's requirements we had to retrofit our 5-stage pipelined CPU into our computational scheme, moving from computing from parallel threads to computing sequentially within our CPU. This meant sacrificing the computational speed we would get from the BPU implementation and in return having to use less memory and significantly less extensive hardware structures that could have reached the limits of our FPGA's capabilities.

Below is a simplified overview of our hardware layout, where we created all the components being used.

- **ROM**: Where we stored our compiled algorithm, in machine code for our specific design of the CPU
- **CPU**: Our custom built 5-stage pipleined, bypassing and hazard detecting 32-bit processor
- **RAM**: This is our main memory, used for storing data during CPU computation
- **Regfile**: Register file which has 32 32-bit registers, with `$r23-$r28` being reserved for communication between the CPU and the rest of the hardware components
    - `$r23`: Used to communicate the x_pos of the user controlled repulsor boid
    - `$r24`: Used to communicate the y_pos of the user controlled repulsor boid
    - `$r25`: Indicates when all boids have been updated in their BPUs, signifying the end of a frame
    - `$r26`: Holds the updated x_pos of the current boid being updated
    - `$r27`: Write enable signal that is either -1 implying write disabled or has the index of the boid being updated
    - `$r28`: Holds the updated y_pos of the current boid being updated

- **Button Inputs**: Used to control the "scary" boid which repulses other boids around it
- **BPUs**: Boid Processing Units, each of which is responsible for a single boid
- **Resettable RAM**: Custom implementation of RAM to allow for pixel updating only to the locations of the boids, and so a much faster refresh rate for the VGA
- **Switches**: Switches allow the user to manipulate the memory and display interfaces, allowing for different effects, such as dark mode, boid trail modes etc
- **VGA Controller**: Custom VGA controller that reads from our implementation of RAM and displays the boids on the screen

![Image](images/simple_schem.png)

### BPU Interface
As our inital plan was for parallel computation, we built a large parallel array of structures we coined "BPUs" - "Boid Processing Units". There will be a single BPU per boid, and therefore there will be an additional instance of hardware needed anytime we want to add a new boid to the simulation.

A BPU module has two inputs and a single output. It takes in the computed x and y positions of the boid from the CPU using a tristate implementation (latched to register 27 which provides information about which boid to write to). The output is the address on the VGA display at which the boid should be drawn (which is calculated within the BPU).

Inside the BPU, we have registers that store the x_loc and y_loc of the boid. Then there is a computation block that efficiently computes the address of the boid on the VGA display. This is where the parallel computation would have taken place, but due to the constraints of the final project, we had to move this computation to the CPU - the general structure of this computation is explained in the "Parallel BPU computation" section.

![Image](images/BPU.png)

### Canvas RAM

One of the bottlenecks we ran into was the inability to refresh our screens fast enough for our computation. This is especially visible when we have a large number of boids on the screen. Traditionally, the VGA display would work by going sequentially through each pixel and updating it. The update would consist of checking whether any of the N boids are in that pixel and then updating the pixel accordingly (as we not only have to check for the presence of a boid, but also the lack of a boid to remove the boid from the screen).

To solve this issue, we created a custom RAM module that has two instances of RAMs. We named these RAMs "canvas" and "async clear" for reasons that will hopefully become clear. The general structure of this module can be seen below.

![Image](images/resettable_ram.png)

The "canvas" RAM is essentially an empty, cleared RAM. This allows us to only write to the locations of the boids, and not have to worry about clearing the screen every frame, allowing for a much faster refresh rate. 

The async clear RAM is used to clear the screen asynchronously. We do this by asynchronously writing "0s" to this RAM at the same time as the "canvas" RAM is interacting with the VGA screen and BPUs.

This gives us the ability to switch which is the "active" RAM (ie the RAM that is being read from by the VGA controller) every time the BPUs are done updating. 

Therefore, we can forgo the need to check every pixel everytime we need to update a frame, and can essentially start with a blank canvas on every new frame. This means for every frame, if we have N boids, we only have to do N computations & writes to the "canvas" RAM, rather than num_pixels * N computations & writes - a significant speedup.

We also have some switches that alter the behaviour of our RAM, leading to some interesting effects, summarised below:

- **Switch 0**: Dark mode - screen is inverted, leading to a dark background with light boids, this makes the boids more visible
- **Switch 1**: Boid trail mode - boids leave a trail behind them, this is done by disabling the async resettable RAM and only writing to the canvas RAM
- **Switch 2**: Freeze mode - boids are frozen in place, this is done by disabling the write enable signal to the RAMs
- **Switch 3**: Faster refresh rate - reduces the time between frames, leading to a faster refresh rate, however this can lead to flickering


### VGA

The VGA display works asynchronously to all the other components of the system. The VGA controller takes in a reference to the current RAM being displays and simply goes pixel by pixel to update the VGA display. The VGA controller also runs a check to see if the current pixel should have the user controlled repulsor boid drawn on it, and if so, it overwrites the RAM's data and displays the repulsor boid.

### Timing of components

Most of our components were run at a clock rate of 50MHz, with the exception of our VGA controller which was run at 25MHz. The way our components were made in a way that there were distinct zones, and we could have run the system in a way that each zone was run at a different clock rate. The main distinct zones were the CPU-RAM-Regfiles, the BPUs and the custom RAM-VGA controller. THe interfaces between these zones could be at the same clock rate, but the internal workings of each zone could be at a different frequencies (this is something that could be optimized in the future).

### Iverilog
Our final testing location was the Iverilog simulator. This allowed us to test our MIPS processor and the BPU interface. We were able to run the MIPS processor and the BPU interface in the Iverilog simulator and verify that the processor was running as expected. This was a crucial step in the development of our project as it allowed us to verify that the processor was running as expected before moving to the FPGA.

Iverilog was primarily useful for the supported print statements and avoiding the ~5 minute compile time of the FPGA. This allowed us to quickly iterate on the MIPS processor and the BPU interface.

## CPU
The CPU was a 5-stage pipelined processor that was built from scratch. It has optimizations such as bypassing, a wallace tree 1-cycle multiplier and appropriately handles hazards and flushing. Its instruction set is specified below. All of this was built from scratch using only structural verilog (no use of genvars or high level verilog).

The overall design of the processor can be seen below.

![Image](images/CPU_full.png)
![Image](images/instruction_set.png)

![Image](images/CPU_left.png)
![Image](images/CPU_right.png)


## Future Work

### Compiler Optimization
| Optimization Level | Cycle's til 1st Write| Speedup |
|---| --- | --- |
| O0 | 52,165 | 1 |
| O1 | 9,103 | 5x |
| O2 | INFINITE LOOP | n/a |
| O3 | ~6500 | 9x |

Near the end of the project, we started exploring additional means to maek the project faster. We found that the MIPS compiler had optimization flags that could be used to speed up the code. MIPS O1 had a massive speedup over O0 by using all registers and removing redundant instructions. I believe we had an interpreter issue with O2, but O3 was able to speed up the code even further. O3 does some crazy inling and redundancy removal that made the code run 9x faster than O0. This was a massive speedup and would have been a great addition to the project.

The reason this wasn't an easy addition was because the optimization made it harder to find the values needed to interface with the BPU and the ≥O1 used all registers making it difficult to save values.

### Parallel BPU Implementation
The way in which we would have implemented the parallel computation of the BPUs is laid out here, and a diaram is shown below to aid the explanantion.

The BPU would have been a mealy finite state machine (FSM) that would have taken in the x_pos and y_pos of the boid from the CPU, and then computed the new x_pos and y_pos of the boid. The BPU would have been responsible for the computation of the boid, and would have been able to run in parallel with the other BPUs.

The state space of the FSM would have included all possible x and y locations of a boid (in this case any pixel on the screen), and the next state logic can be interpreted as the computation of the new x and y positions of the boid. This computation would include the steps outlined in our more software based implementation done on a hardware level.

![Image](images/BPU_FSM.png)

## Bloopers (Challenges)
- Wasted 3/4 hours not realizing the provided processor testbench only supported 512 lines of execution
- Waster 5/6 hours because we didn't read li documentation and didn't realize that the li instruction only supported 16 bit immediate values (this created a disparity between simulated MIPS and hardware MIPS)
- Our MIPS assembler doesn't support space allocation with '.space' so we had to manually allocate space in more_compiles.py
- MIPS default \$sp is \$30. We had some wacky issues with overflows because exceptions would move the stack reference (not good)
- Turns out trying to find one pixel on a VGA screen is very hard, spent a lot of hours thinking our system was broken when we simply could not see
- The VGA screens work very strangely, and actually shut off if you provide them a value all the time. You actually need to have an "active" signal that tells you when to update the screen (ie when there is a new frame), if you provide any information whatsoever at any other time the screen will fail
- Really quite cool way to take the average of two vectors represented in binary is by using the fact you can take the average of two numbers as follows: ` (x&y) + ((x^y)>>1)`, and then boids can be all averaged using a "bracket" style process
- CPU design took a lot of time, a lot of debugging, and a significant lack of sleep

Thanks for reading!

## Media

Some images of our project

![Image](images/media1.png)
![Image](images/media2.png)
![Image](images/media3.png)
![Image](images/media4.png)
