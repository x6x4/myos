
disk_load:

;  load DH sectors to ES:BX from drive DL

push dx

;  read sector routine
mov ah, 0x02
mov al, dh

;  CHS
mov ch, 0x00
mov dh, 0x00
mov cl, 0x01  ;  from boot sector

int 0x13  ;  read intr

jc disk_error  ;  CF (carry flag) set

pop dx

cmp dh, al  ;  no. sectors actually read
jne disk_error_2
ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print_string
	pop dx
	cmp dh, al  ;  no. sectors actually read
	jne disk_error_2
	ret

disk_error_2:
    mov bx, DISK_ERROR_MSG_TWO
    call print_string
	ret

DISK_ERROR_MSG_TWO: db "Wrong number!", 0
DISK_ERROR_MSG: db "Disk read error! ", 0
