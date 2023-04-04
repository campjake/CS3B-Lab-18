// Style Sheet
// Programmer   : Jacob Campbell
// Lab #        : 18
// Purpose      : IO Read Array
// Date         : 4/6/2023

    .data
str1:  .asciz "The Cat in the Hat\n"
str2:  .asciz "\n"
str3:  .asciz  "By Dr. Seuss\n"
str4:  .asciz  "\n"
str5:  .asciz "The sun did not shine.\n"
headPtr:  .quad  0
tailPtr:  .quad  0

// 1) malloc/copy the static string (one at time).
    // a) Get the length of the string (+1 to account for the null at the end)
    // b) Pass the length to malloc, and copy the string into the new malloc'd
        // - Save it to a label so you don't have to memorize the address
// 2) Create the new node
    // a) Malloc 16 bytes (8 bytes for the &data element and 8 bytes for the &next element) for the newNode.
    // b) Store the address of previously malloc'd string in the newNode along with setting the next element to null.
    // c) Insert the newNode into the linked list.
// 3) After you have stored all 5 strings in this manner, traverse the linked list and print its strings.
// 4) (optional) Traverse your list a free everything.

    .global _start
    .text

_start:
    