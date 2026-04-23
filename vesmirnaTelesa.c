#include <stdio.h>
#include <stdlib.h>

typedef struct{
    char nazev[50];
    int rychlost; // v km/s
    int hmotnost; //v kg
    int povrch; // v km2
}TTeleso;

int main()
{
    printf("Projekt z ...!\n");
    FILE * vstup = fopen("data.txt", "r");
    FILE * vystup = fopen("zaloha.txt", "w");
    if (vstup == NULL || vystup == NULL)
    {
        printf("Jeden ze souboru nebyl otevren.\n");
        return -1;
    }
    fclose(vstup);
    fclose (vystup);
    return 0;
}
