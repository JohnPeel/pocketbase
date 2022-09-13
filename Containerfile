ARG BUILDPLATFORM=${BUILDPLATFORM}
FROM --platform=${BUILDPLATFORM} alpine:3 as download

ARG POCKETBASE_VERSION=${POCKETBASE_VERSION:-0.7.2}

ARG TARGETARCH=${TARGETARCH}
ARG TARGETOS=${TARGETOS}
ARG TARGETVARIANT=${TARGETVARIANT}

RUN apk add --no-cache \
    ca-certificates \
    unzip \
    curl \
    zip \
    zlib-dev

RUN curl -Lo /tmp/pocketbase.zip "https://github.com/pocketbase/pocketbase/releases/download/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_${TARGETOS}_${TARGETARCH}${TARGETVARIANT}.zip" \
 && unzip /tmp/pocketbase.zip pocketbase -d /tmp

FROM gcr.io/distroless/static-debian11
LABEL maintainer="John Peel <john@dgby.org>"

COPY --from=download /tmp/pocketbase /usr/local/bin/pocketbase

EXPOSE 8090
VOLUME [ "/data" ]

ENTRYPOINT [ "/usr/local/bin/pocketbase", "--dir", "/data" ]
CMD [ "serve", "--http", "0.0.0.0:8090" ]
