C_FLAGS = -c

CC = CC

aosutils.lsx: osutils.o
	$(CC) -o aosutils.lsx -G osutils.o -lc
	cp aosutils.lsx $(AMZI_DEV_DIR)/lib/

osutils.o: osutils.cpp
	$(CC) -I$(AMZI_DEV_DIR)/include $(C_FLAGS) -o osutils.o osutils.cpp

clean:
	rm *.o
