"""
    Main script for the task of updating sw_version 
"""

# Constant definitions (can be moved to a .info file)
url_devices = "http://127.0.0.1:8000/api/dcim/devices/"
filter_devices = "?tenant=noc&status=active"

import requests
import json
from netmiko import ConnectHandler
import parsers
import logging

# Basic config for logging
logging.basicConfig(
    format="%(asctime)s %(levelname)-8s %(message)s",
    level=logging.INFO,
    datefmt="%Y-%m-%d %H:%M:%S",
)

# Init tasks
logging.info("Starting sw_version update")
logging.info("Opening headers file")
with open("./token/headers_auth.json") as headers_file:
    headers = json.loads(headers_file.read())
updates_counter = 0

# Get request in order to get the devices info
logging.info("Getting devices list from netbox")
query_device_results = requests.request(
    "GET", url_devices + filter_devices, headers=headers
)
devices_data = json.loads(query_device_results.text)

# Iterating over devices
for device in devices_data["results"]:

    # Variable renaming for sake of simplicity
    device_name = device["name"]
    device_id = device["id"]
    sw_level = device["custom_fields"]["sw_version"]
    ipv4_url = device["primary_ip4"]["url"]
    device_type_url = device["device_type"]["url"]
    logging.info(f"Starting with {device_name}")

    # Getting ipv4 data for the device
    logging.info(f"Getting ipv4 data from {device_name}")
    query_ipv4_data = requests.request("GET", ipv4_url, headers=headers)
    ipv4_data = json.loads(query_ipv4_data.text)
    ipv4 = ipv4_data["address"].split("/")[0]
    port = ipv4_data["custom_fields"]["port"]

    # Getting ipv4 data for the device
    logging.info(f"Getting device type data from {device_name}")
    query_device_type_data = requests.request("GET", device_type_url, headers=headers)
    device_type_data = json.loads(query_device_type_data.text)
    sw_level_parser = device_type_data["custom_fields"]["sw_version_parser"]
    command_sw_version = device_type_data["custom_fields"]["command_soft_version"]

    # logging current info
    logging.info(f"Device {device_name} is on netbox on {sw_level}")
    logging.info(
        f"On device {device_name} the command '{command_sw_version}' and will be parsed with '{sw_level_parser}'"
    )

    # Getting and parsing sw version from device
    logging.info(f"Connecting to {device_name}...")
    net_connect = ConnectHandler(
        device_type="terminal_server",
        host=ipv4,
        username="admin",
        password="password",
        port=port,
    )
    command_printout = net_connect.send_command(command_sw_version)
    logging.info(f"Parsing printout of '{command_sw_version}' in {device_name}...")
    parser_callback = getattr(parsers, sw_level_parser)
    updated_sw_level = parser_callback(command_printout)
    net_connect.disconnect()

    # Check if an update is needed, if it is a match I continue with the following device
    if updated_sw_level == sw_level:
        logging.info(
            f"For {device_name} current sw_version matches netbox, no update needed"
        )
        continue

    # Updating SW level in netbox with patch request
    logging.info(
        f"In {device_name} updating from {sw_level}  to {updated_sw_level} on netbox"
    )
    url_to_patch = url_devices + str(device_id) + "/"
    payload = json.dumps({"custom_fields": {"sw_version": updated_sw_level}})
    patch_response = requests.request(
        "PATCH", url_to_patch, headers=headers, data=payload
    )
    if patch_response.status_code >= 200 and patch_response.status_code < 300:
        logging.info(f"Succesfully updated sw_version of {device_name} in netbox")
        updates_counter += 1
    else:
        logging.error(f"Error when attemping to update {device_name} on netbox")
        break
logging.info(f"Task ended, updated {updates_counter} devices")
