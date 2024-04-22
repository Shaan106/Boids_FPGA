# https://godbolt.org - use mips gcc 13.2.0

file_path = "compiled.s"
file = open(file_path, "r")
temp_reg = "$20"
print(f"Temp register: {temp_reg}. Make sure it is not used in the code.")
lines = file.readlines()

# add jump to main
lines.insert(0, "jal     main\n")
# remove comments
for i in range(len(lines)):
    if "#" in lines[i]:
        lines[i] = lines[i][:lines[i].index("#")]
# remove the $LFB0 = .
for i in range(len(lines)):
    if lines[i].strip().endswith("= ."):
        lines[i] = ""


# handle .space
total_stack_space = 4096
sp = total_stack_space  # overflows bad so we need to allocate some space for the stack
lines.insert(0, f"addi    $sp,$sp,{total_stack_space}\n")
for i, line in enumerate(lines):  # for each one allocate some space on the stack then replace all calls to it with the address
    if ".space" in line:
        tokens = line.split()
        space = int(tokens[1])
        name = lines[i-1].strip()[:-1]
        lines[0] = lines[0] + f"addi    $sp,$sp,-{space}\n"
        sp -= space
        assert sp > 100, f"Stack pointer is too low: {sp}. Try increasing the total_stack_space."
        print(name, space, sp)
        lines[i] = ""
        lines[i-1] = ""
        for j in range(i+1, len(lines)):
            if name in lines[j]:
                lines[j] = lines[j].replace(name, f"{sp}")
# # swap names to register numbers
mips_registers = {
    "$zero": 0,
    "$at": 1,
    "$v0": 2,
    "$v1": 3,
    "$a0": 4,
    "$a1": 5,
    "$a2": 6,
    "$a3": 7,
    "$t0": 8,
    "$t1": 9,
    "$t2": 10,
    "$t3": 11,
    "$t4": 12,
    "$t5": 13,
    "$t6": 14,
    "$t7": 15,
    "$s0": 16,
    "$s1": 17,
    "$s2": 18,
    "$s3": 19,
    "$s4": 20,
    "$s5": 21,
    "$s6": 22,
    "$s7": 23,
    "$t8": 24,
    "$t9": 25,
    "$k0": 26,
    "$k1": 27,
    "$gp": 28,
    "$sp": 29,
    "$fp": 23,  # FIXME: this is wrong
    "$ra": 31,
}
for key in mips_registers:
    for i in range(len(lines)):
        lines[i] = lines[i].replace(key, f"${mips_registers[key]}")
# fix %hi(#) and %lo(#)
for i, line in enumerate(lines):
    if "%hi(" in line:
        idx1 = line.index("%hi(")
        idx2 = line.index(")", idx1)
        number = int(line[idx1+4:idx2])
        high = number >> 16
        lines[i] = line[:idx1] + str(high) + line[idx2+1:]
    elif "%lo(" in line:
        idx1 = line.index("%lo(")
        idx2 = line.index(")", idx1)
        number = int(line[idx1+4:idx2])
        low = number & 0xFFFF
        lines[i] = line[:idx1] + str(low) + line[idx2+1:]

for i, line in enumerate(lines):
    if "addiu" in line:
        line = line.replace("addiu", "addi ")
    elif "addu" in line:
        line = line.replace("addu", "add ")
    elif "subu" in line:
        line = line.replace("subu", "sub ")
    lines[i] = line

# change move to add 0
for i, line in enumerate(lines):
    if "move" in line:
        tokens = line.split()
        tokens.extend(tokens.pop().split(','))
        line = f"        add     {tokens[1]}, {tokens[2]},$0\n"
        lines[i] = line

# branch instructions: bgez, b, beq from just bne and blt
skip_counter = 0
for i, line in enumerate(lines):
    if "bgez" in line:  # branch if greater than or equal to zero
        tokens = line.split()
        tokens.extend(tokens.pop().split(','))
        new_lines = f"""
        blt     {tokens[1]},$0,bgez_after_{skip_counter}
        j       {tokens[2]}
        bgez_after_{skip_counter}:\n"""
        skip_counter += 1
        lines[i] = new_lines
    elif " b " in line:
        lines[i] = lines[i].replace(" b ", " j ")
    elif "beq" in line:  # branch if equal
        tokens = line.split()
        tokens.extend(tokens.pop().split(','))
        new_lines = f"""
        bne     {tokens[1]},{tokens[2]},beq_after_{skip_counter}
        j       {tokens[3]}
        beq_after_{skip_counter}:\n"""
        skip_counter += 1
        lines[i] = new_lines
    elif "bltz" in line:
        tokens = line.split()
        tokens.extend(tokens.pop().split(','))
        lines[i] = f"        blt     {tokens[1]},$0,{tokens[2]}\n"

# support nops
for i, line in enumerate(lines):
    if "nop" in line:
        lines[i] = "        add $0, $0,$0\n"

for i, line in enumerate(lines):
    if " ori " in line:
        tokens = line.split()
        tokens.extend(tokens.pop().split(','))
        new_lines = f"""
        addi    {temp_reg},$0,{int(tokens[3], 16)}
        or      {tokens[1]},{temp_reg},{tokens[2]}\n"""
        lines[i] = new_lines
    elif " li " in line:
        tokens = line.split()  # li $t0, 0x1234 - target, value
        tokens.extend(tokens.pop().split(','))
        lower_16 = int(tokens[2]) & 0xFFFF
        upper_16 = int(tokens[2]) >> 16
        new_lines = f"""
        addi    {tokens[1]},$0,{lower_16}\n
        addi    {temp_reg},$0,{upper_16}\n
        sll     {temp_reg},{temp_reg},16\n
        add     {tokens[1]},{tokens[1]},{temp_reg}\n"""
        lines[i] = new_lines
    elif " lui " in line:  # replace iwth addi and then shift left by 16
        tokens = line.split()
        tokens.extend(tokens.pop().split(','))
        new_lines = f"""
        addi    {tokens[1]},$0,{tokens[2]}
        sll     {tokens[1]},{tokens[1]},16\n"""
        lines[i] = new_lines
    elif " slt " in line:  # implement slt without slt or slti
        tokens = line.split()
        tokens.extend(tokens.pop().split(','))  # set to, compare, with
        new_lines = f"""
        {'add' if tokens[3].startswith('$') else 'addi'}    {temp_reg},$0,{tokens[3]}
        blt     {tokens[2]},{temp_reg},slt_set_one_{skip_counter}
        addi    {tokens[1]},$0,0
        j       slt_end_{skip_counter}
        slt_set_one_{skip_counter}:
        addi    {tokens[1]},$0,1
        slt_end_{skip_counter}:\n"""
        skip_counter += 1
        lines[i] = new_lines

# replace all commas with comma & space
for i, line in enumerate(lines):
    lines[i] = line.replace(",", ", ")

# for i in range(32):
#     lines.insert(0, f"addi    ${i}, $0, 0\n")

# add 2 nops between all lines
# for i in range(0, len(lines)):
#     lines[i] = lines[i] + "        add $0, $0, $0\n" + "        add $0, $0, $0\n"
out_path = "main.s"
out_file = open(out_path, "w")
for line in lines:
    out_file.write(line)