
;  Hex to print in dx
print_hex:
	pusha
	mov bx, HEX_OUT+5

convert_loop:
	mov cx, dx
	and dx, 0x000F

	cmp dx, 0xa
	jge letter
	add dx, 48
	jmp end_loop

letter:
	add dx, 87

end_loop:
	mov [bx], dl
	add bx, -1
	shr cx, 4
	cmp cx, 0
    je the_end
	mov dx, cx
	jmp convert_loop

the_end:
	mov bx, HEX_OUT
	call print_string
	popa
	ret

HEX_OUT: db '0x0000', 0

;  String to print in bx
print_string:
	pusha
loop:
	cmp byte[bx], 0
	je end
	mov ah , 0x0e
	mov al, [bx]
	int 0x10
	add bx, 1
	jmp loop

end:
	popa
	ret

