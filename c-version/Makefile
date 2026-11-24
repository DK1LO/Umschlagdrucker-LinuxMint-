CC ?= gcc
CFLAGS += -O2 -Wall -Wextra -std=gnu11 $(shell pkg-config --cflags gtk+-3.0 pangocairo)
LDLIBS += $(shell pkg-config --libs gtk+-3.0 pangocairo) -lm

all: dk1lo-umschlagdrucker
dk1lo-umschlagdrucker: main.o
	$(CC) $^ -o $@ $(LDLIBS)
main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f main.o dk1lo-umschlagdrucker
