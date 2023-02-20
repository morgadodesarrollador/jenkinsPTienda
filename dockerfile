# FROM ub-base
# FROM ubuntu
# FROM node:16-alpine3.14
# FROM node:19-alpine
# FROM node:16 as install
FROM node:16.3.0-alpine


ARG USUARIO
ARG PASSWD
ARG PROYECTO
ARG DB_HOST
ARG DB_NAME
ARG DB_PORT
ARG DB_USERNAME
ARG DB_PASSWORD
ARG URL_Repo_GIT
ARG NEST_PORT

ENV USUARIO=${USUARIO}
ENV PASSWD=${PASSWD}
ENV PROYECTO=${PROYECTO}
ENV DB_HOST=${DB_HOST}
ENV DB_NAME=${DB_NAME}
ENV DB_PORT=${DB_PORT}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV URL_Repo_GIT=${URL_Repo_GIT}
ENV NEST_PORT=${NEST_PORT}

# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app
COPY ./api_nest/package.json .
COPY ./api_nest/yarn.lock .
RUN yarn install

COPY ./api_nest .
# COPY ./build/conf/nginx.conf .
# RUN npm install -g npm@8.15.0
RUN yarn build

RUN cd dist
RUN pwd 
RUN node --version
RUN ls -la
RUN apk update && apk add --no-cache tail
EXPOSE 3005
CMD [ "tail -f /dev/null" ]
# CMD ["nest start"]