#!/bin/bash
sudo apt update
sudo apt-get install python3-venv -y

# Test Phase
cd $WORKSPACE
ls -lah
sudo cp -r $WORKSPACE /opt/jenkins
sudo chown -R jenkins /opt/jenkins

cd /opt/jenkins
python3 -m venv venv
source venv/bin/activate
pip3 install wheel
python setup.py bdist_wheel 
pip3 install -r requirements.txt

# pytest goes here

# Deploy Phase

# Make the installation directory
#FILE=/opt/qa-todo-list
#if [ ! -f "$FILE" ]
#then
#    sudo mkdir /opt/qa-todo-list
#fi

# Give jenkins user permissions for the installation directory
#echo $WORKSPACE
#echo $GIT_CHECKOUT_DIR
#sudo chown -R jenkins /opt/qa-todo-list


sudo systemctl daemon-reload
sudo systemctl stop app.service
sudo systemctl start app.service

python3 app.py