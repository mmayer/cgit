#include <stdio.h>
#include <time.h>
#include <sys/types.h>

/*
 * Reverse memchr()
 * Find the last occurrence of 'c' in the buffer 's' of size 'n'.
 */
void *
memrchr1(const void *s, int c, size_t n)
{
    const unsigned char *cp;

    if (n != 0) {
	cp = (unsigned char *)s + n;
	do {
	    if (*(--cp) == (unsigned char)c)
		return (void *)cp;
	} while (--n != 0);
    }
    return (void *)0;
}

void *
memrchr2(const void *s, int c, size_t n)
{
	unsigned char	ch;
	const unsigned char  *cp;

	ch = c;

	cp = s;
	for (cp += n; n != 0; n--) {
		cp--;
		if (*cp == ch)
			return (void *) cp;
	}

	return NULL;
}

void *
memrchr3(const void *s, int c, size_t n)
{   
    const unsigned char *cp = (const unsigned char *)s + n; 
    const unsigned char ch = (unsigned char)c;
    while (s != cp) {
        if (*(--cp) == ch)
            return (void *)cp;
    }
	return NULL;
}

void *memrchr4(const void *m, int c, size_t n)
{
	const unsigned char *s = m;
	c = (unsigned char)c;
	while (n--) if (s[n]==c) return (void *)(s+n);
	return 0;
}


int main(int argc, char *argv[])
{
	const unsigned long loop_len = 1000000000000;
	const char demo[] = "This is my very nice test string.";
	time_t start_t, end_t;
	struct timespec tstart, tend;
	double duration, s, e;
	unsigned long i;
	char *ptr;
	
	time(&start_t);
	clock_gettime(CLOCK_MONOTONIC, &tstart);
	for (i = 0; i < loop_len; i++) {
		ptr = memrchr1(demo, 'T', sizeof(demo) - 1);
	}
	time(&end_t);
	clock_gettime(CLOCK_MONOTONIC, &tend);
	duration = (tend.tv_sec + 1.0e-9*tend.tv_nsec) - 
           (tstart.tv_sec + 1.0e-9*tstart.tv_nsec);
	printf("%d: execution time: %.5f seconds\n", __LINE__, duration);
	printf("%s\n", ptr);

	time(&start_t);
	clock_gettime(CLOCK_MONOTONIC, &tstart);
	for (i = 0; i < loop_len; i++) {
		ptr = memrchr2(demo, 'T', sizeof(demo) - 1);
	}
	time(&end_t);
	clock_gettime(CLOCK_MONOTONIC, &tend);
	duration = (tend.tv_sec + 1.0e-9*tend.tv_nsec) - 
           (tstart.tv_sec + 1.0e-9*tstart.tv_nsec);
	printf("%d: execution time: %.5f seconds\n", __LINE__, duration);
	printf("%s\n", ptr);

	time(&start_t);
	clock_gettime(CLOCK_MONOTONIC, &tstart);
	for (i = 0; i < loop_len; i++) {
		ptr = memrchr3(demo, 'T', sizeof(demo) - 1);
	}
	time(&end_t);
	clock_gettime(CLOCK_MONOTONIC, &tend);
	duration = (tend.tv_sec + 1.0e-9*tend.tv_nsec) - 
           (tstart.tv_sec + 1.0e-9*tstart.tv_nsec);
	printf("%d: execution time: %.5f seconds\n", __LINE__, duration);
	printf("%s\n", ptr);

	time(&start_t);
	clock_gettime(CLOCK_MONOTONIC, &tstart);
	for (i = 0; i < loop_len; i++) {
		ptr = memrchr4(demo, 'T', sizeof(demo) - 1);
	}
	time(&end_t);
	clock_gettime(CLOCK_MONOTONIC, &tend);
	duration = (tend.tv_sec + 1.0e-9*tend.tv_nsec) - 
           (tstart.tv_sec + 1.0e-9*tstart.tv_nsec);
	printf("%d: execution time: %.5f seconds\n", __LINE__, duration);
	printf("%s\n", ptr);

	return 0;
}
