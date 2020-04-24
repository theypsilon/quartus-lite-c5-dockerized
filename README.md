# Quartus Lite (Cyclone V environment) Dockerized

Based on https://github.com/chriz2600/quartus-lite

Images on [docker hub](https://hub.docker.com/r/theypsilon/quartus-lite-c5): 
```bash
theypsilon/quartus-lite-c5:17.0.docker0 # 4.57GB
theypsilon/quartus-lite-c5:17.1.docker0 # 4.56GB
theypsilon/quartus-lite-c5:18.0.docker0 # 4.56GB
theypsilon/quartus-lite-c5:18.1.docker0 # 4.57GB
theypsilon/quartus-lite-c5:19.1.docker0 # 4.76GB

theypsilon/quartus-lite-c5:17.0.dockerheavy0 # 8.51GB
theypsilon/quartus-lite-c5:17.1.dockerheavy0 # 8.55GB
theypsilon/quartus-lite-c5:18.0.dockerheavy0 # 8.52GB
theypsilon/quartus-lite-c5:18.1.dockerheavy0 # 8.53GB
theypsilon/quartus-lite-c5:19.1.dockerheavy0 # 10.5GB
```

Use them as base and then:
```
RUN /opt/intelFPGA_lite/quartus/bin/quartus_sh --flow compile your_core.qpf
```

### License

Copyright © 2020, [José Manuel Barroso Galindo](https://github.com/theypsilon).
Released under the [MIT License](LICENSE).
