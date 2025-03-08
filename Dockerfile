# Use an official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Build the React application
RUN npm run build

# Install a lightweight server to serve the built application
RUN npm install -g serve

# Expose port 5000 to access the application
EXPOSE 3000

# Start the server to serve the React application
CMD ["serve", "-s", "build", "-l", "3000"]

