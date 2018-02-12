# Rails Docker
Develop Ruby on Rails with Docker!

* Ruby 2.5.0
* Rails 5.1.4

# Prerequisite
Install Docker for your machine [here](https://www.docker.com/community-edition#/download).

# Steps
1. [Setup Docker](#setup-docker)
1. [Connecting the Database](#connecting-the-database)
1. [Up and Running](#up-and-running)

## Setup Docker
* [Building a new project](#building-a-new-project)
* [Existing Project](#existing-project)
#### Building a new project

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

#### Existing Project
Just add `Dockerfile`, `docker-compose.yml`, and `run.sh` to your project and run
```
$ docker-compose build
```

## Connecting the Database
In `config/database.yml` replace the file with this content (feel free to rename the database, see `<<my_app_name>>`):
```
default: &default
  adapter: postgresql
  encoding: unicode
  username: postgres
  password:
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: <%= ENV.fetch("DB_HOST") %>
development:
  <<: *default
  database: <<my_app_name>>_development
test:
  <<: *default
  database: <<my_app_name>>_test
production:
  <<: *default
  database: <<my_app_name>>_production
  password: <%= ENV['APP_DATABASE_PASSWORD'] %>
```

## Up and Running
* Setup the database for your project:
```
$ docker-compose run web rake db:create
$ docker-compose run web rake db:migrate
```
* Make `run.sh` excutable:
```
$ chmod +x run.sh
```
* Spinning up the rails server:
```
$ docker-compose up
```
**Note:** This will excute the commands in `run.sh`
* Visit http://localhost:3000  :rocket:

# Useful commands
* `docker-compose run web <<commands>>`, runs commands in web service container
E.g.,
```
$ docker-compose run web bin/rails c
```
* `docker-compose run web bash`, runs bash to interact with the directory inside the web service container
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
