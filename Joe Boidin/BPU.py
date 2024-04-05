import random
import math
import pygame

pixel_width = 512
int_width = int(2**32)
pixel_size = 2**32 // pixel_width
pixel_size_shift = int(math.log2(pixel_size))
margin = 64 << pixel_size_shift
width, height = pixel_width, pixel_width  # Window size (640, 480)

# Boids parameters
num_boids = 256
visual_range = 75 << pixel_size_shift
initial_speed = 10_000#5 * pixel_size
# Boids list
boids = []
def init_boids():
    for _ in range(num_boids):
        boid = {
            'x': random.randint(margin, int_width-margin),
            'y': random.randint(margin, int_width-margin),
            'dx': random.randint(-initial_speed, initial_speed),
            'dy': random.randint(-initial_speed, initial_speed)
        }
        boids.append(boid)


def keep_within_bounds(boid):
    turn_factor = 2 << pixel_size_shift
    bx = by = 0
    if boid['x'] < margin:
        bx = turn_factor
    elif boid['x'] > (width << pixel_size_shift) - margin:
        bx = -turn_factor
    if boid['y'] < margin:
        by = turn_factor
    if boid['y'] > (height << pixel_size_shift) - margin:
        by = -turn_factor
    return bx, by


def fly_towards_center(boid):
    neighbors = []  # Nearst N Neighbors less than distance 64
    for other_boid in nearest_n(boid, 16):
        if distance(boid, other_boid) < visual_range:
            neighbors.append(other_boid)
    center_x = sum([neighbor['x'] for neighbor in neighbors]) // len(neighbors) if len(neighbors) else 0  # Do avg with funky method
    center_y = sum([neighbor['y'] for neighbor in neighbors]) // len(neighbors) if len(neighbors) else 0
    return (center_x - boid['x']) >> 8, (center_y - boid['y']) >> 8


def avoid_others(boid):
    min_distance = 20 << pixel_size_shift
    move_x = sum([boid['x'] - other_boid['x'] for other_boid in nearest_n(boid, 16) if other_boid is not boid and distance(boid, other_boid) < min_distance])
    move_y = sum([boid['y'] - other_boid['y'] for other_boid in nearest_n(boid, 16) if other_boid is not boid and distance(boid, other_boid) < min_distance])
    return move_x >> 4, move_y >> 4


def match_velocity(boid):
    neighbors = []  # Nearst N Neighbors less than distance 64
    for other_boid in nearest_n(boid, 16):
        if distance(boid, other_boid) < visual_range:
            neighbors.append(other_boid)
    avg_dx = sum([neighbor['dx'] for neighbor in neighbors]) // len(neighbors) if len(neighbors) else 0  # Do avg with funky method
    avg_dy = sum([neighbor['dy'] for neighbor in neighbors]) // len(neighbors) if len(neighbors) else 0
    return (avg_dx) >> 2, (avg_dy) >> 2


def limit_speed(dx, dy):
    speed_limit = 26
    speed = abs(dx) + abs(dy)
    mag = int(math.log2(speed))
    shift = max(mag - speed_limit, 0)
    return dx >> shift, dy >> shift


def distance(boid1, boid2):
    return abs(boid1['x'] - boid2['x']) + abs(boid1['y'] - boid2['y'])


def nearest_n(boid, n):  # TODO: figure out how to implement this efficiently
    return sorted(boids, key=lambda other_boid: distance(boid, other_boid))[:n]


def update_boids(boid_id):
    boid = boids[boid_id]
    cx, cy = fly_towards_center(boid)
    ax, ay = avoid_others(boid)
    vx, vy = match_velocity(boid)
    bx, by = keep_within_bounds(boid)
    dx, dy = limit_speed(boid['dx'] + cx + ax + vx, boid['dy'] + cy + ay + vy)
    boid['dx'] = dx + bx
    boid['dy'] = dy + by


def latch_updates():
    for boid_id in range(num_boids):  # update all boids in parallel
        boid = boids[boid_id]
        boid['x'] += boid['dx']
        boid['y'] += boid['dy']


pygame.init()
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption('Boids Simulation')
clock = pygame.time.Clock()
def draw_boid(screen, boid):
    angle = math.atan2(boid['dy'], boid['dx'])
    end_x = boid['x']//pixel_size + math.cos(angle) * 2
    end_y = boid['y']//pixel_size + math.sin(angle) * 2
    # print(boid['x']//pixel_size, boid['y']//pixel_size, end_x, end_y)
    # pygame.draw.rect(screen, (255, 255, 255), (boid['x'], boid['y'], 2, 2))
    pygame.draw.line(screen, (255, 255, 255), (boid['x']//pixel_size, boid['y']//pixel_size), (end_x, end_y), 1)


init_boids()
while True:
    for boid_id in range(num_boids):
        update_boids(boid_id)
    latch_updates()
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            quit()
    screen.fill((0, 0, 0))
    for boid in boids:
        draw_boid(screen, boid)
    pygame.display.flip()
    clock.tick(30)