FROM node:20-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    openssl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /evolution

RUN git clone https://github.com/EvolutionAPI/evolution-api.git . && \
    git checkout 1.8.2 && \
    echo "=== MONITOR LINE 325-335 ===" && \
    sed -n '325,335p' src/api/services/monitor.service.ts

COPY monitor.service.ts src/api/services/monitor.service.ts
COPY .env .env
COPY env.yml src/env.yml

RUN npm install --legacy-peer-deps
RUN npm install -g ts-node typescript

EXPOSE 8080

CMD ["ts-node", "--transpile-only", "src/main.ts"]
