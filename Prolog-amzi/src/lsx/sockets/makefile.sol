C_FLAGS = -c

CC = CC

sockets.lsx: sockets.o asock_sol.plm
	$(CC) -lsocket -lnsl  -o asock.lsx -G sockets.o
	cp asock.lsx $(AMZI_DEV_DIR)/lib/
	cp asock_sol.plm $(AMZI_DEV_DIR)/abin/

sockets.o: sockets.c
	$(CC) -I$(AMZI_DEV_DIR)/include $(C_FLAGS) -o sockets.o sockets.c

asock_sol.plm: asock_sol.pro
	acmp asock_sol

clean:
	rm *.o
	rm *.plm

