import pygame
import random
import math

# Initialization
pygame.init()
width, height = 800, 600  # Window size
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption('Boids Simulation')
clock = pygame.time.Clock()
running = True

# Boids parameters
num_boids = 100
visual_range = 75

# Boids list
boids = []

def init_boids():
    for _ in range(num_boids):
        boid = {
            'x': random.random() * width,
            'y': random.random() * height,
            'dx': random.random() * 10 - 5,
            'dy': random.random() * 10 - 5,
        }
        boids.append(boid)

def distance(boid1, boid2):
    return math.sqrt((boid1['x'] - boid2['x']) ** 2 + (boid1['y'] - boid2['y']) ** 2)

def n_closest_boids(boid, n):
    sorted_boids = sorted(boids, key=lambda other_boid: distance(boid, other_boid))
    return sorted_boids[1:n+1]

def keep_within_bounds(boid):
    margin = 200
    turn_factor = 1
    if boid['x'] < margin:
        boid['dx'] += turn_factor
    if boid['x'] > width - margin:
        boid['dx'] -= turn_factor
    if boid['y'] < margin:
        boid['dy'] += turn_factor
    if boid['y'] > height - margin:
        boid['dy'] -= turn_factor

def fly_towards_center(boid):
    centering_factor = 0.005
    center_x, center_y = 0, 0
    num_neighbors = 0
    for other_boid in boids:
        if distance(boid, other_boid) < visual_range:
            center_x += other_boid['x']
            center_y += other_boid['y']
            num_neighbors += 1
    if num_neighbors > 0:
        center_x /= num_neighbors
        center_y /= num_neighbors
        boid['dx'] += (center_x - boid['x']) * centering_factor
        boid['dy'] += (center_y - boid['y']) * centering_factor

def avoid_others(boid):
    min_distance = 20
    avoid_factor = 0.05
    move_x, move_y = 0, 0
    for other_boid in boids:
        if other_boid is not boid and distance(boid, other_boid) < min_distance:
            move_x += boid['x'] - other_boid['x']
            move_y += boid['y'] - other_boid['y']
    boid['dx'] += move_x * avoid_factor
    boid['dy'] += move_y * avoid_factor

def match_velocity(boid):
    matching_factor = 0.05
    avg_dx, avg_dy = 0, 0
    num_neighbors = 0
    for other_boid in boids:
        if distance(boid, other_boid) < visual_range:
            avg_dx += other_boid['dx']
            avg_dy += other_boid['dy']
            num_neighbors += 1
    if num_neighbors > 0:
        avg_dx /= num_neighbors
        avg_dy /= num_neighbors
        boid['dx'] += (avg_dx - boid['dx']) * matching_factor
        boid['dy'] += (avg_dy - boid['dy']) * matching_factor

def limit_speed(boid):
    speed_limit = 15
    speed = math.sqrt(boid['dx'] ** 2 + boid['dy'] ** 2)
    if speed > speed_limit:
        boid['dx'] = (boid['dx'] / speed) * speed_limit
        boid['dy'] = (boid['dy'] / speed) * speed_limit


def draw_boid(screen, boid):
    angle = math.atan2(boid['dy'], boid['dx'])
    end_x = boid['x'] + math.cos(angle) * 10
    end_y = boid['y'] + math.sin(angle) * 10
    pygame.draw.line(screen, (255, 255, 255), (boid['x'], boid['y']), (end_x, end_y), 2)

def update_boids():
    for boid in boids:
        fly_towards_center(boid)
        avoid_others(boid)
        match_velocity(boid)
        limit_speed(boid)
        keep_within_bounds(boid)
        boid['x'] += boid['dx']
        boid['y'] += boid['dy']

init_boids()

# Main loop
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill((0, 0, 0))
    update_boids()
    for boid in boids:
        draw_boid(screen, boid)
    pygame.display.flip()
    clock.tick(30)

pygame.quit()