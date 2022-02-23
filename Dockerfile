FROM golang:alpine AS builder

WORKDIR /go/src

COPY main.go /go/src

RUN CGO_ENABLED=0 go build -o /app main.go

FROM scratch

COPY --from=builder /app /

CMD ["/app"]