#include <stdio.h>
#include <sys/types.h>

void *
memrchr(const void *s, int c, size_t n)
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
