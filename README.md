# The netbox challenge

## Objectives

Create a python script to interact with netbox and some network devices

- Collect information for devices with Status = Active, Tenant = NOC in Netbox
- Information to collect: software version
- Custom field to update: "sw_version"
- Assume network device list would contain Cisco Catalyst IOS, Cisco Nexus OS, Cisco ASA OS, Aruba OS, PaloAlto PAN-OS 

## Installation 

1. Set up a python virtual environment and install the following packages listed in requeriments.txt
2. Spin up a local netbox environment. Steps can be found [here](https://docs.netbox.dev/en/stable/installation/). No need to go beyond steps 4, 5 and 6.
3. Create a API token in netbox. (Profile -> Api tokens)
4. Create a folder name token within this repo folder and add a json file named **headers_auth.json** with this content:
   ```json
   {
    "Authorization": "Token <here copy the recently generated token>",
    "Content-Type": "application/json"
   }
   ```
5. Replicate the provided databases (in folder database) following instructions [here](https://docs.netbox.dev/en/stable/administration/replicating-netbox/)

## Starting the environment

1. Start the netbox local environment:
   ```bash
   source /opt/netbox/venv/bin/activate
   cd /opt/netbox/netbox/
   python3 manage.py runserver 0.0.0.0:8000 --insecure   
   ```
2. Start the network devices emulator script:
   ```bash
   source ~/netbox-updater/venv/activate
   cd ~/netbox-updater/
   python3 network_devices_emulator.py  
   ```
