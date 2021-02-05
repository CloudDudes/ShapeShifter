FROM node:14-alpine

COPY app.js package.json ./

RUN npm install

# Command can be overwritten by providing a different command in the template directly.
EXPOSE 8080
CMD ["node", "app.js"]
