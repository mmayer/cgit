#include <stdio.h>
#include <time.h>
#include <sys/types.h>

#include "memrchr_test.h"

/*
 * void *memrchr(const void *s, int c, size_t n);
 */

void test_loop(void *(*fn)(const void *s, int c, size_t n))
{
	const unsigned long loop_len = 1000000000;
	const char demo[] = "This is my very nice test string.";
	struct timespec tstart, tend;
	double duration;
	unsigned long i;
	char *ptr;

	clock_gettime(CLOCK_MONOTONIC, &tstart);
	for (i = 0; i < loop_len; i++) {
		ptr = fn(demo, 'h', sizeof(demo) - 1);
	}
	clock_gettime(CLOCK_MONOTONIC, &tend);
	duration = (tend.tv_sec + 1.0e-9 * tend.tv_nsec) -
		(tstart.tv_sec + 1.0e-9 * tstart.tv_nsec);
	printf("execution time: %.5f seconds\n", duration);
	printf("%s\n", ptr);
}

int main(int argc, char *argv[])
{
	test_loop(memrchr);
	test_loop(memrchr2);
	test_loop(memrchr3);
	test_loop(memrchr4);
	return 0;
}
