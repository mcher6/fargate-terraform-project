# Use official Node.js base image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy app files
COPY app/ .

# Install dependencies
RUN npm install

# Expose port and start the app
EXPOSE 80
CMD ["node", "index.js"]
