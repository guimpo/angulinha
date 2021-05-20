FROM node:14.16.1

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

USER root

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
#RUN npm install -g @angular/cli@11.2.13
RUN npm install -g @angular/cli@10.2.3

# add app
COPY . /app

RUN chown -R node:node /app

USER node

VOLUME ["/app"]

EXPOSE 4200

CMD /bin/bash
