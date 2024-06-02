# Stage 1: Build the React app
FROM node:13.12-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json  package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code to the working directory
COPY . .

EXPOSE 3000

CMD ["npm", "start"]
