[org 0x7c00]
;  ES = 0x0000

mov [BOOT_DRIVE], dl  ;  BIOS stores our drive here

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000
mov dh, 3
mov dl, [BOOT_DRIVE]

call disk_load

mov dx, [0x9000]
call print_hex

mov dx, [0x9000+512]
call print_hex

mov dx, [0x9000+1024]
call print_hex

jmp $

%include "print_string.asm"
%include "disk_load.asm"

BOOT_DRIVE: db 0

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
