_FIRSTLY INSTALL PAHO LIBRARY_

# clean will remove build file for new build.
$ make clean



# make with change variables
$ make CC=arm-linux-gnueabihf-gcc \
     CFLAGS="-march=armv7-a -marm -mfpu=vfp -mfloat-abi=hard" \
     LDFLAGS="-march=armv7-a"


# If you want the static library:
$ make install PREFIX=$(pwd)/install 



# Compile codes below here 
# IMPORTANT NOTE : use -static flag, then its gonna be fully static binary.(noo need to ship .so files)

$ arm-linux-gnueabihf-gcc mqtt_server.c \
  -I/path/to/paho.mqtt.c/src \
  -L/path/to/paho.mqtt.c/build/output \
  -lpaho-mqtt3c \
  -o mqtt_server_arm -static


$ arm-linux-gnueabihf-gcc mqtt_client.c \
  -I/path/to/paho.mqtt.c/src \
  -L/path/to/paho.mqtt.c/build/output \
  -lpaho-mqtt3c \
  -o mqtt_client_arm -static

# Send codes
$ scp mqtt_server_arm user@arm-device.local:~/mqtt_server
$ scp mqtt_client_arm user@arm-device.local:~/mqtt_client




