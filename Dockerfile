FROM node:18-buster-slim as build
COPY . /wstunnel
RUN cd /wstunnel && npm install --production

FROM node:18-buster-slim
COPY --from=build /wstunnel /wstunnel
WORKDIR /wstunnel
ENTRYPOINT ["node", "/wstunnel/bin/wstt.js"]
