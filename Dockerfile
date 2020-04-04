FROM golang:1.14.1-alpine3.11 as build_plugin

RUN apk update && apk add git

RUN go get github.com/gogo/protobuf/proto && go get github.com/gogo/protobuf/protoc-gen-gogofast && go get github.com/gogo/protobuf/gogoproto

FROM thethingsindustries/protoc as entry
COPY --from=build_plugin /go/bin/protoc-gen-gogofast /usr/bin/
ADD entrypoint.bash .
ENTRYPOINT [ "/entrypoint.bash" ]
