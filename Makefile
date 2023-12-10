CC      := gcc
FLAGS   := -std=c11 -Wall -Wextra

TARGET  := main
LIBS    := -lraylib -lm
INCLUDE := -I./
SOURCE  := main.c simlib.c


clean_build: clean build

clean:
	rm -f $(TARGET)

build: main.c
	$(CC) $(FLAGS) $(LIBS) $(INCLUDE) $(SOURCE) -o $(TARGET)

