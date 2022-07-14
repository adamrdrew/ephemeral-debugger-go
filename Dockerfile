FROM golang:1.17.12 

WORKDIR /
COPY . .
RUN CGO_ENABLED=0 go install -ldflags "-s -w -extldflags '-static'" github.com/go-delve/delve/cmd/dlv@latest
RUN CGO_ENABLED=0 go build -gcflags "all=-N -l" -o ./app

EXPOSE 2345/tcp

CMD [ "/go/bin/dlv", "--listen=:2345", "--headless=true", "--log=true", "--log-output=debugger,debuglineerr,gdbwire,lldbout,rpc", "--accept-multiclient", "--api-version=2", "exec", "./app" ]