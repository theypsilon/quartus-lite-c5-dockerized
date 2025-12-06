# Quartus Lite (Cyclone V environment) Dockerized

Based on https://github.com/chriz2600/quartus-lite

Images on [docker hub](https://hub.docker.com/r/theypsilon/quartus-lite-c5):
```bash
# Slim versions - Some components were removed
theypsilon/quartus-lite-c5:17.0
theypsilon/quartus-lite-c5:17.0.2
theypsilon/quartus-lite-c5:17.1
theypsilon/quartus-lite-c5:18.0
theypsilon/quartus-lite-c5:18.1
theypsilon/quartus-lite-c5:19.1

# Heavy versions - Includes all components
theypsilon/quartus-lite-c5:17.0-heavy
theypsilon/quartus-lite-c5:17.0.2-heavy
theypsilon/quartus-lite-c5:17.1-heavy
theypsilon/quartus-lite-c5:18.0-heavy
theypsilon/quartus-lite-c5:18.1-heavy
theypsilon/quartus-lite-c5:19.1-heavy
```

For image sizes, see [sizes.txt](sizes.txt).

Use them as base and then:
```dockerfile
FROM theypsilon/quartus-lite-c5:17.0
COPY . /project
RUN quartus_sh --flow compile your_core.qpf
```

Or run directly (mounts current directory to /project):
```bash
docker run -v $(pwd):/project theypsilon/quartus-lite-c5:17.0 \
    quartus_sh --flow compile your_core.qpf
```

### License

Copyright © 2020-2025, [José Manuel Barroso Galindo](https://github.com/theypsilon).
Released under the [MIT License](LICENSE).
