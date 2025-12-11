FROM ubuntu 

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

# Set the working directory inside the container
WORKDIR /app  

COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm install

COPY server.js server.js 


ENTRYPOINT [ "node", "server.js" ]
