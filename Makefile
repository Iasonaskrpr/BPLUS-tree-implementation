# Compiler and flags
CC = gcc
CFLAGS = -I ./include/ -L ./lib/ -Wl,-rpath,./lib/ -g -O2

# Source files
SRC = ./examples/bp_main.c \
      ./src/record.c \
      ./src/bp_file.c \
      ./src/bp_datanode.c \
      ./src/bp_indexnode.c

# Output
TARGET = ./build/bplus_main

# Build the executable
all:
	@echo "Compiling B+ Tree project..."
	$(CC) $(CFLAGS) $(SRC) -lbf -o $(TARGET)
	@echo "Build complete. Run with 'make run'."

# Run the executable removing data.db is not mandatory it can be reused
run: all
	@echo "Running program..."
	@$(TARGET)
	@echo "Cleaning up..."
	@rm -f data.db

# Clean compiled files and database
clean:
	@echo "Cleaning build and data files..."
	@rm -f $(TARGET) data.db
