#define NUM_BOIDS 4
#define PIXEL_SIZE_SHIFT 2

int xPos[NUM_BOIDS];
int yPos[NUM_BOIDS];
int xVel[NUM_BOIDS];
int yVel[NUM_BOIDS];
int active_x = 0;
int active_y = 0;

void updateBoids() {
//  int num_neighbors = 0;

    for (int boid_index = 0; boid_index < NUM_BOIDS; boid_index++) {
        xPos[boid_index] = boid_index << PIXEL_SIZE_SHIFT;
        yPos[boid_index] = boid_index << PIXEL_SIZE_SHIFT;
    }
}

void main() {
    int running = 1;
    while (running) {
        updateBoids();

        for (int boid_index = 0; boid_index < NUM_BOIDS; boid_index++) {
            int res1 = xPos[boid_index];
            int res2 = yPos[boid_index];
            int res3 = boid_index;
        }

    }
}

// disable read at start
// make main jump back to itself just in case
// right before $L40
//        lw      $26, 52($23)   # BPU interface
//        lw      $28, 56($23)   # BPU interface
//        lw      $27, 60($23)   # BPU interface
//        # print
//        add $0, $0, $0
//        add $0, $0, $0
//        addi    $27, $0, -1
