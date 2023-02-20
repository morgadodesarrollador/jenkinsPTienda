# FROM ub-base
# FROM ubuntu
# FROM node:16-alpine3.14
# FROM node:19-alpine
FROM node:16 as install
LABEL stage=install
# FROM node:16.3.0-alpine


ARG PROYECTO
ARG DB_HOST
ARG DB_NAME
ARG DB_PORT
ARG DB_USERNAME
ARG DB_PASSWORD
ARG NEST_PORT


ENV PROYECTO=${PROYECTO}
ENV DB_HOST=${DB_HOST}
ENV DB_NAME=${DB_NAME}
ENV DB_PORT=${DB_PORT}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV NEST_PORT=${NEST_PORT}

# RUN npm install -g npm@8.15.0 --force
# RUN npm install --global yarn --force
WORKDIR /app
COPY ./api_nest/package.json .
COPY ./api_nest/yarn.lock .
RUN yarn install --force

COPY ./api_nest .
RUN yarn build

WORKDIR /app/dist

# RUN node --version
# RUN ls -la ./dist
EXPOSE 3005
# CMD ["node ./dist/main.js"]
# ENTRYPOINT  node .
# ENTRYPOINT ["/app/start.sh"]
ENTRYPOINT ["tail", "-f", "/dev/null"]