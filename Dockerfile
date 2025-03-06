FROM oven/bun:alpine
LABEL authors="Brandon Tom <magicink@gmail.com>"

# Install curl, jq, and unzip
RUN apk update && apk add --no-cache curl jq unzip

# Set the working directory
WORKDIR /var/www

# Download and unpack the latest web version of TwineJS
RUN curl -s https://api.github.com/repos/klembot/twinejs/releases/latest \
    | jq -r '.assets[] | select(.name | endswith("web.zip")).browser_download_url' \
    | xargs curl -L -o twinejs-web.zip \
    && unzip twinejs-web.zip \
    && rm twinejs-web.zip

# Move the files from "web/" to the root of the working directory
RUN mv web/* . \
    && rm -rf web

RUN bun add --global http-server

VOLUME [ "/var/www" ]

EXPOSE 8080

ENTRYPOINT ["http-server", "-p", "8080"]
