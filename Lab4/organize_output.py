from collections import deque

# The final file, line by line
final_result = []

with open('output.lis', 'r') as file:
    with open('input_data.txt', 'r') as input_data:
        # Read in the input data in order
        for line in input_data:
            if len(line) != 0 and line[0] != '.' and line[0] != '+' and line[0] != "\n":
                final_result.append(line[:-1])

    # Read in data 
    counter = 0
    # Have a buffer, because rtl, average power and current are usually within 5 lines of "job finished"
    buffer = deque()
    for _ in range(5):
        buffer.append("")
    for line in file:
        # If key line "job concluded" is encountered, look into buffer to get the average currents and such
        if "job concluded" in line:
            while len(buffer) != 0:
                temp = buffer.popleft()
                temp_list = temp.strip().split(" ")
                hot_words = ["rtl=", "avg_cur=", "avg_pwr="]
                if len(temp_list) > 1 and temp_list[0] in hot_words:
                    final_result[counter] += (" " + temp_list[1])
            counter += 1
            # Repopulate the buffer
            for _ in range(5):
                buffer.append("")
        buffer.append(line)
        buffer.popleft()

# Update final_result to add in start and finish
final_result = [".DATA mydata", "+ TEMP WIDTH CAP RTL AVG_CUR AVG_POWER"] + final_result + [".ENDDATA"]

# Write the data out 
with open("output_data.txt", 'w') as file:
    for line in final_result:
        file.write(line + "\n")