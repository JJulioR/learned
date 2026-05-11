#include <stdio.h>
#include <cs50.h>

int calculate_quarters(int cents);
int calculate_dimes(int cents);
int calculate_nickels(int cents);
int calculate_pennies(int cents);

int main(void){

    // Prompt the user for change owed, in cents
    int cents;
    do{
        cents = get_int("Change owed: ");
    }
    while (cents < 0);
   // Calculate how many quarters you should give customer
    int quarters = calculate_quarters(cents);

// Subtract the value of those quarters from cents
    cents = cents - (quarters * 25);

// Calculate how many dimes you should give customer

    int dimes = calculate_dimes(cents);
// Subtract the value of those dimes from remaining cents
    cents = cents - (dimes * 10);

// Calculate how many nickels you should give customer
    int nickels = calculate_nickels(cents);

    // Subtract the value of those nickels from remaining cents

    cents = cents - (nickels * 5);

    // Calculate how many pennies you should give custome

    int pennies = calculate_pennies(cents);

    // Subtract the value of those pennies from remaining cents
       cents = cents - (pennies * 1);

    // Sum the number of quarters, dimes, nickels, and pennies used
    int pieces = quarters + dimes + nickels + pennies;
    // Print that sum
    printf("%i\n" , pieces);
}

// Calculate how many quarters you should give customer
int calculate_quarters(int cents){

     int quarters = 0;
    while( cents>= 25){

            quarters++;
            cents= cents - 25;
         }
         return quarters;
}

// Calculate how many dimes you should give customer

int calculate_dimes(int cents){

         int dimes = 0;
         while( cents>= 10){

            dimes++;
            cents= cents - 10;
         }
         return dimes;
}

    // Calculate how many nickels you should give customer

    int calculate_nickels(int cents){

         int nickels = 0;
         while( cents>= 5){

            nickels++;
            cents= cents - 5;
         }
         return nickels;
    }

    // Calculate how many pennies you should give customer
    int calculate_pennies(int cents){

         int pennies = 0;
         while( cents>= 1){

            pennies++;
            cents= cents - 1;
         }
    return pennies;
}
