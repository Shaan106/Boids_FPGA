# Final Project - Boid Hardware
> Tate Staples and Shaan Yadav


## Design and Specifications
The goal of this project was to build an efficient low level implementation of the [Boid Algorithm](https://en.wikipedia.org/wiki/Boids). The Boid Algorithm is a simple algorithm that simulates the flocking behavior of birds. The algorithm is based on three simple rules:
1. **Separation**: Boids will avoid collisions with other boids.
2. **Alignment**: Boids will try to align their velocities with other boids.
3. **Cohesion**: Boids will try to move towards the center of mass of other boids.

The algorithm is simple to implement and can be run in parallel, making it a good candidate for hardware acceleration. We then created a asynchronous double buffer graphics processor to display the boids on a VGA monitor.
## Input & Output
The input to the project was a 4 button control systems (up, down, left, right) that would allow the user to move a cursor around the screen. The cursor acted as a 'scary' object that the boids would avoid. 

Additionally, you could use the switches on the VGA to alter the display behvaior of the boids. The switches would control the following:
- Switch 0: 
- Switch 1: 
- Switch 2: 
- Switch 3: 
- Switch 4: 
## Challenges
### Processor Challenges

### Software Challenges

### Hardware Challenges
We had no circuits off of our FPGA besides directly connecting the VGA as described in lab.
## Testing
Describe how you tested your project
## Code and Compilation
Describe your assembly programs or code
## Future Work
What improvements you would make / new features you would add if you had more time
## Media
Pictures of your project
![Image](images/schematic.png)
