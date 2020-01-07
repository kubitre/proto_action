FROM thethingsindustries/protoc as entry
ADD entrypoint.bash .
ENTRYPOINT [ "/entrypoint.bash" ]
