FROM node:16-bullseye
ARG user=developer
# RUN useradd -ms /bin/bash ${user}
# USER ${user}
WORKDIR /${user}/docker-vue3
RUN yarn global add http-server
COPY package*.json .
RUN yarn install
COPY . .
RUN yarn build
ENV EXPOSE_PORT=8080
EXPOSE ${EXPOSE_PORT}
CMD [ "http-server", "dist"]
