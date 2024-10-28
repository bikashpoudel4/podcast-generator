# FROM ubuntu:latest

# RUN apt-get update && apt-get install -y \
#     python3.10 \
#     python3-pip \
#     git

# RUN pip install PyYAML

# COPY feed.py /usr/bin/feed.py

# COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]

##### FROM MY OWN #####
FROM ubuntu:latest

# Update package list and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git \
    build-essential \
    libyaml-dev && \
    apt-get clean

# Install PyYAML using pip for Python 3.10
RUN python3.12 -m pip install --no-cache-dir PyYAML

# Copy application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
