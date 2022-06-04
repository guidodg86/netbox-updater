import requests
import json
from netmiko import ConnectHandler
import parsers

with open("./token/headers_auth.json") as headers_file:
    headers = json.loads(headers_file.read())

url_devices = "http://127.0.0.1:8000/api/dcim/devices/"


query_device_results = requests.request("GET", url_devices, headers=headers)
devices_data = json.loads(query_device_results.text)

for device in devices_data["results"]:

    device_name = device["name"]
    device_id = device["id"]
    sw_level = device["custom_fields"]["sw_version"]
    ipv4_url = device["primary_ip4"]["url"]
    device_type_url = device["device_type"]["url"]

    query_ipv4_data = requests.request("GET", ipv4_url, headers=headers)
    ipv4_data = json.loads(query_ipv4_data.text)
    ipv4 = ipv4_data["address"].split("/")[0]
    port = ipv4_data["custom_fields"]["port"]
    query_device_type_data = requests.request("GET", device_type_url, headers=headers)
    device_type_data = json.loads(query_device_type_data.text)
    sw_level_parser = device_type_data["custom_fields"]["sw_version_parser"]

    print(device_id, device_name, ipv4, port, sw_level, sw_level_parser)

    net_connect = ConnectHandler(
        device_type="terminal_server",
        host=ipv4,
        username="admin",
        password="password",
        port=port,
    )

    command_printout = net_connect.send_command("show version")

    parser_callback = getattr(parsers, sw_level_parser)
    updated_sw_level = parser_callback(command_printout)
    print(f"Current SW level = {updated_sw_level}")

    net_connect.disconnect()

    url_to_patch = url_devices + str(device_id) + "/"
    print(url_to_patch)

    payload = json.dumps({"custom_fields": {"sw_version": updated_sw_level}})
    patch_response = requests.request(
        "PATCH", url_to_patch, headers=headers, data=payload
    )

    print(patch_response)
    print(patch_response.text)
