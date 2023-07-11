FROM alpine:latest as builder
WORKDIR /usr/src/emender
COPY . .
RUN apk update
RUN apk add make perl lua5.4
RUN make install

FROM alpine:latest
COPY --from=builder /usr/local/bin/emend /usr/local/bin/emend
COPY --from=builder /usr/local/share/doc/emender /usr/local/share/doc/emender
COPY --from=builder /usr/local/share/emender /usr/local/share/emender
COPY --from=builder /usr/local/share/man /usr/local/share/man
RUN apk update
RUN apk add lua5.4 libxml2-utils xmlstarlet ncurses curl
# When running this container interactively, use `-v .:/mnt:Z`
# to mount the current directory in the host to the container working dir.
VOLUME ["/mnt"]
WORKDIR "/mnt"
CMD ["emend"]