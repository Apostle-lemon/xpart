
current_column = 0
string = ""


def main():
    row_list = [1, 2, 3]
    char_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12]
    internal_space = 3
    char_offset = 0
    for row in row_list:
        global current_column
        current_column = 5
        for char in char_list:
            output_one_module(row,char,char_offset,internal_space)
        char_offset = char_offset + 12
    with open('TE_done.txt', 'w') as file:
        file.write(string)

def output_one_module(row,char,char_offset,internal_space):
    global string
    global current_column
    string +=  "vga_gen_col col_row"+str(row)+"_char"+str(char)+"(\n"
    string += "\t.clk(clk),\n"
    string += "\t.rst_n(rst_n),\n"
    string += "\t.input_ascii(char_"+str(char+char_offset)+"),\n"
    string += "\t.col_reg_0(row"+str(row)+"["+str(current_column)+"]),\n"
    string += "\t.col_reg_1(row"+str(row)+"["+str(current_column+1)+"]),\n"
    string += "\t.col_reg_2(row"+str(row)+"["+str(current_column+2)+"]),\n"
    string += "\t.col_reg_3(row"+str(row)+"["+str(current_column+3)+"]),\n"
    string += "\t.col_reg_4(row"+str(row)+"["+str(current_column+4)+"]),\n"
    string += "\t.col_reg_5(row"+str(row)+"["+str(current_column+5)+"]),\n"
    string += "\t.col_reg_6(row"+str(row)+"["+str(current_column+6)+"]),\n"
    string += "\t.col_reg_7(row"+str(row)+"["+str(current_column+7)+"]),\n"
    string += "\t.col_reg_8(row"+str(row)+"["+str(current_column+8)+"]),\n"
    string += "\t.col_reg_9(row"+str(row)+"["+str(current_column+9)+"]),\n"
    string += "\t.col_reg_10(row"+str(row)+"["+str(current_column+10)+"]),\n"
    string += "\t.col_reg_11(row"+str(row)+"["+str(current_column+11)+"]),\n"
    string += "\t.col_reg_12(row"+str(row)+"["+str(current_column+12)+"]),\n"
    string += "\t.col_reg_13(row"+str(row)+"["+str(current_column+13)+"]),\n"
    string += "\t.col_reg_14(row"+str(row)+"["+str(current_column+14)+"]),\n"
    string += "\t.col_reg_15(row"+str(row)+"["+str(current_column+15)+"]),\n"
    string += "\t.col_reg_16(row"+str(row)+"["+str(current_column+16)+"]),\n"
    string += "\t.col_reg_17(row"+str(row)+"["+str(current_column+17)+"]),\n"
    string += "\t.col_reg_18(row"+str(row)+"["+str(current_column+18)+"]),\n"
    string += "\t.col_reg_19(row"+str(row)+"["+str(current_column+19)+"]),\n"
    string += "\t.col_reg_20(row"+str(row)+"["+str(current_column+20)+"]),\n"
    string += "\t.col_reg_21(row"+str(row)+"["+str(current_column+21)+"]),\n"
    string += "\t.col_reg_22(row"+str(row)+"["+str(current_column+22)+"]),\n"
    string += "\t.col_reg_23(row"+str(row)+"["+str(current_column+23)+"]),\n"
    string += "\t.col_reg_24(row"+str(row)+"["+str(current_column+24)+"]),\n"
    string += "\t.col_reg_25(row"+str(row)+"["+str(current_column+25)+"]),\n"
    string += "\t.col_reg_26(row"+str(row)+"["+str(current_column+26)+"]),\n"
    string += "\t.col_reg_27(row"+str(row)+"["+str(current_column+27)+"]),\n"
    string += "\t.col_reg_28(row"+str(row)+"["+str(current_column+28)+"]),\n"
    string += "\t.col_reg_29(row"+str(row)+"["+str(current_column+29)+"]),\n"
    string += "\t.col_reg_30(row"+str(row)+"["+str(current_column+30)+"]),\n"
    string += "\t.col_reg_31(row"+str(row)+"["+str(current_column+31)+"]),\n"
    string += "\t.col_reg_32(row"+str(row)+"["+str(current_column+32)+"]),\n"
    string += "\t.col_reg_33(row"+str(row)+"["+str(current_column+33)+"]),\n"
    string += "\t.col_reg_34(row"+str(row)+"["+str(current_column+34)+"]),\n"
    string += "\t.col_reg_35(row"+str(row)+"["+str(current_column+35)+"]),\n"
    string += "\t.col_reg_36(row"+str(row)+"["+str(current_column+36)+"]),\n"
    string += "\t.col_reg_37(row"+str(row)+"["+str(current_column+37)+"]),\n"
    string += "\t.col_reg_38(row"+str(row)+"["+str(current_column+38)+"]),\n"
    string += "\t.col_reg_39(row"+str(row)+"["+str(current_column+39)+"]),\n"
    string += "\t.col_reg_40(row"+str(row)+"["+str(current_column+40)+"]),\n"
    string += "\t.col_reg_41(row"+str(row)+"["+str(current_column+41)+"]),\n"
    string += "\t.col_reg_42(row"+str(row)+"["+str(current_column+42)+"]),\n"
    string += "\t.col_reg_43(row"+str(row)+"["+str(current_column+43)+"]),\n"
    string += "\t.col_reg_44(row"+str(row)+"["+str(current_column+44)+"]),\n"
    string += "\t.col_reg_45(row"+str(row)+"["+str(current_column+45)+"]),\n"
    string += "\t.col_reg_46(row"+str(row)+"["+str(current_column+46)+"]),\n"
    string += "\t.col_reg_47(row"+str(row)+"["+str(current_column+47)+"]),\n"
    string += "\t.col_reg_48(row"+str(row)+"["+str(current_column+48)+"]),\n"
    string += "\t.col_reg_49(row"+str(row)+"["+str(current_column+49)+"])\n"
    string += ");\n"
    string += "\n\n"

    current_column = current_column + 50 + internal_space


if __name__ == "__main__":
    main()