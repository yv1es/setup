#!/bin/bash 

current_user=$(whoami)

echo 
echo "Do you ($current_user) really want to run the setup playbook locally?"
read -p "(It potentially changes your configs and installed tools!) (y/n): " confirm


if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "[*] Running playbook"
    ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yaml --ask-become-pass -u $current_user 
else
    echo "[!] Exiting"
    exit 0
fi
