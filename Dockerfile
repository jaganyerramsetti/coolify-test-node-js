# Use official Node.js runtime as base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application files
COPY . .

# Expose the port the app runs on
EXPOSE 5900

# Set environment variable for port (can be overridden)
ENV PORT=5900

# Start the application
CMD ["node", "index.js"]

