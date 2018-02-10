# Steps
1. Setup Docker
1. Connecting the Database
1. Up and Running

# Setup Docker
## Building a new project

Clone this repo:
```
$ git clone git@github.com:pdarden/railsbridgenyc_docker.git
```

Create your project directory:
* Remove git remote
```
$ git remote remove origin
```
* Change directory name
```
$ cd .. && mv railsbridgenyc_docker <<new_project_name>> && cd <<new_project_name>>
```

Create a bootstrap `Gemfile` which just loads Rails:
```
$ touch Gemfile
```
Open Gemfile in your editor:
```
source 'https://rubygems.org'
gem 'rails', '5.1.4'
```

Create an empty `Gemfile.lock`:
```
$ touch Gemfile.lock
```

Build new project:
```
$ docker-compose run web rails new . --force --database=postgresql
```

Build image again:
```
$ docker-compose build
```


## Existing Project
Just add `Dockerfile` and `docker-compose.yml` to your project and run
```
$ docker-compose build
```

# Connecting the Database
In `config/database.yml`
```
# Replace `host: localhost` with
host: <%= ENV['DB_HOST'] %>
```

# Up and Running
Run
```
$ docker-compose up
```
 and visit http://localhost:3000

# Useful commands
* `docker-compose build`, build image when `Dockerfile` changes or when you want
  to update or add gems.
* `docker-compose up`, starts up containers.
* `docker-compose up -d`, starts up containers **in the background**.
* `docker-compose down`, stops containers.
* `docker-compose ps`, view container processes, container name, container id.
* `docker attach <<contianer_name>>`, attach container to interact with
  `binding.pry`. `Control + p` `Control + q `, detach from container.

# Guides
* [https://docs.docker.com/compose](https://docs.docker.com/compose)
* [https://docs.docker.com/compose/rails/#build-the-project](https://docs.docker.com/compose/rails/#build-the-project)
