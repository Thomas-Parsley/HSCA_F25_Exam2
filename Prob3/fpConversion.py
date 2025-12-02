import sys

# Input should be in this format:
# python3 fpConversion.py inNumSys input 
# inNumSys can be 'bin' or 'hex', standing for binary or hexadecimal
# input must follow whatever number system provided.

def inputBreakdown(value):
    if len(value) == 32:
        print("binary32")
    elif len(value) == 64:
        print("binary64")
    else:
        print("incorrect input")

def main():
    inNumSys = sys.argv[1]
    input = sys.argv[2]
    inputBreakdown(inNumSys, input)


if __name__ == "__main__":
    main()