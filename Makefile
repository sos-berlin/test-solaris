run: all
	@echo
	./main TEST

all: libtest-exception.so main

libtest-exception.so: exception.o
	g++ -fPIC exception.cpp -shared -Wl,--version-script=version-script -o libtest-exception.so
	chmod +x libtest-exception.so

main: main.o
	g++ main.o libtest-exception.so -o main

clean:
	rm -vf *.o libtest-exception.so main
