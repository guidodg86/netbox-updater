def Cisco_9k_sw_version_parser(command_printout):
    for line in command_printout.split("\n"):
        splitted_line = line.split(",")
        if len(splitted_line) == 4:
            if splitted_line[2].startswith(" Version"):
                return splitted_line[2].split(" ")[2]
    return "0.0.0"
