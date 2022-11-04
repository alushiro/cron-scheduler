
FROM oraclelinux:7-slim

RUN  yum -y install oracle-release-el7 oracle-nodejs-release-el7 && \
     yum-config-manager --disable ol7_developer_EPEL && \
     yum -y install oracle-instantclient19.3-basiclite nodejs && \
     rm -rf /var/cache/yum



#WORKDIR /myapp#
#ADD package.json /myapp/
#ADD index.js /myapp/
#RUN npm install


#CMD exec node ./







#FROM node:16
# Create app directory}

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app



# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json /usr/src/app/
RUN npm install


# If you are building your code for production
# RUN npm ci --only=production


# Bundle app source
COPY . /usr/src/app



EXPOSE 3000
CMD [ "node", "./" ]