; ************************************************************** ;
; File Name  : 3.s
; Purpose    : IA-32 Assembly code to input two matrices and
;              print sum of them
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
    msg1  db  "Enter no. of rows : ",       0
    msg2  db  "Enter no. of columns : ",    0
    msg3  db  "Enter contents of matrix",   0
    msg4  db  "Resultant matrix is",        0
    msg5  db  "   ",                        0
.UDATA              ; Uninitialised Data Macro
    A resd 1000
    B resd 1000
    C resd 1000
    m resd 1
    n resd 1
    p resd 1
.CODE               ; Main code Macro
.STARTUP            ; Start of main function Macro
    PutStr msg1
    GetInt [m]
    mov CX, [m]
    cmp CX, 0
jle return
    PutStr msg2
    GetInt [n]
    mov DX, [n]
    cmp DX, 0
jle return
    imul CX, DX
    mov [p], CX
    PutStr msg3
    nwln
    mov ESI, A
    l1: GetInt [ESI]
        add ESI, 2
        dec CX
    jnz l1
    PutStr msg3
    nwln
    mov CX, [p]
    mov ESI, B
    l2: GetInt [ESI]
        add ESI, 2
        dec CX
    jnz l2
    mov DX, [p]
    mov EAX, A
    mov EBX, B
    mov ECX, C
    l3: mov ESI, [EAX]
        add ESI, [EBX]
        mov [ECX], ESI
        add EAX, 2
        add EBX, 2
        add ECX, 2
        dec DX
    jnz l3
    PutStr msg4
    nwln
    mov CX, [m]
    mov DX, [n]
    mov ESI, C
    l4: PutInt [ESI]
        PutStr msg5
        add ESI, 2
        dec DX
    jnz l4
        nwln
        mov DX, [n]
        dec CX
    jnz l4
return:
.EXIT                   ; Macro to return control to OS
