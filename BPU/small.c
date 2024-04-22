#define PIXEL_WIDTH 256
#define INT_WIDTH 1073741824
#define PIXEL_SIZE 4194304
#define PIXEL_SIZE_SHIFT 22
#define MARGIN 268435456
#define WIDTH 256
#define HEIGHT 256
#define NUM_BOIDS 4
#define NUM_NEIGHBORS 4
#define NEIGBHBOR_SHIFT 2
#define INITIAL_SPEED 41943040
#define COHESION_FACTOR 6
#define SEPARATION_FACTOR 4
#define ALIGNMENT_FACTOR 2
#define MAX_SPEED 23
#define PERCEPTION_RADIUS 41943040
#define EDGE_PUSH 4194304
#define LEFT_BOUND 268435456
#define RIGHT_BOUND 805306368
#define TOP_BOUND 268435456
#define BOTTOM_BOUND 805306368
#define SPAWN_WIDTH 536870912
#define SPAWN_HEIGHT 536870912
#define SPAWN_VEL 83886081
// gcc -o boidin BPU.c -I/opt/homebrew/Cellar/sdl2/2.30.2/include -L/opt/homebrew/Cellar/sdl2/2.30.2/lib -lSDL2
// ./boidin

int xPos[NUM_BOIDS];
int yPos[NUM_BOIDS];
int xVel[NUM_BOIDS];
int yVel[NUM_BOIDS];
int active_x = 0;
int active_y = 0;

void initBoids() {
    for (int i = 0; i < NUM_BOIDS; i+=1) {
        xPos[i] = 0;
        yPos[i] = 0;
        xVel[i] = INITIAL_SPEED;
        yVel[i] = INITIAL_SPEED;
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