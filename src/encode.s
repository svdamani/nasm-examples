; ************************************************************** ;
; File Name  : 4.s
; Purpose    : IA-32 Assembly code to encode an alphanumeric 
;              string in a format
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
    msg1    db  "Enter a string : ", 0
    msg2    db  "Encoded string : ", 0
    msg3    db  "Continue (y/n) : ", 0
    encode  db  "4695031872"       , 0
.UDATA              ; Uninitialised Data Macro
    string resb 1
.CODE               ; Main code Macro
.STARTUP            ; Start of main function Macro
    l0: PutStr msg1
        GetStr string
        mov EDI, string
        l1: mov AL, [EDI]
            cmp AL, '0'
        je l2
            cmp AL, '1'
        je l2
            cmp AL, '2'
        je l2
            cmp AL, '3'
        je l2
            cmp AL, '4'
        je l2
            cmp AL, '5'
        je l2
            cmp AL, '6'
        je l2
            cmp AL, '7'
        je l2
            cmp AL, '8'
        je l2
            cmp AL, '9'
        je l2
        jmp l3
        l2: movzx ESI, AL
            mov AL, [encode + ESI - 48]
            mov [EDI], AL
        l3: inc EDI
            cmp AL, 0
        jne l1
        PutStr msg2
        PutStr string
        nwln
        PutStr msg3
        GetCh BL
        cmp BL, 'y'
    je l0
        cmp BL, 'Y'
    je l0
.EXIT                   ; Macro to return control to OS