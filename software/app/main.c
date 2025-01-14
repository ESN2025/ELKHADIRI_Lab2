#include <stdio.h>
#include <stdlib.h>
#include "system.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"

#define SEGMENT_DELAY  1000000
int int_to_bcd(alt_u16 int_value);

int int_to_bcd(alt_u16 int_value)
{
    char bcd_value[4];
    bcd_value[0] = int_value % 10;
    bcd_value[1] = int_value / 10 % 10;
    bcd_value[2] = int_value / 100 ;
    return (bcd_value[2] << 8) + (bcd_value[1] << 4) + bcd_value[0];
}

void display_number(alt_u16 number) {

    // Écrire dans le registre Avalon
    IOWR_16DIRECT(AVALON_INTERFACE_0_BASE, 0, int_to_bcd(number));
}

int main() {
    alt_u16 number = 0;
	
    while (1) {
        display_number(number);  // Afficher le nombre actuel sur 3 digits

        number++; // Incrémenter le compteur
        if (number > 999) number = 0; // Réinitialiser après 999

        // Délai pour permettre de voir l'affichage
        for (int i = 0; i < SEGMENT_DELAY; i++);
    }

    return 0;
}
