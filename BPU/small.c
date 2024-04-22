#define PIXEL_SIZE_SHIFT 22
#define NUM_BOIDS 4
// gcc -o boidin BPU.c -I/opt/homebrew/Cellar/sdl2/2.30.2/include -L/opt/homebrew/Cellar/sdl2/2.30.2/lib -lSDL2
// ./boidin

int xPos[NUM_BOIDS];
int yPos[NUM_BOIDS];

void initBoids() {
    for (int i = 0; i < NUM_BOIDS; i+=1) {
        xPos[i] = 0;
        yPos[i] = 0;
    }
}

 void updateBoids() {
    for (int boid_index = 0; boid_index < NUM_BOIDS; boid_index+=1) {
        xPos[boid_index] += 1;
        yPos[boid_index] += 1;
        int res1 = xPos[boid_index] >> PIXEL_SIZE_SHIFT;
        int res2 = yPos[boid_index] >> PIXEL_SIZE_SHIFT;
        int res3 = boid_index;
    }
 }

 int main() {
    initBoids();
    int running = 1;
    while (running) {
        updateBoids();
    }
    return 0;
 }

// right before $L40
//        lw      $26,40($30)   # BPU interface
//        lw      $28,44($30)   # BPU interface
//        lw      $27,48($30)   # BPU interface
//        # print
//        add $0, $0,$0
//        add $0, $0,$0
//        addi    $27, $0,-1