CROSS_COMPILE = arm-linux-gnueabihf-
CC	= $(CROSS_COMPILE)gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o
objects2 = fibseq.o fib2.o
default: fibseq fibseq2

.PHONY: default clean qemu install

	
fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fibseq2: $(objects2)
	$(CC) $(LDFLAGS) -o $@ $^

install: fibseq fibseq2
	cp fibseq ~/rpi/nfs/test
	cp fibseq2 ~/rpi/nfs/test
fib.o: fib.s
fib2.o: fib2.s
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) $(objects2) fibseq fibseq2

QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &
CMD = yes 9 | $(call QEMU_CMD) && sleep 1
qemu: fibseq
	@yes 5 | $(call QEMU_CMD)
	@sleep 1
	@yes 6 | $(call QEMU_CMD)
	@sleep 1
	@yes 7 | $(call QEMU_CMD)
	@sleep 1
