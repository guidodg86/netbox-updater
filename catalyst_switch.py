import logging

logging.basicConfig(level="DEBUG")
logger = logging.getLogger()

import sshim
import json


def catalyst_switch(script):
    with open("./printouts/catalyst_switch.json", "r") as printout_file:
        device_data = json.loads(printout_file.read())
        while True:
            script.write("#")
            try:
                script.expect(device_data["command"])
                for line in device_data["printout"]:
                    script.writeline(line[:-1])
            except AssertionError:
                script.write(
                    "Error!!!!, this emulated device works only with 'show version' command\r\n"
                )
                script.write(
                    f"For more information about the command, please check {device_data['metadata'] }\r\n"
                )


# create a server and pass in the callback method
# connect to it using `ssh localhost -p 3000`
server = sshim.Server(catalyst_switch, port=3000)
try:
    server.run()
except KeyboardInterrupt:
    server.stop()
