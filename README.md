# The netbox software version update challenge

## Objectives

Create a python script to interact with netbox and some network devices

- Collect information for devices with Status = Active, Tenant = NOC in Netbox
- Information to collect: software version
- Custom field to update: "sw_version"
- Assume network device list would contain Cisco Catalyst IOS, Cisco Nexus OS, Cisco ASA OS, Aruba OS, PaloAlto PAN-OS 

## Installation 

1. Set up a python virtual environment and install the following packages listed in requeriments.txt
2. 

https://pythonhosted.org/sshim/

https://docs.netbox.dev/en/stable/installation/

source /opt/netbox/venv/bin/activate

python3 manage.py runserver 0.0.0.0:8000 --insecure

https://docs.netbox.dev/en/stable/administration/replicating-netbox/


Add file for the headers:
name = headers_auth.json in token folder
{
    "Authorization": "Token XXXxxxXXXXX",
    "Content-Type": "application/json"
}

Tests with pytest -v
