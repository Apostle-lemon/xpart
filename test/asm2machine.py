from riscv_assembler.convert import AssemblyConverter as AC
# instantiate object, by default outputs to a file in nibbles, not in hexademicals
convert = AC(output_mode = 'f', nibble_mode = False, hex_mode = True)

# Convert a whole .s file to text file
convert("asm.asm", "result.txt")

filename = "result.txt"  # 替换为你要处理的文件名

# 打开文件并读取内容
with open(filename, "r") as file:
    lines = file.readlines()

# 删除每行开头的 '0x'
lines = [line.replace('0x', '', 1) if line.startswith('0x') else line for line in lines]

# 将修改后的内容写回文件
with open(filename, "w") as file:
    file.writelines(lines)
