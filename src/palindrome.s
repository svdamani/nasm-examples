; ************************************************************** ;
; File Name  : 2.s
; Purpose    : IA-32 Assembly code to find whether a string
;              is a Palindrome or not
; Programmer : Shreevardhan
; Assembling : Use the supplied makefile to assemble & execute
;
; Used data types -->
; db   : define byte
; resd : reserve a doubleword
;
; Macros and procedures used from library "io.mac" -->
; .DATA, .UDATA, .CODE, .STARTUP, .EXIT,  PutInt,  GetInt,  nwln
; ************************************************************** ;
%include "lib/io.mac"   ; Standard library file for I/O
.DATA               ; Initialised Data Macro
    msg1  db  "Enter a string : ",      0
    msg2  db  " is a Palindrome.",      0
    msg3  db  " is not a Palindrome.",  0
.UDATA              ; Uninitialised Data Macro
    string resb 1
.CODE               ; Main code Macro
.STARTUP            ; Start of main function Macro
    PutStr msg1
    GetStr string
    xor EAX, EAX
    length:
        mov DL, [string + EAX]
        inc EAX
        cmp DL, 0
    jne length
    sub EAX, 2
    mov ECX, string
    mov EDX, string
    add EDX, EAX
    PutStr string
    loop1:
        mov AL, [ECX]
        mov BL, [EDX]
        cmp AL, BL
    jne notpal
        dec EDX
        inc ECX
        cmp ECX, EDX
    jle loop1
    PutStr msg2
    jmp return
    notpal:
        PutStr msg3
return:
    nwln
.EXIT                   ; Macro to return control to OS
