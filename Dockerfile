FROM docker.io/library/node:18.20.8-alpine as production
RUN mkdir /peer-server
WORKDIR /peer-server
COPY . ./
RUN npm clean-install --omit=dev
RUN npm install -g peer
ENV PORT 9000
EXPOSE ${PORT}
ENTRYPOINT ["peerjs", "--port", "9000", "--key", "peerjs", "--path", "/myapp"]
