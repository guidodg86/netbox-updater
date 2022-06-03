"""
    Simple script to generate data on the emulated devices
    The printout must be copied con the file draft_printout, then the rest of the data is asked
    while the script is running

"""


import json

print("Converting file ./printouts/draft_printout.txt")
with open("./printouts/draft_printout.txt", "r") as text_file:
    printout_data = text_file.readlines()
    new_filename = input(
        "New filename (will be saved in ./printouts/ with a .json extension): "
    )
    command = input("Command to emulate: ")
    metadata = input("Metadata (url where the printout was obtained from): ")
    with open(f"./printouts/{new_filename}.json", "w") as target_file:
        result_info = {}
        result_info["metadata"] = metadata
        result_info["printout"] = printout_data
        result_info["command"] = command
        json.dump(result_info, target_file, indent=4)
        print(f"File ./printouts/{new_filename}.json succesfully generated")
