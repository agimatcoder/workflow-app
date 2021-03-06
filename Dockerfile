# build phase
FROM node:latest as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm build

# run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html