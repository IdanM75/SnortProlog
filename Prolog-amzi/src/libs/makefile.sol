LIBS = \
   list.plm \
   bug.plm \
   misc.plm

.SUFFIXES: .plm .pro

.pro.plm:
	acmp $<

_libs : $(LIBS)
	cp *.plm $(AMZI_DEV_DIR)/abin

clean :
	rm *.plm

