############################
# @author EliasDH Team     #
# @see https://eliasdh.com #
# @since 01/01/2025        #
############################

# Run:
# sudo docker pull ghcr.io/eliasdh-com/minecraft-server-vanilla:latest
# sudo docker run -d --name minecraft-server-vanilla -p 25565:25565 -v minecraft-server-vanilla-data:/data ghcr.io/eliasdh-com/minecraft-server-vanilla:latest
# sudo docker logs minecraft-server
# sudo docker stop minecraft-server
# sudo docker rm minecraft-server
# sudo docker rmi ghcr.io/eliasdh-com/minecraft-server-vanilla:latest
# sudo docker volume rm minecraft-server-vanilla-data

# Directory structuur:
# ├── server/                         Generated Docker Files
# │   ├── server.jar
# │   ├── server-icon.png
# │   ├── eula.txt
# │   ├── server.properties
# │   └── ops.json
# └── data/                           Persistent Volume Claim
#     ├── logs/
#     └── world/

FROM ubuntu:25.04

# Labels for metadata
LABEL maintainer "Minecraft Server Vanilla"
LABEL version "1.0"
LABEL description "EliasDH Minecraft Server Vanilla"
LABEL org.opencontainers.image.description "EliasDH Minecraft Server Vanilla"

# Install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openjdk-21-jre-headless screen imagemagick wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
RUN mkdir /server
WORKDIR /server

# Copy configuration files
RUN echo '[{"uuid": "", "name": "EliasDehondt", "level": 4}]' > ops.json
RUN echo "eula=true" > eula.txt
RUN echo "gamemode=survival" > server.properties && \
    echo "motd=§a§lW§b§le§c§ll§d§lc§e§lo§f§lm§a§le §b§lt§c§lo §d§lE§e§ll§f§li§a§la§b§ls§c§lD§d§lH §e§lM§f§li§a§ln§b§le§c§lc§d§lr§e§la§f§lf§a§lt §b§lS§c§le§d§lr§e§lv§f§le§a§lr" >> server.properties && \
    echo "max-players=10" >> server.properties && \
    echo "difficulty=normal" >> server.properties && \
    echo "pvp=true" >> server.properties && \
    echo "spawn-protection=0" >> server.properties && \
    echo "online-mode=true" >> server.properties && \
    echo "level-name=/data/world" >> server.properties && \
    echo "server-port=25565" >> server.properties && \
    echo "view-distance=12" >> server.properties && \
    echo "simulation-distance=12" >> server.properties

# Download Minecraft server jar
RUN wget https://piston-data.mojang.com/v1/objects/e6ec2f64e6080b9b5d9b471b291c33cc7f509733/server.jar

# Download and resize server icon
RUN wget https://eliasdh.com/assets/media/images/logo-github.png -O server-icon.png
RUN convert server-icon.png -resize 64x64! server-icon.png

# Expose Minecraft port
EXPOSE 25565/tcp

# Run Minecraft server in a screen session
CMD ["java", "-Xmx6G", "-Xms4G", "-jar", "/server/server.jar", "nogui"]