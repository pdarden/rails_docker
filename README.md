# Steps
1. Setup Docker
1. Connecting the Database
1. Up and Running

# Setup Docker
## Building a new project

Create a bootstrap `Gemfile` which just loads Rails:
  ```
  touch Gemfile
  ```
Open Gemfile in your editor:
  ```
  source 'https://rubygems.org'
  gem 'rails', '5.1.4'
  ```

Create an empty `Gemfile.lock`:
  ```
  touch Gemfile.lock
  ```

Build new project:
  ```
  docker-compose run web rails new . --force --database=postgresql
  ```

Build image again:
  ```
  docker-compose build
  ```


## Existing Project
Just add `Dockerfile` and `docker-compose.yml` to your project and run
```
docker-compose build
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
docker-compose up
```
 and visit http://localhost:3000

# Guides
* [https://docs.docker.com/compose](https://docs.docker.com/compose)
* [https://docs.docker.com/compose/rails/#build-the-project](https://docs.docker.com/compose/rails/#build-the-project)
