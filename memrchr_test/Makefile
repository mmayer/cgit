BIN = memrchr_test
SRCS := $(wildcard ../memrchr*.c) memrchr_test.c
OBJS := $(SRCS:.c=.o)
ASMS := $(SRCS:.c=.s)

CFLAGS ?= -O -Wall

# Hackeroo to redefine memrchr() and avoid duplicate symbols
%.o: %.c
	@if echo "$^" | grep '[0-9]\.c' >/dev/null; then \
		EXTRA=-Dmemrchr=memrchr`echo "$^" | \
			sed -e 's/.*\([0-9]\)\.c/\1/'`; \
	fi; \
	$(CC) $(CPPFLAGS) $(CFLAGS) $${EXTRA} -o $@ -c $^; \
	echo $(CC) $(CPPFLAGS) $(CFLAGS) $${EXTRA} -o $@ -c $^

%.s: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -S $^

.PHONY : all
all: $(BIN)

.PHONY : asm
asm: $(ASMS)

$(BIN): $(OBJS)

.PHONY : clean
clean:
	rm -f $(OBJS) $(BIN) $(ASMS)
