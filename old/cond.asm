mov bx, 49

cmp bx, 4
jg else_if
mov al, 'A'
jmp end

else_if:
cmp bx, 40
jge else
mov al, 'B'
jmp end
else:
mov al, 'C'

end:
mov ah, 0x0e
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55
