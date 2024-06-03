
---

### 1. Choice of the Base Image on Which to Build Each Container

**Backend Container:**
- **Base Image:** `node:13.12-alpine`
- **Reasoning:** The `node:13.12-alpine` image is a lightweight version of the Node.js image. It includes the essential tools and libraries required for running a Node.js application, reducing the overall image size and improving build and run times. Alpine Linux is known for its small footprint, which helps in optimizing the performance and efficiency of the container.

**Frontend Container:**
- **Base Image:** `node:13.12-alpine`
- **Reasoning:** Similarly to the backend, the frontend container also uses `node:13.12-alpine` as the base image. This consistency ensures that both environments are similar, reducing potential discrepancies. The lightweight nature of Alpine Linux is beneficial for building and running the React application efficiently.

---

### 2. Dockerfile Directives Used in the Creation and Running of Each Container

**Backend Dockerfile:**
- **`ARG NODE_VERSION=13.12` and `FROM node:${NODE_VERSION}-alpine`:** Defines the base image for the container.
- **`ENV NODE_ENV production`:** Sets the environment variable to production by default.
- **`WORKDIR /usr/src/app`:** Sets the working directory inside the container.
- **`COPY package*.json package-lock*.json ./` and `RUN npm install`:** Copies package files and installs dependencies.
- **`USER node`:** Runs the application as a non-root user for better security.
- **`COPY . .`:** Copies the rest of the application source files into the container.
- **`EXPOSE 5000`:** Exposes port 5000 for the backend service.
- **`CMD npm start`:** Defines the command to start the Node.js application.

**Frontend Dockerfile:**
- **`FROM node:13.12-alpine AS build`:** Defines the base image for the build stage.
- **`WORKDIR /app`:** Sets the working directory inside the container.
- **`COPY package*.json package-lock.json ./` and `RUN npm install`:** Copies package files and installs dependencies.
- **`COPY . .`:** Copies the rest of the application source files into the container.
- **`EXPOSE 3000`:** Exposes port 3000 for the frontend service.
- **`CMD ["npm", "start"]`:** Defines the command to start the React application.

---

### 3. Docker-Compose Networking (Application Port Allocation and a Bridge Network Implementation)

**Networking:**
- **Network Name:** `app-network`
- **Driver:** `bridge`
- **Reasoning:** A bridge network is used to allow the containers to communicate with each other. The `app-network` bridge network is defined in the `docker-compose.yml` file, ensuring isolated and secure communication between the backend and frontend services.

**Port Allocation:**
- **Backend Service:** Ports `"5000:5000"` map port 5000 on the host to port 5000 on the container, exposing the backend service.
- **Frontend Service:** Ports `"3000:3000"` map port 3000 on the host to port 3000 on the container, exposing the frontend service.

---

### 4. Docker-Compose Volume Definition and Usage

**Volumes:**
- **Backend Volume:** `backend-data:/app/data`
  - **Purpose:** This volume persists data related to the backend service, ensuring that important data is not lost when the container is restarted or rebuilt.
- **Frontend Volume:** `frontend-data:/usr/share/nginx/html`
  - **Purpose:** This volume is used to persist the frontend build artifacts, allowing for a more efficient development workflow and potentially speeding up subsequent builds.

---

### 5. Git Workflow Used to Achieve the Task

**Git Workflow:**
- **Branching Strategy:** The workflow follows a feature-branch strategy where new features and fixes are developed in separate branches. This allows for isolated development and easier integration.
- **Commit Messages:** Clear and descriptive commit messages are used to document the changes made in each commit, facilitating easier tracking of progress and changes.
- **Pull Requests:** Changes are merged into the main branch via pull requests, which are reviewed and approved by team members to ensure code quality and consistency.
- **Continuous Integration:** Automated tests are run on each pull request to ensure that new changes do not break existing functionality.

- ### 6. Screengrab of the Docker
- ![image](https://github.com/kjmbote/yolo/assets/16819296/9a01cd58-6eeb-4a2b-b57e-b430e8577c19)

- 
-

- 
