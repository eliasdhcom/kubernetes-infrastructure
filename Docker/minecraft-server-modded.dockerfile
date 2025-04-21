############################
# @author EliasDH Team     #
# @see https://eliasdh.com #
# @since 04/21/2025        #
############################

# Run:
# sudo docker pull ghcr.io/eliasdh-com/minecraft-server-modded:latest
# sudo docker run -d --name minecraft-server-modded -p 25565:25565 -v minecraft-server-modded-data:/data ghcr.io/eliasdh-com/minecraft-server-modded:latest
# sudo docker logs minecraft-server-modded
# sudo docker stop minecraft-server-modded
# sudo docker rm minecraft-server-modded
# sudo docker rmi ghcr.io/eliasdh-com/minecraft-server-vanilla:latest
# sudo docker volume rm minecraft-server-modded-data

# Directory structuur:
# ├── server/                         Generated Docker Files
# │   ├── forge.jar
# │   ├── server-icon.png
# │   ├── eula.txt
# │   ├── server.properties
# │   ├── ops.json
# │   └── mods/                       Contains mod .jar files
# │       ├── appliedenergistics2.jar
# │       ├── compactmachines.jar
# │       ├── enderio.jar
# │       └── mekanism.jar
# └── data/                           Persistent Volume Claim
#     ├── logs/
#     ├── world/
#     └── mods/                       Optional for dynamic mod additions

FROM ubuntu:25.04

# Labels for metadata
LABEL maintainer="Minecraft Server Modded"
LABEL version="1.2"
LABEL description="EliasDH Minecraft Server Modded"
LABEL org.opencontainers.image.description="EliasDH Minecraft Server Modded"

# Install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openjdk-21-jre-headless screen imagemagick wget unzip
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
RUN mkdir /server /server/mods
WORKDIR /server

# Copy configuration files
RUN echo '[{"uuid": "", "name": "EliasDehondt", "level": 4}]' > ops.json
RUN echo "eula=true" > eula.txt
RUN echo "gamemode=survival" > server.properties && \
    echo "motd=§a§lW§b§le§c§ll§d§lc§e§lo§f§lm§a§le §b§lt§c§lo §d§lM§e§lo§f§ld§a§ld§b§le§c§ld §d§lS§e§le§f§lr§a§lv§b§le§c§lr" >> server.properties && \
    echo "max-players=10" >> server.properties && \
    echo "difficulty=normal" >> server.properties && \
    echo "pvp=true" >> server.properties && \
    echo "spawn-protection=0" >> server.properties && \
    echo "online-mode=true" >> server.properties && \
    echo "level-name=/data/world" >> server.properties && \
    echo "server-port=25565" >> server.properties && \
    echo "view-distance=12" >> server.properties && \
    echo "simulation-distance=12" >> server.properties

# Download Forge server (Minecraft 1.20.1, Forge 47.2.20)
RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.2.20/forge-1.20.1-47.2.20-installer.jar -O forge-installer.jar
RUN java -jar forge-installer.jar --installServer && rm forge-installer.jar

# Download mods
RUN wget https://raw.githubusercontent.com/EliasDH-com/kubernetes-infrastructure/refs/heads/main/Assets/Java/appliedenergistics2-1.20.1.jar -O mods/appliedenergistics2-1.20.1.jar
RUN wget https://raw.githubusercontent.com/EliasDH-com/kubernetes-infrastructure/refs/heads/main/Assets/Java/compactmachines-1.20.1.jar -O mods/compactmachines-1.20.1.jar
RUN wget https://raw.githubusercontent.com/EliasDH-com/kubernetes-infrastructure/refs/heads/main/Assets/Java/kubejsenderio-1.20.1.jar -O mods/kubejsenderio-1.20.1.jar
RUN wget https://raw.githubusercontent.com/EliasDH-com/kubernetes-infrastructure/refs/heads/main/Assets/Java/mekanism-1.20.1.jar -O mods/mekanism-1.20.1.jar

# Download and resize server icon
RUN wget https://eliasdh.com/assets/media/images/logo-github.png -O server-icon.png
RUN convert server-icon.png -resize 64x64! server-icon.png

# Create symbolic link for mods in /data (for persistence)
RUN ln -s /data/mods /server/mods

# Expose Minecraft port
EXPOSE 25565/tcp

# Run Minecraft server in a screen session
CMD ["java", "-Xmx8G", "-Xms6G", "-jar", "/server/forge-1.20.1-47.2.20.jar", "nogui"]