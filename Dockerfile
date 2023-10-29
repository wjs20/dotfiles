# Use Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=non-interactive

# Run package updates and install packages
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    python3-pip \
    python3-venv \
    bash \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a new user and add to sudoers
RUN useradd -m developer && echo "developer:developer" | chpasswd && adduser developer sudo

# Switch to the new user
USER developer

# Set the working directory
WORKDIR /home/developer

# Start the bash shell
CMD ["/bin/bash"]
