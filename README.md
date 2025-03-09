# TwineJS Docker Container

This Docker container automates the setup for running the latest web version of TwineJS, using `oven/bun:alpine` as the base image. It's designed to be lightweight and easy to deploy.

## Features

- **Lightweight**: Utilizes `oven/bun:alpine` for a minimal footprint.
- **Automated Updates**: Fetches the latest TwineJS web version directly from GitHub releases.
- **Simplicity**: Serves TwineJS using `http-server` on port 8080.

## License

This project is licensed under the MIT License.

## Prerequisites

Docker must be installed on your system to use this container.

## Building the Image

To construct the Docker image, execute the following command within the directory that houses the Dockerfile:

```bash
docker build -t twinejs-docker .
```

## Running the Container

Launch the container with the command below:

```bash
docker run -d -p 8080:8080 --name twinejs twinejs-docker
```

This instruction initiates a container named `twinejs` exposed on port 8080. Access TwineJS by navigating to `http://localhost:8080` in your web browser.

### Data Persistence

The container declares `/var/www` as a volume, ensuring that any data within, such as custom story formats or saved stories, persists across container restarts:

```bash
docker run -d -p 8080:8080 \
  -v /path/to/local/www:/var/www \
  --name twinejs twinejs-docker
```

Adjust `/path/to/local/www` to the path of a directory on your host machine for data persistence.

## Customization

For custom server settings or port adjustments, modify the `ENTRYPOINT` directive in the Dockerfile or override the default command when starting the container. For instance, to change the server port to 9090:

```bash
docker run -d -p 9090:8080 twinejs-docker http-server -p 8080
```

## Additional Information

For further details on TwineJS, please visit the [official TwineJS GitHub repository](https://github.com/klembot/twinejs).
