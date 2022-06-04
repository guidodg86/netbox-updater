import requests
import json
from netmiko import ConnectHandler

with open("./token/headers_auth.json") as headers_file:
    headers = json.loads(headers_file.read())

url_devices = "http://127.0.0.1:8000/api/dcim/devices/"

payload = {}

query_device_results = requests.request(
    "GET", url_devices, headers=headers, data=payload
)
devices_data = json.loads(query_device_results.text)
device_name = devices_data["results"][0]["name"]
ipv4_url = devices_data["results"][0]["primary_ip4"]["url"]

query_ipv4_data = requests.request("GET", ipv4_url, headers=headers, data=payload)
ipv4_data = json.loads(query_ipv4_data.text)
ipv4 = ipv4_data["address"].split("/")[0]
port = ipv4_data["custom_fields"]["port"]
sw_level = devices_data["results"][0]["custom_fields"]["sw_version"]

print(device_name, ipv4, port, sw_level)

net_connect = ConnectHandler(
    device_type="terminal_server",
    host=ipv4,
    username="admin",
    password="password",
    port=port,
)

output = net_connect.send_command("show version")
print(output)

net_connect.disconnect()