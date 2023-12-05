This program basically runs a sweep analysis using HSPICE on a DRAm cell using differing combinations of temperature, width, and capacitance to find out what their resulting RTL, average power, and average current is.

In order to run this program do this:

1. python3 generate_input.py
2. hspice -i DRAM.sp > output.lis
3. python3 organize_output.py

Then you can find the output in the file: "output_data.txt"