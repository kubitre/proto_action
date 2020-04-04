FROM golang:1.13.0-alpine3.10 as build_plugin

RUN go get github.com/gogo/protobuf/proto && go get github.com/gogo/protobuf/protoc-gen-gofast && go get github.com/gogo/protobuf/gogoproto

FROM thethingsindustries/protoc as entry
COPY --from=build_plugin /go/bin/protoc-gen-gofast /usr/bin/
ADD entrypoint.bash .
ENTRYPOINT [ "/entrypoint.bash" ]
