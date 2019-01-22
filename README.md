# grapple-demo

A demo Rails application to display grapple's available features and how to use them.

## Installation

Download the project and install the requisite dependencies.

```sh
git clone https://github.com/EqualLevel/grapple-demo.git
cd grapple-demo.git
bin/dev install
```

If you want to run the app in a Docker container, use the following npm script.
It takes care of all the prerequisite setup for you.
*NOTE: You must have docker and npm installed*.

```sh
bin/dev serve # Initializes the database, builds the Docker image and launches a new container
# OR
bin/dev build
bin/dev start
# Once you have an image, you don't need to build it over and over again
bin/dev start # Starts/Restarts the container from an existing image
```

If you want to run the app on your local machine for development, you need to initialize the
database before running the rails server.

```sh
bin/dev db:init # Initializes the database
bin/dev dev # Start the server
```

## Available Scripts

This is a brief overview. More in-depth instructions, run `bin/dev --help`.

* `bin/dev db:init` initializes the SQLite database. This only needs to be run once.
* `bin/dev build` builds the Docker image. Run this if you change the Dockerfile or add a new gem.
* `bin/dev start` starts/restarts the container from the image. An image **must** exist before this command can be run.
* `bin/dev stop` stops the container
* `bin/dev inspect` Accesses the container's bash terminal
* `bin/dev serve` initializes the database, builds an image, and starts the container. *Recommended for first time Docker setup.*
* `bin/dev dev` starts a local server for development
