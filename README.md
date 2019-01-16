# grapple-demo

A demo application to display grapple's available features and how to use them.

## Installation

Download the project and install the requisite dependencies

```sh
git clone https://github.com/EqualLevel/grapple-demo.git
cd grapple-demo.git
bundle install
```

If you want to run the app in a Docker container, use the following npm scripts.
*NOTE: You must have docker and npm installed*.

```sh
npm run serve # Builds the Docker image and launches a new container
```

If you want to run the app on your local machine, use

```sh
bin/rails server -p 5000
```

## Available Scripts

* `npm run build` builds the Docker image
* `npm start` starts/restarts the container from the image. `npm run build` must be called before this script.
* `npm run serve` builds and starts the container
