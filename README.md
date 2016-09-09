Repo Info
=========
Build [Docker] image for [Cacti]..

Consuming
---------
Spin up using `docker-compose`:

```
docker-compose up -d --build
```
`docker-compose.yml`
```
version: '2'
services:
  cacti:
    image: "mrlesmithjr/cacti:latest"
    depends_on:
      - "db"
    links:
      - "db"
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - "config:/config"
    restart: "always"
    environment:
      CACTI_DB_HOST: "db"
      MYSQL_ROOT_PASSWORD: "cacti"
      MYSQL_DATABASE: "cactidb"
      MYSQL_USER: "cactiuser"
      MYSQL_PASSWORD: "cacti"
  db:
    image: "mrlesmithjr/mysql:latest"
    volumes:
      - "db:/var/lib/mysql"
    restart: "always"
    environment:
      MYSQL_ROOT_PASSWORD: "cacti"
      MYSQL_DATABASE: "cactidb"
      MYSQL_USER: "cactiuser"
      MYSQL_PASSWORD: "cacti"

volumes:
  config:
  db:
```

License
-------

BSD

Author Information
------------------

Larry Smith Jr.
- [@mrlesmithjr]
- [everythingshouldbevirtual.com]
- [mrlesmithjr@gmail.com]


[Ansible]: <https://www.ansible.com/>
[Cacti]: <http://cacti.net/>
[Docker]: <https://www.docker.com>
[@mrlesmithjr]: <https://twitter.com/mrlesmithjr>
[everythingshouldbevirtual.com]: <http://everythingshouldbevirtual.com>
[mrlesmithjr@gmail.com]: <mailto:mrlesmithjr@gmail.com>
