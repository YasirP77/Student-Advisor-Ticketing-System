# Dockerfile
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY package*.json ./
COPY tsconfig.json ./

# Install dependencies
RUN apk add --no-cache postgresql-client netcat-openbsd
RUN npm install

# Copy everything else
COPY . .

# Expose ports if needed (example)
EXPOSE 3000
EXPOSE 3001

# Default (overridden by docker-compose)
CMD [ "npx", "expo", "start" ]
