#!/bin/bash
sudo apt update
sudo apt-get install python3-venv -y

# Test Phase
python3 -m venv venv
source venv/bin/activate
pip3 install wheel
python setup.py bdist_wheel 
pip3 install -r requirements.txt

# pytest goes here

# Deploy Phase

# Make the installation directory
sudo mkdir /opt/qa-todo-list

# Give jenkins user permissions for the installation directory
sudo chown -R jenkins /opt/qa-todo-list


sudo systemctl daemon-reload
sudo systemctl stop app.service
sudo systemctl start app.service