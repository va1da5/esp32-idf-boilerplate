# ESP32 RTOS Project Boilerplate

## Requirements

- [Make utility](https://manpages.ubuntu.com/manpages/cosmic/man1/make.1.html)
- [ESPRESSIF ESP Toolchain for Linux](https://github.com/va1da5/esp-toolchain-docker)

## Get Started

Clone the boilerplate repository

```bash
git clone https://github.com/va1da5/esp32-idf-boilerplate.git my-awesome-project
```

The boilerplate contains a `bootstrap.sh` utility script which initiates missing project pieces. Execute the following to get started.

```bash
./bootstrap.sh
Enter project name: my-awesome-project
```

The utility script will provision `Makefile` which will point to ESP8266 RTOS SDK. It is not required to have SDK installed in the host machine. It can be used from a dedicated [container image](https://github.com/va1da5/esp-toolchain-docker). The container image needs to be build before moving further.

Once container images with `esp32` development tools are ready, we can start it and begin our development journey. Please update the device definition (`--device=/dev/ttyUSB0`) in the docker run command based on your setup.

```
current_dir=${PWD##*/}
docker run --rm -it \
  -v "${PWD}:/${current_dir}" \
  -w "/${current_dir}" \
  --device=/dev/ttyUSB0  esp32
```

Commands within container.

```bash
# run idf.py set-target without any arguments to see a list of supported targets.
root@e7c862f46b0c:/my-awesome-project# idf.py set-target <chip_name>

# idf.py menuconfig opens a text-based configuration menu where you can configure the project.
root@e7c862f46b0c:/my-awesome-project# idf.py menuconfig

# compile app, bootloader and generate a partition table based on the config.
root@e7c862f46b0c:/my-awesome-project# idf.py build

# builds, flashes and monitors serial output
root@e7c862f46b0c:/my-awesome-project# idf.py flash monitor
```

## References

- [esp-idf SDK](https://github.com/espressif/esp-idf)
- [FreeRTOS Documentation](https://www.freertos.org/Documentation/RTOS_book.html)
- [ESP32 Module Reference](http://esp32.net/)
