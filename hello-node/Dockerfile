FROM node:4.2.2
COPY logger.js /logger.js
COPY server.js /server.js
COPY package.json /package.json
RUN npm install
CMD node server.js
