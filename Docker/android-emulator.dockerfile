############################
# @author EliasDH Team     #
# @see https://eliasdh.com #
# @since 04/21/2025        #
############################
FROM budtmo/docker-android:emulator_13.0_v2.1.3-p1

# Labels for metadata
LABEL maintainer="Android Docker Image"
LABEL version="1.0"
LABEL description="EliasDH Android Docker Image"
LABEL org.opencontainers.image.description="EliasDH Android Docker Image"

# Download GPX file for location simulation
RUN wget https://raw.githubusercontent.com/eliasdhcom/kubernetes-infrastructure/refs/heads/main/Assets/route.gpx -O /route.gpx