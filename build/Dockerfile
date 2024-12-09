#
# Docker image to generate deterministic, verifiable builds of Anchor programs.
#

FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG SOLANA_CLI="v2.1.0"
ARG ANCHOR_CLI="v0.30.1"
ARG NODE_VERSION="v20.16.0"

ENV HOME="/root"
ENV PATH="${HOME}/.cargo/bin:${PATH}"
ENV PATH="${HOME}/.local/share/solana/install/active_release/bin:${PATH}"
ENV PATH="${HOME}/.nvm/versions/node/${NODE_VERSION}/bin:${PATH}"

# Install base utilities.
RUN mkdir -p /workdir && mkdir -p /tmp && \
    apt-get update -qq && apt-get upgrade -qq && apt-get install -qq \
    build-essential git curl wget jq pkg-config python3-pip \
    libssl-dev libudev-dev

# Install rust.
RUN curl "https://sh.rustup.rs" -sfo rustup.sh && \
    sh rustup.sh -y && \
    rustup component add rustfmt clippy && rustc --version

# Install node / npm / yarn.
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
ENV NVM_DIR="${HOME}/.nvm"
RUN . $NVM_DIR/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    nvm use ${NODE_VERSION} && \
    nvm alias default node && \
    npm install -g yarn && yarn --version

# Install Solana tools.
RUN sh -c "$(curl -sSfL https://release.anza.xyz/${SOLANA_CLI}/install)"

# Install anchor.
RUN cargo install --git https://github.com/coral-xyz/anchor avm --locked --force && avm install latest && avm --version && avm use latest 

# Build a dummy program to bootstrap the BPF SDK (doing this speeds up builds).
RUN mkdir -p /tmp && cd tmp && anchor init dummy && cd dummy && anchor build

# Load Account
COPY scripts/load-account.sh /usr/local/bin/load-account.sh 
RUN chmod +x /usr/local/bin/load-account.sh

# Change Anchor version
COPY scripts/anchor-version.sh /usr/local/bin/anchor-version.sh 
RUN chmod +x /usr/local/bin/anchor-version.sh

# Ensure Node.js and npm are installed 
RUN apt-get update && apt-get install -y nodejs npm
RUN npm install -g npx

# create solana dapp
COPY scripts/create-dapp.sh /usr/local/bin/create-dapp.sh
RUN chmod +x /usr/local/bin/create-dapp.sh 

WORKDIR /workdir