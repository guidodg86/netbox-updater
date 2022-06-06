# The netbox challenge

## Objectives

Create a python script to interact with netbox and some network devices

- Collect information for devices with Status = Active, Tenant = NOC in Netbox
- Information to collect: software version
- Custom field to update: "sw_version"
- Assume network device list would contain Cisco Catalyst IOS, Cisco Nexus OS, Cisco ASA OS, Aruba OS, PaloAlto PAN-OS 

## Installation 

1. Set up a python virtual environment and install the following packages listed in [requeriments.txt](https://github.com/guidodg86/netbox-updater/blob/main/requeriments.txt)
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
## Main script execution

Once the devices emulator and the netbox environment are up, the main script can be executed. This script will interact with netbox and also with the emulated devices.
```bash
   source ~/netbox-updater/venv/activate
   cd ~/netbox-updater/
   python3 software_version_updater.py  
```
The script will fetch the network devices from netbox and will connect to every virtual device to gather information about the software version. If any update in netbox is needed, it will perform it.

## Execution example
Here you can see the initial status of the netbox devices, all the devices have been placed in a software version of **1,2n** as a **wrong value**
![initial status](https://raw.githubusercontent.com/guidodg86/netbox-updater/master/pics/1.png?raw=true)
After the script execution we can see the following:
![end_status](https://raw.githubusercontent.com/guidodg86/netbox-updater/master/pics/2.png?raw=true)
The logs from the devices can be found in the [example_log.txt](https://github.com/guidodg86/netbox-updater/blob/main/example_log.txt) file in this repository.
As an example here we can see one of the updates made:
![example](https://raw.githubusercontent.com/guidodg86/netbox-updater/master/pics/3.png?raw=true)

## Custom fields
The following custom fields have been created:
| Custom field | Model | Description
| ------------- | ------------- |----------------|
| sw_version | dcim \| device | Mandatory in challenge to store software version of the device |
| port | IPAM \| IP address | To save the port of the virtual device |
| sw_version_parser | dcim \| device type | Name of the function in the python file to parse the printout |
| 	command_soft_version | dcim \| device type | Command to be executed to get the current software version |

## Testing
One test for each parser function has been developed. The test are performed with [pytest](https://docs.pytest.org/en/7.1.x/). In order to test the parser function the following commands need to be executed:
```bash
   cd ~/netbox-updater/
   pytest -v 
```
