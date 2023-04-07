// Style Sheet
// Programmer   : Jacob Campbell
// Lab #        : 18
// Purpose      : IO Read Array
// Date         : 4/6/2023

    .data
str1:           .asciz "The Cat in the Hat\n"
str2:           .asciz "\n"
str3:           .asciz  "By Dr. Seuss\n"
str4:           .asciz  "\n"
str5:           .asciz "The sun did not shine.\n"
headPtr:        .quad  0    // Head of list, will not be updated after being set
tailPtr:        .quad  0    // Tail of list, will be updated each time a node is added
newNodePtr:     .quad  0    // Used to add to linked list
currentNode:    .quad  0    // Used to traverse linked list

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
// Use String_copy to get a malloc'd address of a copy of our string
    LDR X0,=str1            // load the string to X0
    BL  String_copy         // X0 points to a malloc's string's address
    MOV X19, X0             // Copy the address of our new string to X19

// Dynamically allocate for our new node
    MOV X0, #16         // Allocate 16 bytes for new string and tail
    BL  malloc          // That dynamic mem is pointed to by X0 (newNode = new Node)
    LDR X20,=newNodePtr // Load label of newNodePtr to X20
    STR X0, [X20]       // Save the address of newNode to address of newNodePtr
    STR X19, [X0]       // Store address of new string from str_cpy
    MOV X19, #0         // Move NULL into X19
    STR X19, [X0, #8]   // Store the null into next field of our struct/node
    // first 8 bytes of node contain the string, second 8 bytes are tail (NULL for now)

// Head needs to point to the first element in list
    LDR X1,=headPtr     // *X1 = headPtr, a pointer to the first node, which points to the address of a string
    STR X0, [X1]        // head = node1
    LDR X2,=tailPtr     // *X2 = tailPtr, which holds nothing right now
    STR X0, [X2]        // tail = node1

// Get node2
// Use String_copy to get a malloc'd address of a copy of our string
    LDR X0,=str2        // Load the string to X0
    BL  String_copy     // X0 points to a malloc's string's address
    MOV X19, X0         // Copy that address to X19
// Dynamically allocate for the node
    MOV X0, #16         // Allocate 16 bytes for new string and tail
    BL  malloc          // Dynamic mem is pointed to by X0
    STR X19, [X0]       // Store new string to new node
    LDR X20,=newNodePtr // Load label newNodePtr to X20, which points to node1
    STR X0, [X20]       // Store the address of the node to memory
    MOV X19, #0         // Reuse X19 to hold NULL for tail
    STR X19, [X0, #8]   // Dereference to get the newNode, with 8 byte offset to get tail

    LDR X2,=tailPtr     // Load the address of node1 to X2
    LDR X2, [X2]        // Dereference to get the address
    STR X0, [X2, #8]    // Store the address of node2 to node1.tail
    LDR X2,=tailPtr     // Load the address of node1
    STR X0, [X2]        // node1.tail = address of node2

// Get node3
// Use String_copy to get a malloc'd address of a copy of our string
    LDR X0,=str3        // Load the string to X0
    BL  String_copy     // X0 points to a malloc's string's address
    MOV X19, X0         // Copy that address to X19
// Dynamically allocate for the node
    MOV X0, #16         // Allocate 16 bytes for new string and tail
    BL  malloc          // Dynamic mem is pointed to by X0
    STR X19, [X0]       // Store new string to new node
    LDR X20,=newNodePtr // Load label newNodePtr to X20, which points to node1
    STR X0, [X20]       // Store the address of the node to memory
    MOV X19, #0         // Reuse X19 to hold NULL for tail
    STR X19, [X0, #8]   // Dereference to get the newNode, with 8 byte offset to get tail

    LDR X2,=tailPtr     // Load the address of node1 to X2
    LDR X2, [X2]        // Dereference to get the address
    STR X0, [X2, #8]    // Store the address of node2 to node1.tail
    LDR X2,=tailPtr     // Load the address of node1
    STR X0, [X2]        // node1.tail = address of node2

// Get node4
// Use String_copy to get a malloc'd address of a copy of our string
    LDR X0,=str4        // Load the string to X0
    BL  String_copy     // X0 points to a malloc's string's address
    MOV X19, X0         // Copy that address to X19
// Dynamically allocate for the node
    MOV X0, #16         // Allocate 16 bytes for new string and tail
    BL  malloc          // Dynamic mem is pointed to by X0
    STR X19, [X0]       // Store new string to new node
    LDR X20,=newNodePtr // Load label newNodePtr to X20, which points to node1
    STR X0, [X20]       // Store the address of the node to memory
    MOV X19, #0         // Reuse X19 to hold NULL for tail
    STR X19, [X0, #8]   // Dereference to get the newNode, with 8 byte offset to get tail

    LDR X2,=tailPtr     // Load the address of node1 to X2
    LDR X2, [X2]        // Dereference to get the address
    STR X0, [X2, #8]    // Store the address of node2 to node1.tail
    LDR X2,=tailPtr     // Load the address of node1
    STR X0, [X2]        // node1.tail = address of node2

// Get node5
// Use String_copy to get a malloc'd address of a copy of our string
    LDR X0,=str5        // Load the string to X0
    BL  String_copy     // X0 points to a malloc's string's address
    MOV X19, X0         // Copy that address to X19
// Dynamically allocate for the node
    MOV X0, #16         // Allocate 16 bytes for new string and tail
    BL  malloc          // Dynamic mem is pointed to by X0
    STR X19, [X0]       // Store new string to new node
    LDR X20,=newNodePtr // Load label newNodePtr to X20, which points to node1
    STR X0, [X20]       // Store the address of the node to memory
    MOV X19, #0         // Reuse X19 to hold NULL for tail
    STR X19, [X0, #8]   // Dereference to get the newNode, with 8 byte offset to get tail

    LDR X2,=tailPtr     // Load the address of node1 to X2
    LDR X2, [X2]        // Dereference to get the address
    STR X0, [X2, #8]    // Store the address of node2 to node1.tail
    LDR X2,=tailPtr     // Load the address of node1
    STR X0, [X2]        // node1.tail = address of node2

    

// How do we insert a new node?
// if the list is empty, head = newNode, tail = newNode
// else tail->next = newNode, tail = newNode

// To free the list
// Initialize X0 - X3 before using free()
    MOV X0, #0
    MOV X1, #0
    MOV X2, #0
    MOV X3, #0

    LDR X19,=headPtr     // Load address of headPtr label
    LDR X19, [X19]        // Dereference to get the address of the first node
    MOV X20, X19          // Copy address of the node to X2
    LDR X0, [X19]        // Dereference to get the value of the first node, which is the address of the new string
    BL  free            // Free up that memory

    MOV X0, X19          // Copy the address of the first node
    LDR X19, [X20, #8]    // Get the tail, which points to the next node
    BL  free            // Frees the node in X0 

    MOV X20, X19        // Copy address of second node to X20
    LDR X0, [X19]       // Load the address of the new string to X0
    BL  free            // Free up the memory from the string

    MOV X0, X19         // Copy the address of the second node to X0
    LDR X19, [X20, #8]  // Load the tail to X19, which points to node3
    BL  free            // Free up memory for node2



// Call kernel to end program
	MOV	X0, #0				// Return code 0 (iosetup)
	MOV	X8, #93				// Service command 93 (exit)
	SVC	0					// Service code 0 (iosetup)
	.end					// End of program
