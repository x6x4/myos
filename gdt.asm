;  byte - minimal addressable unit
;  dd = 2 dw = 4 db

gdt_start:

gdt_null:	;  null descriptor (address 0x0)
	dd 0x0
	dd 0x0

gdt_code:	;  code segment descriptor
	dw 0xffff	;  limit 0-15
	dw 0x0		;  base 0-15
	db 0x0		;  base 16-23

	;  1st flags: present, privilege, descriptor type
	db 1001b
	;  type flags: code, conforming, readable, accessed
	db 1010b
	;  2nd flags: granularity, 32-bit default, 64-bit seg, avl
	db 1100b
	;  limit 16-19, base 24-31
	db 1111b
	db 0x0

gdt_data:	;  data segment descriptor
	dw 0xffff
	dw 0x0
	dw 0x0

	db 1001b
	;  type flags: code, expand down, writable, accessed
	db 0010b
	db 1100b
	db 1111b
	db 0x0

gdt_end:


gdt_descriptor:
	dw gdt_end - gdt_start - 1    ;  16-bit (last entry number)
	dd gdt_start				  ;  32-bit

CODE_SEG: equ gdt_code - gdt_start  ;  (address 0x08)
DATA_SEG: equ gdt_data - gdt_start	;  (address 0x10)
