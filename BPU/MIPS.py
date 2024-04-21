file_path = "main.s"

def alphanumeric(s):
    return ''.join(c for c in s if c.isalnum())

def log(*args):
    return
    print(*args)

def main(): # simulate MIPS
    file = open(file_path, "r")
    lines = file.readlines()
    registers = [0] * 32
    memory = dict()
    functions = dict()
    pc = 0
    for line in lines:
        line = line.strip()
        if line.endswith(':'):
            functions[line[:-1]] = pc
            pc += 1
            continue
        pc += 1
    pc = 0
    executed = 0
    while pc < len(lines):
        executed += 1
        line = lines[pc].strip().split('#', 1)[0]
        tokens = line.split()
        if line.endswith(':'):
            functions[line[:-1]] = pc
            pc += 1
            continue

        log(pc + 1, line, tokens)
        if not tokens:
            pc += 1
            continue
        if tokens[0] == 'add':
            log(f"Registers[{int(alphanumeric(tokens[1]))}] = {registers[int(alphanumeric(tokens[2]))]} + {registers[int(alphanumeric(tokens[3]))]}")
            registers[int(alphanumeric(tokens[1]))] = registers[int(alphanumeric(tokens[2]))] + registers[int(alphanumeric(tokens[3]))]
        elif tokens[0] == 'addi':
            # log(int(alphanumeric(tokens[1])), int(alphanumeric(tokens[2])), int(tokens[3]))
            log(f"Registers[{int(alphanumeric(tokens[1]))}] = {registers[int(alphanumeric(tokens[2]))]} + {int(tokens[3])}")
            registers[int(alphanumeric(tokens[1]))] = registers[int(alphanumeric(tokens[2]))] + int(tokens[3])
        elif tokens[0] == 'sll':
            log(f"Registers[{int(alphanumeric(tokens[1]))}] = {registers[int(alphanumeric(tokens[2]))]} << {int(tokens[3])}")
            registers[int(alphanumeric(tokens[1]))] = registers[int(alphanumeric(tokens[2]))] << int(tokens[3])
        elif tokens[0] == 'sra':
            log(f"Registers[{int(alphanumeric(tokens[1]))}] = {registers[int(alphanumeric(tokens[2]))]} >> {int(tokens[3])}")
            registers[int(alphanumeric(tokens[1]))] = registers[int(alphanumeric(tokens[2]))] >> int(tokens[3])
        elif tokens[0] == 'sub':
            log(f"Registers[{int(alphanumeric(tokens[1]))}] = {registers[int(alphanumeric(tokens[2]))]} - {registers[int(alphanumeric(tokens[3]))]}")
            registers[int(alphanumeric(tokens[1]))] = registers[int(alphanumeric(tokens[2]))] - registers[int(alphanumeric(tokens[3]))]
        elif tokens[0] == 'mul':
            raise NotImplementedError
        elif tokens[0] == 'div':
            raise NotImplementedError
        elif tokens[0] == 'lw':
            addr = tokens[2]
            idx_1 = addr.index('(')
            idx_2 = addr.index(')')
            offset = int(addr[:idx_1])
            register = int(alphanumeric(addr[idx_1+1:idx_2]))
            registers[int(alphanumeric(tokens[1]))] = memory.get(registers[register] + offset, 0)
            log(f"Registers[{int(alphanumeric(tokens[1]))}] = Memory[{registers[register] + offset}]")
        elif tokens[0] == 'sw':  # allow relative addressing (ie sw $t0, 4($t1))
            addr = tokens[2]
            idx_1 = addr.index('(')
            idx_2 = addr.index(')')
            offset = int(addr[:idx_1])
            register = int(alphanumeric(addr[idx_1+1:idx_2]))
            memory[registers[register] + offset] = registers[int(alphanumeric(tokens[1]))]
            log(f"Memory[{registers[register] + offset}] = {registers[int(alphanumeric(tokens[1]))]}" )
        elif tokens[0] == 'blt':
            if registers[int(alphanumeric(tokens[1]))] < registers[int(alphanumeric(tokens[2]))]:
                pc = functions[tokens[3]]
                log(f"Branching to {tokens[3]}")
        elif tokens[0] == 'bne':
            if registers[int(alphanumeric(tokens[1]))] != registers[int(alphanumeric(tokens[2]))]:
                pc = functions[tokens[3]]
                log(f"Branching to {tokens[3]}")
        elif tokens[0] == 'j':
            pc = functions[tokens[1]]
            log(f"Jumping to {tokens[1]}")
        elif tokens[0] == 'jr':
            pc = registers[int(alphanumeric(tokens[1]))]
            log(f"Jumping to {tokens[1]} which is {pc}")
        elif tokens[0] == 'jal':
            registers[31] = pc
            pc = functions[tokens[1]]
            log(f"Jumping to {tokens[1]} and saving return address {pc+1}")
        elif tokens[0] == 'nop':
            boid_index = registers[27]
            boid_x = registers[28]
            boid_y = registers[26]
            print(f"Boid {boid_index} at ({boid_x}, {boid_y})")
        else:
            print("Invalid Instruction")
            print("Instruction:", line)
            break
        pc += 1
    log(pc, executed)

if __name__ == '__main__':
    main()