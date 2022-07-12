FROM node:16-bullseye AS builder
WORKDIR /vue3/
COPY package*.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN yarn build
USER 1001

FROM nginx:1.21
COPY --from=builder /vue3/dist /usr/share/nginx/html/
COPY --from=builder /vue3/nginx/nginx.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
