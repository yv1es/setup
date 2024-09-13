# Personal Setup with Ansible

This repository contains an Ansible playbook designed to set up my favorite tools and configurations on Linux systems. The playbook will install various tools such as `tmux`, `fzf`, and `vim`, along with their respective plugins, configurations, and other essential setup details.

## Features

- **Tools Installation**: `tmux`, `fzf`, `vim`, and their plugins.
- **Configurations**: Git configurations, bash aliases, and other custom setups.

## Prerequisites

1. **Ansible**: Required to execute the playbook.
2. **Git**: Required for cloning repositories.
3. **Docker** (Optional): Required if you want to use the test/preview container.

## Installation

To install the tools and configurations locally, run the `installLocally.bash` script:

```bash
./installLocally.bash
```

## Usage and Testing

You can test changes made to the playbook or configurations in an Ubuntu container using the `runInTestContainer.bash` script. 

### Commands:

- **Run the test container**:

    ```bash
    ./runInTestContainer.bash
    ```

- **Interactive SSH Session**:

    Use the `--interactive` option to start an SSH session into the container for interactive testing:

    ```bash
    ./runInTestContainer.bash --interactive
    ```

## Note

Please be aware that a private key named `testkey` is checked into this repository. This key is used solely for connecting to the test container and must not be used for other purposes.
