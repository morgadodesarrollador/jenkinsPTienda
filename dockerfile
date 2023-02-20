# FROM ub-base
# FROM ubuntu
FROM node:16-alpine3.14

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

COPY ./build/start-nest.sh .
COPY ./api_nest .
COPY ./build/conf/nginx.conf .
RUN npm install


#.,<jv.,<b<z
# RUN dos2unix /root/start-nest.sh 
# RUN chmod +x /root/start-nest.sh

EXPOSE 3005
# ENTRYPOINT [ "/root/start-nest.sh" ]
CMD [ "npm run start:dev" ]