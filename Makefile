CROSS_COMPILE?=
LD:=$(CROSS_COMPILE)ld
CC:=$(CROSS_COMPILE)gcc

CFLAGS+= -Wall -g
LIBS+=

all: lock 

LOCK_OBJ= lock.o

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

lock: $(LOCK_OBJ)
	@echo "Building lock tool"
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

clean:
	rm -f *.o
	rm -f lock
