FROM node:15.0.1
ENV PORT 3000

# Create app directory
RUN mkdir -p /usr/src
WORKDIR /usr/src

# Installing dependencies
COPY package*.json /usr/src/
RUN npm install

# Copying source files
COPY . /usr/src

# EXPOSE PORT
EXPOSE 3000