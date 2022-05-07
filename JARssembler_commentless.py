"""
usage: python assembler.py [assembly file] [machine code file]
requires python 3.x
This assembler is assuming the bit breakdown as follows:
R-Type: 2 bits opcode, 4 bits function, 3 bits operand register 
I-Type: 1 bits opcode, 8 bits immediate
B-Type: 2 bits opcode, 6 bits address
"""
import sys

# map registers to binary
registers = {
    "$0": "000",
    "$1": "001",
    "$2": "010",
    "$3": "011",
    "$4": "100",
    "$5": "101",
    "$6": "110",
    "$7": "111",
    }

# map opcode to binary
opcode = {
    "ldi": "0",
    "add": "100000",
    "sub": "100001",
    "ldr": "100010",
    "str": "100011",
    "mov": "100100",
    "and": "100101",
    "ior": "100110",
    "xor": "100111",
    "not": "101000",
    "lsl": "101001",
    "lsr": "101010",
    "slt": "101011",
    "seq": "101100",
    "brl": "111",
    "brr": "110",
    "hlt": "101111111"
    }

# classify opcodes into types
rtype = ['add', 'sub', 'ldr', 'str', 'mov', 'and', 'ior', 'xor', 'not', 'lsl', 'lsr', 'slt', 'seq']
itype = ['ldi']
btype = ['brl', 'brr']

comment_char = '//'

with (
    open(sys.argv[1], "r") as read,
    open(sys.argv[2], "w") as write
):

# with automatically handles file (no need for open and close)
    line = read.readline() # read a line
    # for every line
    while(line):
        # strip takes away whitespace from left and right
        line = line.strip()

        # split your comments out
        line = line.split(comment_char, 1)

        # store assembly assemblyruction
        assembly = line[0].strip()

        # store comment if comment exists
        if len(line) == 1:
            comment = '\n'
        else:
            comment = " // " + line[1].strip() + '\n'
        
        # split assemblyruction into arguments
        assembly = assembly.split()

        # initialize the string that contains the machine code binary
        machine = ''

        # write the opcode
        if assembly[0] in opcode:
            machine += opcode[assembly[0]]
        else:
            # if the assemblyruction is not valid print an error and exit
            print("Error: Invalid Instruction!")
            sys.exit()

        # if the assembly instruction is an r-type
        if assembly[0] in rtype:
            bits = registers[assembly[1]]
        # if the assembly instruction is an i-type
        elif assembly[0] in itype:
            # if immediate is in decimal
            if assembly[1][0] == '#':
                # convert decimal to bits
                bits = str(bin(int(assembly[1][1:]) & 0b11111111)[2:])

                # sign extend to 8 bits
                if (assembly[1][1] == '-'):
                    bits = bits.rjust(8, '1')
                else:
                    bits = bits.rjust(8, '0')
            # else immediate is in binary
            else:
                # immediate is 8-bits wide
                if len(assembly[1]) == 8:
                    # check if immediate is in binary
                    for i in assembly[1]:
                        if i not in '01':
                            print("Error: Invalid Immediate Length!")
                            sys.exit()

                    bits = assembly[1]
                # immediate is not 8-bits wide
                else:
                    print("Error: Invalid Immediate Length!")
                    sys.exit()
        # if the assembly instruction is a b-type
        elif assembly[0] in btype:
            # if immediate is in decimal
            if assembly[1][0] == '#':
                # convert decimal to bits
                bits = str(bin(int(assembly[1][1:]) & 0b111111)[2:])

                # zero extend to 6 bits
                bits = bits.rjust(6, '0')
            # else immediate is in binary
            else:
                if len(assembly[1]) == 6:
                    # check if immediate is in binary
                    for i in assembly[1]:
                        if i not in '01':
                            print("Error: Invalid Immediate Length!")
                            sys.exit()

                    bits = assembly[1]
                # immediate is not 8-bits wide
                else:
                    print("Error: Invalid Immediate Length!")
                    sys.exit()
        else:
            if (assembly[0] == 'hlt'):
                bits = ''
            else:
                print("Error: Invalid Instruction Type!")
                sys.exit()

        # concatenate remaining bits depending on type
        machine += bits
        machine += '\n'
        # # concatenate comment
        # machine += comment

        # write the line into the desired file
        write.write(machine)

        # print line to console
        print(machine)

        # read the next line
        line = read.readline()