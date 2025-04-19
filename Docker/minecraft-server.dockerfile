############################
# @author EliasDH Team     #
# @see https://eliasdh.com #
# @since 01/01/2025        #
############################
FROM ubuntu:24.04

# Labels for metadata
LABEL maintainer "Minecraft Server"
LABEL version "1.0"
LABEL description "EliasDH Minecraft Server"
LABEL org.opencontainers.image.description "EliasDH Minecraft Server"

# Install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openjdk-21-jre-headless screen imagemagick wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /minecraft

# Copy ops.json and server.properties configurations
RUN echo '[{"uuid": "", "name": "EliasDehondt", "level": 4}]' > ops.json
RUN echo "eula=true" > eula.txt
RUN echo "gamemode=survival" > server.properties && \
    echo "motd=Welcome to EliasDH Minecraft Server" >> server.properties && \
    echo "max-players=100" >> server.properties && \
    echo "difficulty=normal" >> server.properties && \
    echo "pvp=true" >> server.properties && \
    echo "spawn-protection=0" >> server.properties && \
    echo "online-mode=true" >> server.properties && \
    echo "seed=694200000097885" >> server.properties

# Download Minecraft server jar
RUN wget https://piston-data.mojang.com/v1/objects/e6ec2f64e6080b9b5d9b471b291c33cc7f509733/server.jar

# Download and resize server icon
RUN wget https://eliasdh.com/assets/media/images/logo-github.png -O server-icon.png
RUN convert server-icon.png -resize 64x64! server-icon.png

# Expose Minecraft port
EXPOSE 25565/tcp

# Run Minecraft server in a screen session
CMD ["screen", "-DmS", "minecraft", "java", "-Xmx1G", "-Xms1G", "-jar", "server.jar", "nogui"]