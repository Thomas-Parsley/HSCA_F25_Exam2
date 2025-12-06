import sys

# python3 fpConversion.py 

import numpy as np
import struct

def float_to_hex32(value):
    packed = struct.pack('!f', np.float32(value))
    bits = struct.unpack('!I', packed)[0]
    return f"0x{bits:08X}"

def float_to_hex64(value):
    packed = struct.pack('!d', float(value))
    bits = struct.unpack('!Q', packed)[0]
    return f"0x{bits:016X}"

def main():
    innum = float(input("Number (Decimal):"))
    type = int(input("Type (32 or 64) (Default 64):"))
    #print(type == 32)
    print("")
    number = innum

    if (type == 32):
        number = np.float32(number)
        print("Decimal: ", number)
        print("Hex: ", float_to_hex32(number))
    else:
        number = float(number)
        print("Decimal: ", number)
        print("Hex: ", float_to_hex64(number))

if __name__ == "__main__":
    main()


