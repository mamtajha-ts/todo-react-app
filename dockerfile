FROM node:12.18.3-alpine as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY . /app/
RUN yarn install
RUN yarn run build

FROM nginx:1.16.0-alpine
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemin off;"]
