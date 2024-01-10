FROM alpine:3.18 AS builder

ARG UPX_VERSION=4.2.2

WORKDIR /upx

RUN apk --no-cache add curl tar xz
RUN ARCH=arm64; \
    if [ "$(arch)" = "x86_64" ]; then \
    ARCH=amd64; \
    fi && \
    curl -L https://github.com/upx/upx/releases/download/v${UPX_VERSION}/upx-${UPX_VERSION}-${ARCH}_linux.tar.xz -o upx.tar.xz && \
    tar -xf upx.tar.xz && mv upx-${UPX_VERSION}-${ARCH}_linux/upx . && chmod +x upx


FROM alpine:3.18
COPY --from=builder /upx/upx /usr/local/bin/upx
