#define NUM_BOIDS 4
#define PIXEL_SIZE_SHIFT 2

 void updateBoids(int boid_num) {
    int num_neighbors = 0;
    int res1 = boid_num << PIXEL_SIZE_SHIFT;
    int res2 = boid_num << PIXEL_SIZE_SHIFT;
    int res3 = boid_num;
 }

 void main() {
    int running = 1;
    while (running) {
        for (int boid_index = 0; boid_index < NUM_BOIDS; boid_index++) {
            updateBoids(boid_index);
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