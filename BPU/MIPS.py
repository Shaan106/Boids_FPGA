file_path = "main.s"

def alphanumeric(s):
    return ''.join(c for c in s if c.isalnum())

def pretty_registers(registers):
    return dict(zip(range(32), registers))

debug_flag = None
def debug(pc):
    global debug_flag
    if debug_flag is None or pc == debug_flag:
        blank = 1 + 1
        x = input("Continue til:")
        if x:
            debug_flag = int(x)
        else:
            debug_flag = None

# int_ = int
# int = lambda x: int_(x) if

def log(*args):
    return
    print(*args)

def main(): # simulate MIPS
    global function_stack, current_section, debug_flag, registers, memory, functions
    file = open(file_path, "r")
    lines = file.readlines()
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
    all_tokens = set()
    while pc < len(lines):
        if 'print' in lines[pc]:
            boid_index = registers[27]
            boid_x = registers[28]
            boid_y = registers[26]
            print(f"Boid {boid_index} at ({boid_x}, {boid_y})", executed)
        debug(pc)
        executed += 1
        line = lines[pc].strip().split('#', 1)[0].strip()
        if line.endswith(':') or "nop" in line:
            functions[line[:-1]] = pc
            pc += 1
            continue
        tokens = line.split()
        if not tokens:
            pc += 1
            continue
        tokens.extend(tokens.pop().split(','))
        log(pc + 1, line, tokens, function_stack, current_section)
        # all_tokens.add(tokens[0])
        # pc += 1
        # continue
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
            log(f"Registers[{int(alphanumeric(tokens[1]))}] = Memory[{registers[register] + offset}] which is {registers[int(alphanumeric(tokens[1]))]}")
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
                current_section = tokens[3]
                log(f"Branching to {tokens[3]}")
        elif tokens[0] == 'bne':
            if registers[int(alphanumeric(tokens[1]))] != registers[int(alphanumeric(tokens[2]))]:
                pc = functions[tokens[3]]
                current_section = tokens[3]
                log(f"Branching to {tokens[3]}")
        elif tokens[0] == 'j':
            pc = functions[tokens[1]]
            current_section = tokens[1]
            log(f"Jumping to {tokens[1]}")
        elif tokens[0] == 'jr':
            pc = registers[int(alphanumeric(tokens[1]))]
            log(f"Return to {function_stack[-2]} from {function_stack[-1]}")
            function_stack.pop()
        elif tokens[0] == 'jal':
            registers[31] = pc
            pc = functions[tokens[1]]
            function_stack.append(tokens[1])
            log(f"Jumping to {tokens[1]} from {function_stack[-2] if len(function_stack) > 1 else 'root'}")
        elif tokens[0] == 'or':
            log(f"Registers[{int(alphanumeric(tokens[1]))}] = {registers[int(alphanumeric(tokens[2]))]} | {registers[int(alphanumeric(tokens[3]))]}")
            registers[int(alphanumeric(tokens[1]))] = registers[int(alphanumeric(tokens[2]))] | registers[int(alphanumeric(tokens[3]))]
        else:
            print("Invalid Instruction", pc)
            print("Instruction:", line)
            break
        pc += 1
    print(pc, executed)


if __name__ == '__main__':
    registers = [0] * 32
    memory = dict()
    functions = dict()
    function_stack = []
    current_section = ""
    main()
