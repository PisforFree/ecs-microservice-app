# Use official Node.js LTS image
FROM node:22-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json first (for caching npm install layer)
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy app source code
COPY . .

# Expose port 3000
EXPOSE 3000

# Start app
CMD [ "npm", "start" ]
