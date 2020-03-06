# Quartus Lite (Cyclone V environment) Dockerized

Based on https://github.com/chriz2600/quartus-lite

Images on [docker hub](https://hub.docker.com/r/theypsilon/quartus-lite-c5): 
```
theypsilon/quartus-lite-c5:17.0.docker0
theypsilon/quartus-lite-c5:17.1.docker0
theypsilon/quartus-lite-c5:18.0.docker0
theypsilon/quartus-lite-c5:18.1.docker0
theypsilon/quartus-lite-c5:19.1.docker0
```

Use them as base and then:
```
RUN /opt/intelFPGA_lite/quartus/bin/quartus_sh --flow compile your_core.qpf
```