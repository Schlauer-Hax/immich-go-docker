FROM debian:bullseye-slim AS builder

WORKDIR /app

ADD https://github.com/simulot/immich-go/releases/latest/download/immich-go_Linux_x86_64.tar.gz /app/immich-go_Linux_x86_64.tar.gz
RUN tar -xvf immich-go_Linux_x86_64.tar.gz

FROM gcr.io/distroless/static-debian12:latest

COPY --from=builder /app/immich-go /usr/local/bin/immich-go

ENTRYPOINT ["/usr/local/bin/immich-go"]