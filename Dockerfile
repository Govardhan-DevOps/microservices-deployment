FROM node:7

	RUN apt-get update && apt install -y git && \
	WORKDIR /app
	COPY  package.json app.js config.json printer.js weather.js ./
	RUN npm install
	COPY . /app
	EXPOSE 8081
	RUN node app.js &
