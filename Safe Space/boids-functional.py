import pygame
import random
import math

# Initialization
pygame.init()
pixel_width = 512
int_width = int(2**32)
pixel_size = 2**32 / pixel_width
margin = 32 * pixel_size
width, height = pixel_width, pixel_width  # Window size
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption('Boids Simulation')
clock = pygame.time.Clock()
running = True

# Boids parameters
num_boids = 300
visual_range = 75 * pixel_size
initial_speed = 5 * pixel_size

# Boids list
boids = []


def init_boids():
    for _ in range(num_boids):
        boid = {
            'x': random.randint(margin, int_width-margin),
            'y': random.randint(margin, int_width-margin),
            'dx': random.randint(-5 * pixel_size, 5 * pixel_size),
            'dy': random.randint(-initial_speed, initial_speed)
        }
        boids.append(boid)


def distance(boid1, boid2):
    return abs(boid1['x'] - boid2['x']) + abs(boid1['y'] - boid2['y'])


def nearest_n(boid, n):
    return sorted(boids, key=lambda other_boid: distance(boid, other_boid))[:n]


def keep_within_bounds(boid):
    turn_factor = 2 * pixel_size
    if boid['x'] < margin:
        boid['dx'] += turn_factor
    if boid['x'] > width * pixel_size - margin:
        boid['dx'] -= turn_factor
    if boid['y'] < margin:
        boid['dy'] += turn_factor
    if boid['y'] > height * pixel_size - margin:
        boid['dy'] -= turn_factor


def fly_towards_center(boid):
    centering_factor = 0.005
    center_x, center_y = 0, 0
    num_neighbors = 0
    for other_boid in nearest_n(boid, 16):
        if distance(boid, other_boid) < visual_range:
            center_x += other_boid['x']
            center_y += other_boid['y']
            num_neighbors += 1
    if num_neighbors > 0:
        center_x /= num_neighbors
        center_y /= num_neighbors
        boid['dx'] += (center_x - boid['x']) * centering_factor  # make shifts
        boid['dy'] += (center_y - boid['y']) * centering_factor


def avoid_others(boid):
    min_distance = 20 * pixel_size
    avoid_factor = 0.05
    move_x, move_y = 0, 0
    for other_boid in nearest_n(boid, 16):
        if other_boid is not boid and distance(boid, other_boid) < min_distance:
            move_x += boid['x'] - other_boid['x']
            move_y += boid['y'] - other_boid['y']
    boid['dx'] += move_x * avoid_factor  # make shifts
    boid['dy'] += move_y * avoid_factor


def match_velocity(boid):
    matching_factor = 0.5
    avg_dx, avg_dy = 0, 0
    num_neighbors = 0
    for other_boid in nearest_n(boid, 16):
        if distance(boid, other_boid) < visual_range:
            avg_dx += other_boid['dx']
            avg_dy += other_boid['dy']
            num_neighbors += 1
    if num_neighbors > 0:
        avg_dx /= num_neighbors
        avg_dy /= num_neighbors
        # print(1, (avg_dx - boid['dx']) * matching_factor)
        boid['dx'] += (avg_dx - boid['dx']) * matching_factor
        boid['dy'] += (avg_dy - boid['dy']) * matching_factor


def scary(boid):
    scary_factor = 1e9
    move_x, move_y = 0, 0
    mouse_x, mouse_y = pygame.mouse.get_pos()

    if distance(boid, {'x': mouse_x*pixel_size, 'y': mouse_y*pixel_size}) < visual_range:
        dis_x = abs(boid['x'] - mouse_x*pixel_size)
        dis_y = abs(boid['y'] - mouse_y*pixel_size)

        move_x = visual_range - dis_y
        move_y = visual_range - dis_x
        if boid['x'] < mouse_x*pixel_size:
            move_x = -move_x
        if boid['y'] < mouse_y*pixel_size:
            move_y = -move_y
        # print(move_x * scary_factor, move_y * scary_factor)
    # boid['dx'] += move_x * scary_factor  # make shifts
    # boid['dy'] += move_y * scary_factor
    # print()
    # if move_x != 0:
    #     print("-----------------")
    #     print(move_x * scary_factor, move_y * scary_factor)
    #     print(boid['dx'], boid['dy'])
    boid['dx'] += move_x * scary_factor  # make shifts
    boid['dy'] += move_y * scary_factor


def limit_speed(boid):
    speed_limit = 26
    speed = abs(boid['dx']) + abs(boid['dy'])
    mag = int(math.log2(speed))
    shift = max(mag - speed_limit, 0)
    if speed > speed_limit:
        boid['dx'] = boid['dx'] / 2**shift
        boid['dy'] = boid['dy'] / 2**shift


def draw_boid(screen, boid):
    angle = math.atan2(boid['dy'], boid['dx'])
    end_x = boid['x']//pixel_size + math.cos(angle) * 2
    end_y = boid['y']//pixel_size + math.sin(angle) * 2
    # print(boid['x']//pixel_size, boid['y']//pixel_size, end_x, end_y)
    # pygame.draw.rect(screen, (255, 255, 255), (boid['x'], boid['y'], 2, 2))
    pygame.draw.line(screen, (255, 255, 255), (boid['x']//pixel_size, boid['y']//pixel_size), (end_x, end_y), 1)


def update_boids():
    for boid in boids:
        fly_towards_center(boid)
        avoid_others(boid)
        match_velocity(boid)
        scary(boid)
        keep_within_bounds(boid)
        limit_speed(boid)
        boid['x'] += boid['dx']
        boid['y'] += boid['dy']


init_boids()

# Main loop
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    mouse_x, mouse_y = pygame.mouse.get_pos()
    # draw visual range circle around mouse
    screen.fill((0, 0, 0))
    # pygame.draw.circle(screen, (255, 255, 255), (mouse_x, mouse_y), visual_range // pixel_size, 1)
    update_boids()
    # quit()
    for boid in boids:
        draw_boid(screen, boid)
    pygame.display.flip()
    clock.tick(30)

pygame.quit()