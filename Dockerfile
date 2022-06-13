FROM node:16-bullseye
# RUN useradd -ms /bin/bash developer
RUN yarn global add http-server
# USER developer
WORKDIR /docker-vue3
COPY package*.json .
RUN yarn install
COPY . .
# ENV EXPOSE_PORT=ENV["EXPOSE_DOCKER_PORT"]
EXPOSE 8080
RUN yarn run build
CMD [ "http-server", "dist"]
