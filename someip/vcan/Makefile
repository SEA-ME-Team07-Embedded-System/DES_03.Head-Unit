# Compiler settings
CC = g++
CFLAGS = -Wall
LIBS = 

# Targets
all: can_sender can_receiver

can_sender: can_sender.cpp
	$(CC) $(CFLAGS) -o can_sender can_sender.cpp $(LIBS)

can_receiver: can_receiver.cpp
	$(CC) $(CFLAGS) -o can_receiver can_receiver.cpp $(LIBS)

clean:
	rm -f can_sender can_receiver

.PHONY: all clean

