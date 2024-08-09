##First basic file 
# size 1.1Gb

# FROM node:20
# WORKDIR /usr/src/app
# COPY package*.json ./
# RUN npm install
# COPY . .
# EXPOSE 8080
# CMD [ "node", "HW.js" ]

# ## Second revision Muilt-stage builds

# build stage
# FROM node:20-alpine AS build
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .

# # run stage
# FROM node:20-alpine
# WORKDIR /app
# COPY --from=build /app/package*.json ./
# RUN npm install --omit=dev
# COPY --from=build /app .
# CMD ["node", "HW.js"]




### Thrid revision using containerless distro (v3 & v4)

# best security with size 124 Mb

#build stage
FROM node:20-bullseye-slim AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm prune --production

# run stage
FROM gcr.io/distroless/nodejs20-debian12
WORKDIR /app
COPY --from=build /app .
CMD ["HW.js"]


#### fourth revision experimental 3rd stage multistage 


## best size 2.18 Mb
## best security

# build stage



# # Intermediate stage
# FROM node:20-bullseye-slim AS intermediate
# WORKDIR /app
# COPY package*.json ./
# RUN npm ci
# COPY . .
# RUN npm prune --production

# # Build stage
# FROM gcr.io/distroless/nodejs20-debian11 AS build
# WORKDIR /app
# COPY --from=intermediate /app .


# # Final stage
# FROM scratch
# COPY --from=build --link /app /app 
# CMD ["/app/HW.js"]




