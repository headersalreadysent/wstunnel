FROM node:18.16.1-buster as build
COPY . /wstunnel
RUN cd /wstunnel && npm install --production

FROM node:18.16.1-buster-slim
COPY --from=build /wstunnel /wstunnel
WORKDIR /wstunnel
ENTRYPOINT ["node", "/wstunnel/bin/wstt.js"]
