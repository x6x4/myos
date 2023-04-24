;  working with data

;[org 0x7c00]

;the_secret:
;    db 'Booting OS',0


;  using BIOS routines
;mov ah, 0x0e

;  conditional jump

;cmp ax, 4
;je then_block

;mov bx, 45
;jmp the_end

;then_block:
;	mov bx, 23

;the_end:

;  stack

;mov bp, 0x8000
;mov sp, bp

;push 'A'
;push 'B'
;push 'C'

;pop bx
;mov al, bl
;int 0x10

;  memory addressing

;mov al, [0x7ffa]
;int 0x10

;mov bx, the_secret
;mov al, [bx]
;int 0x10

jmp $

;  padding and magic BIOS number

times 510 - ($-$$) db 0
dw 0xaa55
