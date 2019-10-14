FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

# Expose the port you want elastic beanstalk to map automatically
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html