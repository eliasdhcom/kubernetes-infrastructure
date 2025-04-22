############################
# @author EliasDH Team     #
# @see https://eliasdh.com #
# @since 04/21/2025        #
############################

# Run:
# sudo docker pull ghcr.io/eliasdh-com/minecraft-server-allthemodes10:latest
# sudo docker run -d --name minecraft-server-allthemodes10 -p 25565:25565 -v minecraft-server-allthemodes10-data:/data ghcr.io/eliasdh-com/minecraft-server-allthemodes10:latest
# sudo docker logs minecraft-server-allthemodes10
# sudo docker stop minecraft-server-allthemodes10
# sudo docker rm minecraft-server-allthemodes10
# sudo docker rmi ghcr.io/eliasdh-com/minecraft-server-allthemodes10:latest
# sudo docker volume rm minecraft-server-allthemodes10-data

FROM ubuntu:25.04

# Labels for metadata
LABEL maintainer="Minecraft Server All The Modes 10"
LABEL version="1.2"
LABEL description="EliasDH Minecraft Server All The Modes 10"
LABEL org.opencontainers.image.description="EliasDH Minecraft Server All The Modes 10"

