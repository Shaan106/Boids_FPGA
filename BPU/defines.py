import math

pixel_width_power = 8  # 2**9 = 512
int_width_power = 30
pixel_size_power = int_width_power - pixel_width_power
margin_power = 6  # 64
force_amplifier = 0

num_boids = 4
num_neighbors = 4

s = f"""#define PIXEL_WIDTH (1 << {pixel_width_power})
#define INT_WIDTH (1 << {int_width_power})
#define PIXEL_SIZE (1 << {pixel_size_power})
#define PIXEL_SIZE_SHIFT {pixel_size_power}
#define MARGIN (64 << {pixel_size_power})
#define WIDTH (1 << {pixel_width_power})
#define HEIGHT (1 << {pixel_width_power})

#define NUM_BOIDS {num_boids}
#define NUM_NEIGHBORS {num_neighbors}
#define NEIGBHBOR_SHIFT {int(math.log2(num_neighbors))}
#define INITIAL_SPEED (10 << {pixel_size_power})
#define COHESION_FACTOR (6+{force_amplifier})
#define SEPARATION_FACTOR (4+{force_amplifier})
#define ALIGNMENT_FACTOR (2+{force_amplifier})
#define MAX_SPEED 23
#define PERCEPTION_RADIUS (10 << {pixel_size_power})
#define EDGE_PUSH (1 << ({pixel_size_power}))
#define LEFT_BOUND MARGIN
#define RIGHT_BOUND (WIDTH << {pixel_size_power}) - MARGIN
#define TOP_BOUND MARGIN
#define BOTTOM_BOUND (HEIGHT << PIXEL_SIZE_SHIFT) - MARGIN
#define SPAWN_WIDTH (INT_WIDTH - 2 * MARGIN)
#define SPAWN_HEIGHT (INT_WIDTH - 2 * MARGIN)
#define SPAWN_VEL (2 * INITIAL_SPEED + 1)"""

s2 = """
#define PIXEL_WIDTH 512
#define INT_WIDTH (1 << 30)
#define PIXEL_SIZE (INT_WIDTH / PIXEL_WIDTH)
#define PIXEL_SIZE_SHIFT (int)(log2(PIXEL_SIZE))
#define MARGIN (100 << PIXEL_SIZE_SHIFT)
#define WIDTH PIXEL_WIDTH
#define HEIGHT PIXEL_WIDTH

#define NUM_BOIDS 512
#define NUM_NEIGHBORS 4
#define NEIGBHBOR_SHIFT 2
#define INITIAL_SPEED 10 * PIXEL_SIZE
#define FORCE_AMPLIFIER 0
#define COHESION_FACTOR (6+FORCE_AMPLIFIER)
#define SEPARATION_FACTOR (4+FORCE_AMPLIFIER)
#define ALIGNMENT_FACTOR (2+FORCE_AMPLIFIER)
#define MAX_SPEED 23
#define PERCEPTION_RADIUS (10 << PIXEL_SIZE_SHIFT)
#define EDGE_PUSH (1 << (PIXEL_SIZE_SHIFT))
#define LEFT_BOUND MARGIN
#define RIGHT_BOUND (WIDTH << PIXEL_SIZE_SHIFT) - MARGIN
#define TOP_BOUND MARGIN
#define BOTTOM_BOUND (HEIGHT << PIXEL_SIZE_SHIFT) - MARGIN
#define SPAWN_WIDTH (INT_WIDTH - 2 * MARGIN)
#define SPAWN_HEIGHT (INT_WIDTH - 2 * MARGIN)
#define SPAWN_VEL (2 * INITIAL_SPEED + 1)
"""

for line in s.split("\n"):
    parts = line.split(None, 2)  # Split the line into at most 3 parts
    if len(parts) >= 3:
        value = parts[2]  # Get everything after the second word
        key = parts[1]
    else:
        continue
    val = eval(value)
    globals()[key] = val
    print(f"#define {key} {val}")
# print(s)