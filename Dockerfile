FROM golang:1.13.0-buster

WORKDIR /go/src

# add apt dependencies 
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# install tools
RUN apt-get update
RUN apt-get -y install zip unzip

# install protocol buffers
RUN curl -OL https://github.com/google/protobuf/releases/download/v3.9.1/protoc-3.9.1-linux-x86_64.zip
RUN unzip protoc-3.9.1-linux-x86_64.zip -d protoc3
RUN mv protoc3/bin/* /usr/local/bin/
RUN mv protoc3/include/* /usr/local/include/
RUN go get -u github.com/golang/protobuf/protoc-gen-go

# install grpc for golang lib
RUN go get -u google.golang.org/grpc

# build synerex daemon
WORKDIR /synerex_simulation
COPY /provider/visualization/visualization-provider.go ./provider/visualization/
COPY /provider/visualization/go.mod ./provider/visualization/
COPY /provider/visualization/monitor/build ./provider/visualization/monitor/build
COPY /provider/simutil ./provider/simutil
COPY /util ./util
COPY /api ./api
COPY /nodeapi ./nodeapi


# expose port
#EXPOSE 10000
WORKDIR /synerex_simulation/provider/visualization
RUN go build visualization-provider.go
ENTRYPOINT [ "./visualization-provider" ]