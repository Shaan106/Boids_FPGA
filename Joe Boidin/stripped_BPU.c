#define PIXEL_WIDTH 512
#define INT_WIDTH (1 << 30)
#define PIXEL_SIZE (INT_WIDTH / PIXEL_WIDTH)
#define PIXEL_SIZE_SHIFT (int)(log2(PIXEL_SIZE))
#define MARGIN (100 << PIXEL_SIZE_SHIFT)
#define WIDTH PIXEL_WIDTH
#define HEIGHT PIXEL_WIDTH

#define NUM_BOIDS 512
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


Boid boids[NUM_BOIDS];

int abs(int x) {
    return x < 0 ? -x : x;
}

int log_2(int x) {
    int result = 0;
    while (x >>= 1) {
        result++;
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
    for (int i = 0; i < NUM_BOIDS; i++) {
        xPos[i] = i % SPAWN_WIDTH + MARGIN;
        yPos[i] = 1 % SPAWN_HEIGHT + MARGIN;
        xVel[i] = INITIAL_SPEED;
        yVel[i] = INITIAL_SPEED;
        // xPos[i] = rand() % SPAWN_WIDTH + MARGIN;
        // yPos[i] = rand() % SPAWN_HEIGHT + MARGIN;
        // xVel[i] = rand() % SPAWN_VEL - INITIAL_SPEED;
        // yVel[i] = rand() % SPAWN_VEL - INITIAL_SPEED;
    }
}

void keepWithinBounds(int boid_index) {
    if (xPos[boid_index] < LEFT_BOUND) {
        active_x += EDGE_PUSH;
    } else if (xPos[boid_index] > RIGHT_BOUND) {
        active_x += -EDGE_PUSH;
    }
    if (yPos[boid_index] < TOP_BOUND) {
        active_y += EDGE_PUSH;
    } else if (yPos[boid_index] > BOTTOM_BOUND) {
        active_y += -EDGE_PUSH;
    }
}

int distance(int b1, int b2) {
    return abs(xPos[b1] - xPos[b2]) + abs(yPos[b1] - yPos[b2]);
}

void fly_towards_center(int boid_index, int neighbors[]) {
    int centerX = 0, centerY = 0;
    for (int i = 0; i < NUM_NEIGHBORS; i++) {
        int neighbor = neighbors[i];
        centerX += xPos[neighbor] >> NEIGBHBOR_SHIFT;
        centerY += yPos[neighbor] >> NEIGBHBOR_SHIFT;
    }
    active_x += (centerX - xPos[boid_index]) >> COHESION_FACTOR;
    active_y += (centerY - yPos[boid_index]) >> COHESION_FACTOR;
}

void avoid_others(int boid_index, int neighbors[]) {
    int repelX = 0, repelY = 0;
    for (int i = 0; i < NUM_NEIGHBORS; i++) {
        int neighbor = neighbors[i];
        if (distance(boid_index, neighbor) < PERCEPTION_RADIUS) {
            printf("Force: %d\n", (xPos[boid_index] - xPos[neighbor]));
            repelX += (xPos[boid_index] - xPos[neighbor]);
            repelY += (yPos[boid_index] - yPos[neighbor]);
        }
    }
    active_x += repelX >> SEPARATION_FACTOR;
    active_y += repelY >> SEPARATION_FACTOR;
}

void match_velocity(int boid_index, int neighbors[]) {
    int avgDX = 0, avgDY = 0;
    for (int i = 0; i < NUM_NEIGHBORS; i++) {
        int neighbor = neighbors[i];
        avgDX += xVel[neighbor] >> NEIGBHBOR_SHIFT;
        avgDY += yVel[neighbor] >> NEIGBHBOR_SHIFT;
    }
    active_x += (avgDX) >> ALIGNMENT_FACTOR;
    active_y += (avgDY) >> ALIGNMENT_FACTOR;
}

void limit_speed() {
    int speed = abs(active_x) + abs(active_y);
    int mag = (int)log2(speed);
    int shift = mag - MAX_SPEED;
    shift = (shift > 0) ? shift : 0;

    active_x >>= shift;
    active_y >>= shift;
}

void updateBoids() {
    for (int boid_index = 0; boid_index < NUM_BOIDS; boid_index++) {
        int neighbors[NUM_NEIGHBORS] = {-1};
        // Find nearest neighbors
        for (int j = 0; j < NUM_BOIDS; j++) {
            int new_boid = j;
            for (int k = 0; k < NUM_NEIGHBORS; k++) {
                if (neighbors[k] == -1) {
                    neighbors[k] = new_boid;
                    break;
                }
                if (distance(boid_index, new_boid) < distance(boid_index, neighbors[k])) {
                    int temp = neighbors[k];
                    neighbors[k] = new_boid;
                    break;
                    new_boid = temp;
                }
            }

        }
        active_x = xVel[boid_index];
        active_y = yVel[boid_index];
        fly_towards_center(boid_index, neighbors);
        avoid_others(boid_index, neighbors);
        match_velocity(boid_index, neighbors);
        limit_speed();
        keepWithinBounds(boid_index);
        xVel[boid_index] = active_x;
        yVel[boid_index] = active_y;

        xPos[boid_index] += xVel[boid_index];
        yPos[boid_index] += yVel[boid_index];
    }
}

int main(int argc, char *argv[]) {
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window *window = SDL_CreateWindow("Boids Simulation", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WIDTH, HEIGHT, 0);
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 0);

    initBoids();

    SDL_Event event;
    int running = 1;
    while (running) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = 0;
            }
        }

        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        SDL_RenderClear(renderer);

        updateBoids();

        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        for (int boid = 0; boid < NUM_BOIDS; boid++) {
            // print boid x and y
            // printf("Boid %d: x = %d (%d), y = %d (%d)\n", i, boid->x / PIXEL_SIZE, boid->x, boid->y / PIXEL_SIZE, boid->y);
            int line_length = 4;
            SDL_RenderDrawLine(renderer, xPos[boid] / PIXEL_SIZE, yPos[boid] / PIXEL_SIZE, (xPos[boid] / PIXEL_SIZE + (int)(line_length * cos(atan2(yVel[boid], xVel[boid])))), (yPos[boid] / PIXEL_SIZE + (int)(line_length * sin(atan2(yVel[boid], xVel[boid])))));
        }

        SDL_RenderPresent(renderer);
        SDL_Delay(10); // Approximately 30 FPS
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}