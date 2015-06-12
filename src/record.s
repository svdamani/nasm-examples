; ************************************************************** ;
; File Name  : 1.s
; Purpose    : IA-32 Assembly code for record of N students
;              and calculating average of p courses
; Programmer : Shreevardhan
; Assembling : Use the supplied makefile to assemble & execute
;
; Used data types
; db   : define byte
; resd : reserve a doubleword
;
; Macros and procedures used from library "io.mac"
; .DATA, .UDATA, .CODE, .STARTUP, .EXIT,  PutInt,  GetInt,  nwln
; ************************************************************** ;
%include "lib/io.mac"   ; Standard library file for I/O operations
.DATA                   ; Initialised Data Macro
    msg1  db  "Enter number of students : ",            0
    msg2  db  "Enter number of courses : ",             0
    msg3  db  "Enter marks of student in all courses",  0
    msg4  db  "Average marks in course (approx.) : ",   0
.UDATA                  ; Uninitialised Data Macro
    N      resd  1 
    p      resd  1
    marks  resd  100    ; Array of 100 doublewords
    tmp    resd  1      ; Temporary variable
.CODE                   ; Main code Macro
    %macro average 1    ; Macro Declaration with one argument
        mov CX, 0
        xor AX, AX

        loop4:
            add AX, [%1 + ESI]      ; Macro argument referenced here
            add ESI, [p]
            add ESI, [p]
            inc CX
            cmp CX, [N]
        jl loop4
        
        mov [tmp], DX
        mov DX, 0
        div CX
        mov DX, [tmp]

    %endmacro           ; End of macro declaration
    .STARTUP            ; Start of main function Macro
        PutStr  msg1
        GetInt  [N]     ; Input no. of students in variable N
        mov CX, [N]
        cmp CX, 0
        jle return

        PutStr  msg2
        GetInt  [p]     ; Input no. of courses in variable p
        mov DX, [p]
        cmp DX, 0
        jle return
        
        mov EBX, marks  ; Setting EBX as the address of marks[0]

        loop1:
            PutStr msg3
            nwln

            loop2:
                GetInt AX
                mov [EBX], AX
                add EBX, 2
                dec DX
            jnz loop2

            mov DX, [p]
            dec CX
        jnz loop1

        xor EBX, EBX

        loop3:
            average marks   ; Calling the declared macro here
            PutStr msg4
            PutInt AX       ; Print the calculated average
            nwln
            xor ESI, ESI
            add EBX, 2
            add ESI, EBX
            dec DX
        jnz loop3
    return:
.EXIT                       ; Macro to return control to OS