BIN=xor64_fe
LD_FLAGS=
CC=clang

cxx_sources=$(wildcard src/*.cpp)
c_sources=$(wildcard src/*.c)
objects=$(patsubst src/%.cpp,build/%.o,$(cxx_sources)) $(patsubst src/%.c,build/%.o,$(c_sources))

all: build/$(BIN)


build/$(BIN): $(objects)
	$(CC) -c -o $@ $^ $(CC_FLAGS)




