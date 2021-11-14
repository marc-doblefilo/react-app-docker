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

# Adding to app
COPY check-react.sh ./

# Starting app
RUN chmod +x /app/check-react.sh
CMD ["sh", "/app/check-react.sh"]
