FROM docker.io/golang:1.15.3 AS builder
COPY . src
RUN cd src && make build

FROM docker.io/alpine:3.12
LABEL maintainer="Dalton Hubble <dghubble@gmail.com>"
COPY --from=builder /go/src/bin/matchbox /matchbox
EXPOSE 8080
ENTRYPOINT ["/matchbox"]
