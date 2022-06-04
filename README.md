# netbox-updater

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