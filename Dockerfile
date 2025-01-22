# Use a lightweight Node.js v22 image as the base
FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install dependencies before copying source code for better caching
COPY package.json package-lock.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port Vite uses in dev mode
EXPOSE 5173

# Default command to run in dev mode
CMD ["npm", "run", "dev", "--", "--host"]