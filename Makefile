# === Config ===
CROSS_COMPILE := arm-linux-gnueabihf-
CC := $(CROSS_COMPILE)gcc
CFLAGS := -march=armv7-a -marm -mfpu=vfp -mfloat-abi=hard -O2
LDFLAGS := -static

PAHO_DIR := ./paho-arm
INCLUDES := -I$(PAHO_DIR)/src
LIBS := -L$(PAHO_DIR)/build/output -lpaho-mqtt3c

# === Files ===
SRC_SERVER := mqtt_server.c
SRC_CLIENT := mqtt_client.c

OUT_SERVER := mqtt_server_arm_v3
OUT_CLIENT := mqtt_client_arm_v3

# === Rules ===
all: $(OUT_SERVER) $(OUT_CLIENT)

$(OUT_SERVER): $(SRC_SERVER)
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@ $(LIBS) $(LDFLAGS)

$(OUT_CLIENT): $(SRC_CLIENT)
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@ $(LIBS) $(LDFLAGS)

clean:
	rm -f $(OUT_SERVER) $(OUT_CLIENT)
