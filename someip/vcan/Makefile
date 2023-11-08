# Compiler settings
CC = g++
CFLAGS = -Wall
LIBS = 

# Targets
all: can_sender1 can_sender2  can_receiver

can_sender1: can_sender1.cpp
	$(CC) $(CFLAGS) -o can_sender1 can_sender1.cpp $(LIBS)

can_sender2: can_sender2.cpp
	$(CC) $(CFLAGS) -o can_sender2 can_sender2.cpp $(LIBS)

can_receiver: can_receiver.cpp
	$(CC) $(CFLAGS) -o can_receiver can_receiver.cpp $(LIBS)

clean:
	rm -f can_sender1 can_sender2 can_receiver

.PHONY: all clean

