BIN=xor64_fe

CC_FLAGS  = -Isrc/include -std=c23
CXX_FLAGS = -Isrc/include -std=c++23 -fmodules-ts
LD_FLAGS  = -lm
CC=gcc
CXX=g++
LD=gcc

cxx_sources=$(wildcard src/*.cpp)
c_sources=$(wildcard src/*.c)
objects=$(patsubst src/%.cpp,bin/obj/%.cpp.o,$(cxx_sources)) $(patsubst src/%.c,bin/obj/%.c.o,$(c_sources))

all: bin/$(BIN)
	@rm -r bin/obj
	
keep: bin/$(BIN)

clean:
	rm -r bin/obj/


bin/$(BIN): $(objects)
	$(LD)  -o $@ $^ $(LD_FLAGS)

bin/obj/%.cpp.o: src/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) -c -o $@ $^ $(CXX_FLAGS)

bin/obj/%.c.o: src/%.c
	@mkdir -p $(dir $@)
	$(CC) -c -o $@ $^ $(CC_FLAGS)