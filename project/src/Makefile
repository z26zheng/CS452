#
# Makefile for busy-wait IO tests
#
XCC=gcc
AS=as
LD=ld
CFLAGS=-c -fPIC -Wall -I. -I../include/ -mcpu=arm920t -msoft-float 
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map timer.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../../lib

all:  timer.s io.s a0.s a0.s train_control.s sensor.s a0.elf

io.s: io.c
	$(XCC) -S $(CFLAGS) io.c

timer.s: timer.c 
	$(XCC) -S $(CFLAGS) timer.c

train_control.s: train_control.c	
	$(XCC) -S $(CFLAGS) train_control.c

a0.s: a0.c	
	$(XCC) -S $(CFLAGS) a0.c

sensor.s: sensor.c	
	$(XCC) -S $(CFLAGS) sensor.c



timer.o: timer.s
	$(AS) $(ASFLAGS) -o timer.o timer.s

io.o: io.s
	$(AS) $(ASFLAGS) -o io.o io.s

train_control.o: train_control.s
	$(AS) $(ASFLAGS) -o train_control.o train_control.s

a0.o: a0.s
	$(AS) $(ASFLAGS) -o a0.o a0.s

sensor.o: sensor.s
	$(AS) $(ASFLAGS) -o sensor.o sensor.s



# MUST add .o file here:
a0.elf: timer.o io.o train_control.o a0.o sensor.o
	$(LD) $(LDFLAGS) -o $@ timer.o io.o train_control.o a0.o sensor.o -lgcc #-lbwio

clean:
	-rm -f *.elf *.s *.o *.map
