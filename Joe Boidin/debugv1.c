#define NUM_BOIDS 4


 int main() {
    // int running = 1;
    // while (running) {
    //     updateBoids();
    // }
    // return 0;

    for (int boid_index = 0; boid_index < NUM_BOIDS; boid_index++) {
        int b_x = boid_index << 5;
        int b_y = boid_index << 5;
        int b_index = boid_index;
    }
 }

// disable read at start
// make main jump back to itself just in case
// right before $L40
//        lw      $26,52($23)   # BPU interface
//        lw      $28,56($23)   # BPU interface
//        lw      $27,60($23)   # BPU interface
//        # print
//        add $0, $0,$0
//        add $0, $0,$0
//        addi    $27, $0,-1