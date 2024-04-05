import random

pixel_width = 512
int_width = int(2**32)
pixel_size = 2**32 / pixel_width
margin = 32 * pixel_size
width, height = pixel_width, pixel_width  # Window size

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


def limit_speed(boid):
    speed_limit = 26
    speed = abs(boid['dx']) + abs(boid['dy'])
    mag = int(math.log2(speed))
    shift = max(mag - speed_limit, 0)
    if speed > speed_limit:
        boid['dx'] = boid['dx'] / 2**shift
        boid['dy'] = boid['dy'] / 2**shift


def update_boids(boid_id):
    fly_towards_center(boid_id)
    avoid_others(boid)
    match_velocity(boid)
    limit_speed(boid)
    keep_within_bounds(boid)

def latch_updates():
    for boid_id in range(num_boids):  # update all boids in parallel
        boids[boid_id]['x'] += boids[boid_id]['dx']
        boids[boid_id]['y'] += boids[boid_id]['dy']

while True:
    for boid_id in range(num_boids):
        update_boids(boid_id)
    latch_updates()