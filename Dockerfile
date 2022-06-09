FROM node:latest
WORKDIR /creation-docker-vue3
COPY . .
EXPOSE 3000
RUN yarn install
CMD ["yarn","run","dev","--host"]
