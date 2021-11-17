FROM node:alpine as builder

WORKDIR '/usr/app'

COPY . .

RUN npm install

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=builder /usr/app/build /usr/share/nginx/html
