obj-m += imx585.o

#dtbo-y += imx585.dtbo

KDIR ?= /lib/modules/$(shell uname -r)/build

targets += $(dtbo-y)    

always-y := $(dtbo-y)

all:
	make -C $(KDIR)  M=$(shell pwd)

clean:
	make -C $(KDIR)  M=$(shell pwd) clean
