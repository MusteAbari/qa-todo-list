#!/bin/bash
cd /opt/qa-todo-list
sudo python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
python3 app.py