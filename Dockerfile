# Prepare the build environment
FROM alpine:latest as builder
RUN apk update
RUN apk add make perl lua5.4 git openssh

# Install the main emender program
WORKDIR /usr/src/emender
COPY . .
RUN make install

# Install emenbder libraries from a separate Git repository
WORKDIR /usr/src/emender-libs
RUN git clone https://github.com/emender/emender-lib.git .
RUN make install

# Store the installed emender program in a separate container without build tools
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