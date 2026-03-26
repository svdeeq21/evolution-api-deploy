FROM node:20-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    openssl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /evolution

RUN git clone --depth 1 https://github.com/EvolutionAPI/evolution-api.git . && \
    git fetch --tags && \
    git checkout tags/1.8.2

COPY .env .env

RUN npm install --legacy-peer-deps

RUN npx tsc --skipLibCheck --noEmitOnError false || true

EXPOSE 8080

CMD ["node", "dist/main.js"]
