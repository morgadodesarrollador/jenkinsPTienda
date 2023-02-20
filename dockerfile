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

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# RUN echo "$USUARIO, $PROYECTO, $DB_NAME" > /home/datos_dfile.txt
# RUN apt-get update && apt-get install -y -q --no-install-recommends \
#     apt-utils \
    # wget \ 
    # curl \ 
    # git \
    # nano \ 
    # sudo \ 
    # unzip \
    # dos2unix \ 
    # expect \
    # python3 \
    # ca-certificates \
    # gnupg2 \
    # nginx

# install nvm
# WORKDIR /root 
# ENV NVM_DIR /usr/local/nvm
# ENV NODE_VERSION 18.1.0
# RUN curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash 
# # install node and npm
# RUN ~/.bashrc $NVM_DIR/nvm.sh \
#     && nvm install $NODE_VERSION \
#     && nvm alias default $NODE_VERSION \
#     && nvm use default

# COPY ./start.sh /root
COPY ./build/start-nest.sh /root
COPY ./api_nest /root
COPY ./build/conf/nginx.conf /root

# COPY ./build/conf/nodesource.list /etc/apt/sources.list.d/
# RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - 
# RUN apt-get update && apt-get install -y nodejs
# RUN apt-get upadfasddate && apt-get install -y -q --no-install-recommends \
#     nodejs

# RUN dos2unix /root/start-nest.sh 
RUN chmod +x /root/start-nest.sh

EXPOSE 3005
# ENTRYPOINT [ "/root/start-nest.sh" ]
CMD [ "tail -f /dev/null" ]