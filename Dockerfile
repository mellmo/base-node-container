FROM node:boron
MAINTAINER mellouki.mhd@gmail.com

# Setup Env. variables
ARG BASE_NODE_CONTAINER_PORT=8080
ENV BASE_NODE_CONTAINER_PORT ${BASE_NODE_CONTAINER_PORT}

# Create app directory
RUN mkdir -p /var/docker/base-node-container/app
WORKDIR /var/docker/base-node-container/app

# Install app dependencies
COPY package.json /var/docker/base-node-container/app
RUN npm i

# Bundle app source
COPY . /var/docker/base-node-container/app

# Expose port
EXPOSE ${BASE_NODE_CONTAINER_PORT}

# Run the app
CMD [ "npm", "start" ]
