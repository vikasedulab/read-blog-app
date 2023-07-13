# Stage 1: Compile and Build angular codebase

# use official node image as the base image
FROM node:latest as build
# set the working directory
WORKDIR /app
# Add the source code to app
COPY package.json .
RUN npm install
COPY . /app/
# install all the depencies
RUN npm run build


# stage 2: Serve app with nginx server

# use official nginx image as the base image
FROM nginx:latest
# copy the build output to replace the default nginx contents
COPY --from=build /app/dist/read-blog-app /share/nginx/html
# expose port 80
EXPOSE 80




























# Stage 1: Build the application
# FROM node:14
# WORKDIR /app

# # Copy package.json and yarn.lock to install dependencies
# # COPY ../package.json .
# COPY package.json /app/package.json



# # Install dependencies
# RUN npm install

# # Copy the rest of the application code
# COPY . .

# ENV PORT=8080

# EXPOSE 8080

# # Start Nginx when the container starts
# CMD ["npm", "start"]



# # # Build the application
# # RUN yarn build

# # # Stage 2: Create the production image
# # FROM nginx:alpine

# # # Copy the built application from the previous stage
# # COPY --from=build /app/build /usr/share/nginx/html

# # # Copy the Nginx configuration file
# # COPY nginx.conf /etc/nginx/nginx.conf

# # # Expose port 80
# # EXPOSE 80

# # # Start Nginx when the container starts
# # CMD ["nginx", "-g", "daemon off;"]
