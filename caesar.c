#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

bool only_digits(string s);

int main(int argc, string argv[]){

    // Make sure program was run with just one command-line argument
    if (argc !=2){

        printf("Usage: ./caesar key\n");
        return 1;
    }


    // Make sure every character in argv[1] is a digit
    if (!only_digits(argv[1])){
        printf("Usage: ./caesar key\n");
        return 1;
    }

    // Convert argv[1] from a `string` to an `int`
    int k = atoi(argv[1]);

    // Prompt user for plaintext
    string plaintext = get_string("plaintext: ");

    printf("ciphertext: ");
    // For each character in the plaintext:
    for (int i = 0, n = strlen(plaintext); i < n; i++){

        char c = plaintext[i];

        // Rotate the character if it's a letter
        if (isupper(c)){

            char shifted = 'A' + (c - 'A' + k) %26;
            printf("%c",shifted);
        }
        else if (islower(c)){
            char shifted = 'a' + ( c - 'a' + k) %26;
            printf("%c",shifted);
        }
        else{
            printf("%c",c);
        }
    }
printf("\n");


}

bool only_digits(string s){

    for (int i = 0, n = strlen(s); i < n; i++)
{
        if (!isdigit(s[i])){
            return false;
        }
    }
    return true;
}
