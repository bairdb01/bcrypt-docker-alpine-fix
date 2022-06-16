FROM node:16-alpine

# Install bcrypt dependencies python/pip/make
RUN apk update && apk add build-base
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

WORKDIR /
COPY ./package*.json .
# Optional: Rebuild to match OS
# RUN npm install && npm rebuild bcrypt --build-from-source
RUN npm install
COPY . .
CMD ["npm", "start"]
