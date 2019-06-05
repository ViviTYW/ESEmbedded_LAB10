.syntax unified

.global	read_sp
read_sp:
	    mov R0, SP;
	    blx lr;

.global	read_msp
read_msp:
	    MRS  R0, MSP;
	    blx lr;

.global	read_psp
read_psp:
	    MRS  R0, PSP;
	    blx lr;

.global	read_ctrl
read_ctrl:
	    MRS R0, CONTROL;
	    blx lr;

.global	start_user
start_user:
        mov lr, R0;
        MSR PSP, R1;
        mov R3, #0b11;
        MSR CONTROL, R3 ;
        ISB
        bx lr;

.global	sw_priv
sw_priv:
		mov R3, #0;
		MSR CONTROL, R3;
		ISB
		bx lr;