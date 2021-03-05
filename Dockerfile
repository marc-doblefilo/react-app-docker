# Pull Server Image
FROM node:13.12.0-alpine

# Setting workdir
WORKDIR /app

# Adding '/app/node_modules/.bin' to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Installing React modules
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# Adding to app
COPY . ./

# Starting app
CMD ["npm", "start"]
