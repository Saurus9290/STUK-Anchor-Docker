# Solana Anchor Docker Environment

This project provides a Dockerized setup for Solana development using the Anchor framework. It includes all necessary tools like Rust, Solana CLI, Node.js, and Anchor CLI to build, test, and deploy Solana programs.

## Project Structure

- **Dockerfile**: Defines the Docker image for the development environment.
- **docker-compose.yml**: Configures services like the build environment and a Solana test validator.
- **/workdir**: The default working directory inside the container.

## Prerequisites

1. Docker installed on your system.
2. Docker Compose installed.

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd sample-solana-docker

2. Run docker image
    ```bash
    docker-compose build

3. Run validator
    ```bash
    docker-compose up validator

4. Compile Anchor program
    ```bash
    docker-compose run build

5. Deploy Anchor program
    ```bash
    docker-compose run deploy

6. Run Anchor test
    ```bash
    docker-compose run test

7. For keys-sync 
    ```bash
    docker-compose run keys-sync


8. For loading account and funding it
    ```bash
    docker-compose run load-account <account_address>


9. For changing anchor version
    ```bash
    docker-compose run anchor-version <version>


10. For creating solana dapp
    ```bash
    docker-compose run create-dapp <project_name>
