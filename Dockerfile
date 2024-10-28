# FROM ubuntu:latest

# RUN apt-get update && apt-get install -y \
#     python3.12 \
#     python3-pip \
#     git

# RUN pip3 install PyYAML

# COPY feed.py /usr/bin/feed.py

# COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]

FROM ubuntu:latest

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3.12-distutils \
    git && \
    apt-get clean

# Install pip independently for python3.12
RUN python3.12 -m ensurepip --upgrade

# Install PyYAML using pip3.12 with --no-cache-dir
RUN pip3 install --no-cache-dir PyYAML

# Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
