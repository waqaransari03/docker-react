FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN apk add --update npm
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


