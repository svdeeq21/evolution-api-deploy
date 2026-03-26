FROM node:20-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    openssl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /evolution

RUN git clone --branch 1.8.7 --depth 1 https://github.com/EvolutionAPI/evolution-api.git .

COPY .env .env

RUN npm install

RUN npm run build

EXPOSE 8080

CMD ["node", "dist/main.js"]
