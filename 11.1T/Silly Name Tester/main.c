#include <stdio.h>


void silly_name(char* name) {

printf("%s is a ", name);

    for(int i = 0; i < 60; i++)
    {
    printf("silly ");
    }
printf("name\n");
}

int main() {
    printf("Please enter your name\n");
    char name[255];

    scanf("%s", name);

    if(strcasecmp("Andrew", name) == 0)
        printf("Awesome name!\n");
    else
        silly_name(name);
    return 0;
}
