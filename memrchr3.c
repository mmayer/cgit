#include <stdio.h>
#include <sys/types.h>

void *
memrchr(const void *s, int c, size_t n)
{   
    const unsigned char *cp = (const unsigned char *)s + n; 
    const unsigned char ch = (unsigned char)c;
    while (s != cp) {
        if (*(--cp) == ch)
            return (void *)cp;
    }
	return NULL;
}
