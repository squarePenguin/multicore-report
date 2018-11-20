all:  main

main:  main.cpp
			g++ -O2 -Wall -std=c++17 -pthread main.cpp -o main

asm:   main.cpp
			g++ -O2 -Wall -std=c++17 -pthread main.cpp -S -o main.s

clean:
		rm main

