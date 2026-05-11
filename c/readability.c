#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);

int main (void){

    // demande le texte à l'utilisateur
    string text = get_string("Text: ");

    // On applique les 3 fonctipns sur le text
    int letters = count_letters(text);
    int words = count_words(text);
    int sentences = count_sentences(text);

    // L : pourcentage de lettres par 100 mots

    float L = 100 * letters / (float) words;

    // S : pourcentage de phrase par 100 mot
    float S = 100 * sentences / (float) words;

    // Formule Coleman-Liau
    float index = 0.0588 * L - 0.296 * S - 15.8;
    index = round(index);

    //affiche les grades
    if (index < 1){

        printf("Before Grade 1\n");
    }
    else if (index > 16){

        printf("Grade 16+\n");
    }
    else{
        printf("Grade %i\n", (int)index);
    }

    return 0;
}

// fonction compte les lettres maj et min
   int count_letters(string text){

    int count = 0;

    for (int i = 0, n = strlen(text); i < n; i++){

        // isalpha regarde si c'est un char alphabétique

        if (isalpha(text[i])){

            count++;
        }
    }
    return count;
}

//fonction qui compte les mots
     int count_words(string text){

        int count = 0;

        // savoir si on est dans un mot ou non
        bool in_word = false;

        for (int i = 0, n = strlen(text); i < n; i++){

            if (text[i] != ' '){

                if (!in_word){
                    count++;//+1 nouveau mot
                    in_word = true; // On est dans un mot
                }
            }
            else{
                in_word = false;
            }
        }
        return count;
     }

//fonction qui compte les phrases en fonction de la ponctuation

int count_sentences(string text){

    int count = 0;

    for (int i = 0, n = strlen(text); i < n; i++){

        if (text[i] == '.' || text[i] == '?' || text[i] == '!'){

            count++;
        }
    }
    return count;
}
