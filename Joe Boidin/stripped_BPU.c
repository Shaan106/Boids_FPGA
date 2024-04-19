#define PIXEL_WIDTH 512
#define INT_WIDTH (1 << 30)
#define PIXEL_SIZE (INT_WIDTH / PIXEL_WIDTH)
#define PIXEL_SIZE_SHIFT (int)(log2(PIXEL_SIZE))
#define MARGIN (100 << PIXEL_SIZE_SHIFT)
#define WIDTH PIXEL_WIDTH
#define HEIGHT PIXEL_WIDTH

#define NUM_BOIDS 1024
#define NUM_NEIGHBORS 4
#define NEIGBHBOR_SHIFT (int)log2(NUM_NEIGHBORS)
#define INITIAL_SPEED 10 * PIXEL_SIZE
#define FORCE_AMPLIFIER 0
#define COHESION_FACTOR (6+FORCE_AMPLIFIER)
#define SEPARATION_FACTOR (4+FORCE_AMPLIFIER)
#define ALIGNMENT_FACTOR (2+FORCE_AMPLIFIER)
#define MAX_SPEED 23  // 2**26
#define PERCEPTION_RADIUS (10 << PIXEL_SIZE_SHIFT)
#define EDGE_PUSH (1 << (PIXEL_SIZE_SHIFT))
#define LEFT_BOUND MARGIN
#define RIGHT_BOUND (WIDTH << PIXEL_SIZE_SHIFT) - MARGIN
#define TOP_BOUND MARGIN
#define BOTTOM_BOUND (HEIGHT << PIXEL_SIZE_SHIFT) - MARGIN
#define SPAWN_WIDTH (INT_WIDTH - 2 * MARGIN)
#define SPAWN_HEIGHT (INT_WIDTH - 2 * MARGIN)
#define SPAWN_VEL (2 * INITIAL_SPEED + 1)
// gcc -o boidin BPU.c -I/opt/homebrew/Cellar/sdl2/2.30.2/include -L/opt/homebrew/Cellar/sdl2/2.30.2/lib -lSDL2
// ./boidin

typedef struct {
    int x;
    int y;
    int dx;
    int dy;
} Boid;

typedef struct {
    int dx;
    int dy;
} Velocity;



Boid boids[NUM_BOIDS];

void initBoids() {
    for (int i = 0; i < NUM_BOIDS; i++) {
        boids[i].x = rand() % SPAWN_WIDTH + MARGIN;
        boids[i].y = rand() % SPAWN_HEIGHT + MARGIN;
        boids[i].dx = rand() % SPAWN_VEL - INITIAL_SPEED;
        boids[i].dy = rand() % SPAWN_VEL - INITIAL_SPEED;
    }
}

Velocity keepWithinBounds(Boid *boid) {
    Velocity v = {0, 0};
    if (boid->x < LEFT_BOUND) {
        v.dx = EDGE_PUSH;
    } else if (boid->x > RIGHT_BOUND) {
        v.dx = -EDGE_PUSH;
    }
    if (boid->y < TOP_BOUND) {
        v.dy = EDGE_PUSH;
    } else if (boid->y > BOTTOM_BOUND) {
        v.dy = -EDGE_PUSH;
    }
    return v;
}

int distance(Boid *b1, Boid *b2) {
    return abs(b1->x - b2->x) + abs(b1->y - b2->y);
}

Velocity fly_towards_center(Boid *boid, Boid *neighbors[]) {
    int centerX = 0, centerY = 0;
    for (int i = 0; i < NUM_NEIGHBORS; i++) {
        centerX += neighbors[i]->x >> NEIGBHBOR_SHIFT;
        centerY += neighbors[i]->y >> NEIGBHBOR_SHIFT;
    }
    Velocity a;
    a.dx = (centerX - boid->x) >> COHESION_FACTOR;
    a.dy = (centerY - boid->y) >> COHESION_FACTOR;
    
    return a;
}

Velocity avoid_others(Boid *boid, Boid *neighbors[]) {
    int repelX = 0, repelY = 0;
    for (int i = 0; i < NUM_NEIGHBORS; i++) {
        if (distance(boid, neighbors[i]) < PERCEPTION_RADIUS) {
            repelX += (boid->x - neighbors[i]->x);
            repelY += (boid->y - neighbors[i]->y);
        }
    }
    Velocity a;
    a.dx = repelX >> SEPARATION_FACTOR;
    a.dy = repelY >> SEPARATION_FACTOR;
    return a;
}

Velocity match_velocity(Boid *boid, Boid *neighbors[]) {
    int avgDX = 0, avgDY = 0;
    for (int i = 0; i < NUM_NEIGHBORS; i++) {
        avgDX += neighbors[i]->dx >> NEIGBHBOR_SHIFT;
        avgDY += neighbors[i]->dy >> NEIGBHBOR_SHIFT;
    }
    Velocity a;
    a.dx = (avgDX) >> ALIGNMENT_FACTOR;
    a.dy = (avgDY) >> ALIGNMENT_FACTOR;
    return a;
}

Velocity limit_speed(Velocity unlimited_a) {
    int speed = abs(unlimited_a.dx) + abs(unlimited_a.dy);
    int mag = (int)log2(speed);
    int shift = mag - MAX_SPEED;
    shift = (shift > 0) ? shift : 0;

    Velocity a;
    a.dx = unlimited_a.dx >> shift;
    a.dy = unlimited_a.dy >> shift;
    return a;
}

void updateBoids() {
    for (int i = 0; i < NUM_BOIDS; i++) {
        Boid *boid = &boids[i];
        Boid *neighbors[NUM_NEIGHBORS] = {0};


        // Find nearest neighbors
        for (int j = 0; j < NUM_BOIDS; j++) {
            Boid* new_boid = &boids[j];
            for (int k = 0; k < NUM_NEIGHBORS; k++) {
                if (neighbors[k] == 0) {
                    neighbors[k] = new_boid;
                    break;
                }
                if (distance(boid, new_boid) < distance(boid, neighbors[k])) {
                    Boid* temp = neighbors[k];
                    neighbors[k] = new_boid;
                    // break;
                    new_boid = temp;
                }
            }

        }
        Velocity speed = {boid->dx, boid->dy};
        Velocity cohesion = fly_towards_center(boid, neighbors);
        Velocity separaction = avoid_others(boid, neighbors);
        Velocity alignment = match_velocity(boid, neighbors);
        speed.dx += cohesion.dx + separaction.dx + alignment.dx;
        speed.dy += cohesion.dy + separaction.dy + alignment.dy;
        speed = limit_speed(speed);
        Velocity bounds = keepWithinBounds(boid);
        boid->dx = speed.dx + bounds.dx;
        boid->dy = speed.dy + bounds.dy;

        boid->x += boid->dx;
        boid->y += boid->dy;
    }
}

int main(int argc, char *argv[]) {
    int running = 1;
    while (running) {
        updateBoids();

        for (int i = 0; i < NUM_BOIDS; i++) {
            Boid *boid = &boids[i];
        }
    }
    return 0;
}