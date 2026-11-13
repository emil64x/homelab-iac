FROM golang:alpine AS builder

RUN apk add --no-cache gcc musl-dev

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY main.go ./
RUN CGO_ENABLED=1 GOOS=linux go build -ldflags="-s -w" -o whatsapp-bridge main.go

FROM alpine:latest
RUN apk add --no-cache ca-certificates tzdata sqlite-libs
WORKDIR /app
COPY --from=builder /app/whatsapp-bridge /app/whatsapp-bridge

EXPOSE 8080
VOLUME ["/app/store"]

CMD ["/app/whatsapp-bridge"]
