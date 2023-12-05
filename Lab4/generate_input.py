with open('input_data.txt', 'w') as file:
    file.write(".DATA mydata\n")
    file.write("+ TEMP WIDTH CAP\n")
    temp_list = [25, 85]
    width_list = list(range(120, 301, 60)) # stops at 301 to include 300
    cap_list = [0.01] + [8 ** (0.1 * i) for i in range(1, 11, 1)]
    for temp in temp_list:
        for width in width_list:
            for cap in cap_list:
                file.write(str(temp) + " " + str(width) + "n " + str(cap) + "f\n")
    file.write(".ENDDATA")