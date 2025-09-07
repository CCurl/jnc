app := tc

ARCH ?= 32
CXX := clang
CFLAGS := -m$(ARCH) -O3 -D IS_LINUX

srcfiles := $(shell find . -name "*.c")
incfiles := $(shell find . -name "*.h")
LDLIBS   := -lm

# -------------------------------------------------------------------
# Targets
# -------------------------------------------------------------------

jnc: jnc.c heap.c heap.h
	$(CXX) $(CFLAGS) $(LDFLAGS) -o jnc jnc.c heap.c $(LDLIBS)
	ls -l jnc

bin: jnc
	cp -u -p jnc ~/bin/

clean:
	rm -f jnc
	rm -f test.asm
	rm -f test

# -------------------------------------------------------------------
# Scripts
# -------------------------------------------------------------------

test: jnc test.jn
	./jnc test.jn > test.asm
	fasm test.asm test
	ls -l test
	chmod +x test
