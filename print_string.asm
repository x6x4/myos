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

