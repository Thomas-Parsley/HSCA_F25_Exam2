import random

def to_bin_twos(value, width):
    """Convert signed integer to two's complement binary string of given width."""
    if value < 0:
        value = (1 << width) + value
    return f"{value & ((1 << width) - 1):0{width}b}"

# Choose your bit-widths here
WIDTH_A = 16
WIDTH_B = 12
WIDTH_P = WIDTH_A + WIDTH_B

with open('csam.tv', 'w') as f:
    for _ in range(256):

        # Signed ranges for each multiplicand
        a = random.randint(-(1 << (WIDTH_A - 1)), (1 << (WIDTH_A - 1)) - 1)
        b = random.randint(-(1 << (WIDTH_B - 1)), (1 << (WIDTH_B - 1)) - 1)

        prod = a * b  # signed product

        line = (
            f"{to_bin_twos(a, WIDTH_A)}_"
            f"{to_bin_twos(b, WIDTH_B)}_"
            f"{to_bin_twos(prod, WIDTH_P)}\n"
        )
        f.write(line)
