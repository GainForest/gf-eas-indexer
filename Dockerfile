FROM node:18-alpine
WORKDIR /app
ENV NODE_ENV=production

# Install necessary dependencies
RUN apk update && apk upgrade
RUN apk add --no-cache openssl

# Set environment variables
ENV DATABASE_URL=${DATABASE_URL}
ENV INFURA_API_KEY=${INFURA_API_KEY}
ENV ALCHEMY_ARBITRUM_API_KEY=${ALCHEMY_ARBITRUM_API_KEY}
ENV ALCHEMY_SEPOLIA_API_KEY=${ALCHEMY_SEPOLIA_API_KEY}
ENV ALCHEMY_OPTIMISM_GOERLI_API_KEY=${ALCHEMY_OPTIMISM_GOERLI_API_KEY}
ENV CHAIN_ID=${CHAIN_ID}

COPY . .

COPY entrypoint.sh /app/entrypoint.sh
RUN apk update && apk add --no-cache postgresql-client
RUN chmod +x /app/entrypoint.sh
RUN yarn install
ENTRYPOINT ["/app/entrypoint.sh"]
EXPOSE 4000
