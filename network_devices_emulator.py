import logging

logging.basicConfig(level="DEBUG")
logger = logging.getLogger()

import sshim
import json
import threading


class networkDeviceThread(threading.Thread):
    def __init__(self, device_data):
        threading.Thread.__init__(self)
        self.device_data = device_data

    def run(self):
        server = sshim.Server(
            self.device_data["callback_function"], port=self.device_data["port"]
        )
        try:
            print("Starting " + self.device_data["name"] + "...")
            server.run()
        except KeyboardInterrupt:
            server.stop()


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


def nexus(script):
    with open("./printouts/nexus.json", "r") as printout_file:
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


def cisco_asa(script):
    with open("./printouts/cisco_asa.json", "r") as printout_file:
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


def aruba_wlc(script):
    with open("./printouts/aruba_wlc.json", "r") as printout_file:
        device_data = json.loads(printout_file.read())
        while True:
            script.write("#")
            try:
                script.expect(device_data["command"])
                for line in device_data["printout"]:
                    script.writeline(line[:-1])
            except AssertionError:
                script.write(
                    "Error!!!!, this emulated device works only with 'show image version' command\r\n"
                )
                script.write(
                    f"For more information about the command, please check {device_data['metadata'] }\r\n"
                )


network_devices = []
network_devices.append(
    {"callback_function": catalyst_switch, "port": 3001, "name": "HEAD-LAN001"}
)
network_devices.append(
    {"callback_function": catalyst_switch, "port": 3002, "name": "HEAD-LAN002"}
)
network_devices.append(
    {"callback_function": nexus, "port": 3003, "name": "HEAD-NEX001"}
)
network_devices.append(
    {"callback_function": cisco_asa, "port": 3004, "name": "HEAD-SEC001"}
)
network_devices.append(
    {"callback_function": aruba_wlc, "port": 3005, "name": "HEAD-WLC001"}
)

# Create new threads
for device in network_devices:
    draft_thread = networkDeviceThread(device)
    draft_thread.start()
