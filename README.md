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

## URLS

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

## DB Access Once Running

- For TablePlus, find the connection in the `_config/sql` folder
- Host: `127.0.0.1`
- Port: `3307`
- User: `root`
- Pass: `password`

## XDebug

- VSCode Extension: [https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug)
- Browser Extension: (see link for XDebug Helper Here) [https://www.jetbrains.com/help/phpstorm/browser-debugging-extensions.html](https://www.jetbrains.com/help/phpstorm/browser-debugging-extensions.html)
- Configuration is in the `.vscode` folder in the `launch.json` file
- To start debugging, click on the "Run and Debug" icon on the left side of VSCode and click "Listen for xdebug" (look for the green play button at the top of the second column).
- In your browser, make sure the above browser exention is active and browse to the site.
