SOURCES := $(shell find src -name '*.fnl')
OBJECTS := $(patsubst src/%.fnl, lua/%.lua, $(SOURCES))

.PHONY: all clean

all: $(OBJECTS)
	cp lua/init.lua init.lua

clean:
	rm -rf lua

lua/%.lua: src/%.fnl
	mkdir -p $(dir $@)
	fennel --compile $< > $@


