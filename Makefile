
########## Nazev projektu #############
PROJECT:= vesmirnaTelesa
# Vlastni nazev souboru zip + pripona #
ZIPFILE := 
#######################################

CC := gcc
CFLAGS := -std=c99 -Wall -Wextra -pedantic -g -fdiagnostics-color=always

SRCS := $(wildcard *.c)
OBJS := $(addprefix bin/,$(SRCS:.c=.o))

TARGET := $(PROJECT).exe
ZIPFILE := $(if $(ZIPFILE),$(ZIPFILE),$(PROJECT).zip)

.PHONY: ph

ph: clean all

clean:
	rm -rf bin *.exe

clean-zip:
	rm -f $(ZIPFILE)

bin:
	@mkdir -p bin

zip: clean-zip
	powershell -Command "Get-ChildItem -Path '$(DIR)' -Exclude *.exe,*.o,*.zip | Compress-Archive -DestinationPath '$(ZIPFILE)' -Force"
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

bin/%.o: %.c | bin
	$(CC) $(CFLAGS) -c -o $@ $<
