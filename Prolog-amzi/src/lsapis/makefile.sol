HERE = $(AMZI_DEV_DIR)/src/lsapis

all: _dirs _java20 _cgi

_dirs:
	-mkdir $(AMZI_DEV_DIR)/lsapis
	-mkdir $(AMZI_DEV_DIR)/lsapis/java20
	-mkdir $(AMZI_DEV_DIR)/lsapis/cgi

_java20:
	@echo --- making java20 ---
	cd $(AMZI_DEV_DIR)/src/lsapis/java20; make -f makefile.sol

_cgi:
	@echo --- making cgi ---
	cd $(AMZI_DEV_DIR)/src/lsapis/cgi; make -f makefile.sol

clean:
	cd $(AMZI_DEV_DIR)/src/lsapis/java20; make -f makefile.sol clean
	cd $(AMZI_DEV_DIR)/src/lsapis/cgi; make -f makefile.sol clean


remove_cvs:
	-rm -r CVS
	cd $(AMZI_DEV_DIR)/src/lsapis/java20; make -f makefile.sol remove_cvs
	cd $(AMZI_DEV_DIR)/src/lsapis/cgi; make -f makefile.sol remove_cvs


