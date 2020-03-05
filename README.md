# Quartus Lite (Cyclone V environment) Dockerized

Based on https://github.com/chriz2600/quartus-lite

Image generated: theypsilon/quartus-lite-c5:17.0

Use it as base and then:
```
RUN /opt/intelFPGA_lite/quartus/bin/quartus_sh --flow compile your_core.qpf
```