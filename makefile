ARCH ?= 32
CXX := clang
CFLAGS := -m$(ARCH) -O3 -D IS_LINUX

# -------------------------------------------------------------------
# Targets
# -------------------------------------------------------------------

jnc: jnc.c
	$(CXX) $(CFLAGS) $(LDFLAGS) -o jnc jnc.c $(LDLIBS)
	ls -l jnc

bin: jnc
	cp -u -p jnc ~/bin/

clean:
	rm -f jnc test test.asm

# -------------------------------------------------------------------
# Scripts
# -------------------------------------------------------------------

test: jnc test.jn
	./jnc test.jn > test.asm
	fasm test.asm test
	ls -l test
	chmod +x test
	./test
