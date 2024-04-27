#define PIXEL_WIDTH 512
#define PIXEL_SIZE 2097152
#define PIXEL_SIZE_SHIFT 21
#define MARGIN 67108864
#define WIDTH 512
#define HEIGHT 480
#define NUM_BOIDS 64
#define NUM_NEIGHBORS 4
#define NEIGBHBOR_SHIFT 2
#define INITIAL_SPEED 20971520
#define COHESION_FACTOR 6
#define SEPARATION_FACTOR 4
#define ALIGNMENT_FACTOR 2
#define SCARY_FACTOR 2
#define MAX_SPEED 23
#define PERCEPTION_RADIUS 20971520
#define EDGE_PUSH 2097152
#define LEFT_BOUND 67108864
#define RIGHT_BOUND 1006632960
#define TOP_BOUND 67108864
#define BOTTOM_BOUND 939524096
#define SPAWN_VEL 41943041
// gcc -o boidin BPU.c -I/opt/homebrew/Cellar/sdl2/2.30.2/include -L/opt/homebrew/Cellar/sdl2/2.30.2/lib -lSDL2
// ./boidin



int abs(int x) {
    if (x < 0) {
        return 0 - x;
    }
    return x;
}

int log_2(int x) {
    int result = 0;
    while (x >>= 1) {
        result+=1;
    }
    return result;
}

int xPos[NUM_BOIDS];
int yPos[NUM_BOIDS];
int xVel[NUM_BOIDS];
int yVel[NUM_BOIDS];
int active_x = 0;
int active_y = 0;

void initBoids() {
    for (int i = 0; i < NUM_BOIDS; i+=1) {
        xPos[i] = MARGIN + i;
        yPos[i] = MARGIN + (i << 3);
        xVel[i] = INITIAL_SPEED;
        yVel[i] = INITIAL_SPEED;
    }
}

void keepWithinBounds(int boid_index) {
    if (xPos[boid_index] < LEFT_BOUND) {
        active_x += EDGE_PUSH;
    } else if (xPos[boid_index] > RIGHT_BOUND) {
        active_x -= EDGE_PUSH;
    }
    if (yPos[boid_index] < TOP_BOUND) {
        active_y += EDGE_PUSH;
    } else if (yPos[boid_index] > BOTTOM_BOUND) {
        active_y -= EDGE_PUSH;
    }
}

 int distance(int b1, int b2) {
    return abs(xPos[b1] - xPos[b2]) + abs(yPos[b1] - yPos[b2]);
 }

 void fly_towards_center(int boid_index, int* neighbors) {
    int centerX = 0;
    int centerY = 0;
    for (int i = 0; i < NUM_NEIGHBORS; i+=1) {
        int neighbor = neighbors[i];
        centerX += xPos[neighbor] >> NEIGBHBOR_SHIFT;
        centerY += yPos[neighbor] >> NEIGBHBOR_SHIFT;
    }
    active_x += (centerX - xPos[boid_index]) >> COHESION_FACTOR;
    active_y += (centerY - yPos[boid_index]) >> COHESION_FACTOR;
 }

 void avoid_others(int boid_index, int* neighbors) {
    int repelX = 0;
    int repelY = 0;
    for (int i = 0; i < NUM_NEIGHBORS; i+=1) {
        int neighbor = neighbors[i];
        if (distance(boid_index, neighbor) < PERCEPTION_RADIUS) {
            repelX += (xPos[boid_index] - xPos[neighbor]);
            repelY += (yPos[boid_index] - yPos[neighbor]);
        }
    }
    active_x += repelX >> SEPARATION_FACTOR;
    active_y += repelY >> SEPARATION_FACTOR;
 }

 void match_velocity(int boid_index, int* neighbors) {
    int avgDX = 0;
    int avgDY = 0;
    for (int i = 0; i < NUM_NEIGHBORS; i+=1) {
        int neighbor = neighbors[i];
        avgDX += xVel[neighbor] >> NEIGBHBOR_SHIFT;
        avgDY += yVel[neighbor] >> NEIGBHBOR_SHIFT;
    }
    active_x += (avgDX) >> ALIGNMENT_FACTOR;
    active_y += (avgDY) >> ALIGNMENT_FACTOR;
 }

int mouse_x = 0;
int mouse_y = 0;
void scary(int boid_index) {
    int move_x = 0;
    int move_y = 0;
    // load mouse position
    mouse_x = 1;
    mouse_y = 1;

    int m_x = mouse_x << PIXEL_SIZE_SHIFT;
    int m_y = mouse_y << PIXEL_SIZE_SHIFT;

    int dis_x = abs(xPos[boid_index] - m_x);
    int dis_y = abs(yPos[boid_index] - m_y);
    int d = dis_x + dis_y;

    if (d < (PERCEPTION_RADIUS << 3)) {
        move_x = dis_x;
        move_y = dis_y;
        if (xPos[boid_index] > m_x) {
            move_x = -move_x;
        }
        if (yPos[boid_index] > m_y) {
            move_y = -move_y;
        }
    }
    active_x -= move_x << SCARY_FACTOR;  // make shifts
    active_y -= move_y << SCARY_FACTOR;
}

 void limit_speed() {
    int speed = abs(active_x) + abs(active_y);
    int mag = log_2(speed);
    int shift = mag - MAX_SPEED;
    if (shift < 0) {
        return;
    }
    for (int i = 0; i < shift; i+=1) {
        active_x >>= 1;
        active_y >>= 1;
    }
 }

 void updateBoids() {
    int num_neighbors = 0;
    for (int boid_index = 0; boid_index < NUM_BOIDS; boid_index+=1) {
        int neighbors[NUM_NEIGHBORS];
        for (int i = 0; i < NUM_NEIGHBORS; i+=1) {
            neighbors[i] = -1;
        }
        // Find nearest neighbors
        for (int j = 0; j < NUM_BOIDS; j+=1) {
            int new_boid = j;
            for (int k = 0; k < NUM_NEIGHBORS; k+=1) {
                if (neighbors[k] == -1) {
                    neighbors[k] = new_boid;
                    num_neighbors += 1;
                    break;
                }
                if (distance(boid_index, new_boid) < distance(boid_index, neighbors[k])) {
                    int temp = neighbors[k];
                    neighbors[k] = new_boid;
                    // break;
                    new_boid = temp;
                }
            }

        }
        active_x = xVel[boid_index];
        active_y = yVel[boid_index];
        fly_towards_center(boid_index, neighbors);
        avoid_others(boid_index, neighbors);
        match_velocity(boid_index, neighbors);
        scary(boid_index);
        limit_speed();
        keepWithinBounds(boid_index);
        xVel[boid_index] = active_x;
        yVel[boid_index] = active_y;

        xPos[boid_index] += xVel[boid_index];
        yPos[boid_index] += yVel[boid_index];
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

// talk to BPU drawer - right before $L45
//        lw      $28, 48($22)   # BPU interface
//        lw      $26, 52($22)   # BPU interface
//        lw      $27, 56($22)   # BPU interface
//        # print
//        add $0, $0, $0
//        add $0, $0, $0
//        addi    $27, $0, -1

// swap screen buffer - after $L53
//        addi    $25, $0, 1
//        addi    $25, $0, 0

// scary - at start of scary: (3rd and 4th sw)
//        sw      $23, 4084($2)
//        sw      $24, 4080($2)