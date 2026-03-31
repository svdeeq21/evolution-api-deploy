FROM node:20-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    openssl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /evolution

RUN git clone https://github.com/svdeeq21/evolution-api.git .

COPY .env .env
COPY env.yml src/env.yml

RUN npm install --legacy-peer-deps

RUN npm install -g ts-node typescript

EXPOSE 8080

CMD ["ts-node", "--transpile-only", "src/main.ts"]
