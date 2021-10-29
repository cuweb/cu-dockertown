# Carleton Dockertown

## Prerequisites

- Docker Desktop [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
- NVM (Recommended) [https://github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm)

## Installation

- Clone this repo, navigate to the folder containing the `docker-compose.yml` file, and run `docker-compose build`

## Use After Setup

Using a terminal, navigate to the folder containing the `docker-compose.yml` file

| Command                | Description                                              |
| ---------------------- | -------------------------------------------------------- |
| `docker-compose up`    | Bring up all services, composer install on cutheme / api |
| `docker-compose up -d` | Same as above, but will run in background                |
| `docker-compose down`  | Stop running containers                                  |

# URLS

- Frontend (Vue): [http://localhost/](http://localhost/)
- Backend (Laravel): [http://localhost:8081/](http://localhost:8081/)
- MailHog: [http://localhost:8025/](http://localhost:8025/)

## Running Commands on containers

- Once running, from the same directory as the docker-compose.yml
- Command structure is `docker-compose exec CONTAINER_NAME COMMAND`

## Example Commands:

- MySQL Dump to Deskop `docker-compose exec mysql mysqldump --all-databases --user=root --password=password > ~/Desktop/db.sql`
- PHP Aritsan Commans `docker-compose exec backend php artisan migrate`

## SSH to a container

- Command structure is `docker-compose exec CONTAINER_NAME sh`

### DB Access Once Running

- For TablePlus, find the connection in the \_config/sql folder
- Host: `127.0.0.1`
- Port: `3307`
- User: `root`
- Pass: `password`
