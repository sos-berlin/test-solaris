ifdef export-symbols
ifeq ($(shell uname),Linux)
exportSymbols=-Wl,--version-script=version-script
else
ifeq ($(shell uname),SunOS)
CFLAGS += -m64
exportSymbols=-Wl,-M -Wl,version-script
else
exportSymbols=
endif
endif
else
exportSymbols=
endif


run: all
	@echo
	./main TEST

all: libtest-exception.so main

libtest-exception.so: exception.o
	g++ -fPIC $(CFLAGS) exception.cpp -shared $(exportSymbols) -o libtest-exception.so
	chmod +x libtest-exception.so

main: main.o
	g++ main.o libtest-exception.so -o main

clean:
	rm -vf *.o libtest-exception.so main
