FROM node:14-alpine

WORKDIR /usr/src/app

COPY . ./
RUN yarn

EXPOSE 3000

ENV HOST=0.0.0.0
ENV PORT=3000

RUN yarn generate

CMD [ "yarn", "start" ]
