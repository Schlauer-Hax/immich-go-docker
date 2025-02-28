FROM debian:bullseye-slim

WORKDIR /app

ADD https://github.com/simulot/immich-go/releases/latest/download/immich-go_Linux_x86_64.tar.gz /app/immich-go_Linux_x86_64.tar.gz
RUN tar -xvf immich-go_Linux_x86_64.tar.gz

ENV PATH="/app:${PATH}"

RUN apt update && apt install -y curl

ENTRYPOINT ["immich-go"]