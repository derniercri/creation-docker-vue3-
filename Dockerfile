FROM node:16-bullseye
WORKDIR /app
RUN yarn global add http-server
COPY package*.json .
RUN yarn install
COPY . .
RUN yarn build
USER 1001
CMD [ "http-server", "dist"]
