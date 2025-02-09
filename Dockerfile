FROM golang:1.20.1-alpine

WORKDIR /app

RUN mkdir -p data

COPY go.* ./
RUN go mod download

COPY . ./

RUN go build \
    -ldflags '-w -extldflags "-static"' \
    -o /bin/verifier \
    cmd/verifier/main.go

# The CMD instruction specifies the main command to run when the container starts
CMD ["/bin/verifier"]
