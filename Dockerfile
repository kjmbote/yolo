ARG NODE_VERSION=13.12

FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
ENV NODE_ENV production


WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files into the image.
COPY package*.json package-lock*.json ./

# Install the application dependencies.
RUN npm install

# Run the application as a non-root user.
USER node

# Copy the rest of the source files into the image.
COPY . .

# Expose the port that the application listens on.
EXPOSE 5000

# Run the application.
CMD npm start
