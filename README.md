# unbound-docker

unofficial [Unbound](https://unbound.net) docker image

## Tags

|tag|description|
|---|---|
|`latest`|latest multi-arch|
|`amd64`|latest amd64|
|`armv7hf`|latest armv7hf|
|`1.9.0`|multi-arch with unbound 1.9.0|
|`amd64-1.9.0`|amd64 with unbound 1.9.0|
|`armv7hf-1.9.0`|armv7hf with unbound 1.9.0|
|`1.9.0rc1`|multi-arch with unbound 1.9.0rc1| 
|`amd64-1.9.0rc1`|amd64 with unbound 1.9.0rc1|
|`armv7hf-1.9.0rc1`|armv7hf with unbound 1.9.0rc1|
|`amd64-dev`|amd64 development|
|`armv7hf-dev`|armv7hf development|

## Deployment

```bash
docker run -p 5353:53/tcp -p 5353:53/udp -e TZ=America/Toronto klutchell/unbound
```

## Parameters

* `-p 5353:53/tcp` - expose tcp port 53 on the container to tcp port 5353 on the host
* `-p 5353:53/udp` - expose udp port 53 on the container to udp port 5353 on the host
* `-e TZ=America/Toronto` - (optional) provide desired timezone from [this list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

## Testing

Testing is only supported on amd64 for now.
```bash
docker-compose -f docker-compose.test.yml -p ci up --build --abort-on-container-exit
```

## Usage

Check out the following guide for usage with [Pi-hole](https://pi-hole.net/)

* https://docs.pi-hole.net/guides/unbound/

## Author

Kyle Harding <kylemharding@gmail.com>

## Acknowledgments

* https://docs.pi-hole.net/guides/unbound/
* https://github.com/folhabranca/docker-unbound
* https://github.com/MatthewVance/unbound-docker
* https://www.balena.io/docs/reference/base-images/base-images/
* https://nlnetlabs.nl/documentation/unbound/howto-anchor/
* https://nlnetlabs.nl/documentation/unbound/howto-setup/
* http://www.linuxfromscratch.org/blfs/view/svn/server/unbound.html

## License

[MIT License](./LICENSE)