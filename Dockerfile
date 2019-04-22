# Use an existing docker image as a base
FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./

# download and install a depdendancies
RUN npm install
#Tell the image what to do when it starts as a contianer
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

