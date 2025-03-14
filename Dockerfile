# Use the official Node.js 14 image as a base
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/lafs

# Copy package.json and package-lock.json before running npm install
COPY package*.json ./

# Install Angular CLI globally (matching your installed version)
RUN npm install -g @angular/cli@12.2.18 

# Install dependencies
RUN npm install

# Install a compatible node-sass version (adjust if needed)
RUN npm install node-sass@4.14.1 

# Copy the rest of the application files
COPY . .

# Expose the port that Angular runs on
EXPOSE 4200

# Start the Angular application
CMD ["ng", "serve", "--host", "0.0.0.0"]