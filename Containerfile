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

# Install the SLAXML dependency used with DocBook XML
WORKDIR /usr/src/SLAXML
RUN git clone https://github.com/Phrogz/SLAXML.git .
RUN mkdir -p /usr/local/share/lua/5.4/
RUN cp slaxml.lua /usr/local/share/lua/5.4/slaxml.lua
RUN cp slaxdom.lua /usr/local/share/lua/5.4/slaxdom.lua

# Store the installed emender program in a separate container without build tools
FROM alpine:latest
RUN apk update
RUN apk add lua5.4 libxml2-utils xmlstarlet sqlite ncurses curl
COPY --from=builder /usr/local/bin/emend /usr/local/bin/emend
COPY --from=builder /usr/local/share/doc/emender /usr/local/share/doc/emender
COPY --from=builder /usr/local/share/emender /usr/local/share/emender
COPY --from=builder /usr/local/share/man /usr/local/share/man
COPY --from=builder /usr/local/share/lua/5.4 /usr/local/share/lua/5.4
# Alpine doesn't have a generic lua binary. Specify the version
RUN sed -i s/lua/lua5.4/ /usr/local/bin/emend
# When running this container interactively, use `-v .:/mnt:Z`
# to mount the current directory in the host to the container working dir.
VOLUME ["/mnt"]
WORKDIR "/mnt"
CMD ["emend"]
