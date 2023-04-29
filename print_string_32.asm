[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

;  string to print in ebx.
;
;  Brief: move string and videomem ptrs until endl

print_string_32:
	pusha
	mov edx, VIDEO_MEMORY
	mov ah, WHITE_ON_BLACK

print_string_32_loop:
	mov al, [ebx]

	cmp al, 0  ;  endl
	je print_string_32_done

	mov [edx], ax  ;  al + ah = ax

	add ebx, 1
	add edx, 2

	jmp print_string_32_loop

print_string_32_done:
	popa
	ret
