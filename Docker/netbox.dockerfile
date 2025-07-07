############################
# @author EliasDH Team     #
# @see https://eliasdh.com #
# @since 01/01/2025        #
############################

FROM netboxcommunity/netbox:latest

# Labels for metadata
LABEL maintainer="Custom NetBox image"
LABEL version="1.0"
LABEL description="Custom NetBox image with configuration and plugins"
LABEL org.opencontainers.image.description="Custom NetBox image with configuration and plugins"

# Install wget
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Download configuration files from GitHub
RUN wget -O /etc/netbox/config/configuration.py \
    https://raw.githubusercontent.com/eliasdhcom/kubernetes-infrastructure/refs/heads/main/Assets/Python/NetBox/configuration.py && \
    wget -O /etc/netbox/config/plugins.py \
    https://raw.githubusercontent.com/eliasdhcom/kubernetes-infrastructure/refs/heads/main/Assets/Python/NetBox/plugins.py && \
    wget -O /opt/netbox/requirements.txt \
    https://raw.githubusercontent.com/eliasdhcom/kubernetes-infrastructure/refs/heads/main/Assets/Python/NetBox/requirements.txt

# New directory for "netbox-topology-views"
RUN mkdir -p /opt/netbox/netbox/static/netbox_topology_views/img

RUN /usr/local/bin/uv pip install --no-cache-dir -r /opt/netbox/requirements.txt netbox-topology-views netbox-interface-synchronization