FROM node:16-bullseye AS builder
WORKDIR /vue3/
# RUN yarn global add http-server
COPY package*.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN yarn build
# USER 1001
# CMD [ "http-server", "dist"]

FROM nginx:1.21 AS runner
WORKDIR /nginx
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /vue3/dist ./
USER 1001
CMD ["systemctl", "start", "nginx"]
