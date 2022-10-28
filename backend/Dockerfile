FROM node:16.17-alpine

# Docs
LABEL autor="Sport Apps Team"
LABEL vendor="Uniandes"

# Environment variables
ARG CONTAINER_PATH=.
ARG RUNTIME_FOLDER="/usr/apps"
ENV RUNTIME_FOLDER=${RUNTIME_FOLDER}

WORKDIR ${RUNTIME_FOLDER}

# Add none root user to docker container
ARG USER="uniandes"
ENV USER=${USER}

# Copy package.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Deployment artifacts
COPY ${CONTAINER_PATH} $RUNTIME_FOLDER/

# User permissions
RUN addgroup -g 1005 -S ${USER} && \
    adduser -u 1005 -S ${USER} -G ${USER} && \
    chown -R ${USER}:${USER} ${RUNTIME_FOLDER}

# Build dist
RUN npm run build

USER ${USER}

# Execution
CMD [ "node", "dist/main.js" ]