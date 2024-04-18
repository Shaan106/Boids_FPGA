#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <SDL2/SDL.h>

#define PIXEL_WIDTH 512
#define INT_WIDTH (1 << 30)
#define PIXEL_SIZE (INT_WIDTH / PIXEL_WIDTH)
#define PIXEL_SIZE_SHIFT (int)(log2(PIXEL_SIZE))
#define MARGIN (100 << PIXEL_SIZE_SHIFT)
#define WIDTH PIXEL_WIDTH
#define HEIGHT PIXEL_WIDTH

#define NUM_BOIDS 256
#define NUM_NEIGHBORS 8
#define INITIAL_SPEED 10 * PIXEL_SIZE
#define FORCE_AMPLIFIER 1
#define COHESION_FACTOR (7+FORCE_AMPLIFIER)
#define SEPARATION_FACTOR (4+FORCE_AMPLIFIER)
#define ALIGNMENT_FACTOR (2+FORCE_AMPLIFIER)
#define MAX_SPEED 23  // 2**26
#define PERCEPTION_RADIUS (20 << PIXEL_SIZE_SHIFT)
#define EDGE_PUSH (1 << (PIXEL_SIZE_SHIFT))
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
        boids[i].x = rand() % (INT_WIDTH - 2 * MARGIN) + MARGIN;
        boids[i].y = rand() % (INT_WIDTH - 2 * MARGIN) + MARGIN;
        boids[i].dx = rand() % (2 * INITIAL_SPEED + 1) - INITIAL_SPEED;
        boids[i].dy = rand() % (2 * INITIAL_SPEED + 1) - INITIAL_SPEED;
    }
}

Velocity keepWithinBounds(Boid *boid) {
    Velocity v = {0, 0};
    if (boid->x < MARGIN) {
        v.dx = EDGE_PUSH;
    } else if (boid->x > (WIDTH << PIXEL_SIZE_SHIFT) - MARGIN) {
        v.dx = -EDGE_PUSH;
    }
    if (boid->y < MARGIN) {
        v.dy = EDGE_PUSH;
    } else if (boid->y > (HEIGHT << PIXEL_SIZE_SHIFT) - MARGIN) {
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
        centerX += neighbors[i]->x / NUM_NEIGHBORS;
        centerY += neighbors[i]->y / NUM_NEIGHBORS;
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
        avgDX += neighbors[i]->dx / NUM_NEIGHBORS;
        avgDY += neighbors[i]->dy / NUM_NEIGHBORS;
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
        Boid *neighbors[NUM_NEIGHBORS] = {NULL};


        // Find nearest neighbors
        for (int j = 0; j < NUM_BOIDS; j++) {
            for (int k = 0; k < NUM_NEIGHBORS; k++) {
                if (neighbors[k] == NULL) {
                    neighbors[k] = &boids[j];
                    break;
                }
                if (distance(boid, &boids[j]) < distance(boid, neighbors[k])) {
                    neighbors[k] = &boids[j];
                    break;
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

// Boid[] nearest_neighbors(Boid *boid, int count) {
//     if (count == 2) {

//     }
//     else {
//         Boid neighbors[count] = {0};
//         neighbors[0:count/2] = nearest_neighbors(boid, count/2);
//         neighbors[count/2:count] = nearest_neighbors(boid + count/2, count/2);
//         return neighbors;
//     }
//     Boid neighbors[NUM_NEIGHBORS] = {0};
//     for (int i = 0; i < NUM_BOIDS; i++) {
//         if (boid != &boids[i]) {
//             int distance = abs(boid->x - boids[i].x) + abs(boid->y - boids[i].y);
//             if (distance < PERCEPTION_RADIUS) {
//                 // Add to neighbors
//             }
//         }
//     }
//     return neighbors;
// }

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
        for (int i = 0; i < NUM_BOIDS; i++) {
            Boid *boid = &boids[i];
            // print boid x and y
            // printf("Boid %d: x = %d (%d), y = %d (%d)\n", i, boid->x / PIXEL_SIZE, boid->x, boid->y / PIXEL_SIZE, boid->y);
            int line_length = 4;
            SDL_RenderDrawLine(renderer, boid->x / PIXEL_SIZE, boid->y / PIXEL_SIZE, (boid->x / PIXEL_SIZE + (int)(line_length * cos(atan2(boid->dy, boid->dx)))), (boid->y / PIXEL_SIZE + (int)(line_length * sin(atan2(boid->dy, boid->dx)))));
        }

        SDL_RenderPresent(renderer);
        SDL_Delay(10); // Approximately 30 FPS
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}