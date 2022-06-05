def Cisco_9k_sw_version_parser(command_printout):
    for line in command_printout.split("\n"):
        splitted_line = line.split(",")
        if len(splitted_line) == 4:
            if splitted_line[2].startswith(" Version"):
                return splitted_line[2].split(" ")[2]
    return "0.0.0"


def Cisco_NEXUS_sw_version_parser(command_printout):
    for line in command_printout.split("\n"):
        if line.startswith("system:"):
            return line.split(" ")[2]
    return "0.0.0"


def Cisco_ASA_sw_version_parser(command_printout):
    for line in command_printout.split("\n"):
        if line.startswith("Cisco Adaptive Security Appliance Software Version"):
            return line.split(" ")[6]
    return "0.0.0"


def Aruba_7205_sw_version_parser(command_printout):
    for line in command_printout.split("\n"):
        if line.startswith("Software Version"):
            return line.split(": ")[1].split(" ")[1]
    return "0.0.0"


def PaloAlto_sw_version_parser(command_printout):
    for line in command_printout.split("\n"):
        if line.startswith("sw-version:"):
            return line.split(" ")[1]
    return "0.0.0"
