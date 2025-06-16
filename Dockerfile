# Stage 1: Build the application
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files and install dependencies
# Using package-lock.json* to ensure it uses package-lock.json if available
COPY package.json package-lock.json* ./
RUN npm install

# Add ARGs for build-time environment variables
ARG NEXT_PUBLIC_FIREBASE_API_KEY
ARG NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN
ARG NEXT_PUBLIC_FIREBASE_PROJECT_ID
ARG NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET
ARG NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID
ARG NEXT_PUBLIC_FIREBASE_APP_ID
ARG FIREBASE_SERVICE_ACCOUNT_BASE64

# Set ENV for build-time environment variables so they are available to `npm run build`
ENV NEXT_PUBLIC_FIREBASE_API_KEY=${NEXT_PUBLIC_FIREBASE_API_KEY}
ENV NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=${NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN}
ENV NEXT_PUBLIC_FIREBASE_PROJECT_ID=${NEXT_PUBLIC_FIREBASE_PROJECT_ID}
ENV NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=${NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET}
ENV NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=${NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID}
ENV NEXT_PUBLIC_FIREBASE_APP_ID=${NEXT_PUBLIC_FIREBASE_APP_ID}
ENV FIREBASE_SERVICE_ACCOUNT_BASE64=${FIREBASE_SERVICE_ACCOUNT_BASE64}

# Copy the rest of the application code
COPY . .

# Build the Next.js application
# The build-time environment variables are passed in via build-args
RUN npm run build

# Stage 2: Production image
FROM node:18-alpine
WORKDIR /app

# Set environment to production for Next.js
ENV NODE_ENV production

# Copy built assets and necessary files from the builder stage
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

# Expose the port Next.js runs on (default for `npm start` is 3000)
EXPOSE 3000

# Command to run the application
# `npm start` executes `next start` as defined in package.json
CMD ["npm", "start"]
