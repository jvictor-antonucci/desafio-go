FROM alpine:latest AS stage1

COPY ./hello.go .

RUN apk add --no-cache go \
    && go build hello.go

FROM scratch AS stage2
COPY --from=stage1 ./hello .
CMD ["./hello"]