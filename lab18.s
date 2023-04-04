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
newNodePtr:    .quad    0   // Used to add to linked list
currentNode:    .quad   0   // Used to traverse linked list

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
// Get String length + 1
    MOV X0, #20     // 19 + 1 = 20 bytes for strlen
    BL  malloc      // X0 points to dynamically allocated mem
// Store that away to tempPtr    
    LDR X1,=newNodePtr // *X1 = tempPtr
    STR X0, [X1]    // Store the dynamically allocated mem to tempPtr
    LDR X1,=newNodePtr // *X1 = tempPtr
    LDR X2,=str1    // *X2 = str1
    LDR X2, [X2]    // X2 = str1
    STR X2, [X1]    // Store str1 to dynamic memory
// Dynamically allocate for headPtr & tailPtr
    MOV X0, #16         // Allocate 16 bytes for head and tail ptrs
    BL  malloc          // That dynamic mem is pointed to by X0
    LDR X1,=newNodePtr     // *X1 = headPtr
    LDR X2,=tailPtr     // *X2 = tailPtr
    STR X0, [X1]        // Store 8 bytes to head
    STR X0, [X2, #8]    // Store the next 8 bytes to tail
// Make headPtr point to 1st node, tail to null
    LDR X3,=tempPtr     // 