#!/bin/bash

show_help() {
    echo "Usage: $0 [options]"
    echo ""
    echo "Options:"
    echo "  -i, --interactive    Start an interactive SSH session after playbook execution."
    echo "  -h, --help           Display this help menu."
}

interactive=false 

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -i|--interactive)
            interactive=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done


# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo "[!] This script requires root privileges because of docker. Exiting..."
    exit 1
fi

cd test_container

echo "[*] Setting up test container"
sudo ./setupTestContainer.bash


echo "[*] Applying playbook to container"
sudo ./runPlaybook.bash
exit_code=$?

# Check if the playbook was successful and if interactive mode is enabled
if [ $exit_code -eq 0 ]; then
    if [ "$interactive" = true ]; then
        echo "[*] Starting an interactive SSH session where you can verify the setup."
        ./connectSSH.bash
    fi
fi

echo "[*] Removing test container"
sudo ./cleanUpTestContainer.bash

if [ $exit_code -eq 0 ]; then
    echo "[*] Playbook run successfully!"
else
    echo "[!] Playbook run failed!"
fi
