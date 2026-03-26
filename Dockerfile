FROM node:20-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @evolution-api/evolution-api@1.8.7

WORKDIR /evolution

EXPOSE 8080

CMD ["evolution-server"]
