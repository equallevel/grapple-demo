# grapple-demo

A demo application to display grapple's available features and how to use them.

## Installation

Download the project and install the requisite dependencies

```sh
git clone https://github.com/EqualLevel/grapple-demo.git
cd grapple-demo.git
bundle install
```

If you want to run the app in a Docker container, use the following npm script.
It takes care of all the prerequisite setup for you.
*NOTE: You must have docker and npm installed*.

```sh
npm run serve # Initializes the database, builds the Docker image and launches a new container
# OR
npm run build
npm start
# Once you have an image, you don't need to build it over and over again
npm start # Starts/Restarts the container from an existing image
```

If you want to run the app on your local machine, you need to initialize the
database before running the rails server

```sh
npm run db:init # Initializes the database
bin/rails server -p 5000 # Start the server
```

## Available Scripts

* `npm run db:init` initializes the SQLite database. This only needs to be run once.
* `npm run build` builds the Docker image. Run this if you change the Dockerfile or add a new gem.
* `npm start` starts/restarts the container from the image. An image **must** exist before this command can be run.
* `npm run serve` initializes the database, builds an image, and starts the container. *Recommended for first time Docker setup.*
