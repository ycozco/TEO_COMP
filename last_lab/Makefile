all: main


programa: *.l
	gcc -o programa main.o

main.o: main.c
	gcc -c main.c

clear:
	rm -f programa *.c