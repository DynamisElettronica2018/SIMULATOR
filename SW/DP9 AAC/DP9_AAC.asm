
_unsignedIntToString:

;basic.c,8 :: 		
;basic.c,9 :: 		
	PUSH	W10
	MOV	W11, W10
	CALL	_emptyString
	POP	W10
;basic.c,10 :: 		
	MOV	#lo_addr(?lstr_1_DP9_AAC), W0
	PUSH	W10
	PUSH	W0
	PUSH	W11
	CALL	_sprintf
	SUB	#6, W15
;basic.c,11 :: 		
L_end_unsignedIntToString:
	RETURN
; end of _unsignedIntToString

_signedIntToString:

;basic.c,13 :: 		
;basic.c,14 :: 		
	PUSH	W10
	MOV	W11, W10
	CALL	_emptyString
	POP	W10
;basic.c,15 :: 		
	MOV	#lo_addr(?lstr_2_DP9_AAC), W0
	PUSH	W10
	PUSH	W0
	PUSH	W11
	CALL	_sprintf
	SUB	#6, W15
;basic.c,16 :: 		
L_end_signedIntToString:
	RETURN
; end of _signedIntToString

_emptyString:

;basic.c,18 :: 		
;basic.c,19 :: 		
	CLR	W0
	MOV.B	W0, [W10]
;basic.c,23 :: 		
L_end_emptyString:
	RETURN
; end of _emptyString

_getNumberDigitCount:

;basic.c,25 :: 		
;basic.c,26 :: 		
	MOV.B	#100, W0
	CP.B	W10, W0
	BRA GEU	L__getNumberDigitCount808
	GOTO	L_getNumberDigitCount0
L__getNumberDigitCount808:
;basic.c,27 :: 		
	MOV.B	#3, W0
	GOTO	L_end_getNumberDigitCount
;basic.c,28 :: 		
L_getNumberDigitCount0:
	CP.B	W10, #10
	BRA GEU	L__getNumberDigitCount809
	GOTO	L_getNumberDigitCount2
L__getNumberDigitCount809:
;basic.c,29 :: 		
	MOV.B	#2, W0
	GOTO	L_end_getNumberDigitCount
;basic.c,30 :: 		
L_getNumberDigitCount2:
;basic.c,31 :: 		
	MOV.B	#1, W0
;basic.c,33 :: 		
L_end_getNumberDigitCount:
	RETURN
; end of _getNumberDigitCount

_setAllPinAsDigital:

;dspic.c,7 :: 		
;dspic.c,8 :: 		
	MOV	#65535, W0
	MOV	WREG, ADPCFG
;dspic.c,9 :: 		
L_end_setAllPinAsDigital:
	RETURN
; end of _setAllPinAsDigital

_setInterruptPriority:

;dspic.c,11 :: 		
;dspic.c,12 :: 		
	GOTO	L_setInterruptPriority4
;dspic.c,13 :: 		
L_setInterruptPriority6:
;dspic.c,14 :: 		
	MOV.B	W11, W1
	MOV	#lo_addr(IPC0bits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(IPC0bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(IPC0bits), W0
	MOV.B	W1, [W0]
;dspic.c,15 :: 		
	GOTO	L_setInterruptPriority5
;dspic.c,16 :: 		
L_setInterruptPriority7:
;dspic.c,17 :: 		
	MOV.B	W11, W1
	MOV	#lo_addr(IPC4bits), W0
	XOR.B	W1, [W0], W1
	AND.B	W1, #7, W1
	MOV	#lo_addr(IPC4bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(IPC4bits), W0
	MOV.B	W1, [W0]
;dspic.c,18 :: 		
	GOTO	L_setInterruptPriority5
;dspic.c,19 :: 		
L_setInterruptPriority8:
;dspic.c,20 :: 		
	ZE	W11, W0
	MOV	W0, W1
	MOV.B	#12, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(IPC5bits), W0
	XOR	W1, [W0], W1
	MOV	#28672, W0
	AND	W1, W0, W1
	MOV	#lo_addr(IPC5bits), W0
	XOR	W1, [W0], W1
	MOV	W1, IPC5bits
;dspic.c,21 :: 		
	GOTO	L_setInterruptPriority5
;dspic.c,22 :: 		
L_setInterruptPriority9:
;dspic.c,23 :: 		
	MOV.B	W11, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(IPC9bits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#112, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(IPC9bits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(IPC9bits), W0
	MOV.B	W3, [W0]
;dspic.c,24 :: 		
	GOTO	L_setInterruptPriority5
;dspic.c,25 :: 		
L_setInterruptPriority10:
;dspic.c,26 :: 		
	ZE	W11, W0
	MOV	W0, W1
	MOV.B	#12, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(IPC0bits), W0
	XOR	W1, [W0], W1
	MOV	#28672, W0
	AND	W1, W0, W1
	MOV	#lo_addr(IPC0bits), W0
	XOR	W1, [W0], W1
	MOV	W1, IPC0bits
;dspic.c,27 :: 		
	GOTO	L_setInterruptPriority5
;dspic.c,28 :: 		
L_setInterruptPriority11:
;dspic.c,29 :: 		
	ZE	W11, W0
	MOV	W0, W1
	MOV.B	#8, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(IPC1bits), W0
	XOR	W1, [W0], W1
	MOV	#1792, W0
	AND	W1, W0, W1
	MOV	#lo_addr(IPC1bits), W0
	XOR	W1, [W0], W1
	MOV	W1, IPC1bits
;dspic.c,30 :: 		
	GOTO	L_setInterruptPriority5
;dspic.c,31 :: 		
L_setInterruptPriority12:
;dspic.c,32 :: 		
	MOV.B	W11, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(IPC5bits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#112, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(IPC5bits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(IPC5bits), W0
	MOV.B	W3, [W0]
;dspic.c,33 :: 		
	GOTO	L_setInterruptPriority5
;dspic.c,34 :: 		
L_setInterruptPriority13:
;dspic.c,35 :: 		
	GOTO	L_setInterruptPriority5
;dspic.c,36 :: 		
L_setInterruptPriority4:
	CP.B	W10, #4
	BRA NZ	L__setInterruptPriority812
	GOTO	L_setInterruptPriority6
L__setInterruptPriority812:
	CP.B	W10, #5
	BRA NZ	L__setInterruptPriority813
	GOTO	L_setInterruptPriority7
L__setInterruptPriority813:
	CP.B	W10, #6
	BRA NZ	L__setInterruptPriority814
	GOTO	L_setInterruptPriority8
L__setInterruptPriority814:
	CP.B	W10, #8
	BRA NZ	L__setInterruptPriority815
	GOTO	L_setInterruptPriority9
L__setInterruptPriority815:
	CP.B	W10, #1
	BRA NZ	L__setInterruptPriority816
	GOTO	L_setInterruptPriority10
L__setInterruptPriority816:
	CP.B	W10, #2
	BRA NZ	L__setInterruptPriority817
	GOTO	L_setInterruptPriority11
L__setInterruptPriority817:
	CP.B	W10, #3
	BRA NZ	L__setInterruptPriority818
	GOTO	L_setInterruptPriority12
L__setInterruptPriority818:
	GOTO	L_setInterruptPriority13
L_setInterruptPriority5:
;dspic.c,37 :: 		
L_end_setInterruptPriority:
	RETURN
; end of _setInterruptPriority

_setExternalInterrupt:

;dspic.c,39 :: 		
;dspic.c,40 :: 		
	PUSH	W11
	MOV.B	#4, W11
	CALL	_setInterruptPriority
	POP	W11
;dspic.c,41 :: 		
	GOTO	L_setExternalInterrupt14
;dspic.c,42 :: 		
L_setExternalInterrupt16:
;dspic.c,43 :: 		
	BTSS	W11, #0
	BCLR	INTCON2, #0
	BTSC	W11, #0
	BSET	INTCON2, #0
;dspic.c,44 :: 		
	BCLR	IFS0, #0
;dspic.c,45 :: 		
	BSET	IEC0, #0
;dspic.c,46 :: 		
	GOTO	L_setExternalInterrupt15
;dspic.c,47 :: 		
L_setExternalInterrupt17:
;dspic.c,48 :: 		
	BTSS	W11, #0
	BCLR	INTCON2, #1
	BTSC	W11, #0
	BSET	INTCON2, #1
;dspic.c,49 :: 		
	BCLR	IFS1, #0
;dspic.c,50 :: 		
	BSET	IEC1, #0
;dspic.c,51 :: 		
	GOTO	L_setExternalInterrupt15
;dspic.c,52 :: 		
L_setExternalInterrupt18:
;dspic.c,53 :: 		
	BTSS	W11, #0
	BCLR	INTCON2, #2
	BTSC	W11, #0
	BSET	INTCON2, #2
;dspic.c,54 :: 		
	BCLR	IFS1, #7
;dspic.c,55 :: 		
	BSET	IEC1, #7
;dspic.c,56 :: 		
	GOTO	L_setExternalInterrupt15
;dspic.c,57 :: 		
L_setExternalInterrupt19:
;dspic.c,58 :: 		
	BTSS	W11, #0
	BCLR	INTCON2, #4
	BTSC	W11, #0
	BSET	INTCON2, #4
;dspic.c,59 :: 		
	BCLR	IFS2, #5
;dspic.c,60 :: 		
	BSET	IEC2, #5
;dspic.c,61 :: 		
L_setExternalInterrupt20:
;dspic.c,62 :: 		
	GOTO	L_setExternalInterrupt15
;dspic.c,63 :: 		
L_setExternalInterrupt14:
	CP.B	W10, #4
	BRA NZ	L__setExternalInterrupt820
	GOTO	L_setExternalInterrupt16
L__setExternalInterrupt820:
	CP.B	W10, #5
	BRA NZ	L__setExternalInterrupt821
	GOTO	L_setExternalInterrupt17
L__setExternalInterrupt821:
	CP.B	W10, #6
	BRA NZ	L__setExternalInterrupt822
	GOTO	L_setExternalInterrupt18
L__setExternalInterrupt822:
	CP.B	W10, #8
	BRA NZ	L__setExternalInterrupt823
	GOTO	L_setExternalInterrupt19
L__setExternalInterrupt823:
	GOTO	L_setExternalInterrupt20
L_setExternalInterrupt15:
;dspic.c,64 :: 		
L_end_setExternalInterrupt:
	RETURN
; end of _setExternalInterrupt

_switchExternalInterruptEdge:

;dspic.c,66 :: 		
;dspic.c,67 :: 		
	GOTO	L_switchExternalInterruptEdge21
;dspic.c,68 :: 		
L_switchExternalInterruptEdge23:
;dspic.c,69 :: 		
	BTSS	INTCON2, #0
	GOTO	L_switchExternalInterruptEdge24
;dspic.c,70 :: 		
	BCLR	INTCON2, #0
;dspic.c,71 :: 		
	GOTO	L_switchExternalInterruptEdge25
L_switchExternalInterruptEdge24:
;dspic.c,72 :: 		
	BSET	INTCON2, #0
;dspic.c,73 :: 		
L_switchExternalInterruptEdge25:
;dspic.c,74 :: 		
	GOTO	L_switchExternalInterruptEdge22
;dspic.c,75 :: 		
L_switchExternalInterruptEdge26:
;dspic.c,76 :: 		
	BTSS	INTCON2, #1
	GOTO	L_switchExternalInterruptEdge27
;dspic.c,77 :: 		
	BCLR	INTCON2, #1
;dspic.c,78 :: 		
	GOTO	L_switchExternalInterruptEdge28
L_switchExternalInterruptEdge27:
;dspic.c,79 :: 		
	BSET	INTCON2, #1
;dspic.c,80 :: 		
L_switchExternalInterruptEdge28:
;dspic.c,81 :: 		
	GOTO	L_switchExternalInterruptEdge22
;dspic.c,82 :: 		
L_switchExternalInterruptEdge29:
;dspic.c,83 :: 		
	BTSS	INTCON2, #2
	GOTO	L_switchExternalInterruptEdge30
;dspic.c,84 :: 		
	BCLR	INTCON2, #2
;dspic.c,85 :: 		
	GOTO	L_switchExternalInterruptEdge31
L_switchExternalInterruptEdge30:
;dspic.c,86 :: 		
	BSET	INTCON2, #2
;dspic.c,87 :: 		
L_switchExternalInterruptEdge31:
;dspic.c,88 :: 		
	GOTO	L_switchExternalInterruptEdge22
;dspic.c,89 :: 		
L_switchExternalInterruptEdge32:
;dspic.c,90 :: 		
	BTSS	INTCON2, #4
	GOTO	L_switchExternalInterruptEdge33
;dspic.c,91 :: 		
	BCLR	INTCON2, #4
;dspic.c,92 :: 		
	GOTO	L_switchExternalInterruptEdge34
L_switchExternalInterruptEdge33:
;dspic.c,93 :: 		
	BSET	INTCON2, #4
;dspic.c,94 :: 		
L_switchExternalInterruptEdge34:
;dspic.c,95 :: 		
L_switchExternalInterruptEdge35:
;dspic.c,96 :: 		
	GOTO	L_switchExternalInterruptEdge22
;dspic.c,97 :: 		
L_switchExternalInterruptEdge21:
	CP.B	W10, #4
	BRA NZ	L__switchExternalInterruptEdge825
	GOTO	L_switchExternalInterruptEdge23
L__switchExternalInterruptEdge825:
	CP.B	W10, #5
	BRA NZ	L__switchExternalInterruptEdge826
	GOTO	L_switchExternalInterruptEdge26
L__switchExternalInterruptEdge826:
	CP.B	W10, #6
	BRA NZ	L__switchExternalInterruptEdge827
	GOTO	L_switchExternalInterruptEdge29
L__switchExternalInterruptEdge827:
	CP.B	W10, #8
	BRA NZ	L__switchExternalInterruptEdge828
	GOTO	L_switchExternalInterruptEdge32
L__switchExternalInterruptEdge828:
	GOTO	L_switchExternalInterruptEdge35
L_switchExternalInterruptEdge22:
;dspic.c,98 :: 		
L_end_switchExternalInterruptEdge:
	RETURN
; end of _switchExternalInterruptEdge

_getExternalInterruptEdge:

;dspic.c,100 :: 		
;dspic.c,101 :: 		
	GOTO	L_getExternalInterruptEdge36
;dspic.c,102 :: 		
L_getExternalInterruptEdge38:
;dspic.c,103 :: 		
	CLR.B	W0
	BTSC	INTCON2, #0
	INC.B	W0
	GOTO	L_end_getExternalInterruptEdge
;dspic.c,104 :: 		
L_getExternalInterruptEdge39:
;dspic.c,105 :: 		
	CLR.B	W0
	BTSC	INTCON2, #1
	INC.B	W0
	GOTO	L_end_getExternalInterruptEdge
;dspic.c,106 :: 		
L_getExternalInterruptEdge40:
;dspic.c,107 :: 		
	CLR.B	W0
	BTSC	INTCON2, #2
	INC.B	W0
	GOTO	L_end_getExternalInterruptEdge
;dspic.c,108 :: 		
L_getExternalInterruptEdge41:
;dspic.c,109 :: 		
	CLR.B	W0
	BTSC	INTCON2, #4
	INC.B	W0
	GOTO	L_end_getExternalInterruptEdge
;dspic.c,110 :: 		
L_getExternalInterruptEdge42:
;dspic.c,111 :: 		
	CLR	W0
	GOTO	L_end_getExternalInterruptEdge
;dspic.c,112 :: 		
L_getExternalInterruptEdge36:
	CP.B	W10, #4
	BRA NZ	L__getExternalInterruptEdge830
	GOTO	L_getExternalInterruptEdge38
L__getExternalInterruptEdge830:
	CP.B	W10, #5
	BRA NZ	L__getExternalInterruptEdge831
	GOTO	L_getExternalInterruptEdge39
L__getExternalInterruptEdge831:
	CP.B	W10, #6
	BRA NZ	L__getExternalInterruptEdge832
	GOTO	L_getExternalInterruptEdge40
L__getExternalInterruptEdge832:
	CP.B	W10, #8
	BRA NZ	L__getExternalInterruptEdge833
	GOTO	L_getExternalInterruptEdge41
L__getExternalInterruptEdge833:
	GOTO	L_getExternalInterruptEdge42
;dspic.c,113 :: 		
L_end_getExternalInterruptEdge:
	RETURN
; end of _getExternalInterruptEdge

_clearExternalInterrupt:

;dspic.c,115 :: 		
;dspic.c,116 :: 		
	GOTO	L_clearExternalInterrupt43
;dspic.c,117 :: 		
L_clearExternalInterrupt45:
;dspic.c,118 :: 		
	BCLR	IFS0, #0
;dspic.c,119 :: 		
	GOTO	L_clearExternalInterrupt44
;dspic.c,120 :: 		
L_clearExternalInterrupt46:
;dspic.c,121 :: 		
	BCLR	IFS1, #0
;dspic.c,122 :: 		
	GOTO	L_clearExternalInterrupt44
;dspic.c,123 :: 		
L_clearExternalInterrupt47:
;dspic.c,124 :: 		
	BCLR	IFS1, #7
;dspic.c,125 :: 		
	GOTO	L_clearExternalInterrupt44
;dspic.c,126 :: 		
L_clearExternalInterrupt48:
;dspic.c,127 :: 		
	BCLR	IFS2, #5
;dspic.c,128 :: 		
L_clearExternalInterrupt49:
;dspic.c,129 :: 		
	GOTO	L_clearExternalInterrupt44
;dspic.c,130 :: 		
L_clearExternalInterrupt43:
	CP.B	W10, #4
	BRA NZ	L__clearExternalInterrupt835
	GOTO	L_clearExternalInterrupt45
L__clearExternalInterrupt835:
	CP.B	W10, #5
	BRA NZ	L__clearExternalInterrupt836
	GOTO	L_clearExternalInterrupt46
L__clearExternalInterrupt836:
	CP.B	W10, #6
	BRA NZ	L__clearExternalInterrupt837
	GOTO	L_clearExternalInterrupt47
L__clearExternalInterrupt837:
	CP.B	W10, #8
	BRA NZ	L__clearExternalInterrupt838
	GOTO	L_clearExternalInterrupt48
L__clearExternalInterrupt838:
	GOTO	L_clearExternalInterrupt49
L_clearExternalInterrupt44:
;dspic.c,131 :: 		
L_end_clearExternalInterrupt:
	RETURN
; end of _clearExternalInterrupt

_setTimer:

;dspic.c,133 :: 		
;dspic.c,135 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W11
	PUSH	W12
	MOV.B	#4, W11
	CALL	_setInterruptPriority
	POP	W12
	POP	W11
;dspic.c,137 :: 		
	PUSH	W11
	PUSH	W12
	PUSH	W10
	MOV	W11, W10
	MOV	W12, W11
	CALL	_getTimerPrescaler
	POP	W10
	POP	W12
	POP	W11
; prescalerIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dspic.c,138 :: 		
	GOTO	L_setTimer50
;dspic.c,139 :: 		
L_setTimer52:
;dspic.c,140 :: 		
	MOV.B	W4, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(T1CONbits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#48, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(T1CONbits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(T1CONbits), W0
	MOV.B	W3, [W0]
;dspic.c,141 :: 		
	MOV	W11, W10
	MOV	W12, W11
; prescalerIndex end address is: 8 (W4)
	MOV.B	W4, W12
	CALL	_getTimerPeriod
	MOV	WREG, PR1
;dspic.c,142 :: 		
	BSET	IEC0bits, #3
;dspic.c,143 :: 		
	BSET	T1CONbits, #15
;dspic.c,144 :: 		
	GOTO	L_setTimer51
;dspic.c,145 :: 		
L_setTimer53:
;dspic.c,146 :: 		
; prescalerIndex start address is: 8 (W4)
	MOV.B	W4, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#48, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(T2CONbits), W0
	MOV.B	W3, [W0]
;dspic.c,147 :: 		
	MOV	W11, W10
	MOV	W12, W11
; prescalerIndex end address is: 8 (W4)
	MOV.B	W4, W12
	CALL	_getTimerPeriod
	MOV	WREG, PR2
;dspic.c,148 :: 		
	BSET	IEC0bits, #6
;dspic.c,149 :: 		
	BSET	T2CONbits, #15
;dspic.c,150 :: 		
	GOTO	L_setTimer51
;dspic.c,151 :: 		
L_setTimer54:
;dspic.c,152 :: 		
; prescalerIndex start address is: 8 (W4)
	MOV.B	W4, W3
	MOV.B	#4, W0
	ZE	W3, W1
	SE	W0, W2
	SL	W1, W2, W3
	MOV	#lo_addr(T4CONbits), W0
	XOR.B	W3, [W0], W3
	MOV.B	#48, W0
	AND.B	W3, W0, W3
	MOV	#lo_addr(T4CONbits), W0
	XOR.B	W3, [W0], W3
	MOV	#lo_addr(T4CONbits), W0
	MOV.B	W3, [W0]
;dspic.c,153 :: 		
	MOV	W11, W10
	MOV	W12, W11
; prescalerIndex end address is: 8 (W4)
	MOV.B	W4, W12
	CALL	_getTimerPeriod
	MOV	WREG, PR4
;dspic.c,154 :: 		
	BSET	IEC1bits, #5
;dspic.c,155 :: 		
	BSET	T4CONbits, #15
;dspic.c,156 :: 		
	GOTO	L_setTimer51
;dspic.c,157 :: 		
L_setTimer50:
; prescalerIndex start address is: 8 (W4)
	CP.B	W10, #1
	BRA NZ	L__setTimer840
	GOTO	L_setTimer52
L__setTimer840:
	CP.B	W10, #2
	BRA NZ	L__setTimer841
	GOTO	L_setTimer53
L__setTimer841:
	CP.B	W10, #3
	BRA NZ	L__setTimer842
	GOTO	L_setTimer54
L__setTimer842:
; prescalerIndex end address is: 8 (W4)
L_setTimer51:
;dspic.c,158 :: 		
L_end_setTimer:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _setTimer

_clearTimer:

;dspic.c,160 :: 		
;dspic.c,161 :: 		
	GOTO	L_clearTimer55
;dspic.c,162 :: 		
L_clearTimer57:
;dspic.c,163 :: 		
	BCLR	IFS0bits, #3
;dspic.c,164 :: 		
	GOTO	L_clearTimer56
;dspic.c,165 :: 		
L_clearTimer58:
;dspic.c,166 :: 		
	BCLR	IFS0bits, #6
;dspic.c,167 :: 		
	GOTO	L_clearTimer56
;dspic.c,168 :: 		
L_clearTimer59:
;dspic.c,169 :: 		
	BCLR	IFS1bits, #5
;dspic.c,170 :: 		
	GOTO	L_clearTimer56
;dspic.c,171 :: 		
L_clearTimer55:
	CP.B	W10, #1
	BRA NZ	L__clearTimer844
	GOTO	L_clearTimer57
L__clearTimer844:
	CP.B	W10, #2
	BRA NZ	L__clearTimer845
	GOTO	L_clearTimer58
L__clearTimer845:
	CP.B	W10, #3
	BRA NZ	L__clearTimer846
	GOTO	L_clearTimer59
L__clearTimer846:
L_clearTimer56:
;dspic.c,172 :: 		
L_end_clearTimer:
	RETURN
; end of _clearTimer

_turnOnTimer:

;dspic.c,174 :: 		
;dspic.c,175 :: 		
	GOTO	L_turnOnTimer60
;dspic.c,176 :: 		
L_turnOnTimer62:
;dspic.c,177 :: 		
	BSET	T1CONbits, #15
;dspic.c,178 :: 		
	GOTO	L_turnOnTimer61
;dspic.c,179 :: 		
L_turnOnTimer63:
;dspic.c,180 :: 		
	BSET	T2CONbits, #15
;dspic.c,181 :: 		
	GOTO	L_turnOnTimer61
;dspic.c,182 :: 		
L_turnOnTimer64:
;dspic.c,183 :: 		
	BSET	T4CONbits, #15
;dspic.c,184 :: 		
	GOTO	L_turnOnTimer61
;dspic.c,185 :: 		
L_turnOnTimer60:
	CP.B	W10, #1
	BRA NZ	L__turnOnTimer848
	GOTO	L_turnOnTimer62
L__turnOnTimer848:
	CP.B	W10, #2
	BRA NZ	L__turnOnTimer849
	GOTO	L_turnOnTimer63
L__turnOnTimer849:
	CP.B	W10, #3
	BRA NZ	L__turnOnTimer850
	GOTO	L_turnOnTimer64
L__turnOnTimer850:
L_turnOnTimer61:
;dspic.c,186 :: 		
L_end_turnOnTimer:
	RETURN
; end of _turnOnTimer

_turnOffTimer:

;dspic.c,188 :: 		
;dspic.c,189 :: 		
	GOTO	L_turnOffTimer65
;dspic.c,190 :: 		
L_turnOffTimer67:
;dspic.c,191 :: 		
	BCLR	T1CONbits, #15
;dspic.c,192 :: 		
	GOTO	L_turnOffTimer66
;dspic.c,193 :: 		
L_turnOffTimer68:
;dspic.c,194 :: 		
	BCLR	T2CONbits, #15
;dspic.c,195 :: 		
	GOTO	L_turnOffTimer66
;dspic.c,196 :: 		
L_turnOffTimer69:
;dspic.c,197 :: 		
	BCLR	T4CONbits, #15
;dspic.c,198 :: 		
	GOTO	L_turnOffTimer66
;dspic.c,199 :: 		
L_turnOffTimer65:
	CP.B	W10, #1
	BRA NZ	L__turnOffTimer852
	GOTO	L_turnOffTimer67
L__turnOffTimer852:
	CP.B	W10, #2
	BRA NZ	L__turnOffTimer853
	GOTO	L_turnOffTimer68
L__turnOffTimer853:
	CP.B	W10, #3
	BRA NZ	L__turnOffTimer854
	GOTO	L_turnOffTimer69
L__turnOffTimer854:
L_turnOffTimer66:
;dspic.c,200 :: 		
L_end_turnOffTimer:
	RETURN
; end of _turnOffTimer

_getTimerPeriod:
	LNK	#8

;dspic.c,202 :: 		
;dspic.c,203 :: 		
	PUSH	W12
	MOV.D	W10, W0
	MOV	#9216, W2
	MOV	#18804, W3
	CALL	__Mul_FP
	POP	W12
	MOV	W0, [W14+4]
	MOV	W1, [W14+6]
	ZE	W12, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_PRESCALER_VALUES), W0
	ADD	W0, W1, W2
	MOV	[W2], W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15692, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	PUSH.D	W2
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	POP.D	W2
	CALL	__Float2Longint
;dspic.c,204 :: 		
L_end_getTimerPeriod:
	ULNK
	RETURN
; end of _getTimerPeriod

_getTimerPrescaler:

;dspic.c,206 :: 		
;dspic.c,209 :: 		
	CALL	_getExactTimerPrescaler
; exactTimerPrescaler start address is: 8 (W4)
	MOV.D	W0, W4
;dspic.c,210 :: 		
; i start address is: 6 (W3)
	CLR	W3
; i end address is: 6 (W3)
L_getTimerPrescaler70:
; i start address is: 6 (W3)
; exactTimerPrescaler start address is: 8 (W4)
; exactTimerPrescaler end address is: 8 (W4)
	CP.B	W3, #8
	BRA LTU	L__getTimerPrescaler857
	GOTO	L_getTimerPrescaler71
L__getTimerPrescaler857:
; exactTimerPrescaler end address is: 8 (W4)
;dspic.c,211 :: 		
; exactTimerPrescaler start address is: 8 (W4)
	PUSH.D	W4
	PUSH	W3
	PUSH.D	W10
	MOV.D	W4, W0
	CALL	__Float2Longint
	POP.D	W10
	POP	W3
	POP.D	W4
	ZE	W3, W1
	SL	W1, #1, W2
	MOV	#lo_addr(_PRESCALER_VALUES), W1
	ADD	W1, W2, W2
	MOV	#___Lib_System_DefaultPage, W1
	MOV	W1, 52
	MOV	[W2], W1
	CP	W0, W1
	BRA LTU	L__getTimerPrescaler858
	GOTO	L_getTimerPrescaler73
L__getTimerPrescaler858:
; exactTimerPrescaler end address is: 8 (W4)
;dspic.c,212 :: 		
	MOV.B	W3, W0
; i end address is: 6 (W3)
	GOTO	L_end_getTimerPrescaler
;dspic.c,213 :: 		
L_getTimerPrescaler73:
;dspic.c,210 :: 		
; i start address is: 0 (W0)
; exactTimerPrescaler start address is: 8 (W4)
; i start address is: 6 (W3)
	ADD.B	W3, #1, W0
; i end address is: 6 (W3)
;dspic.c,214 :: 		
; exactTimerPrescaler end address is: 8 (W4)
; i end address is: 0 (W0)
	MOV.B	W0, W3
	GOTO	L_getTimerPrescaler70
L_getTimerPrescaler71:
;dspic.c,215 :: 		
; i start address is: 6 (W3)
	ZE	W3, W0
; i end address is: 6 (W3)
	DEC	W0
;dspic.c,217 :: 		
;dspic.c,218 :: 		
L_end_getTimerPrescaler:
	RETURN
; end of _getTimerPrescaler

_getExactTimerPrescaler:

;dspic.c,220 :: 		
;dspic.c,221 :: 		
	MOV.D	W10, W0
	MOV	#9216, W2
	MOV	#18804, W3
	CALL	__Mul_FP
	MOV	#52224, W2
	MOV	#17740, W3
	CALL	__Div_FP
;dspic.c,222 :: 		
L_end_getExactTimerPrescaler:
	RETURN
; end of _getExactTimerPrescaler

_setupAnalogSampling:

;dspic.c,224 :: 		
;dspic.c,225 :: 		
	PUSH	W10
	MOV	#lo_addr(ADCON1bits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	IOR.B	W1, W0, W1
	MOV	#lo_addr(ADCON1bits), W0
	MOV.B	W1, [W0]
;dspic.c,226 :: 		
	MOV	ADCON1bits, W1
	MOV	#64767, W0
	AND	W1, W0, W0
	MOV	WREG, ADCON1bits
;dspic.c,227 :: 		
	BCLR	ADCON1bits, #13
;dspic.c,228 :: 		
	BSET	ADCON2bits, #10
;dspic.c,229 :: 		
	BCLR	ADCON2bits, #1
;dspic.c,230 :: 		
	BCLR	ADCON2bits, #0
;dspic.c,231 :: 		
	BCLR	ADCON3bits, #7
;dspic.c,232 :: 		
	BCLR	ADCHSbits, #12
;dspic.c,233 :: 		
	BCLR	ADCHSbits, #4
;dspic.c,234 :: 		
	MOV	ADCHSbits, W1
	MOV	#61695, W0
	AND	W1, W0, W0
	MOV	WREG, ADCHSbits
;dspic.c,235 :: 		
	MOV	#lo_addr(ADCHSbits), W0
	MOV.B	[W0], W1
	MOV.B	#240, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(ADCHSbits), W0
	MOV.B	W1, [W0]
;dspic.c,238 :: 		
	CALL	_getMinimumAnalogClockConversion
	MOV.B	W0, W1
	MOV	#lo_addr(ADCON3bits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(ADCON3bits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(ADCON3bits), W0
	MOV.B	W1, [W0]
;dspic.c,239 :: 		
	MOV	#256, W0
	MOV	W0, W1
	MOV	#lo_addr(ADCON3bits), W0
	XOR	W1, [W0], W1
	MOV	#7936, W0
	AND	W1, W0, W1
	MOV	#lo_addr(ADCON3bits), W0
	XOR	W1, [W0], W1
	MOV	W1, ADCON3bits
;dspic.c,241 :: 		
	MOV	#65535, W0
	MOV	WREG, ADPCFG
;dspic.c,242 :: 		
	CLR	ADCSSL
;dspic.c,244 :: 		
	CALL	_setAutomaticSampling
;dspic.c,245 :: 		
	CLR	W10
	CALL	_setAnalogVoltageReference
;dspic.c,246 :: 		
	CALL	_unsetAnalogInterrupt
;dspic.c,247 :: 		
	CALL	_startSampling
;dspic.c,248 :: 		
L_end_setupAnalogSampling:
	POP	W10
	RETURN
; end of _setupAnalogSampling

_turnOnAnalogModule:

;dspic.c,250 :: 		
;dspic.c,251 :: 		
	BSET	ADCON1bits, #15
;dspic.c,252 :: 		
L_end_turnOnAnalogModule:
	RETURN
; end of _turnOnAnalogModule

_turnOffAnalogModule:

;dspic.c,254 :: 		
;dspic.c,255 :: 		
	BCLR	ADCON1bits, #15
;dspic.c,256 :: 		
L_end_turnOffAnalogModule:
	RETURN
; end of _turnOffAnalogModule

_startSampling:

;dspic.c,258 :: 		
;dspic.c,259 :: 		
	BSET	ADCON1bits, #1
;dspic.c,260 :: 		
L_end_startSampling:
	RETURN
; end of _startSampling

_getAnalogValue:

;dspic.c,262 :: 		
;dspic.c,263 :: 		
	MOV	ADCBUF0, WREG
;dspic.c,264 :: 		
L_end_getAnalogValue:
	RETURN
; end of _getAnalogValue

_setAnalogPIN:

;dspic.c,266 :: 		
;dspic.c,267 :: 		
	ZE	W10, W1
	MOV	#1, W0
	SL	W0, W1, W2
	MOV	W2, W0
	COM	W0, W1
	MOV	#lo_addr(ADPCFG), W0
	AND	W1, [W0], [W0]
;dspic.c,268 :: 		
	MOV	#lo_addr(ADCSSL), W0
	IOR	W2, [W0], [W0]
;dspic.c,269 :: 		
L_end_setAnalogPIN:
	RETURN
; end of _setAnalogPIN

_unsetAnalogPIN:

;dspic.c,271 :: 		
;dspic.c,272 :: 		
	ZE	W10, W1
	MOV	#1, W0
	SL	W0, W1, W1
	MOV	#lo_addr(ADPCFG), W0
	IOR	W1, [W0], [W0]
;dspic.c,273 :: 		
	MOV	W1, W0
	COM	W0, W1
	MOV	#lo_addr(ADCSSL), W0
	AND	W1, [W0], [W0]
;dspic.c,274 :: 		
L_end_unsetAnalogPIN:
	RETURN
; end of _unsetAnalogPIN

_setAnalogInterrupt:

;dspic.c,276 :: 		
;dspic.c,277 :: 		
	CALL	_clearAnalogInterrupt
;dspic.c,278 :: 		
	BSET	IEC0bits, #11
;dspic.c,279 :: 		
L_end_setAnalogInterrupt:
	RETURN
; end of _setAnalogInterrupt

_unsetAnalogInterrupt:

;dspic.c,281 :: 		
;dspic.c,282 :: 		
	CALL	_clearAnalogInterrupt
;dspic.c,283 :: 		
	BCLR	IEC0bits, #11
;dspic.c,284 :: 		
L_end_unsetAnalogInterrupt:
	RETURN
; end of _unsetAnalogInterrupt

_clearAnalogInterrupt:

;dspic.c,286 :: 		
;dspic.c,287 :: 		
	BCLR	IFS0bits, #11
;dspic.c,288 :: 		
L_end_clearAnalogInterrupt:
	RETURN
; end of _clearAnalogInterrupt

_setAutomaticSampling:

;dspic.c,290 :: 		
;dspic.c,291 :: 		
	BSET	ADCON1bits, #2
;dspic.c,292 :: 		
L_end_setAutomaticSampling:
	RETURN
; end of _setAutomaticSampling

_unsetAutomaticSampling:

;dspic.c,294 :: 		
;dspic.c,295 :: 		
	BCLR	ADCON1bits, #2
;dspic.c,296 :: 		
L_end_unsetAutomaticSampling:
	RETURN
; end of _unsetAutomaticSampling

_setAnalogVoltageReference:

;dspic.c,298 :: 		
;dspic.c,299 :: 		
	ZE	W10, W0
	MOV	W0, W1
	MOV.B	#13, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(ADCON2bits), W0
	XOR	W1, [W0], W1
	MOV	#57344, W0
	AND	W1, W0, W1
	MOV	#lo_addr(ADCON2bits), W0
	XOR	W1, [W0], W1
	MOV	W1, ADCON2bits
;dspic.c,300 :: 		
L_end_setAnalogVoltageReference:
	RETURN
; end of _setAnalogVoltageReference

_setAnalogDataOutputFormat:

;dspic.c,302 :: 		
;dspic.c,303 :: 		
	ZE	W10, W0
	MOV	W0, W1
	MOV.B	#8, W0
	SE	W0, W0
	SL	W1, W0, W1
	MOV	#lo_addr(ADCON1bits), W0
	XOR	W1, [W0], W1
	MOV	#768, W0
	AND	W1, W0, W1
	MOV	#lo_addr(ADCON1bits), W0
	XOR	W1, [W0], W1
	MOV	W1, ADCON1bits
;dspic.c,304 :: 		
L_end_setAnalogDataOutputFormat:
	RETURN
; end of _setAnalogDataOutputFormat

_getMinimumAnalogClockConversion:

;dspic.c,306 :: 		
;dspic.c,307 :: 		
	MOV	#24, W0
;dspic.c,308 :: 		
L_end_getMinimumAnalogClockConversion:
	RETURN
; end of _getMinimumAnalogClockConversion

_EEPROM_writeInt:

;eeprom.c,7 :: 		
;eeprom.c,11 :: 		
	PUSH	W12
	MOV	W11, W12
	CLR	W11
	CALL	_EEPROM_Write
;eeprom.c,12 :: 		
L_EEPROM_writeInt74:
	BTSS	WR_bit, BitPos(WR_bit+0)
	GOTO	L_EEPROM_writeInt75
	GOTO	L_EEPROM_writeInt74
L_EEPROM_writeInt75:
;eeprom.c,15 :: 		
L_end_EEPROM_writeInt:
	POP	W12
	RETURN
; end of _EEPROM_writeInt

_EEPROM_readInt:

;eeprom.c,17 :: 		
;eeprom.c,18 :: 		
	CLR	W11
	CALL	_EEPROM_Read
;eeprom.c,19 :: 		
L_end_EEPROM_readInt:
	RETURN
; end of _EEPROM_readInt

_EEPROM_writeArray:

;eeprom.c,21 :: 		
;eeprom.c,23 :: 		
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_EEPROM_writeArray76:
; i start address is: 2 (W1)
	CP	W1, #2
	BRA LTU	L__EEPROM_writeArray878
	GOTO	L_EEPROM_writeArray77
L__EEPROM_writeArray878:
;eeprom.c,24 :: 		
	SL	W1, #1, W0
	ADD	W11, W0, W0
	PUSH	W11
	MOV	[W0], W11
	CALL	_EEPROM_writeInt
	POP	W11
;eeprom.c,23 :: 		
	INC	W1
;eeprom.c,25 :: 		
; i end address is: 2 (W1)
	GOTO	L_EEPROM_writeArray76
L_EEPROM_writeArray77:
;eeprom.c,26 :: 		
L_end_EEPROM_writeArray:
	RETURN
; end of _EEPROM_writeArray

_EEPROM_readArray:
	LNK	#2

;eeprom.c,28 :: 		
;eeprom.c,30 :: 		
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_EEPROM_readArray79:
; i start address is: 4 (W2)
	CP	W2, #2
	BRA LTU	L__EEPROM_readArray880
	GOTO	L_EEPROM_readArray80
L__EEPROM_readArray880:
;eeprom.c,31 :: 		
	SL	W2, #1, W0
	ADD	W11, W0, W0
	MOV	W0, [W14+0]
	ADD	W10, W2, W0
	PUSH.D	W10
	MOV	W0, W10
	CLR	W11
	CALL	_EEPROM_Read
	POP.D	W10
	MOV	[W14+0], W1
	MOV	W0, [W1]
;eeprom.c,30 :: 		
	INC	W2
;eeprom.c,32 :: 		
; i end address is: 4 (W2)
	GOTO	L_EEPROM_readArray79
L_EEPROM_readArray80:
;eeprom.c,33 :: 		
L_end_EEPROM_readArray:
	ULNK
	RETURN
; end of _EEPROM_readArray

_eGlcd_init:

;eglcd.c,33 :: 		
;eglcd.c,34 :: 		
	MOV	#lo_addr(_BLACK), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;eglcd.c,35 :: 		
	MOV	#lo_addr(_WHITE), W1
	CLR	W0
	MOV.B	W0, [W1]
;eglcd.c,36 :: 		
	CALL	_Glcd_Init
;eglcd.c,39 :: 		
L_eGlcd_init82:
;eglcd.c,40 :: 		
L_end_eGlcd_init:
	RETURN
; end of _eGlcd_init

_eGlcd_invertColors:

;eglcd.c,42 :: 		
;eglcd.c,43 :: 		
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__eGlcd_invertColors883
	GOTO	L_eGlcd_invertColors83
L__eGlcd_invertColors883:
;eglcd.c,44 :: 		
	MOV	#lo_addr(_BLACK), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;eglcd.c,45 :: 		
	MOV	#lo_addr(_WHITE), W1
	CLR	W0
	MOV.B	W0, [W1]
;eglcd.c,46 :: 		
	GOTO	L_eGlcd_invertColors84
L_eGlcd_invertColors83:
;eglcd.c,47 :: 		
	MOV	#lo_addr(_BLACK), W1
	CLR	W0
	MOV.B	W0, [W1]
;eglcd.c,48 :: 		
	MOV	#lo_addr(_WHITE), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;eglcd.c,49 :: 		
L_eGlcd_invertColors84:
;eglcd.c,50 :: 		
L_end_eGlcd_invertColors:
	RETURN
; end of _eGlcd_invertColors

_eGlcd_clear:

;eglcd.c,52 :: 		
;eglcd.c,53 :: 		
	PUSH	W10
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W10
	CALL	_eGlcd_fill
;eglcd.c,54 :: 		
L_end_eGlcd_clear:
	POP	W10
	RETURN
; end of _eGlcd_clear

_eGlcd_fill:

;eglcd.c,56 :: 		
;eglcd.c,57 :: 		
	PUSH	W10
	CP0.B	W10
	BRA NZ	L__eGlcd_fill886
	GOTO	L_eGlcd_fill85
L__eGlcd_fill886:
;eglcd.c,58 :: 		
	MOV.B	#255, W10
	CALL	_Glcd_Fill
;eglcd.c,59 :: 		
	GOTO	L_eGlcd_fill86
L_eGlcd_fill85:
;eglcd.c,60 :: 		
	CLR	W10
	CALL	_Glcd_Fill
;eglcd.c,61 :: 		
L_eGlcd_fill86:
;eglcd.c,62 :: 		
L_end_eGlcd_fill:
	POP	W10
	RETURN
; end of _eGlcd_fill

_eGlcd_overwriteChar:

;eglcd.c,65 :: 		
;eglcd.c,66 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W12
	PUSH	W11
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_clearChar
	POP	W11
	POP	W12
;eglcd.c,67 :: 		
	MOV.B	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeChar
;eglcd.c,68 :: 		
L_end_eGlcd_overwriteChar:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteChar

_eGlcd_clearChar:

;eglcd.c,70 :: 		
;eglcd.c,71 :: 		
	PUSH	W10
	PUSH	W13
	MOV	#lo_addr(_BLACK), W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_clearChar889
	GOTO	L_eGlcd_clearChar87
L__eGlcd_clearChar889:
;eglcd.c,72 :: 		
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Char
;eglcd.c,73 :: 		
	GOTO	L_eGlcd_clearChar88
L_eGlcd_clearChar87:
;eglcd.c,74 :: 		
	PUSH	W10
	MOV.B	#1, W10
	CALL	_xGLCD_Set_Transparency
	POP	W10
;eglcd.c,75 :: 		
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Char
;eglcd.c,76 :: 		
	CLR	W10
	CALL	_xGLCD_Set_Transparency
;eglcd.c,77 :: 		
L_eGlcd_clearChar88:
;eglcd.c,78 :: 		
L_end_eGlcd_clearChar:
	POP	W13
	POP	W10
	RETURN
; end of _eGlcd_clearChar

_eGlcd_writeChar:

;eglcd.c,80 :: 		
;eglcd.c,81 :: 		
	PUSH	W13
	MOV	#lo_addr(_BLACK), W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_writeChar891
	GOTO	L_eGlcd_writeChar89
L__eGlcd_writeChar891:
;eglcd.c,82 :: 		
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Char
;eglcd.c,83 :: 		
	GOTO	L_eGlcd_writeChar90
L_eGlcd_writeChar89:
;eglcd.c,84 :: 		
	MOV.B	#2, W13
	CALL	_xGlcd_Write_Char
;eglcd.c,85 :: 		
L_eGlcd_writeChar90:
;eglcd.c,86 :: 		
L_end_eGlcd_writeChar:
	POP	W13
	RETURN
; end of _eGlcd_writeChar

_eGlcd_overwriteText:

;eglcd.c,88 :: 		
;eglcd.c,89 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W12
	PUSH	W11
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_clearText
	POP	W11
	POP	W12
;eglcd.c,90 :: 		
	MOV	W11, W10
	MOV.B	W12, W11
	MOV.B	W13, W12
	CALL	_eGlcd_writeText
;eglcd.c,91 :: 		
L_end_eGlcd_overwriteText:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_overwriteText

_eGlcd_clearText:

;eglcd.c,93 :: 		
;eglcd.c,94 :: 		
	PUSH	W10
	PUSH	W13
	MOV	#lo_addr(_BLACK), W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_clearText894
	GOTO	L_eGlcd_clearText91
L__eGlcd_clearText894:
;eglcd.c,95 :: 		
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Text
;eglcd.c,96 :: 		
	GOTO	L_eGlcd_clearText92
L_eGlcd_clearText91:
;eglcd.c,97 :: 		
	PUSH	W10
	MOV.B	#1, W10
	CALL	_xGLCD_Set_Transparency
	POP	W10
;eglcd.c,98 :: 		
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Text
;eglcd.c,99 :: 		
	CLR	W10
	CALL	_xGLCD_Set_Transparency
;eglcd.c,100 :: 		
L_eGlcd_clearText92:
;eglcd.c,101 :: 		
L_end_eGlcd_clearText:
	POP	W13
	POP	W10
	RETURN
; end of _eGlcd_clearText

_eGlcd_writeText:

;eglcd.c,103 :: 		
;eglcd.c,104 :: 		
	PUSH	W13
	MOV	#lo_addr(_BLACK), W0
	CP0.B	[W0]
	BRA NZ	L__eGlcd_writeText896
	GOTO	L_eGlcd_writeText93
L__eGlcd_writeText896:
;eglcd.c,105 :: 		
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W13
	CALL	_xGlcd_Write_Text
;eglcd.c,106 :: 		
	GOTO	L_eGlcd_writeText94
L_eGlcd_writeText93:
;eglcd.c,107 :: 		
	MOV.B	#2, W13
	CALL	_xGlcd_Write_Text
;eglcd.c,108 :: 		
L_eGlcd_writeText94:
;eglcd.c,109 :: 		
L_end_eGlcd_writeText:
	POP	W13
	RETURN
; end of _eGlcd_writeText

_eGlcd_setupTimer:

;eglcd.c,111 :: 		
;eglcd.c,112 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#52429, W0
	MOV	#15564, W1
	MOV	_EGLCD_TIMER_COEFFICIENT, W2
	MOV	_EGLCD_TIMER_COEFFICIENT+2, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV	#52428, W2
	MOV	#15884, W3
	CALL	__Mul_FP
	MOV	#47664, W2
	MOV	#16872, W3
	CALL	__Mul_FP
	MOV	#14269, W2
	MOV	#13702, W3
	CALL	__Mul_FP
	MOV	W0, W11
	MOV	W1, W12
	MOV.B	#3, W10
	CALL	_setTimer
;eglcd.c,113 :: 		
	MOV.B	#5, W11
	MOV.B	#3, W10
	CALL	_setInterruptPriority
;eglcd.c,114 :: 		
	MOV.B	#3, W10
	CALL	_turnOffTimer
;eglcd.c,115 :: 		
L_end_eGlcd_setupTimer:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _eGlcd_setupTimer

_eGlcd_setTimerCoefficient:

;eglcd.c,117 :: 		
;eglcd.c,118 :: 		
	MOV	W10, _EGLCD_TIMER_COEFFICIENT
	MOV	W11, _EGLCD_TIMER_COEFFICIENT+2
;eglcd.c,119 :: 		
L_end_eGlcd_setTimerCoefficient:
	RETURN
; end of _eGlcd_setTimerCoefficient

_eGlcd_getTextPixelLength:

;eglcd.c,121 :: 		
;eglcd.c,123 :: 		
; textPixelLength start address is: 14 (W7)
	CLR	W7
;eglcd.c,124 :: 		
; i start address is: 12 (W6)
	CLR	W6
; textPixelLength end address is: 14 (W7)
; i end address is: 12 (W6)
L_eGlcd_getTextPixelLength95:
; i start address is: 12 (W6)
; textPixelLength start address is: 14 (W7)
	CALL	_strlen
	CP	W6, W0
	BRA LTU	L__eGlcd_getTextPixelLength900
	GOTO	L_eGlcd_getTextPixelLength96
L__eGlcd_getTextPixelLength900:
;eglcd.c,125 :: 		
	ADD	W10, W6, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_xGlcd_Char_Width
	POP	W10
	ZE	W0, W0
	ADD	W7, W0, W7
;eglcd.c,124 :: 		
	INC	W6
;eglcd.c,126 :: 		
; i end address is: 12 (W6)
	GOTO	L_eGlcd_getTextPixelLength95
L_eGlcd_getTextPixelLength96:
;eglcd.c,127 :: 		
	MOV	W7, W0
; textPixelLength end address is: 14 (W7)
;eglcd.c,128 :: 		
L_end_eGlcd_getTextPixelLength:
	RETURN
; end of _eGlcd_getTextPixelLength

_xGlcd_Set_Font:

;eglcd.c,136 :: 		
;eglcd.c,137 :: 		
	MOV	W10, _xGlcdSelFont
;eglcd.c,138 :: 		
	MOV	#lo_addr(_xGlcdSelFontWidth), W0
	MOV.B	W11, [W0]
;eglcd.c,139 :: 		
	MOV	#lo_addr(_xGlcdSelFontHeight), W0
	MOV.B	W12, [W0]
;eglcd.c,140 :: 		
	MOV	#lo_addr(_xGlcdSelFontOffset), W0
	MOV.B	W13, [W0]
;eglcd.c,141 :: 		
	MOV	#lo_addr(_xGLCD_Transparency), W1
	CLR	W0
	MOV.B	W0, [W1]
;eglcd.c,142 :: 		
	ZE	W12, W0
	ASR	W0, #3, W1
	MOV	#lo_addr(_xGlcdSelFontNbRows), W0
	MOV.B	W1, [W0]
;eglcd.c,143 :: 		
	ZE	W12, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	CP0	W0
	BRA NZ	L__xGlcd_Set_Font902
	GOTO	L_xGlcd_Set_Font98
L__xGlcd_Set_Font902:
	MOV.B	#1, W1
	MOV	#lo_addr(_xGlcdSelFontNbRows), W0
	ADD.B	W1, [W0], [W0]
L_xGlcd_Set_Font98:
;eglcd.c,144 :: 		
L_end_xGlcd_Set_Font:
	RETURN
; end of _xGlcd_Set_Font

_xGLCD_Write_Data:

;eglcd.c,147 :: 		
;eglcd.c,150 :: 		
	PUSH	W10
	MOV.B	#127, W0
	CP.B	W10, W0
	BRA LEU	L__xGLCD_Write_Data904
	GOTO	L__xGLCD_Write_Data722
L__xGLCD_Write_Data904:
	MOV.B	#63, W0
	CP.B	W11, W0
	BRA LEU	L__xGLCD_Write_Data905
	GOTO	L__xGLCD_Write_Data721
L__xGLCD_Write_Data905:
	GOTO	L_xGLCD_Write_Data101
L__xGLCD_Write_Data722:
L__xGLCD_Write_Data721:
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data101:
;eglcd.c,151 :: 		
	ZE	W10, W0
	MOV	#64, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; xx start address is: 6 (W3)
	MOV.B	W0, W3
;eglcd.c,152 :: 		
	ZE	W11, W0
	ASR	W0, #3, W0
; tmp start address is: 8 (W4)
	MOV.B	W0, W4
;eglcd.c,153 :: 		
	CP.B	W0, #7
	BRA GTU	L__xGLCD_Write_Data906
	GOTO	L_xGLCD_Write_Data102
L__xGLCD_Write_Data906:
; xx end address is: 6 (W3)
; tmp end address is: 8 (W4)
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data102:
;eglcd.c,154 :: 		
; tmp start address is: 8 (W4)
; xx start address is: 6 (W3)
	ZE	W11, W0
	MOV	#8, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
; tmpY start address is: 4 (W2)
	MOV.B	W0, W2
;eglcd.c,155 :: 		
	CP0.B	W0
	BRA NZ	L__xGLCD_Write_Data907
	GOTO	L_xGLCD_Write_Data103
L__xGLCD_Write_Data907:
;eglcd.c,157 :: 		
	ZE	W12, W1
	ZE	W2, W0
	SL	W1, W0, W0
; gData start address is: 10 (W5)
	MOV.B	W0, W5
;eglcd.c,158 :: 		
	CALL	_Glcd_Set_Side
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
	MOV.B	W4, W10
	CALL	_Glcd_Set_Page
	CALL	_Glcd_Read_Data
	CALL	_Glcd_Read_Data
; dataR start address is: 12 (W6)
	MOV.B	W0, W6
;eglcd.c,163 :: 		
	MOV	#lo_addr(_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data908
	GOTO	L__xGLCD_Write_Data723
L__xGLCD_Write_Data908:
;eglcd.c,164 :: 		
	ZE	W2, W0
	SUBR	W0, #8, W1
	MOV	#255, W0
	LSR	W0, W1, W0
; dataR start address is: 0 (W0)
	AND.B	W6, W0, W0
; dataR end address is: 12 (W6)
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data104
L__xGLCD_Write_Data723:
;eglcd.c,163 :: 		
	MOV.B	W6, W0
;eglcd.c,164 :: 		
L_xGLCD_Write_Data104:
;eglcd.c,165 :: 		
; dataR start address is: 0 (W0)
; dataR start address is: 12 (W6)
	IOR.B	W5, W0, W6
; gData end address is: 10 (W5)
; dataR end address is: 0 (W0)
;eglcd.c,166 :: 		
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
	MOV.B	W6, W10
; dataR end address is: 12 (W6)
	CALL	_Glcd_Write_Data
;eglcd.c,169 :: 		
	ADD.B	W4, #1, W0
	MOV.B	W0, W4
;eglcd.c,170 :: 		
	CP.B	W0, #7
	BRA GTU	L__xGLCD_Write_Data909
	GOTO	L_xGLCD_Write_Data105
L__xGLCD_Write_Data909:
; xx end address is: 6 (W3)
; tmpY end address is: 4 (W2)
; tmp end address is: 8 (W4)
	GOTO	L_end_xGLCD_Write_Data
L_xGLCD_Write_Data105:
;eglcd.c,171 :: 		
; tmp start address is: 8 (W4)
; tmpY start address is: 4 (W2)
; xx start address is: 6 (W3)
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
	MOV.B	W4, W10
; tmp end address is: 8 (W4)
	CALL	_Glcd_Set_Page
	ZE	W2, W0
	SUBR	W0, #8, W1
	ZE	W12, W0
	LSR	W0, W1, W0
; gData start address is: 8 (W4)
	MOV.B	W0, W4
	CALL	_Glcd_Read_Data
	CALL	_Glcd_Read_Data
; dataR start address is: 10 (W5)
	MOV.B	W0, W5
;eglcd.c,176 :: 		
	MOV	#lo_addr(_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA Z	L__xGLCD_Write_Data910
	GOTO	L__xGLCD_Write_Data724
L__xGLCD_Write_Data910:
;eglcd.c,177 :: 		
	MOV	#255, W1
	ZE	W2, W0
; tmpY end address is: 4 (W2)
	SL	W1, W0, W0
; dataR start address is: 0 (W0)
	AND.B	W5, W0, W0
; dataR end address is: 10 (W5)
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data106
L__xGLCD_Write_Data724:
;eglcd.c,176 :: 		
	MOV.B	W5, W0
;eglcd.c,177 :: 		
L_xGLCD_Write_Data106:
;eglcd.c,178 :: 		
; dataR start address is: 0 (W0)
; dataR start address is: 4 (W2)
	IOR.B	W4, W0, W2
; gData end address is: 8 (W4)
; dataR end address is: 0 (W0)
;eglcd.c,179 :: 		
	MOV.B	W3, W10
; xx end address is: 6 (W3)
	CALL	_Glcd_Set_X
	MOV.B	W2, W10
; dataR end address is: 4 (W2)
	CALL	_Glcd_Write_Data
;eglcd.c,181 :: 		
	GOTO	L_xGLCD_Write_Data107
L_xGLCD_Write_Data103:
;eglcd.c,183 :: 		
; tmp start address is: 8 (W4)
; xx start address is: 6 (W3)
	CALL	_Glcd_Set_Side
	MOV.B	W3, W10
	CALL	_Glcd_Set_X
	MOV.B	W4, W10
; tmp end address is: 8 (W4)
	CALL	_Glcd_Set_Page
;eglcd.c,186 :: 		
	MOV	#lo_addr(_xGLCD_Transparency), W0
	CP0.B	[W0]
	BRA NZ	L__xGLCD_Write_Data911
	GOTO	L_xGLCD_Write_Data108
L__xGLCD_Write_Data911:
;eglcd.c,187 :: 		
	CALL	_Glcd_Read_Data
	CALL	_Glcd_Read_Data
; dataR start address is: 0 (W0)
	IOR.B	W12, W0, W0
;eglcd.c,190 :: 		
	MOV.B	W0, W2
; dataR end address is: 0 (W0)
	GOTO	L_xGLCD_Write_Data109
L_xGLCD_Write_Data108:
;eglcd.c,192 :: 		
; dataR start address is: 0 (W0)
	MOV.B	W12, W0
; dataR end address is: 0 (W0)
	MOV.B	W0, W2
L_xGLCD_Write_Data109:
;eglcd.c,193 :: 		
; dataR start address is: 4 (W2)
	MOV.B	W3, W10
; xx end address is: 6 (W3)
	CALL	_Glcd_Set_X
	MOV.B	W2, W10
; dataR end address is: 4 (W2)
	CALL	_Glcd_Write_Data
;eglcd.c,195 :: 		
L_xGLCD_Write_Data107:
;eglcd.c,196 :: 		
L_end_xGLCD_Write_Data:
	POP	W10
	RETURN
; end of _xGLCD_Write_Data

_xGlcd_Write_Char:
	LNK	#2

;eglcd.c,198 :: 		
;eglcd.c,203 :: 		
	MOV	#lo_addr(_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eglcd.c,204 :: 		
	ZE	W10, W1
	MOV	#lo_addr(_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eglcd.c,205 :: 		
	MOV	#lo_addr(_xGlcdSelFont), W2
	ADD	W0, [W2], W3
;eglcd.c,206 :: 		
	MOV	#___Lib_System_DefaultPage, W2
	MOV	W2, 52
	MOV.B	[W3], W2
; CharWidth start address is: 4 (W2)
;eglcd.c,207 :: 		
; cOffset start address is: 10 (W5)
	ADD	W0, #1, W5
	ADDC	W1, #0, W6
;eglcd.c,208 :: 		
; i start address is: 14 (W7)
	CLR	W7
; CharWidth end address is: 4 (W2)
; cOffset end address is: 10 (W5)
; i end address is: 14 (W7)
	MOV.B	W2, W4
L_xGlcd_Write_Char110:
; i start address is: 14 (W7)
; cOffset start address is: 10 (W5)
; CharWidth start address is: 8 (W4)
	CP.B	W7, W4
	BRA LTU	L__xGlcd_Write_Char913
	GOTO	L_xGlcd_Write_Char111
L__xGlcd_Write_Char913:
;eglcd.c,209 :: 		
; j start address is: 16 (W8)
	CLR	W8
; CharWidth end address is: 8 (W4)
; cOffset end address is: 10 (W5)
; j end address is: 16 (W8)
; i end address is: 14 (W7)
L_xGlcd_Write_Char113:
; j start address is: 16 (W8)
; CharWidth start address is: 8 (W4)
; cOffset start address is: 10 (W5)
; i start address is: 14 (W7)
	MOV	#lo_addr(_xGlcdSelFontNbRows), W0
	CP.B	W8, [W0]
	BRA LTU	L__xGlcd_Write_Char914
	GOTO	L_xGlcd_Write_Char114
L__xGlcd_Write_Char914:
;eglcd.c,210 :: 		
	ZE	W7, W1
	MOV	#lo_addr(_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_xGlcdSelFont), W0
	ADD	W2, [W0], W1
	ZE	W8, W0
	ADD	W1, W0, W0
; CurCharData start address is: 2 (W1)
	ADD	W0, W5, W1
;eglcd.c,211 :: 		
	GOTO	L_xGlcd_Write_Char116
; CurCharData end address is: 2 (W1)
;eglcd.c,212 :: 		
L_xGlcd_Write_Char118:
;eglcd.c,213 :: 		
	CLR	W0
	MOV.B	W0, [W14+0]
;eglcd.c,214 :: 		
	GOTO	L_xGlcd_Write_Char117
;eglcd.c,215 :: 		
L_xGlcd_Write_Char119:
;eglcd.c,216 :: 		
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	MOV.B	W0, [W14+0]
;eglcd.c,217 :: 		
	GOTO	L_xGlcd_Write_Char117
;eglcd.c,218 :: 		
L_xGlcd_Write_Char120:
;eglcd.c,219 :: 		
; CurCharData start address is: 2 (W1)
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
; CurCharData end address is: 2 (W1)
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;eglcd.c,220 :: 		
	GOTO	L_xGlcd_Write_Char117
;eglcd.c,221 :: 		
L_xGlcd_Write_Char116:
; CurCharData start address is: 2 (W1)
	CP.B	W13, #0
	BRA NZ	L__xGlcd_Write_Char915
	GOTO	L_xGlcd_Write_Char118
L__xGlcd_Write_Char915:
	CP.B	W13, #1
	BRA NZ	L__xGlcd_Write_Char916
	GOTO	L_xGlcd_Write_Char119
L__xGlcd_Write_Char916:
	CP.B	W13, #2
	BRA NZ	L__xGlcd_Write_Char917
	GOTO	L_xGlcd_Write_Char120
L__xGlcd_Write_Char917:
; CurCharData end address is: 2 (W1)
L_xGlcd_Write_Char117:
;eglcd.c,222 :: 		
	ZE	W8, W0
	SL	W0, #3, W1
	ZE	W12, W0
	ADD	W0, W1, W2
	ZE	W11, W1
	ZE	W7, W0
	ADD	W1, W0, W0
	PUSH.D	W4
	PUSH.D	W6
	PUSH	W8
	PUSH	W12
	PUSH.D	W10
	MOV.B	[W14+0], W12
	MOV.B	W2, W11
	MOV.B	W0, W10
	CALL	_xGLCD_Write_Data
	POP.D	W10
	POP	W12
	POP	W8
	POP.D	W6
	POP.D	W4
;eglcd.c,209 :: 		
	INC.B	W8
;eglcd.c,223 :: 		
; j end address is: 16 (W8)
	GOTO	L_xGlcd_Write_Char113
L_xGlcd_Write_Char114:
;eglcd.c,208 :: 		
	INC.B	W7
;eglcd.c,223 :: 		
; cOffset end address is: 10 (W5)
; i end address is: 14 (W7)
	GOTO	L_xGlcd_Write_Char110
L_xGlcd_Write_Char111:
;eglcd.c,224 :: 		
	MOV.B	W4, W0
; CharWidth end address is: 8 (W4)
;eglcd.c,225 :: 		
L_end_xGlcd_Write_Char:
	ULNK
	RETURN
; end of _xGlcd_Write_Char

_xGlcd_Char_Width:

;eglcd.c,227 :: 		
;eglcd.c,230 :: 		
	MOV	#lo_addr(_xGlcdSelFontWidth), W0
	ZE	[W0], W1
	MOV	#lo_addr(_xGlcdSelFontNbRows), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W0
	INC	W0
; cOffset start address is: 4 (W2)
	MOV	W0, W2
	CLR	W3
;eglcd.c,231 :: 		
	ZE	W10, W1
	MOV	#lo_addr(_xGlcdSelFontOffset), W0
	ZE	[W0], W0
	SUB	W1, W0, W0
	CLR	W1
	CALL	__Multiply_32x32
; cOffset end address is: 4 (W2)
;eglcd.c,232 :: 		
	MOV	#lo_addr(_xGlcdSelFont), W2
	ADD	W0, [W2], W2
;eglcd.c,233 :: 		
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W2], W0
;eglcd.c,234 :: 		
L_end_xGlcd_Char_Width:
	RETURN
; end of _xGlcd_Char_Width

_xGlcd_Write_Text:

;eglcd.c,236 :: 		
;eglcd.c,239 :: 		
	CALL	_strlen
; l start address is: 4 (W2)
	MOV.B	W0, W2
;eglcd.c,240 :: 		
; posX start address is: 10 (W5)
	MOV.B	W11, W5
;eglcd.c,241 :: 		
; curChar start address is: 8 (W4)
	MOV	W10, W4
;eglcd.c,242 :: 		
; i start address is: 6 (W3)
	CLR	W3
; posX end address is: 10 (W5)
; l end address is: 4 (W2)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
L_xGlcd_Write_Text121:
; i start address is: 6 (W3)
; curChar start address is: 8 (W4)
; posX start address is: 10 (W5)
; l start address is: 4 (W2)
	CP.B	W3, W2
	BRA LTU	L__xGlcd_Write_Text920
	GOTO	L_xGlcd_Write_Text122
L__xGlcd_Write_Text920:
;eglcd.c,243 :: 		
	PUSH	W2
	PUSH.D	W4
	PUSH	W3
	PUSH.D	W10
	MOV.B	W5, W11
	MOV.B	[W4], W10
	CALL	_xGlcd_Write_Char
	POP.D	W10
	POP	W3
	POP.D	W4
	POP	W2
	ZE	W5, W1
; posX end address is: 10 (W5)
	ZE	W0, W0
	ADD	W1, W0, W0
; posX start address is: 0 (W0)
	INC.B	W0
;eglcd.c,244 :: 		
	INC	W4
;eglcd.c,242 :: 		
	INC.B	W3
;eglcd.c,245 :: 		
; l end address is: 4 (W2)
; posX end address is: 0 (W0)
; curChar end address is: 8 (W4)
; i end address is: 6 (W3)
	MOV.B	W0, W5
	GOTO	L_xGlcd_Write_Text121
L_xGlcd_Write_Text122:
;eglcd.c,246 :: 		
L_end_xGlcd_Write_Text:
	RETURN
; end of _xGlcd_Write_Text

_xGlcd_Text_Width:

;eglcd.c,248 :: 		
;eglcd.c,250 :: 		
	CALL	_strlen
; l start address is: 12 (W6)
	MOV.B	W0, W6
;eglcd.c,251 :: 		
; w start address is: 16 (W8)
	CLR	W8
;eglcd.c,252 :: 		
; i start address is: 14 (W7)
	CLR	W7
; w end address is: 16 (W8)
; l end address is: 12 (W6)
; i end address is: 14 (W7)
L_xGlcd_Text_Width124:
; i start address is: 14 (W7)
; w start address is: 16 (W8)
; l start address is: 12 (W6)
	CP.B	W7, W6
	BRA LTU	L__xGlcd_Text_Width922
	GOTO	L_xGlcd_Text_Width125
L__xGlcd_Text_Width922:
;eglcd.c,253 :: 		
	ZE	W7, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_xGlcd_Char_Width
	POP	W10
	ZE	W8, W1
; w end address is: 16 (W8)
	ZE	W0, W0
	ADD	W1, W0, W0
; w start address is: 0 (W0)
	INC.B	W0
;eglcd.c,252 :: 		
	INC.B	W7
;eglcd.c,253 :: 		
; l end address is: 12 (W6)
; w end address is: 0 (W0)
; i end address is: 14 (W7)
	MOV.B	W0, W8
	GOTO	L_xGlcd_Text_Width124
L_xGlcd_Text_Width125:
;eglcd.c,254 :: 		
; w start address is: 16 (W8)
	MOV.B	W8, W0
; w end address is: 16 (W8)
;eglcd.c,255 :: 		
L_end_xGlcd_Text_Width:
	RETURN
; end of _xGlcd_Text_Width

_xGLCD_Set_Transparency:

;eglcd.c,257 :: 		
;eglcd.c,258 :: 		
	MOV	#lo_addr(_xGLCD_Transparency), W0
	MOV.B	W10, [W0]
;eglcd.c,259 :: 		
L_end_xGLCD_Set_Transparency:
	RETURN
; end of _xGLCD_Set_Transparency

_Music_hasToMakeSound:

;music.c,12 :: 		
;music.c,13 :: 		
	MOV	#lo_addr(_music_isPlayingNote), W0
	CP0.B	[W0]
	BRA NZ	L__Music_hasToMakeSound925
	GOTO	L_Music_hasToMakeSound128
L__Music_hasToMakeSound925:
	MOV	_music_tickCounter, W1
	MOV	#lo_addr(_music_trentaduesimoTicks), W0
	CP	W1, [W0]
	BRA GTU	L__Music_hasToMakeSound926
	GOTO	L_Music_hasToMakeSound128
L__Music_hasToMakeSound926:
	MOV.B	#1, W0
	GOTO	L_Music_hasToMakeSound127
L_Music_hasToMakeSound128:
	CLR	W0
L_Music_hasToMakeSound127:
;music.c,14 :: 		
L_end_Music_hasToMakeSound:
	RETURN
; end of _Music_hasToMakeSound

_Music_tick:

;music.c,16 :: 		
;music.c,17 :: 		
	MOV	_music_tickCounter, W0
	CP	W0, #0
	BRA GTU	L__Music_tick928
	GOTO	L_Music_tick129
L__Music_tick928:
;music.c,18 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_music_tickCounter), W0
	SUBR	W1, [W0], [W0]
;music.c,19 :: 		
	MOV	_music_tickCounter, W0
	CP	W0, #0
	BRA Z	L__Music_tick929
	GOTO	L_Music_tick130
L__Music_tick929:
;music.c,20 :: 		
	CALL	_Music_playSongNextNote
;music.c,21 :: 		
L_Music_tick130:
;music.c,22 :: 		
L_Music_tick129:
;music.c,23 :: 		
L_end_Music_tick:
	RETURN
; end of _Music_tick

_Music_setSongTime:

;music.c,25 :: 		
;music.c,26 :: 		
	MOV	W10, _music_songTime
;music.c,27 :: 		
L_end_Music_setSongTime:
	RETURN
; end of _Music_setSongTime

_Music_playSong:

;music.c,29 :: 		
;music.c,30 :: 		
	MOV	W10, _music_song
;music.c,31 :: 		
	MOV	W11, _music_songLength
;music.c,32 :: 		
	MOV	#lo_addr(_music_isPlaying), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;music.c,33 :: 		
	CLR	W0
	MOV	W0, _music_currentNote
;music.c,34 :: 		
	CALL	_Music_playSongNextNote
;music.c,35 :: 		
L_end_Music_playSong:
	RETURN
; end of _Music_playSong

_Music_playSongNextNote:

;music.c,37 :: 		
;music.c,39 :: 		
	PUSH	W10
	PUSH	W11
	MOV	_music_currentNote, W1
	MOV	#lo_addr(_music_songLength), W0
	CP	W1, [W0]
	BRA LTU	L__Music_playSongNextNote933
	GOTO	L_Music_playSongNextNote131
L__Music_playSongNextNote933:
;music.c,40 :: 		
	MOV	_music_song, W1
	MOV	#lo_addr(_music_currentNote), W0
	ADD	W1, [W0], W1
;music.c,41 :: 		
	ADD	W1, #1, W0
;music.c,42 :: 		
	MOV.B	[W0], W11
	MOV.B	[W1], W10
	CALL	_Music_playNote
;music.c,43 :: 		
	MOV	#2, W1
	MOV	#lo_addr(_music_currentNote), W0
	ADD	W1, [W0], [W0]
;music.c,44 :: 		
	GOTO	L_Music_playSongNextNote132
L_Music_playSongNextNote131:
;music.c,45 :: 		
	MOV	#lo_addr(_music_isPlaying), W1
	CLR	W0
	MOV.B	W0, [W1]
;music.c,46 :: 		
L_Music_playSongNextNote132:
;music.c,47 :: 		
L_end_Music_playSongNextNote:
	POP	W11
	POP	W10
	RETURN
; end of _Music_playSongNextNote

_Music_playNote:
	LNK	#4

;music.c,49 :: 		
;music.c,51 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#200, W0
	CP.B	W10, W0
	BRA Z	L__Music_playNote935
	GOTO	L_Music_playNote133
L__Music_playNote935:
;music.c,52 :: 		
	MOV	#lo_addr(_music_isPlayingNote), W1
	CLR	W0
	MOV.B	W0, [W1]
;music.c,53 :: 		
	MOV	#4719, W0
	MOV	#14979, W1
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
;music.c,54 :: 		
	GOTO	L_Music_playNote134
L_Music_playNote133:
;music.c,55 :: 		
	MOV	#lo_addr(_music_isPlayingNote), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;music.c,56 :: 		
	CALL	_Music_getNoteFrequency
	PUSH	W11
	MOV.D	W0, W2
	MOV	#0, W0
	MOV	#16256, W1
	CALL	__Div_FP
	POP	W11
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
;music.c,57 :: 		
L_Music_playNote134:
;music.c,58 :: 		
	MOV.B	W11, W10
	CALL	_Music_getActualNoteDuration
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _music_tickCounter
;music.c,59 :: 		
	MOV.B	#1, W10
	CALL	_Music_getActualNoteDuration
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _music_trentaduesimoTicks
;music.c,60 :: 		
	MOV	[W14+0], W11
	MOV	[W14+2], W12
	MOV.B	#3, W10
	CALL	_setTimer
;music.c,61 :: 		
L_end_Music_playNote:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Music_playNote

_Music_getActualNoteDuration:
	LNK	#8

;music.c,63 :: 		
;music.c,64 :: 		
	ZE	W10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+4]
	MOV	W1, [W14+6]
	MOV	_music_songTime, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	PUSH.D	W2
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	POP.D	W2
	MOV	#0, W2
	MOV	#16624, W3
	CALL	__Mul_FP
;music.c,65 :: 		
L_end_Music_getActualNoteDuration:
	ULNK
	RETURN
; end of _Music_getActualNoteDuration

_Music_getNoteFrequency:

;music.c,67 :: 		
;music.c,68 :: 		
	ZE	W10, W0
	SL	W0, #2, W1
	MOV	#lo_addr(_MUSIC_NOTE_TABLE), W0
	ADD	W0, W1, W2
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.D	[W2], W0
;music.c,69 :: 		
L_end_Music_getNoteFrequency:
	RETURN
; end of _Music_getNoteFrequency

_Can_init:

;can.c,38 :: 		
;can.c,39 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;can.c,46 :: 		
	MOV	#4, W13
	MOV	#3, W12
	MOV	#4, W11
	MOV	#2, W10
	MOV	#235, W0
	PUSH	W0
	MOV	#2, W0
	PUSH	W0
	CALL	_CAN1Initialize
	SUB	#4, W15
;can.c,47 :: 		
	MOV	#255, W11
	MOV	#4, W10
	CALL	_CAN1SetOperationMode
;can.c,58 :: 		
	MOV	#255, W13
	CLR	W11
	CLR	W12
	CLR	W10
	CALL	_CAN1SetMask
;can.c,59 :: 		
	MOV	#255, W13
	CLR	W11
	CLR	W12
	CLR	W10
	CALL	_CAN1SetFilter
;can.c,60 :: 		
	MOV	#255, W13
	CLR	W11
	CLR	W12
	MOV	#1, W10
	CALL	_CAN1SetFilter
;can.c,62 :: 		
	MOV	#255, W13
	CLR	W11
	CLR	W12
	MOV	#1, W10
	CALL	_CAN1SetMask
;can.c,63 :: 		
	MOV	#255, W13
	CLR	W11
	CLR	W12
	MOV	#2, W10
	CALL	_CAN1SetFilter
;can.c,66 :: 		
	MOV	#255, W11
	CLR	W10
	CALL	_CAN1SetOperationMode
;can.c,68 :: 		
	CALL	_Can_initInterrupt
;can.c,69 :: 		
	MOV	#253, W10
	CALL	_Can_setWritePriority
;can.c,70 :: 		
L_end_Can_init:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Can_init

_Can_read:

;can.c,72 :: 		
;can.c,73 :: 		
	CALL	_Can_B0hasBeenReceived
	CP0.B	W0
	BRA NZ	L__Can_read940
	GOTO	L_Can_read135
L__Can_read940:
;can.c,74 :: 		
	CALL	_Can_clearB0Flag
;can.c,75 :: 		
	CALL	_CAN1Read
	GOTO	L_end_Can_read
;can.c,77 :: 		
L_Can_read135:
;can.c,78 :: 		
	CALL	_Can_B1hasBeenReceived
	CP0.B	W0
	BRA NZ	L__Can_read941
	GOTO	L_Can_read137
L__Can_read941:
;can.c,79 :: 		
	CALL	_Can_clearB1Flag
;can.c,80 :: 		
	CALL	_CAN1Read
	GOTO	L_end_Can_read
;can.c,82 :: 		
L_Can_read137:
;can.c,83 :: 		
L_end_Can_read:
	RETURN
; end of _Can_read

_Can_writeByte:

;can.c,85 :: 		
;can.c,86 :: 		
	CALL	_Can_resetWritePacket
;can.c,87 :: 		
	PUSH.D	W10
	MOV.B	W12, W10
	CALL	_Can_addByteToWritePacket
	POP.D	W10
;can.c,88 :: 		
	CALL	_Can_write
;can.c,89 :: 		
L_end_Can_writeByte:
	RETURN
; end of _Can_writeByte

_Can_writeInt:

;can.c,91 :: 		
;can.c,92 :: 		
	CALL	_Can_resetWritePacket
;can.c,93 :: 		
	PUSH.D	W10
	MOV	W12, W10
	CALL	_Can_addIntToWritePacket
	POP.D	W10
;can.c,94 :: 		
	CALL	_Can_write
;can.c,95 :: 		
L_end_Can_writeInt:
	RETURN
; end of _Can_writeInt

_Can_addIntToWritePacket:

;can.c,97 :: 		
;can.c,98 :: 		
	PUSH	W10
	ASR	W10, #8, W0
	PUSH	W10
	MOV.B	W0, W10
	CALL	_Can_addByteToWritePacket
	POP	W10
;can.c,99 :: 		
	MOV	#255, W0
	AND	W10, W0, W0
	MOV.B	W0, W10
	CALL	_Can_addByteToWritePacket
;can.c,100 :: 		
L_end_Can_addIntToWritePacket:
	POP	W10
	RETURN
; end of _Can_addIntToWritePacket

_Can_addByteToWritePacket:

;can.c,102 :: 		
;can.c,103 :: 		
	MOV	#lo_addr(_can_dataOutBuffer), W1
	MOV	#lo_addr(_can_dataOutLength), W0
	ADD	W1, [W0], W0
	MOV.B	W10, [W0]
;can.c,104 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_can_dataOutLength), W0
	ADD	W1, [W0], [W0]
;can.c,105 :: 		
L_end_Can_addByteToWritePacket:
	RETURN
; end of _Can_addByteToWritePacket

_Can_write:

;can.c,107 :: 		
;can.c,108 :: 		
	PUSH	W12
	PUSH	W13
; i start address is: 14 (W7)
	CLR	W7
; i end address is: 14 (W7)
;can.c,109 :: 		
L_Can_write138:
;can.c,111 :: 		
; i start address is: 14 (W7)
	CALL	_Can_getWriteFlags
	PUSH.D	W10
	MOV	#8, W13
	MOV	#lo_addr(_can_dataOutBuffer), W12
	PUSH	W0
	CALL	_CAN1Write
	SUB	#2, W15
	POP.D	W10
;can.c,112 :: 		
	INC	W7
;can.c,113 :: 		
	CP	W0, #0
	BRA Z	L__Can_write947
	GOTO	L__Can_write727
L__Can_write947:
	MOV	#50, W0
	CP	W7, W0
	BRA LTU	L__Can_write948
	GOTO	L__Can_write726
L__Can_write948:
	GOTO	L_Can_write138
L__Can_write727:
L__Can_write726:
;can.c,114 :: 		
	MOV	#50, W0
	CP	W7, W0
	BRA Z	L__Can_write949
	GOTO	L_Can_write143
L__Can_write949:
; i end address is: 14 (W7)
;can.c,115 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_can_err), W0
	ADD	W1, [W0], [W0]
;can.c,116 :: 		
L_Can_write143:
;can.c,117 :: 		
L_end_Can_write:
	POP	W13
	POP	W12
	RETURN
; end of _Can_write

_Can_setWritePriority:

;can.c,119 :: 		
;can.c,120 :: 		
	MOV	W10, _can_txPriority
;can.c,121 :: 		
L_end_Can_setWritePriority:
	RETURN
; end of _Can_setWritePriority

_Can_resetWritePacket:

;can.c,123 :: 		
;can.c,124 :: 		
	CLR	W0
	MOV	W0, _can_dataOutLength
L_Can_resetWritePacket144:
	MOV	_can_dataOutLength, W0
	CP	W0, #8
	BRA LTU	L__Can_resetWritePacket952
	GOTO	L_Can_resetWritePacket145
L__Can_resetWritePacket952:
;can.c,125 :: 		
	MOV	#lo_addr(_can_dataOutBuffer), W1
	MOV	#lo_addr(_can_dataOutLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
;can.c,124 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_can_dataOutLength), W0
	ADD	W1, [W0], [W0]
;can.c,126 :: 		
	GOTO	L_Can_resetWritePacket144
L_Can_resetWritePacket145:
;can.c,127 :: 		
	CLR	W0
	MOV	W0, _can_dataOutLength
;can.c,128 :: 		
L_end_Can_resetWritePacket:
	RETURN
; end of _Can_resetWritePacket

_Can_getWriteFlags:

;can.c,130 :: 		
;can.c,131 :: 		
	MOV	#255, W1
	MOV	#lo_addr(_can_txPriority), W0
	AND	W1, [W0], W0
;can.c,132 :: 		
L_end_Can_getWriteFlags:
	RETURN
; end of _Can_getWriteFlags

_Can_B0hasBeenReceived:

;can.c,134 :: 		
;can.c,135 :: 		
	CLR.B	W0
	BTSC	C1INTFbits, #0
	INC.B	W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__Can_B0hasBeenReceived955
	INC.B	W0
L__Can_B0hasBeenReceived955:
;can.c,136 :: 		
L_end_Can_B0hasBeenReceived:
	RETURN
; end of _Can_B0hasBeenReceived

_Can_B1hasBeenReceived:

;can.c,138 :: 		
;can.c,139 :: 		
	CLR.B	W0
	BTSC	C1INTFbits, #1
	INC.B	W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__Can_B1hasBeenReceived957
	INC.B	W0
L__Can_B1hasBeenReceived957:
;can.c,140 :: 		
L_end_Can_B1hasBeenReceived:
	RETURN
; end of _Can_B1hasBeenReceived

_Can_clearB0Flag:

;can.c,142 :: 		
;can.c,143 :: 		
	BCLR	C1INTFbits, #0
;can.c,144 :: 		
L_end_Can_clearB0Flag:
	RETURN
; end of _Can_clearB0Flag

_Can_clearB1Flag:

;can.c,146 :: 		
;can.c,147 :: 		
	BCLR	C1INTFbits, #1
;can.c,148 :: 		
L_end_Can_clearB1Flag:
	RETURN
; end of _Can_clearB1Flag

_Can_clearInterrupt:

;can.c,150 :: 		
;can.c,151 :: 		
	BCLR	IFS1bits, #11
;can.c,152 :: 		
L_end_Can_clearInterrupt:
	RETURN
; end of _Can_clearInterrupt

_Can_initInterrupt:

;can.c,154 :: 		
;can.c,161 :: 		
	BSET	IEC1bits, #11
;can.c,162 :: 		
	BSET.B	C1INTEbits, #0
;can.c,163 :: 		
	BSET.B	C1INTEbits, #1
;can.c,165 :: 		
L_end_Can_initInterrupt:
	RETURN
; end of _Can_initInterrupt

_dd_Menu_setY_OFFSET:

;dd_menu.c,9 :: 		
;dd_menu.c,10 :: 		
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W0
	MOV.B	W10, [W0]
;dd_menu.c,11 :: 		
L_end_dd_Menu_setY_OFFSET:
	RETURN
; end of _dd_Menu_setY_OFFSET

_dd_Menu_setX_OFFSET:

;dd_menu.c,13 :: 		
;dd_menu.c,14 :: 		
	MOV	#lo_addr(_dd_Menu_X_OFFSET), W0
	MOV.B	W10, [W0]
;dd_menu.c,15 :: 		
L_end_dd_Menu_setX_OFFSET:
	RETURN
; end of _dd_Menu_setX_OFFSET

_dd_Menu_setHeight:

;dd_menu.c,17 :: 		
;dd_menu.c,18 :: 		
	CP.B	W10, #8
	BRA GTU	L__dd_Menu_setHeight965
	GOTO	L_dd_Menu_setHeight147
L__dd_Menu_setHeight965:
;dd_menu.c,19 :: 		
	MOV.B	#8, W10
;dd_menu.c,20 :: 		
L_dd_Menu_setHeight147:
;dd_menu.c,21 :: 		
	MOV	#lo_addr(_dd_Menu_Height_param), W0
	MOV.B	W10, [W0]
;dd_menu.c,22 :: 		
L_end_dd_Menu_setHeight:
	RETURN
; end of _dd_Menu_setHeight

_dd_Menu_setWidth:

;dd_menu.c,24 :: 		
;dd_menu.c,25 :: 		
	CP.B	W10, #18
	BRA GTU	L__dd_Menu_setWidth967
	GOTO	L_dd_Menu_setWidth148
L__dd_Menu_setWidth967:
;dd_menu.c,26 :: 		
	MOV.B	#18, W10
;dd_menu.c,27 :: 		
L_dd_Menu_setWidth148:
;dd_menu.c,28 :: 		
	MOV	#lo_addr(_dd_Menu_Width), W0
	MOV.B	W10, [W0]
;dd_menu.c,29 :: 		
L_end_dd_Menu_setWidth:
	RETURN
; end of _dd_Menu_setWidth

_dd_Menu_reset:

;dd_menu.c,31 :: 		
;dd_menu.c,32 :: 		
	MOV	#lo_addr(_dd_Menu_SelectedLine), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,33 :: 		
	MOV	#lo_addr(_dd_Menu_LinesCount), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,34 :: 		
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,35 :: 		
L_end_dd_Menu_reset:
	RETURN
; end of _dd_Menu_reset

_dd_Menu_addLine:
	LNK	#2

;dd_menu.c,37 :: 		
;dd_menu.c,38 :: 		
	PUSH	W10
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	MOV.B	W10, [W0]
;dd_menu.c,39 :: 		
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W0
	PUSH	W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W11
;dd_menu.c,40 :: 		
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	INC2	W0
	MOV	W0, [W14+0]
	MOV	W11, W10
	CALL	_strlen
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;dd_menu.c,41 :: 		
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;dd_menu.c,42 :: 		
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#33, W0
	ADD	W1, W0, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_menu.c,43 :: 		
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#36, W0
	ADD	W1, W0, W1
	CLR	W0
	MOV	W0, [W1]
;dd_menu.c,44 :: 		
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #3, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,45 :: 		
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#34, W0
	ADD	W1, W0, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_menu.c,46 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ADD.B	W1, [W0], [W0]
;dd_menu.c,47 :: 		
L_end_dd_Menu_addLine:
	POP	W10
	ULNK
	RETURN
; end of _dd_Menu_addLine

_dd_Menu_selectDown:

;dd_menu.c,49 :: 		
;dd_menu.c,50 :: 		
	PUSH	W10
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	SUB	W0, #1, W1
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	ZE	[W0], W0
	CP	W0, W1
	BRA LT	L__dd_Menu_selectDown971
	GOTO	L_dd_Menu_selectDown149
L__dd_Menu_selectDown971:
;dd_menu.c,51 :: 		
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W10
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,52 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	ADD.B	W1, [W0], [W0]
;dd_menu.c,53 :: 		
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W10
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,54 :: 		
	CALL	_dd_Menu_resetDescriptionScrolling
;dd_menu.c,55 :: 		
L_dd_Menu_selectDown149:
;dd_menu.c,56 :: 		
	MOV	#lo_addr(_dd_Menu_Height_param), W0
	ZE	[W0], W1
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	ZE	[W0], W0
	ADD	W0, W1, W1
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W0
	ZE	[W0], W0
	SUB	W1, W0, W1
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	ZE	[W0], W0
	CP	W0, W1
	BRA Z	L__dd_Menu_selectDown972
	GOTO	L_dd_Menu_selectDown150
L__dd_Menu_selectDown972:
;dd_menu.c,57 :: 		
	CALL	_dd_Menu_scrollDown
;dd_menu.c,58 :: 		
L_dd_Menu_selectDown150:
;dd_menu.c,59 :: 		
L_end_dd_Menu_selectDown:
	POP	W10
	RETURN
; end of _dd_Menu_selectDown

_dd_Menu_selectUp:

;dd_menu.c,61 :: 		
;dd_menu.c,62 :: 		
	PUSH	W10
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GTU	L__dd_Menu_selectUp974
	GOTO	L_dd_Menu_selectUp151
L__dd_Menu_selectUp974:
;dd_menu.c,63 :: 		
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W10
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,64 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	SUBR.B	W1, [W0], [W0]
;dd_menu.c,65 :: 		
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W10
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,66 :: 		
	CALL	_dd_Menu_resetDescriptionScrolling
;dd_menu.c,67 :: 		
L_dd_Menu_selectUp151:
;dd_menu.c,68 :: 		
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	CP.B	W1, [W0]
	BRA LTU	L__dd_Menu_selectUp975
	GOTO	L_dd_Menu_selectUp152
L__dd_Menu_selectUp975:
;dd_menu.c,69 :: 		
	CALL	_dd_Menu_scrollUp
;dd_menu.c,70 :: 		
L_dd_Menu_selectUp152:
;dd_menu.c,71 :: 		
L_end_dd_Menu_selectUp:
	POP	W10
	RETURN
; end of _dd_Menu_selectUp

_dd_Menu_scrollDown:

;dd_menu.c,73 :: 		
;dd_menu.c,75 :: 		
	PUSH	W10
	MOV	#lo_addr(_dd_Menu_Height_param), W0
	ZE	[W0], W1
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	ZE	[W0], W0
	ADD	W0, W1, W1
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W0
	ZE	[W0], W0
	SUB	W1, W0, W1
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	ZE	[W0], W0
	CP	W1, W0
	BRA LTU	L__dd_Menu_scrollDown977
	GOTO	L_dd_Menu_scrollDown153
L__dd_Menu_scrollDown977:
;dd_menu.c,76 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	ADD.B	W1, [W0], [W0]
;dd_menu.c,77 :: 		
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
; i start address is: 8 (W4)
	MOV.B	[W0], W4
; i end address is: 8 (W4)
L_dd_Menu_scrollDown154:
; i start address is: 8 (W4)
	MOV	#lo_addr(_dd_Menu_Height_param), W0
	ZE	[W0], W1
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	ZE	[W0], W0
	ADD	W0, W1, W1
	ZE	W4, W0
	CP	W0, W1
	BRA LTU	L__dd_Menu_scrollDown978
	GOTO	L_dd_Menu_scrollDown155
L__dd_Menu_scrollDown978:
;dd_menu.c,78 :: 		
	MOV.B	W4, W10
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,77 :: 		
; i start address is: 0 (W0)
	ADD.B	W4, #1, W0
; i end address is: 8 (W4)
;dd_menu.c,79 :: 		
	MOV.B	W0, W4
; i end address is: 0 (W0)
	GOTO	L_dd_Menu_scrollDown154
L_dd_Menu_scrollDown155:
;dd_menu.c,80 :: 		
L_dd_Menu_scrollDown153:
;dd_menu.c,81 :: 		
L_end_dd_Menu_scrollDown:
	POP	W10
	RETURN
; end of _dd_Menu_scrollDown

_dd_Menu_scrollUp:

;dd_menu.c,83 :: 		
;dd_menu.c,85 :: 		
	PUSH	W10
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GTU	L__dd_Menu_scrollUp980
	GOTO	L_dd_Menu_scrollUp157
L__dd_Menu_scrollUp980:
;dd_menu.c,86 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	SUBR.B	W1, [W0], [W0]
;dd_menu.c,87 :: 		
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
; i start address is: 8 (W4)
	MOV.B	[W0], W4
; i end address is: 8 (W4)
L_dd_Menu_scrollUp158:
; i start address is: 8 (W4)
	MOV	#lo_addr(_dd_Menu_Height_param), W0
	ZE	[W0], W1
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	ZE	[W0], W0
	ADD	W0, W1, W1
	ZE	W4, W0
	CP	W0, W1
	BRA LTU	L__dd_Menu_scrollUp981
	GOTO	L_dd_Menu_scrollUp159
L__dd_Menu_scrollUp981:
;dd_menu.c,88 :: 		
	MOV.B	W4, W10
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,87 :: 		
; i start address is: 0 (W0)
	ADD.B	W4, #1, W0
; i end address is: 8 (W4)
;dd_menu.c,89 :: 		
	MOV.B	W0, W4
; i end address is: 0 (W0)
	GOTO	L_dd_Menu_scrollUp158
L_dd_Menu_scrollUp159:
;dd_menu.c,90 :: 		
L_dd_Menu_scrollUp157:
;dd_menu.c,91 :: 		
L_end_dd_Menu_scrollUp:
	POP	W10
	RETURN
; end of _dd_Menu_scrollUp

_dd_MenuLine_setStringValue:

;dd_menu.c,93 :: 		
;dd_menu.c,94 :: 		
	PUSH	W10
	CALL	_dd_Menu_getLineIndex
; lineIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dd_menu.c,95 :: 		
	MOV	#38, W1
	ZE	W0, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #20, W0
	MOV	W0, W10
	CALL	_strcpy
;dd_menu.c,96 :: 		
	MOV.B	W4, W10
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,97 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,98 :: 		
	MOV	#38, W1
	ZE	W4, W0
; lineIndex end address is: 8 (W4)
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#34, W0
	ADD	W1, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,99 :: 		
L_end_dd_MenuLine_setStringValue:
	POP	W10
	RETURN
; end of _dd_MenuLine_setStringValue

_dd_MenuLine_setIntValue:

;dd_menu.c,101 :: 		
;dd_menu.c,102 :: 		
	PUSH	W10
	CALL	_dd_Menu_getLineIndex
; lineIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dd_menu.c,103 :: 		
	MOV	#38, W1
	ZE	W0, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #26, W0
	MOV	[W0], W0
;dd_menu.c,104 :: 		
	CP	W0, W11
	BRA Z	L__dd_MenuLine_setIntValue984
	GOTO	L__dd_MenuLine_setIntValue731
L__dd_MenuLine_setIntValue984:
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#34, W0
	ADD	W1, W0, W0
	CP0.B	[W0]
	BRA Z	L__dd_MenuLine_setIntValue985
	GOTO	L__dd_MenuLine_setIntValue730
L__dd_MenuLine_setIntValue985:
;dd_menu.c,105 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	INC	W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__dd_MenuLine_setIntValue986
	GOTO	L__dd_MenuLine_setIntValue729
L__dd_MenuLine_setIntValue986:
; lineIndex end address is: 8 (W4)
	GOTO	L_dd_MenuLine_setIntValue163
;dd_menu.c,104 :: 		
L__dd_MenuLine_setIntValue731:
; lineIndex start address is: 8 (W4)
L__dd_MenuLine_setIntValue730:
;dd_menu.c,105 :: 		
L__dd_MenuLine_setIntValue729:
;dd_menu.c,106 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #26, W0
	MOV	W11, [W0]
;dd_menu.c,107 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_menu.c,108 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#34, W0
	ADD	W1, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,109 :: 		
	MOV.B	W4, W10
; lineIndex end address is: 8 (W4)
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,110 :: 		
L_dd_MenuLine_setIntValue163:
;dd_menu.c,111 :: 		
L_end_dd_MenuLine_setIntValue:
	POP	W10
	RETURN
; end of _dd_MenuLine_setIntValue

_dd_MenuLine_setFloatValue:

;dd_menu.c,113 :: 		
;dd_menu.c,114 :: 		
	PUSH	W10
	CALL	_dd_Menu_getLineIndex
; lineIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dd_menu.c,115 :: 		
	MOV	#38, W1
	ZE	W0, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #28, W2
	MOV.D	[W2], W0
	PUSH	W4
	PUSH	W11
	PUSH	W12
	MOV	W11, W2
	MOV	W12, W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA Z	L__dd_MenuLine_setFloatValue988
	INC.B	W0
L__dd_MenuLine_setFloatValue988:
	POP	W12
	POP	W11
	POP	W4
;dd_menu.c,116 :: 		
	CP0.B	W0
	BRA Z	L__dd_MenuLine_setFloatValue989
	GOTO	L__dd_MenuLine_setFloatValue735
L__dd_MenuLine_setFloatValue989:
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#34, W0
	ADD	W1, W0, W0
	CP0.B	[W0]
	BRA Z	L__dd_MenuLine_setFloatValue990
	GOTO	L__dd_MenuLine_setFloatValue734
L__dd_MenuLine_setFloatValue990:
;dd_menu.c,117 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	INC	W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__dd_MenuLine_setFloatValue991
	GOTO	L__dd_MenuLine_setFloatValue733
L__dd_MenuLine_setFloatValue991:
; lineIndex end address is: 8 (W4)
	GOTO	L_dd_MenuLine_setFloatValue166
;dd_menu.c,116 :: 		
L__dd_MenuLine_setFloatValue735:
; lineIndex start address is: 8 (W4)
L__dd_MenuLine_setFloatValue734:
;dd_menu.c,117 :: 		
L__dd_MenuLine_setFloatValue733:
;dd_menu.c,118 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #28, W0
	MOV	W11, [W0++]
	MOV	W12, [W0--]
;dd_menu.c,119 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;dd_menu.c,120 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#34, W0
	ADD	W1, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,121 :: 		
	MOV.B	W4, W10
; lineIndex end address is: 8 (W4)
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,122 :: 		
L_dd_MenuLine_setFloatValue166:
;dd_menu.c,123 :: 		
L_end_dd_MenuLine_setFloatValue:
	POP	W10
	RETURN
; end of _dd_MenuLine_setFloatValue

_dd_MenuLine_setBoolValue:

;dd_menu.c,125 :: 		
;dd_menu.c,126 :: 		
	PUSH	W10
	CALL	_dd_Menu_getLineIndex
; lineIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dd_menu.c,127 :: 		
	MOV	#38, W1
	ZE	W0, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#32, W0
	ADD	W1, W0, W0
;dd_menu.c,128 :: 		
	CP.B	W11, [W0]
	BRA Z	L__dd_MenuLine_setBoolValue993
	GOTO	L__dd_MenuLine_setBoolValue739
L__dd_MenuLine_setBoolValue993:
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#34, W0
	ADD	W1, W0, W0
	CP0.B	[W0]
	BRA Z	L__dd_MenuLine_setBoolValue994
	GOTO	L__dd_MenuLine_setBoolValue738
L__dd_MenuLine_setBoolValue994:
;dd_menu.c,129 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	INC	W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__dd_MenuLine_setBoolValue995
	GOTO	L__dd_MenuLine_setBoolValue737
L__dd_MenuLine_setBoolValue995:
; lineIndex end address is: 8 (W4)
	GOTO	L_dd_MenuLine_setBoolValue169
;dd_menu.c,128 :: 		
L__dd_MenuLine_setBoolValue739:
; lineIndex start address is: 8 (W4)
L__dd_MenuLine_setBoolValue738:
;dd_menu.c,129 :: 		
L__dd_MenuLine_setBoolValue737:
;dd_menu.c,130 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#32, W0
	ADD	W1, W0, W0
	MOV.B	W11, [W0]
;dd_menu.c,131 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;dd_menu.c,132 :: 		
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#34, W0
	ADD	W1, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,133 :: 		
	MOV.B	W4, W10
; lineIndex end address is: 8 (W4)
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,134 :: 		
L_dd_MenuLine_setBoolValue169:
;dd_menu.c,135 :: 		
L_end_dd_MenuLine_setBoolValue:
	POP	W10
	RETURN
; end of _dd_MenuLine_setBoolValue

_dd_MenuLine_switchBoolValue:

;dd_menu.c,137 :: 		
;dd_menu.c,138 :: 		
	PUSH	W10
	CALL	_dd_Menu_getLineIndex
; lineIndex start address is: 10 (W5)
	MOV.B	W0, W5
;dd_menu.c,139 :: 		
	MOV	#38, W1
	ZE	W0, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#32, W0
	ADD	W1, W0, W4
	MOV	#38, W1
	ZE	W5, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#32, W0
	ADD	W1, W0, W0
	CP0.B	[W0]
	CLR.B	W0
	BRA NZ	L__dd_MenuLine_switchBoolValue997
	INC.B	W0
L__dd_MenuLine_switchBoolValue997:
	MOV.B	W0, [W4]
;dd_menu.c,140 :: 		
	MOV	#38, W1
	ZE	W5, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;dd_menu.c,141 :: 		
	MOV	#38, W1
	ZE	W5, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#34, W0
	ADD	W1, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,142 :: 		
	MOV.B	W5, W10
; lineIndex end address is: 10 (W5)
	CALL	_dd_Menu_requestLinePrintUpdate
;dd_menu.c,143 :: 		
L_end_dd_MenuLine_switchBoolValue:
	POP	W10
	RETURN
; end of _dd_MenuLine_switchBoolValue

_dd_Menu_getLineIndex:

;dd_menu.c,145 :: 		
;dd_menu.c,147 :: 		
; i start address is: 8 (W4)
	CLR	W4
; i end address is: 8 (W4)
L_dd_Menu_getLineIndex170:
;dd_menu.c,148 :: 		
; i start address is: 8 (W4)
	MOV	#38, W1
	ZE	W4, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	MOV.B	[W0], W0
	CP.B	W0, W10
	BRA Z	L__dd_Menu_getLineIndex999
	GOTO	L_dd_Menu_getLineIndex173
L__dd_Menu_getLineIndex999:
;dd_menu.c,149 :: 		
	MOV.B	W4, W0
; i end address is: 8 (W4)
	GOTO	L_end_dd_Menu_getLineIndex
;dd_menu.c,150 :: 		
L_dd_Menu_getLineIndex173:
;dd_menu.c,147 :: 		
; i start address is: 0 (W0)
; i start address is: 8 (W4)
	ADD.B	W4, #1, W0
; i end address is: 8 (W4)
;dd_menu.c,151 :: 		
	MOV.B	W0, W4
; i end address is: 0 (W0)
	GOTO	L_dd_Menu_getLineIndex170
;dd_menu.c,153 :: 		
L_end_dd_Menu_getLineIndex:
	RETURN
; end of _dd_Menu_getLineIndex

_dd_printMenu:

;dd_menu.c,155 :: 		
;dd_menu.c,157 :: 		
	PUSH	W10
	MOV	#1, W1
	MOV	#lo_addr(_dd_Menu_DescriptionScrollingTicks), W0
	ADD	W1, [W0], [W0]
;dd_menu.c,158 :: 		
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_dd_printMenu174:
; i start address is: 2 (W1)
	MOV	#lo_addr(_dd_Menu_LinesCount), W0
	CP.B	W1, [W0]
	BRA LTU	L__dd_printMenu1001
	GOTO	L_dd_printMenu175
L__dd_printMenu1001:
;dd_menu.c,159 :: 		
	PUSH	W1
	MOV.B	W1, W10
	CALL	_dd_Menu_isPrintedLineRequestingUpdate
	POP	W1
	CP0.B	W0
	BRA Z	L__dd_printMenu1002
	GOTO	L__dd_printMenu747
L__dd_printMenu1002:
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_printMenu1003
	GOTO	L__dd_printMenu746
L__dd_printMenu1003:
	GOTO	L_dd_printMenu179
L__dd_printMenu747:
L__dd_printMenu746:
;dd_menu.c,160 :: 		
	PUSH	W1
	MOV.B	W1, W10
	CALL	_dd_printMenuLine
	POP	W1
;dd_menu.c,161 :: 		
L_dd_printMenu179:
;dd_menu.c,158 :: 		
; i start address is: 0 (W0)
	ADD.B	W1, #1, W0
; i end address is: 2 (W1)
;dd_menu.c,162 :: 		
	MOV.B	W0, W1
; i end address is: 0 (W0)
	GOTO	L_dd_printMenu174
L_dd_printMenu175:
;dd_menu.c,163 :: 		
L_end_dd_printMenu:
	POP	W10
	RETURN
; end of _dd_printMenu

_dd_printMenuLine:
	LNK	#22

;dd_menu.c,165 :: 		
;dd_menu.c,168 :: 		
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_dd_Menu_isLineVisible
	CP0.B	W0
	BRA NZ	L__dd_printMenuLine1005
	GOTO	L_dd_printMenuLine180
L__dd_printMenuLine1005:
;dd_menu.c,169 :: 		
	ZE	W10, W1
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	ZE	[W0], W0
	SUB	W1, W0, W2
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W1
	ADD	W14, #0, W0
	ADD.B	W2, [W1], [W0]
;dd_menu.c,170 :: 		
	CALL	_dd_Menu_isLineSelected
	CP0.B	W0
	BRA NZ	L__dd_printMenuLine1006
	GOTO	L_dd_printMenuLine181
L__dd_printMenuLine1006:
;dd_menu.c,171 :: 		
	MOV	#lo_addr(_WHITE), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+1]
;dd_menu.c,172 :: 		
	GOTO	L_dd_printMenuLine182
L_dd_printMenuLine181:
;dd_menu.c,173 :: 		
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+1]
;dd_menu.c,174 :: 		
L_dd_printMenuLine182:
;dd_menu.c,175 :: 		
	ADD	W14, #2, W0
	PUSH	W10
	MOV.B	W10, W11
	MOV	W0, W10
	CALL	_dd_Menu_makeLineText
;dd_menu.c,176 :: 		
	MOV	#___Lib_System_DefaultPage, W0
	MOV.B	#8, W13
	MOV.B	#6, W12
	MOV	#lo_addr(_DynamisFont_Terminal6x8), W10
	MOV	W0, W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
	ADD	W14, #2, W0
	MOV.B	[W14+1], W13
	MOV.B	[W14+0], W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	POP	W10
;dd_menu.c,178 :: 		
	CALL	_dd_Menu_clearLinePrintUpdateRequest
;dd_menu.c,179 :: 		
L_dd_printMenuLine180:
;dd_menu.c,180 :: 		
L_end_dd_printMenuLine:
	POP	W13
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _dd_printMenuLine

_dd_Menu_makeLineText:
	LNK	#2

;dd_menu.c,182 :: 		
;dd_menu.c,185 :: 		
	PUSH.D	W10
	MOV.B	W11, W10
	CALL	_dd_MenuLine_makeTextValue
	POP.D	W10
;dd_menu.c,186 :: 		
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dd_MenuLine_getValueWidth
; valueWidth start address is: 8 (W4)
	MOV.B	W0, W4
;dd_menu.c,187 :: 		
	MOV.B	W11, W10
	CALL	_dd_MenuLine_getScrollingOverflow
	POP	W10
; scrollingOverflow start address is: 10 (W5)
	MOV	W0, W5
;dd_menu.c,188 :: 		
	PUSH.D	W4
	PUSH.D	W10
	MOV.B	W11, W10
	CALL	_dd_MenuLine_getScrollOffset
	POP.D	W10
	POP.D	W4
; scrollingOffset start address is: 12 (W6)
	MOV	W0, W6
;dd_menu.c,189 :: 		
	MOV	#38, W1
	ZE	W11, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	INC2	W0
; descriptionLength start address is: 14 (W7)
	MOV.B	[W0], W7
;dd_menu.c,190 :: 		
; lineCharIndex start address is: 0 (W0)
	CLR	W0
; valueWidth end address is: 8 (W4)
; scrollingOverflow end address is: 10 (W5)
; scrollingOffset end address is: 12 (W6)
; lineCharIndex end address is: 0 (W0)
	MOV.B	W4, W9
	MOV	W5, W8
	MOV	W0, W5
L_dd_Menu_makeLineText183:
; lineCharIndex start address is: 10 (W5)
; scrollingOverflow start address is: 16 (W8)
; descriptionLength start address is: 14 (W7)
; descriptionLength end address is: 14 (W7)
; scrollingOffset start address is: 12 (W6)
; scrollingOverflow start address is: 16 (W8)
; scrollingOverflow end address is: 16 (W8)
; valueWidth start address is: 18 (W9)
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dd_MenuLine_getDescriptionWidth
	POP	W10
	ZE	W0, W0
	CP	W5, W0
	BRA LT	L__dd_Menu_makeLineText1008
	GOTO	L_dd_Menu_makeLineText184
L__dd_Menu_makeLineText1008:
; descriptionLength end address is: 14 (W7)
; scrollingOverflow end address is: 16 (W8)
;dd_menu.c,191 :: 		
; scrollingOverflow start address is: 16 (W8)
; descriptionLength start address is: 14 (W7)
	ADD	W5, W6, W1
	MOV	W1, [W14+0]
;dd_menu.c,192 :: 		
	ZE	W7, W0
	CP	W1, W0
	BRA LT	L__dd_Menu_makeLineText1009
	GOTO	L_dd_Menu_makeLineText186
L__dd_Menu_makeLineText1009:
;dd_menu.c,193 :: 		
	ADD	W10, W5, W4
	MOV	#38, W1
	ZE	W11, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W1
	ADD	W14, #0, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], [W4]
;dd_menu.c,194 :: 		
	GOTO	L_dd_Menu_makeLineText187
L_dd_Menu_makeLineText186:
	ADD	W14, #0, W0
	CP	W8, [W0]
	BRA LE	L__dd_Menu_makeLineText1010
	GOTO	L__dd_Menu_makeLineText743
L__dd_Menu_makeLineText1010:
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dd_MenuLine_hasToScroll
	POP	W10
	CP0.B	W0
	BRA NZ	L__dd_Menu_makeLineText1011
	GOTO	L__dd_Menu_makeLineText742
L__dd_Menu_makeLineText1011:
	GOTO	L_dd_Menu_makeLineText190
L__dd_Menu_makeLineText743:
L__dd_Menu_makeLineText742:
;dd_menu.c,195 :: 		
	ADD	W10, W5, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;dd_menu.c,196 :: 		
	GOTO	L_dd_Menu_makeLineText191
L_dd_Menu_makeLineText190:
;dd_menu.c,197 :: 		
	ADD	W10, W5, W4
	MOV	#38, W1
	ZE	W11, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W1
	ADD	W14, #0, W0
	SUBR	W8, [W0], W0
	ADD	W1, W0, W0
	MOV.B	[W0], [W4]
;dd_menu.c,198 :: 		
L_dd_Menu_makeLineText191:
L_dd_Menu_makeLineText187:
;dd_menu.c,190 :: 		
	INC	W5
;dd_menu.c,199 :: 		
; descriptionLength end address is: 14 (W7)
; scrollingOverflow end address is: 16 (W8)
	GOTO	L_dd_Menu_makeLineText183
L_dd_Menu_makeLineText184:
;dd_menu.c,200 :: 		
	CP.B	W9, #0
	BRA GTU	L__dd_Menu_makeLineText1012
	GOTO	L__dd_Menu_makeLineText744
L__dd_Menu_makeLineText1012:
;dd_menu.c,201 :: 		
	CLR	W0
	MOV	W0, [W14+0]
; scrollingOffset end address is: 12 (W6)
; valueWidth end address is: 18 (W9)
; lineCharIndex end address is: 10 (W5)
	MOV	W5, W7
	MOV	W6, W3
	MOV.B	W9, W2
L_dd_Menu_makeLineText193:
; valueWidth start address is: 4 (W2)
; scrollingOffset start address is: 6 (W3)
; lineCharIndex start address is: 14 (W7)
	MOV	[W14+0], W0
	CP	W0, #1
	BRA LT	L__dd_Menu_makeLineText1013
	GOTO	L_dd_Menu_makeLineText194
L__dd_Menu_makeLineText1013:
;dd_menu.c,202 :: 		
	ADD	W10, W7, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;dd_menu.c,203 :: 		
	INC	W7
;dd_menu.c,201 :: 		
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;dd_menu.c,204 :: 		
	GOTO	L_dd_Menu_makeLineText193
L_dd_Menu_makeLineText194:
;dd_menu.c,205 :: 		
	CLR	W0
	MOV	W0, [W14+0]
; valueWidth end address is: 4 (W2)
; scrollingOffset end address is: 6 (W3)
; lineCharIndex end address is: 14 (W7)
	MOV.B	W2, W6
	MOV	W3, W5
L_dd_Menu_makeLineText196:
; lineCharIndex start address is: 14 (W7)
; scrollingOffset start address is: 10 (W5)
; valueWidth start address is: 12 (W6)
	ZE	W6, W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GT	L__dd_Menu_makeLineText1014
	GOTO	L_dd_Menu_makeLineText197
L__dd_Menu_makeLineText1014:
;dd_menu.c,206 :: 		
	ADD	W10, W7, W4
	MOV	#38, W1
	ZE	W11, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #20, W1
	ADD	W14, #0, W0
	ADD	W1, [W0], W0
	MOV.B	[W0], [W4]
;dd_menu.c,207 :: 		
	INC	W7
;dd_menu.c,205 :: 		
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;dd_menu.c,208 :: 		
; valueWidth end address is: 12 (W6)
	GOTO	L_dd_Menu_makeLineText196
L_dd_Menu_makeLineText197:
;dd_menu.c,209 :: 		
	MOV	W7, W0
; lineCharIndex end address is: 14 (W7)
	MOV	W5, W4
	GOTO	L_dd_Menu_makeLineText192
; scrollingOffset end address is: 10 (W5)
L__dd_Menu_makeLineText744:
;dd_menu.c,200 :: 		
	MOV	W6, W4
	MOV	W5, W0
;dd_menu.c,209 :: 		
L_dd_Menu_makeLineText192:
;dd_menu.c,210 :: 		
; scrollingOffset start address is: 8 (W4)
; lineCharIndex start address is: 0 (W0)
	ADD	W10, W0, W1
; lineCharIndex end address is: 0 (W0)
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;dd_menu.c,211 :: 		
	MOV	#38, W1
	ZE	W11, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#36, W0
	ADD	W1, W0, W0
	MOV	W4, [W0]
; scrollingOffset end address is: 8 (W4)
;dd_menu.c,212 :: 		
L_end_dd_Menu_makeLineText:
	ULNK
	RETURN
; end of _dd_Menu_makeLineText

_dd_MenuLine_makeTextValue:
	LNK	#2

;dd_menu.c,214 :: 		
;dd_menu.c,215 :: 		
	PUSH	W10
	PUSH	W11
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	INC	W0
; valueType start address is: 8 (W4)
	MOV.B	[W0], W4
;dd_menu.c,216 :: 		
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__dd_MenuLine_makeTextValue1016
	GOTO	L_dd_MenuLine_makeTextValue199
L__dd_MenuLine_makeTextValue1016:
;dd_menu.c,217 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #20, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_emptyString
	POP	W10
;dd_menu.c,218 :: 		
	GOTO	L_dd_MenuLine_makeTextValue200
; valueType end address is: 8 (W4)
;dd_menu.c,219 :: 		
L_dd_MenuLine_makeTextValue202:
;dd_menu.c,220 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	ADD	W1, #26, W0
	MOV	[W0], W0
	ADD	W1, #20, W1
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(?lstr_27_DP9_AAC), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#6, W15
	POP	W10
;dd_menu.c,221 :: 		
	GOTO	L_dd_MenuLine_makeTextValue201
;dd_menu.c,222 :: 		
L_dd_MenuLine_makeTextValue203:
;dd_menu.c,223 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	ADD	W1, #28, W0
	ADD	W1, #20, W1
	PUSH	W10
	PUSH	[W0++]
	PUSH	[W0--]
	MOV	#lo_addr(?lstr_28_DP9_AAC), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#8, W15
	POP	W10
;dd_menu.c,224 :: 		
	GOTO	L_dd_MenuLine_makeTextValue201
;dd_menu.c,225 :: 		
L_dd_MenuLine_makeTextValue204:
;dd_menu.c,226 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#32, W0
	ADD	W1, W0, W0
	CP0.B	[W0]
	BRA NZ	L__dd_MenuLine_makeTextValue1017
	GOTO	L_dd_MenuLine_makeTextValue205
L__dd_MenuLine_makeTextValue1017:
;dd_menu.c,227 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #20, W0
	PUSH	W10
	MOV	_STRING_TRUE, W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W10
;dd_menu.c,228 :: 		
	GOTO	L_dd_MenuLine_makeTextValue206
L_dd_MenuLine_makeTextValue205:
;dd_menu.c,229 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #20, W0
	PUSH	W10
	MOV	_STRING_FALSE, W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W10
;dd_menu.c,230 :: 		
L_dd_MenuLine_makeTextValue206:
;dd_menu.c,231 :: 		
	GOTO	L_dd_MenuLine_makeTextValue201
;dd_menu.c,232 :: 		
L_dd_MenuLine_makeTextValue207:
;dd_menu.c,233 :: 		
L_dd_MenuLine_makeTextValue208:
;dd_menu.c,234 :: 		
	GOTO	L_dd_MenuLine_makeTextValue201
;dd_menu.c,235 :: 		
L_dd_MenuLine_makeTextValue200:
; valueType start address is: 8 (W4)
	CP.B	W4, #1
	BRA NZ	L__dd_MenuLine_makeTextValue1018
	GOTO	L_dd_MenuLine_makeTextValue202
L__dd_MenuLine_makeTextValue1018:
	CP.B	W4, #2
	BRA NZ	L__dd_MenuLine_makeTextValue1019
	GOTO	L_dd_MenuLine_makeTextValue203
L__dd_MenuLine_makeTextValue1019:
	CP.B	W4, #3
	BRA NZ	L__dd_MenuLine_makeTextValue1020
	GOTO	L_dd_MenuLine_makeTextValue204
L__dd_MenuLine_makeTextValue1020:
	CP.B	W4, #4
	BRA NZ	L__dd_MenuLine_makeTextValue1021
	GOTO	L_dd_MenuLine_makeTextValue207
L__dd_MenuLine_makeTextValue1021:
; valueType end address is: 8 (W4)
	GOTO	L_dd_MenuLine_makeTextValue208
L_dd_MenuLine_makeTextValue201:
;dd_menu.c,236 :: 		
L_dd_MenuLine_makeTextValue199:
;dd_menu.c,237 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	ADD	W1, #3, W0
	MOV	W0, [W14+0]
	ADD	W1, #20, W0
	MOV	W0, W10
	CALL	_strlen
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;dd_menu.c,238 :: 		
L_end_dd_MenuLine_makeTextValue:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_MenuLine_makeTextValue

_dd_MenuLine_getScrollOffset:

;dd_menu.c,240 :: 		
;dd_menu.c,242 :: 		
	CALL	_dd_MenuLine_hasToScroll
	CP0.B	W0
	BRA NZ	L__dd_MenuLine_getScrollOffset1023
	GOTO	L_dd_MenuLine_getScrollOffset209
L__dd_MenuLine_getScrollOffset1023:
;dd_menu.c,243 :: 		
	PUSH	W10
	MOV	_dd_Menu_DescriptionScrollingTicks, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16480, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	POP	W10
; offset start address is: 8 (W4)
	MOV	W0, W4
;dd_menu.c,244 :: 		
	CALL	_dd_MenuLine_getScrollingOverflow
	CP	W4, W0
	BRA GE	L__dd_MenuLine_getScrollOffset1024
	GOTO	L__dd_MenuLine_getScrollOffset740
L__dd_MenuLine_getScrollOffset1024:
; offset end address is: 8 (W4)
;dd_menu.c,245 :: 		
; offset start address is: 2 (W1)
	CLR	W1
;dd_menu.c,246 :: 		
	CALL	_dd_Menu_resetDescriptionScrolling
; offset end address is: 2 (W1)
;dd_menu.c,247 :: 		
	GOTO	L_dd_MenuLine_getScrollOffset210
L__dd_MenuLine_getScrollOffset740:
;dd_menu.c,244 :: 		
	MOV	W4, W1
;dd_menu.c,247 :: 		
L_dd_MenuLine_getScrollOffset210:
;dd_menu.c,248 :: 		
; offset start address is: 2 (W1)
	MOV	W1, W0
; offset end address is: 2 (W1)
	GOTO	L_end_dd_MenuLine_getScrollOffset
;dd_menu.c,249 :: 		
L_dd_MenuLine_getScrollOffset209:
;dd_menu.c,250 :: 		
	CLR	W0
;dd_menu.c,252 :: 		
L_end_dd_MenuLine_getScrollOffset:
	RETURN
; end of _dd_MenuLine_getScrollOffset

_dd_MenuLine_getScrollingOverflow:

;dd_menu.c,254 :: 		
;dd_menu.c,255 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	INC2	W0
	ZE	[W0], W0
	ADD	W0, #4, W0
;dd_menu.c,256 :: 		
L_end_dd_MenuLine_getScrollingOverflow:
	RETURN
; end of _dd_MenuLine_getScrollingOverflow

_dd_MenuLine_hasToScroll:
	LNK	#2

;dd_menu.c,258 :: 		
;dd_menu.c,259 :: 		
	CALL	_dd_Menu_isLineSelected
;dd_menu.c,260 :: 		
	CP0.B	W0
	BRA NZ	L__dd_MenuLine_hasToScroll1027
	GOTO	L_dd_MenuLine_hasToScroll213
L__dd_MenuLine_hasToScroll1027:
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	INC2	W0
	MOV	W0, [W14+0]
	CALL	_dd_MenuLine_getDescriptionWidth
	MOV	[W14+0], W1
	CP.B	W0, [W1]
	BRA LTU	L__dd_MenuLine_hasToScroll1028
	GOTO	L_dd_MenuLine_hasToScroll213
L__dd_MenuLine_hasToScroll1028:
	MOV.B	#1, W0
	GOTO	L_dd_MenuLine_hasToScroll212
L_dd_MenuLine_hasToScroll213:
	CLR	W0
L_dd_MenuLine_hasToScroll212:
;dd_menu.c,261 :: 		
L_end_dd_MenuLine_hasToScroll:
	ULNK
	RETURN
; end of _dd_MenuLine_hasToScroll

_dd_MenuLine_isScrollingThisFrame:
	LNK	#2

;dd_menu.c,263 :: 		
;dd_menu.c,264 :: 		
	CALL	_dd_MenuLine_hasToScroll
;dd_menu.c,265 :: 		
	CP0.B	W0
	BRA NZ	L__dd_MenuLine_isScrollingThisFrame1030
	GOTO	L_dd_MenuLine_isScrollingThisFrame215
L__dd_MenuLine_isScrollingThisFrame1030:
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#36, W0
	ADD	W1, W0, W0
	MOV	[W0], W0
	MOV	W0, [W14+0]
	CALL	_dd_MenuLine_getScrollOffset
	MOV	[W14+0], W1
	CP	W1, W0
	BRA NZ	L__dd_MenuLine_isScrollingThisFrame1031
	GOTO	L_dd_MenuLine_isScrollingThisFrame215
L__dd_MenuLine_isScrollingThisFrame1031:
	MOV.B	#1, W0
	GOTO	L_dd_MenuLine_isScrollingThisFrame214
L_dd_MenuLine_isScrollingThisFrame215:
	CLR	W0
L_dd_MenuLine_isScrollingThisFrame214:
;dd_menu.c,266 :: 		
L_end_dd_MenuLine_isScrollingThisFrame:
	ULNK
	RETURN
; end of _dd_MenuLine_isScrollingThisFrame

_dd_MenuLine_getDescriptionWidth:

;dd_menu.c,268 :: 		
;dd_menu.c,270 :: 		
	CALL	_dd_MenuLine_getValueWidth
; valueWidth start address is: 4 (W2)
	MOV.B	W0, W2
;dd_menu.c,271 :: 		
	CP.B	W0, #0
	BRA GTU	L__dd_MenuLine_getDescriptionWidth1033
	GOTO	L_dd_MenuLine_getDescriptionWidth216
L__dd_MenuLine_getDescriptionWidth1033:
;dd_menu.c,272 :: 		
	MOV	#lo_addr(_dd_Menu_Width), W0
	ZE	[W0], W1
	ZE	W2, W0
; valueWidth end address is: 4 (W2)
	SUB	W1, W0, W0
	DEC	W0
	GOTO	L_end_dd_MenuLine_getDescriptionWidth
;dd_menu.c,273 :: 		
L_dd_MenuLine_getDescriptionWidth216:
;dd_menu.c,274 :: 		
	MOV	#lo_addr(_dd_Menu_Width), W0
	MOV.B	[W0], W0
;dd_menu.c,276 :: 		
L_end_dd_MenuLine_getDescriptionWidth:
	RETURN
; end of _dd_MenuLine_getDescriptionWidth

_dd_MenuLine_getValueWidth:

;dd_menu.c,278 :: 		
;dd_menu.c,279 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #3, W0
	MOV.B	[W0], W0
;dd_menu.c,280 :: 		
L_end_dd_MenuLine_getValueWidth:
	RETURN
; end of _dd_MenuLine_getValueWidth

_dd_Menu_clearLinePrintUpdateRequest:

;dd_menu.c,282 :: 		
;dd_menu.c,283 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#33, W0
	ADD	W1, W0, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_menu.c,284 :: 		
L_end_dd_Menu_clearLinePrintUpdateRequest:
	RETURN
; end of _dd_Menu_clearLinePrintUpdateRequest

_dd_Menu_requestLinePrintUpdate:

;dd_menu.c,286 :: 		
;dd_menu.c,287 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#33, W0
	ADD	W1, W0, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_menu.c,288 :: 		
L_end_dd_Menu_requestLinePrintUpdate:
	RETURN
; end of _dd_Menu_requestLinePrintUpdate

_dd_Menu_isPrintedLineRequestingUpdate:

;dd_menu.c,290 :: 		
;dd_menu.c,291 :: 		
	MOV	#38, W1
	ZE	W10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W1
	MOV	#33, W0
	ADD	W1, W0, W0
	CP0.B	[W0]
	BRA Z	L__dd_Menu_isPrintedLineRequestingUpdate1038
	GOTO	L_dd_Menu_isPrintedLineRequestingUpdate219
L__dd_Menu_isPrintedLineRequestingUpdate1038:
	CALL	_dd_MenuLine_isScrollingThisFrame
	CP0.B	W0
	BRA Z	L__dd_Menu_isPrintedLineRequestingUpdate1039
	GOTO	L_dd_Menu_isPrintedLineRequestingUpdate219
L__dd_Menu_isPrintedLineRequestingUpdate1039:
	CLR	W1
	GOTO	L_dd_Menu_isPrintedLineRequestingUpdate218
L_dd_Menu_isPrintedLineRequestingUpdate219:
	MOV.B	#1, W0
	MOV.B	W0, W1
L_dd_Menu_isPrintedLineRequestingUpdate218:
	MOV.B	W1, W0
;dd_menu.c,292 :: 		
L_end_dd_Menu_isPrintedLineRequestingUpdate:
	RETURN
; end of _dd_Menu_isPrintedLineRequestingUpdate

_dd_Menu_isLineSelected:

;dd_menu.c,294 :: 		
;dd_menu.c,295 :: 		
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	CP.B	W10, [W0]
	CLR.B	W0
	BRA NZ	L__dd_Menu_isLineSelected1041
	INC.B	W0
L__dd_Menu_isLineSelected1041:
;dd_menu.c,296 :: 		
L_end_dd_Menu_isLineSelected:
	RETURN
; end of _dd_Menu_isLineSelected

_dd_Menu_isLineVisible:

;dd_menu.c,298 :: 		
;dd_menu.c,300 :: 		
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	CP.B	W10, [W0]
	BRA GEU	L__dd_Menu_isLineVisible1043
	GOTO	L_dd_Menu_isLineVisible221
L__dd_Menu_isLineVisible1043:
	MOV	#lo_addr(_dd_Menu_Height_param), W0
	ZE	[W0], W1
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W0
	ZE	[W0], W0
	ADD	W1, W0, W1
	MOV	#lo_addr(_dd_Menu_Y_OFFSET), W0
	ZE	[W0], W0
	SUB	W1, W0, W1
	MOV	#lo_addr(_dd_Menu_FirstLineIndex), W0
	ZE	[W0], W0
	ADD	W0, W1, W1
	ZE	W10, W0
	CP	W0, W1
	BRA LTU	L__dd_Menu_isLineVisible1044
	GOTO	L_dd_Menu_isLineVisible221
L__dd_Menu_isLineVisible1044:
	MOV.B	#1, W0
	GOTO	L_dd_Menu_isLineVisible220
L_dd_Menu_isLineVisible221:
	CLR	W0
L_dd_Menu_isLineVisible220:
;dd_menu.c,301 :: 		
L_end_dd_Menu_isLineVisible:
	RETURN
; end of _dd_Menu_isLineVisible

_dd_Menu_resetDescriptionScrolling:

;dd_menu.c,303 :: 		
;dd_menu.c,304 :: 		
	CLR	W0
	MOV	W0, _dd_Menu_DescriptionScrollingTicks
;dd_menu.c,305 :: 		
L_end_dd_Menu_resetDescriptionScrolling:
	RETURN
; end of _dd_Menu_resetDescriptionScrolling

_dd_Indicators_loadDefaults:

;dd_indicators.c,8 :: 		
;dd_indicators.c,10 :: 		
	PUSH	W10
	PUSH	W11
; i start address is: 10 (W5)
	CLR	W5
; i end address is: 10 (W5)
L_dd_Indicators_loadDefaults222:
; i start address is: 10 (W5)
	CP	W5, #22
	BRA LTU	L__dd_Indicators_loadDefaults1047
	GOTO	L_dd_Indicators_loadDefaults223
L__dd_Indicators_loadDefaults1047:
;dd_indicators.c,11 :: 		
	MOV	#lo_addr(_INDICATORS_LIST), W0
	ADD	W0, W5, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W2
	ZE	W2, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_PARAMETERS_DESCRIPTIONS), W0
	ADD	W0, W1, W0
	MOV	[W0], W11
	MOV.B	W2, W10
	CALL	_dd_Dashboard_addIndicator
;dd_indicators.c,12 :: 		
	MOV	#lo_addr(_INDICATORS_LIST), W0
	ADD	W0, W5, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	MOV	#lo_addr(?lstr29_DP9_AAC), W11
	MOV.B	W0, W10
	CALL	_dd_Indicator_setStringValue
;dd_indicators.c,10 :: 		
	INC	W5
;dd_indicators.c,13 :: 		
; i end address is: 10 (W5)
	GOTO	L_dd_Indicators_loadDefaults222
L_dd_Indicators_loadDefaults223:
;dd_indicators.c,14 :: 		
; i start address is: 10 (W5)
	CLR	W5
; i end address is: 10 (W5)
L_dd_Indicators_loadDefaults225:
; i start address is: 10 (W5)
	CP	W5, #4
	BRA LTU	L__dd_Indicators_loadDefaults1048
	GOTO	L_dd_Indicators_loadDefaults226
L__dd_Indicators_loadDefaults1048:
;dd_indicators.c,15 :: 		
	MOV	#lo_addr(_DEFAULT_INDICATORS), W0
	ADD	W0, W5, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	MOV.B	W5, W11
	MOV.B	W0, W10
	CALL	_dd_Indicator_setPrintPosition
;dd_indicators.c,14 :: 		
	INC	W5
;dd_indicators.c,16 :: 		
; i end address is: 10 (W5)
	GOTO	L_dd_Indicators_loadDefaults225
L_dd_Indicators_loadDefaults226:
;dd_indicators.c,17 :: 		
L_end_dd_Indicators_loadDefaults:
	POP	W11
	POP	W10
	RETURN
; end of _dd_Indicators_loadDefaults

_dd_Indicators_isDefault:

;dd_indicators.c,19 :: 		
;dd_indicators.c,21 :: 		
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_dd_Indicators_isDefault228:
; i start address is: 4 (W2)
	CP.B	W2, #4
	BRA LTU	L__dd_Indicators_isDefault1050
	GOTO	L_dd_Indicators_isDefault229
L__dd_Indicators_isDefault1050:
;dd_indicators.c,22 :: 		
	ZE	W2, W1
	MOV	#lo_addr(_DEFAULT_INDICATORS), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W10, W0
	BRA Z	L__dd_Indicators_isDefault1051
	GOTO	L_dd_Indicators_isDefault231
L__dd_Indicators_isDefault1051:
; i end address is: 4 (W2)
;dd_indicators.c,23 :: 		
	MOV.B	#1, W0
	GOTO	L_end_dd_Indicators_isDefault
;dd_indicators.c,24 :: 		
L_dd_Indicators_isDefault231:
;dd_indicators.c,21 :: 		
; i start address is: 0 (W0)
; i start address is: 4 (W2)
	ADD.B	W2, #1, W0
; i end address is: 4 (W2)
;dd_indicators.c,25 :: 		
	MOV.B	W0, W2
; i end address is: 0 (W0)
	GOTO	L_dd_Indicators_isDefault228
L_dd_Indicators_isDefault229:
;dd_indicators.c,26 :: 		
	CLR	W0
;dd_indicators.c,27 :: 		
L_end_dd_Indicators_isDefault:
	RETURN
; end of _dd_Indicators_isDefault

_dd_Indicator_setPrintPosition:

;dd_indicators.c,29 :: 		
;dd_indicators.c,31 :: 		
; i start address is: 8 (W4)
	CLR	W4
; i end address is: 8 (W4)
L_dd_Indicator_setPrintPosition232:
; i start address is: 8 (W4)
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	CP.B	W4, [W0]
	BRA LTU	L__dd_Indicator_setPrintPosition1053
	GOTO	L_dd_Indicator_setPrintPosition233
L__dd_Indicator_setPrintPosition1053:
;dd_indicators.c,32 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	MOV.B	[W0], W0
	CP.B	W0, W10
	BRA Z	L__dd_Indicator_setPrintPosition1054
	GOTO	L_dd_Indicator_setPrintPosition235
L__dd_Indicator_setPrintPosition1054:
;dd_indicators.c,33 :: 		
	PUSH	W10
	MOV.B	W4, W10
	CALL	_dd_Indicator_setAsVisible
;dd_indicators.c,34 :: 		
	MOV.B	W4, W10
	CALL	_dd_Dashboard_requestIndicatorFullPrintUpdate
	POP	W10
;dd_indicators.c,35 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #3, W0
	MOV.B	W11, [W0]
;dd_indicators.c,36 :: 		
	GOTO	L_dd_Indicator_setPrintPosition236
L_dd_Indicator_setPrintPosition235:
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #3, W0
	CP.B	W11, [W0]
	BRA Z	L__dd_Indicator_setPrintPosition1055
	GOTO	L_dd_Indicator_setPrintPosition237
L__dd_Indicator_setPrintPosition1055:
;dd_indicators.c,37 :: 		
	PUSH	W10
	MOV.B	W4, W10
	CALL	_dd_Indicator_hide
;dd_indicators.c,38 :: 		
	MOV.B	W4, W10
	CALL	_dd_Dashboard_requestIndicatorFullPrintUpdate
	POP	W10
;dd_indicators.c,39 :: 		
L_dd_Indicator_setPrintPosition237:
L_dd_Indicator_setPrintPosition236:
;dd_indicators.c,31 :: 		
; i start address is: 0 (W0)
	ADD.B	W4, #1, W0
; i end address is: 8 (W4)
;dd_indicators.c,40 :: 		
	MOV.B	W0, W4
; i end address is: 0 (W0)
	GOTO	L_dd_Indicator_setPrintPosition232
L_dd_Indicator_setPrintPosition233:
;dd_indicators.c,41 :: 		
L_end_dd_Indicator_setPrintPosition:
	RETURN
; end of _dd_Indicator_setPrintPosition

_dd_Indicator_setStringValue:

;dd_indicators.c,43 :: 		
;dd_indicators.c,44 :: 		
	PUSH	W10
	CALL	_dd_Dashboard_getIndicatorIndex
; indicatorIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dd_indicators.c,45 :: 		
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	MOV	W0, W10
	CALL	_strcpy
;dd_indicators.c,46 :: 		
	MOV.B	W4, W10
	CALL	_dd_Dashboard_requestIndicatorPrintUpdate
;dd_indicators.c,47 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_indicators.c,48 :: 		
	ZE	W4, W1
; indicatorIndex end address is: 8 (W4)
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #29, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_indicators.c,49 :: 		
L_end_dd_Indicator_setStringValue:
	POP	W10
	RETURN
; end of _dd_Indicator_setStringValue

_dd_Indicator_setIntValue:

;dd_indicators.c,51 :: 		
;dd_indicators.c,52 :: 		
	PUSH	W10
	CALL	_dd_Dashboard_getIndicatorIndex
; indicatorIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dd_indicators.c,53 :: 		
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #22, W0
	MOV	[W0], W0
;dd_indicators.c,54 :: 		
	CP	W0, W11
	BRA Z	L__dd_Indicator_setIntValue1058
	GOTO	L__dd_Indicator_setIntValue751
L__dd_Indicator_setIntValue1058:
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #29, W0
	CP0.B	[W0]
	BRA Z	L__dd_Indicator_setIntValue1059
	GOTO	L__dd_Indicator_setIntValue750
L__dd_Indicator_setIntValue1059:
;dd_indicators.c,55 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__dd_Indicator_setIntValue1060
	GOTO	L__dd_Indicator_setIntValue749
L__dd_Indicator_setIntValue1060:
; indicatorIndex end address is: 8 (W4)
	GOTO	L_dd_Indicator_setIntValue240
;dd_indicators.c,54 :: 		
L__dd_Indicator_setIntValue751:
; indicatorIndex start address is: 8 (W4)
L__dd_Indicator_setIntValue750:
;dd_indicators.c,55 :: 		
L__dd_Indicator_setIntValue749:
;dd_indicators.c,56 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #22, W0
	MOV	W11, [W0]
;dd_indicators.c,57 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_indicators.c,58 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #29, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_indicators.c,59 :: 		
	MOV.B	W4, W10
; indicatorIndex end address is: 8 (W4)
	CALL	_dd_Dashboard_requestIndicatorPrintUpdate
;dd_indicators.c,60 :: 		
L_dd_Indicator_setIntValue240:
;dd_indicators.c,61 :: 		
L_end_dd_Indicator_setIntValue:
	POP	W10
	RETURN
; end of _dd_Indicator_setIntValue

_dd_Indicator_setFloatValue:

;dd_indicators.c,63 :: 		
;dd_indicators.c,64 :: 		
	PUSH	W10
	CALL	_dd_Dashboard_getIndicatorIndex
; indicatorIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dd_indicators.c,65 :: 		
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #24, W2
	MOV.D	[W2], W0
	PUSH	W4
	PUSH	W11
	PUSH	W12
	MOV	W11, W2
	MOV	W12, W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA Z	L__dd_Indicator_setFloatValue1062
	INC.B	W0
L__dd_Indicator_setFloatValue1062:
	POP	W12
	POP	W11
	POP	W4
;dd_indicators.c,66 :: 		
	CP0.B	W0
	BRA Z	L__dd_Indicator_setFloatValue1063
	GOTO	L__dd_Indicator_setFloatValue755
L__dd_Indicator_setFloatValue1063:
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #29, W0
	CP0.B	[W0]
	BRA Z	L__dd_Indicator_setFloatValue1064
	GOTO	L__dd_Indicator_setFloatValue754
L__dd_Indicator_setFloatValue1064:
;dd_indicators.c,67 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__dd_Indicator_setFloatValue1065
	GOTO	L__dd_Indicator_setFloatValue753
L__dd_Indicator_setFloatValue1065:
; indicatorIndex end address is: 8 (W4)
	GOTO	L_dd_Indicator_setFloatValue243
;dd_indicators.c,66 :: 		
L__dd_Indicator_setFloatValue755:
; indicatorIndex start address is: 8 (W4)
L__dd_Indicator_setFloatValue754:
;dd_indicators.c,67 :: 		
L__dd_Indicator_setFloatValue753:
;dd_indicators.c,68 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #24, W0
	MOV	W11, [W0++]
	MOV	W12, [W0--]
;dd_indicators.c,69 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;dd_indicators.c,70 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #29, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_indicators.c,71 :: 		
	MOV.B	W4, W10
; indicatorIndex end address is: 8 (W4)
	CALL	_dd_Dashboard_requestIndicatorPrintUpdate
;dd_indicators.c,72 :: 		
L_dd_Indicator_setFloatValue243:
;dd_indicators.c,73 :: 		
L_end_dd_Indicator_setFloatValue:
	POP	W10
	RETURN
; end of _dd_Indicator_setFloatValue

_dd_Indicator_setBoolValue:

;dd_indicators.c,75 :: 		
;dd_indicators.c,76 :: 		
	PUSH	W10
	CALL	_dd_Dashboard_getIndicatorIndex
; indicatorIndex start address is: 8 (W4)
	MOV.B	W0, W4
;dd_indicators.c,77 :: 		
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #28, W0
;dd_indicators.c,78 :: 		
	CP.B	W11, [W0]
	BRA Z	L__dd_Indicator_setBoolValue1067
	GOTO	L__dd_Indicator_setBoolValue759
L__dd_Indicator_setBoolValue1067:
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #29, W0
	CP0.B	[W0]
	BRA Z	L__dd_Indicator_setBoolValue1068
	GOTO	L__dd_Indicator_setBoolValue758
L__dd_Indicator_setBoolValue1068:
;dd_indicators.c,79 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__dd_Indicator_setBoolValue1069
	GOTO	L__dd_Indicator_setBoolValue757
L__dd_Indicator_setBoolValue1069:
; indicatorIndex end address is: 8 (W4)
	GOTO	L_dd_Indicator_setBoolValue246
;dd_indicators.c,78 :: 		
L__dd_Indicator_setBoolValue759:
; indicatorIndex start address is: 8 (W4)
L__dd_Indicator_setBoolValue758:
;dd_indicators.c,79 :: 		
L__dd_Indicator_setBoolValue757:
;dd_indicators.c,80 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #28, W0
	MOV.B	W11, [W0]
;dd_indicators.c,81 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;dd_indicators.c,82 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #29, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_indicators.c,83 :: 		
	MOV.B	W4, W10
; indicatorIndex end address is: 8 (W4)
	CALL	_dd_Dashboard_requestIndicatorPrintUpdate
;dd_indicators.c,84 :: 		
L_dd_Indicator_setBoolValue246:
;dd_indicators.c,85 :: 		
L_end_dd_Indicator_setBoolValue:
	POP	W10
	RETURN
; end of _dd_Indicator_setBoolValue

_dd_Indicator_switchBoolValue:

;dd_indicators.c,87 :: 		
;dd_indicators.c,88 :: 		
	PUSH	W10
	CALL	_dd_Dashboard_getIndicatorIndex
; indicatorIndex start address is: 10 (W5)
	MOV.B	W0, W5
;dd_indicators.c,89 :: 		
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #28, W4
	ZE	W5, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #28, W0
	CP0.B	[W0]
	CLR.B	W0
	BRA NZ	L__dd_Indicator_switchBoolValue1071
	INC.B	W0
L__dd_Indicator_switchBoolValue1071:
	MOV.B	W0, [W4]
;dd_indicators.c,90 :: 		
	ZE	W5, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;dd_indicators.c,91 :: 		
	ZE	W5, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #29, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_indicators.c,92 :: 		
	MOV.B	W5, W10
; indicatorIndex end address is: 10 (W5)
	CALL	_dd_Dashboard_requestIndicatorPrintUpdate
;dd_indicators.c,93 :: 		
L_end_dd_Indicator_switchBoolValue:
	POP	W10
	RETURN
; end of _dd_Indicator_switchBoolValue

_dd_Indicator_setAsVisible:

;dd_indicators.c,95 :: 		
;dd_indicators.c,96 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #2, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_indicators.c,97 :: 		
L_end_dd_Indicator_setAsVisible:
	RETURN
; end of _dd_Indicator_setAsVisible

_dd_Indicator_hide:

;dd_indicators.c,99 :: 		
;dd_indicators.c,100 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #2, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_indicators.c,101 :: 		
L_end_dd_Indicator_hide:
	RETURN
; end of _dd_Indicator_hide

_dd_Indicator_isVisible:

;dd_indicators.c,103 :: 		
;dd_indicators.c,104 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	INC2	W0
	MOV.B	[W0], W0
;dd_indicators.c,105 :: 		
L_end_dd_Indicator_isVisible:
	RETURN
; end of _dd_Indicator_isVisible

_dd_printIndicator:
	LNK	#4

;dd_indicators.c,107 :: 		
;dd_indicators.c,109 :: 		
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #6, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+2]
;dd_indicators.c,111 :: 		
	PUSH	W10
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
	POP	W10
;dd_indicators.c,113 :: 		
	CALL	_dd_Indicator_getValueX
	MOV.B	W0, [W14+0]
;dd_indicators.c,114 :: 		
	CALL	_dd_Indicator_getValueY
	MOV.B	W0, [W14+1]
;dd_indicators.c,116 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	PUSH	W10
	MOV.B	[W14+1], W12
	MOV.B	[W14+0], W11
	MOV	W0, W10
	CALL	_eGlcd_clearText
	POP	W10
;dd_indicators.c,118 :: 		
	PUSH	W10
	CALL	_dd_Indicator_makeTextValue
	POP	W10
;dd_indicators.c,119 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #6, W1
	MOV.B	[W14+2], W0
	CP.B	W0, [W1]
	BRA NZ	L__dd_printIndicator1076
	GOTO	L_dd_printIndicator247
L__dd_printIndicator1076:
;dd_indicators.c,121 :: 		
	CALL	_dd_Indicator_getValueX
	MOV.B	W0, [W14+0]
;dd_indicators.c,122 :: 		
L_dd_printIndicator247:
;dd_indicators.c,123 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	PUSH	W10
	MOV.B	[W14+1], W12
	MOV.B	[W14+0], W11
	MOV	W0, W10
	CALL	_eGlcd_writeText
	POP	W10
;dd_indicators.c,125 :: 		
	CALL	_dd_GraphicController_isFrameUpdateForced
;dd_indicators.c,126 :: 		
	CP0.B	W0
	BRA Z	L__dd_printIndicator1077
	GOTO	L__dd_printIndicator762
L__dd_printIndicator1077:
	CALL	_dd_Dashboard_isPrintedIndicatorRequestingFullUpdate
	CP0.B	W0
	BRA Z	L__dd_printIndicator1078
	GOTO	L__dd_printIndicator761
L__dd_printIndicator1078:
	GOTO	L_dd_printIndicator250
L__dd_printIndicator762:
L__dd_printIndicator761:
;dd_indicators.c,127 :: 		
	PUSH	W10
	CALL	_dd_Indicator_drawContainers
	POP	W10
;dd_indicators.c,128 :: 		
	CALL	_dd_Indicator_getDescriptionX
	MOV.B	W0, [W14+0]
;dd_indicators.c,129 :: 		
	CALL	_dd_Indicator_getDescriptionY
	MOV.B	W0, [W14+1]
;dd_indicators.c,130 :: 		
	PUSH	W10
	MOV	#32, W13
	MOV.B	#8, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_DynamisFont_xTerminal6x8), W10
	CALL	_xGlcd_Set_Font
	POP	W10
;dd_indicators.c,131 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #7, W0
	PUSH	W10
	MOV.B	[W14+1], W13
	MOV.B	[W14+0], W12
	MOV	W0, W11
	MOV	W0, W10
	CALL	_eGlcd_overwriteText
	POP	W10
;dd_indicators.c,132 :: 		
L_dd_printIndicator250:
;dd_indicators.c,134 :: 		
	CALL	_dd_Dashboard_clearIndicatorPrintUpdateRequest
;dd_indicators.c,135 :: 		
L_end_dd_printIndicator:
	POP	W13
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _dd_printIndicator

_dd_Indicator_drawContainers:

;dd_indicators.c,137 :: 		
;dd_indicators.c,139 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #3, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_INDICATORS_POSITION_COORDINATES), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W4
;dd_indicators.c,140 :: 		
	INC	W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_indicators.c,141 :: 		
	ZE	W0, W0
	ADD	W0, #1, W3
	ADD	W3, #29, W2
	ZE	W4, W0
	ADD	W0, #1, W1
	MOV	#41, W0
	ADD	W1, W0, W0
	MOV.B	W2, W13
	MOV.B	W0, W12
	MOV.B	W3, W11
	MOV.B	W1, W10
	MOV	#lo_addr(_BLACK), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#3, W0
	PUSH	W0
	CALL	_Glcd_Rectangle_Round_Edges
	SUB	#4, W15
;dd_indicators.c,149 :: 		
L_end_dd_Indicator_drawContainers:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_Indicator_drawContainers

_dd_Indicator_getDescriptionX:

;dd_indicators.c,151 :: 		
;dd_indicators.c,152 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W3
	ADD	W3, #3, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_INDICATORS_POSITION_COORDINATES), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_indicators.c,153 :: 		
	ZE	W0, W0
	ADD	W0, #20, W2
;dd_indicators.c,154 :: 		
	ADD	W3, #5, W0
	ZE	[W0], W1
	MOV	#6, W0
	MUL.SS	W1, W0, W0
	ASR	W0, #1, W0
	SUB	W2, W0, W0
;dd_indicators.c,155 :: 		
L_end_dd_Indicator_getDescriptionX:
	RETURN
; end of _dd_Indicator_getDescriptionX

_dd_Indicator_getDescriptionY:

;dd_indicators.c,157 :: 		
;dd_indicators.c,158 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #3, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_INDICATORS_POSITION_COORDINATES), W0
	ADD	W0, W1, W0
	ADD	W0, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_indicators.c,159 :: 		
	ZE	W0, W0
	ADD	W0, #3, W0
;dd_indicators.c,160 :: 		
L_end_dd_Indicator_getDescriptionY:
	RETURN
; end of _dd_Indicator_getDescriptionY

_dd_Indicator_getValueX:

;dd_indicators.c,162 :: 		
;dd_indicators.c,164 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W3
	ADD	W3, #3, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_INDICATORS_POSITION_COORDINATES), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	ADD	W0, #20, W2
;dd_indicators.c,165 :: 		
	ADD	W3, #6, W0
	ZE	[W0], W1
	MOV	#6, W0
	MUL.SS	W1, W0, W0
	ASR	W0, #1, W0
	SUB	W2, W0, W0
;dd_indicators.c,166 :: 		
L_end_dd_Indicator_getValueX:
	RETURN
; end of _dd_Indicator_getValueX

_dd_Indicator_getValueY:

;dd_indicators.c,168 :: 		
;dd_indicators.c,169 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #3, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_INDICATORS_POSITION_COORDINATES), W0
	ADD	W0, W1, W0
	ADD	W0, #1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_indicators.c,170 :: 		
	ZE	W0, W0
	ADD	W0, #9, W0
;dd_indicators.c,171 :: 		
	ADD	W0, #11, W0
	SUB	W0, #8, W0
;dd_indicators.c,172 :: 		
	INC	W0
;dd_indicators.c,173 :: 		
L_end_dd_Indicator_getValueY:
	RETURN
; end of _dd_Indicator_getValueY

_dd_Indicator_makeTextValue:
	LNK	#2

;dd_indicators.c,175 :: 		
;dd_indicators.c,176 :: 		
	PUSH	W10
	PUSH	W11
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W0
; valueType start address is: 8 (W4)
	MOV.B	[W0], W4
;dd_indicators.c,177 :: 		
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__dd_Indicator_makeTextValue1085
	GOTO	L_dd_Indicator_makeTextValue251
L__dd_Indicator_makeTextValue1085:
;dd_indicators.c,178 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	PUSH	W10
	MOV	W0, W10
	CALL	_emptyString
	POP	W10
;dd_indicators.c,179 :: 		
	GOTO	L_dd_Indicator_makeTextValue252
; valueType end address is: 8 (W4)
;dd_indicators.c,180 :: 		
L_dd_Indicator_makeTextValue254:
;dd_indicators.c,181 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W1
	ADD	W1, #22, W0
	MOV	[W0], W0
	ADD	W1, #17, W1
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(?lstr_30_DP9_AAC), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#6, W15
	POP	W10
;dd_indicators.c,182 :: 		
	GOTO	L_dd_Indicator_makeTextValue253
;dd_indicators.c,183 :: 		
L_dd_Indicator_makeTextValue255:
;dd_indicators.c,184 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W1
	ADD	W1, #24, W0
	ADD	W1, #17, W1
	PUSH	W10
	PUSH	[W0++]
	PUSH	[W0--]
	MOV	#lo_addr(?lstr_31_DP9_AAC), W0
	PUSH	W0
	PUSH	W1
	CALL	_sprintf
	SUB	#8, W15
	POP	W10
;dd_indicators.c,185 :: 		
	GOTO	L_dd_Indicator_makeTextValue253
;dd_indicators.c,186 :: 		
L_dd_Indicator_makeTextValue256:
;dd_indicators.c,187 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #28, W0
	CP0.B	[W0]
	BRA NZ	L__dd_Indicator_makeTextValue1086
	GOTO	L_dd_Indicator_makeTextValue257
L__dd_Indicator_makeTextValue1086:
;dd_indicators.c,188 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	PUSH	W10
	MOV	_STRING_TRUE, W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W10
;dd_indicators.c,189 :: 		
	GOTO	L_dd_Indicator_makeTextValue258
L_dd_Indicator_makeTextValue257:
;dd_indicators.c,190 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	PUSH	W10
	MOV	_STRING_FALSE, W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W10
;dd_indicators.c,191 :: 		
L_dd_Indicator_makeTextValue258:
;dd_indicators.c,192 :: 		
	GOTO	L_dd_Indicator_makeTextValue253
;dd_indicators.c,193 :: 		
L_dd_Indicator_makeTextValue259:
;dd_indicators.c,194 :: 		
L_dd_Indicator_makeTextValue260:
;dd_indicators.c,195 :: 		
	GOTO	L_dd_Indicator_makeTextValue253
;dd_indicators.c,196 :: 		
L_dd_Indicator_makeTextValue252:
; valueType start address is: 8 (W4)
	CP.B	W4, #1
	BRA NZ	L__dd_Indicator_makeTextValue1087
	GOTO	L_dd_Indicator_makeTextValue254
L__dd_Indicator_makeTextValue1087:
	CP.B	W4, #2
	BRA NZ	L__dd_Indicator_makeTextValue1088
	GOTO	L_dd_Indicator_makeTextValue255
L__dd_Indicator_makeTextValue1088:
	CP.B	W4, #3
	BRA NZ	L__dd_Indicator_makeTextValue1089
	GOTO	L_dd_Indicator_makeTextValue256
L__dd_Indicator_makeTextValue1089:
	CP.B	W4, #4
	BRA NZ	L__dd_Indicator_makeTextValue1090
	GOTO	L_dd_Indicator_makeTextValue259
L__dd_Indicator_makeTextValue1090:
; valueType end address is: 8 (W4)
	GOTO	L_dd_Indicator_makeTextValue260
L_dd_Indicator_makeTextValue253:
;dd_indicators.c,197 :: 		
L_dd_Indicator_makeTextValue251:
;dd_indicators.c,198 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W1
	ADD	W1, #6, W0
	MOV	W0, [W14+0]
	ADD	W1, #17, W0
	MOV	W0, W10
	CALL	_strlen
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;dd_indicators.c,199 :: 		
L_end_dd_Indicator_makeTextValue:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_Indicator_makeTextValue

_dd_Dashboard_init:

;dd_dashboard.c,11 :: 		
;dd_dashboard.c,12 :: 		
	PUSH	W10
	CLR	W10
	CALL	_dGear_set
;dd_dashboard.c,13 :: 		
	CALL	_dGear_setNeutral
;dd_dashboard.c,14 :: 		
	CALL	_dd_Indicators_loadDefaults
;dd_dashboard.c,15 :: 		
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA Z	L__dd_Dashboard_init1092
	GOTO	L_dd_Dashboard_init261
L__dd_Dashboard_init1092:
;dd_dashboard.c,16 :: 		
	CALL	_dd_Dashboard_startupLogo
;dd_dashboard.c,17 :: 		
L_dd_Dashboard_init261:
;dd_dashboard.c,18 :: 		
L_end_dd_Dashboard_init:
	POP	W10
	RETURN
; end of _dd_Dashboard_init

_dd_Dashboard_fireTimedMessage:

;dd_dashboard.c,20 :: 		
;dd_dashboard.c,21 :: 		
	PUSH	W10
	PUSH	W11
	PUSH.D	W12
	CALL	_dd_Dashboard_setAlertTimeout
	POP.D	W12
;dd_dashboard.c,22 :: 		
	MOV.B	W13, W11
	MOV	W12, W10
	CALL	_dd_Dashboard_fireMessage
;dd_dashboard.c,23 :: 		
L_end_dd_Dashboard_fireTimedMessage:
	POP	W11
	POP	W10
	RETURN
; end of _dd_Dashboard_fireTimedMessage

_dd_Dashboard_fireMessage:

;dd_dashboard.c,25 :: 		
;dd_dashboard.c,26 :: 		
	PUSH	W10
	PUSH	W11
	MOV	W10, W11
	MOV	#lo_addr(_dd_alertMessage), W10
	CALL	_strcpy
	POP	W11
;dd_dashboard.c,27 :: 		
	GOTO	L_dd_Dashboard_fireMessage262
;dd_dashboard.c,28 :: 		
L_dd_Dashboard_fireMessage264:
;dd_dashboard.c,29 :: 		
	MOV.B	#4, W10
	CALL	_dd_GraphicController_setInterface
;dd_dashboard.c,30 :: 		
	GOTO	L_dd_Dashboard_fireMessage263
;dd_dashboard.c,31 :: 		
L_dd_Dashboard_fireMessage265:
;dd_dashboard.c,32 :: 		
	MOV.B	#5, W10
	CALL	_dd_GraphicController_setInterface
;dd_dashboard.c,33 :: 		
	GOTO	L_dd_Dashboard_fireMessage263
;dd_dashboard.c,34 :: 		
L_dd_Dashboard_fireMessage266:
;dd_dashboard.c,35 :: 		
	MOV.B	#3, W10
	CALL	_dd_GraphicController_setInterface
;dd_dashboard.c,36 :: 		
	GOTO	L_dd_Dashboard_fireMessage263
;dd_dashboard.c,37 :: 		
L_dd_Dashboard_fireMessage267:
;dd_dashboard.c,38 :: 		
	MOV.B	#4, W10
	CALL	_dd_GraphicController_setInterface
;dd_dashboard.c,39 :: 		
	GOTO	L_dd_Dashboard_fireMessage263
;dd_dashboard.c,40 :: 		
L_dd_Dashboard_fireMessage262:
	CP.B	W11, #0
	BRA NZ	L__dd_Dashboard_fireMessage1095
	GOTO	L_dd_Dashboard_fireMessage264
L__dd_Dashboard_fireMessage1095:
	CP.B	W11, #1
	BRA NZ	L__dd_Dashboard_fireMessage1096
	GOTO	L_dd_Dashboard_fireMessage265
L__dd_Dashboard_fireMessage1096:
	CP.B	W11, #2
	BRA NZ	L__dd_Dashboard_fireMessage1097
	GOTO	L_dd_Dashboard_fireMessage266
L__dd_Dashboard_fireMessage1097:
	GOTO	L_dd_Dashboard_fireMessage267
L_dd_Dashboard_fireMessage263:
;dd_dashboard.c,41 :: 		
L_end_dd_Dashboard_fireMessage:
	POP	W10
	RETURN
; end of _dd_Dashboard_fireMessage

_dd_Dashboard_clearAlerts:

;dd_dashboard.c,43 :: 		
;dd_dashboard.c,44 :: 		
	CALL	_dd_GraphicController_getInterface
;dd_dashboard.c,45 :: 		
	CP.B	W0, #3
	BRA NZ	L__dd_Dashboard_clearAlerts1099
	GOTO	L__dd_Dashboard_clearAlerts766
L__dd_Dashboard_clearAlerts1099:
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #4
	BRA NZ	L__dd_Dashboard_clearAlerts1100
	GOTO	L__dd_Dashboard_clearAlerts765
L__dd_Dashboard_clearAlerts1100:
;dd_dashboard.c,46 :: 		
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #5
	BRA NZ	L__dd_Dashboard_clearAlerts1101
	GOTO	L__dd_Dashboard_clearAlerts764
L__dd_Dashboard_clearAlerts1101:
	GOTO	L_dd_Dashboard_clearAlerts270
;dd_dashboard.c,45 :: 		
L__dd_Dashboard_clearAlerts766:
L__dd_Dashboard_clearAlerts765:
;dd_dashboard.c,46 :: 		
L__dd_Dashboard_clearAlerts764:
;dd_dashboard.c,47 :: 		
	CALL	_dd_GraphicController_switchLastInterface
;dd_dashboard.c,48 :: 		
L_dd_Dashboard_clearAlerts270:
;dd_dashboard.c,49 :: 		
L_end_dd_Dashboard_clearAlerts:
	RETURN
; end of _dd_Dashboard_clearAlerts

_dd_Dashboard_isGearLetterChanged:

;dd_dashboard.c,52 :: 		
;dd_dashboard.c,53 :: 		
	CALL	_dGear_getCurrentGearLetter
	MOV	#lo_addr(_dd_lastPrintedGearLetter), W1
	CP.B	W0, [W1]
	CLR.B	W0
	BRA Z	L__dd_Dashboard_isGearLetterChanged1103
	INC.B	W0
L__dd_Dashboard_isGearLetterChanged1103:
;dd_dashboard.c,54 :: 		
L_end_dd_Dashboard_isGearLetterChanged:
	RETURN
; end of _dd_Dashboard_isGearLetterChanged

_dd_Dashboard_printGearLetter:
	LNK	#2

;dd_dashboard.c,56 :: 		
;dd_dashboard.c,57 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_dGear_getCurrentGearLetter
	MOV.B	W0, [W14+0]
;dd_dashboard.c,58 :: 		
	CALL	_dd_Dashboard_isGearLetterChanged
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printGearLetter1105
	GOTO	L__dd_Dashboard_printGearLetter769
L__dd_Dashboard_printGearLetter1105:
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printGearLetter1106
	GOTO	L__dd_Dashboard_printGearLetter768
L__dd_Dashboard_printGearLetter1106:
	GOTO	L_dd_Dashboard_printGearLetter273
L__dd_Dashboard_printGearLetter769:
L__dd_Dashboard_printGearLetter768:
;dd_dashboard.c,59 :: 		
	MOV	#48, W13
	MOV.B	#59, W12
	MOV.B	#40, W11
	MOV	#lo_addr(_DynamisFont_Gears40x59), W10
	CALL	_xGlcd_Set_Font
;dd_dashboard.c,60 :: 		
	MOV	#lo_addr(_dd_lastPrintedGearLetter), W0
	MOV.B	#3, W13
	MOV.B	#44, W12
	MOV.B	[W14+0], W11
	MOV.B	[W0], W10
	CALL	_eGlcd_overwriteChar
;dd_dashboard.c,61 :: 		
	MOV	#lo_addr(_dd_lastPrintedGearLetter), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;dd_dashboard.c,62 :: 		
L_dd_Dashboard_printGearLetter273:
;dd_dashboard.c,63 :: 		
L_end_dd_Dashboard_printGearLetter:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_Dashboard_printGearLetter

_dd_Dashboard_addIndicator:
	LNK	#2

;dd_dashboard.c,65 :: 		
;dd_dashboard.c,66 :: 		
	PUSH	W10
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	MOV.B	W10, [W0]
;dd_dashboard.c,67 :: 		
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #7, W0
	PUSH	W11
	MOV	W0, W10
	CALL	_strcpy
	POP	W11
;dd_dashboard.c,68 :: 		
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #5, W0
	MOV	W0, [W14+0]
	MOV	W11, W10
	CALL	_strlen
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;dd_dashboard.c,69 :: 		
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;dd_dashboard.c,70 :: 		
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_dashboard.c,71 :: 		
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #29, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_dashboard.c,72 :: 		
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #2, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_dashboard.c,73 :: 		
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #3, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_dashboard.c,74 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	ADD.B	W1, [W0], [W0]
;dd_dashboard.c,75 :: 		
L_end_dd_Dashboard_addIndicator:
	POP	W10
	ULNK
	RETURN
; end of _dd_Dashboard_addIndicator

_dd_Dashboard_requestIndicatorPrintUpdate:

;dd_dashboard.c,77 :: 		
;dd_dashboard.c,79 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	INC	W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__dd_Dashboard_requestIndicatorPrintUpdate1109
	GOTO	L_dd_Dashboard_requestIndicatorPrintUpdate274
L__dd_Dashboard_requestIndicatorPrintUpdate1109:
;dd_dashboard.c,80 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_dashboard.c,81 :: 		
L_dd_Dashboard_requestIndicatorPrintUpdate274:
;dd_dashboard.c,82 :: 		
L_end_dd_Dashboard_requestIndicatorPrintUpdate:
	RETURN
; end of _dd_Dashboard_requestIndicatorPrintUpdate

_dd_Dashboard_requestIndicatorFullPrintUpdate:

;dd_dashboard.c,84 :: 		
;dd_dashboard.c,85 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;dd_dashboard.c,86 :: 		
L_end_dd_Dashboard_requestIndicatorFullPrintUpdate:
	RETURN
; end of _dd_Dashboard_requestIndicatorFullPrintUpdate

_dd_Dashboard_clearIndicatorPrintUpdateRequest:

;dd_dashboard.c,88 :: 		
;dd_dashboard.c,89 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #1, W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_dashboard.c,90 :: 		
L_end_dd_Dashboard_clearIndicatorPrintUpdateRequest:
	RETURN
; end of _dd_Dashboard_clearIndicatorPrintUpdateRequest

_dd_Dashboard_isPrintedIndicatorRequestingUpdate:

;dd_dashboard.c,92 :: 		
;dd_dashboard.c,93 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	INC	W0
;dd_dashboard.c,94 :: 		
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__dd_Dashboard_isPrintedIndicatorRequestingUpdate1113
	GOTO	L_dd_Dashboard_isPrintedIndicatorRequestingUpdate276
L__dd_Dashboard_isPrintedIndicatorRequestingUpdate1113:
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	INC	W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__dd_Dashboard_isPrintedIndicatorRequestingUpdate1114
	GOTO	L_dd_Dashboard_isPrintedIndicatorRequestingUpdate276
L__dd_Dashboard_isPrintedIndicatorRequestingUpdate1114:
	CLR	W1
	GOTO	L_dd_Dashboard_isPrintedIndicatorRequestingUpdate275
L_dd_Dashboard_isPrintedIndicatorRequestingUpdate276:
	MOV.B	#1, W0
	MOV.B	W0, W1
L_dd_Dashboard_isPrintedIndicatorRequestingUpdate275:
	MOV.B	W1, W0
;dd_dashboard.c,95 :: 		
L_end_dd_Dashboard_isPrintedIndicatorRequestingUpdate:
	RETURN
; end of _dd_Dashboard_isPrintedIndicatorRequestingUpdate

_dd_Dashboard_isPrintedIndicatorRequestingFullUpdate:

;dd_dashboard.c,97 :: 		
;dd_dashboard.c,98 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	INC	W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	CLR.B	W0
	BRA NZ	L__dd_Dashboard_isPrintedIndicatorRequestingFullUpdate1116
	INC.B	W0
L__dd_Dashboard_isPrintedIndicatorRequestingFullUpdate1116:
;dd_dashboard.c,99 :: 		
L_end_dd_Dashboard_isPrintedIndicatorRequestingFullUpdate:
	RETURN
; end of _dd_Dashboard_isPrintedIndicatorRequestingFullUpdate

_dd_Dashboard_printIndicators:
	LNK	#2

;dd_dashboard.c,101 :: 		
;dd_dashboard.c,103 :: 		
	PUSH	W10
	CLR	W0
	MOV.B	W0, [W14+0]
L_dd_Dashboard_printIndicators277:
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA LTU	L__dd_Dashboard_printIndicators1118
	GOTO	L_dd_Dashboard_printIndicators278
L__dd_Dashboard_printIndicators1118:
;dd_dashboard.c,104 :: 		
	MOV.B	[W14+0], W10
	CALL	_dd_Dashboard_getIndicatorIndexAtPosition
; index start address is: 8 (W4)
	MOV.B	W0, W4
;dd_dashboard.c,105 :: 		
	MOV.B	W0, W10
	CALL	_dd_Dashboard_isPrintedIndicatorRequestingUpdate
;dd_dashboard.c,106 :: 		
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printIndicators1119
	GOTO	L__dd_Dashboard_printIndicators775
L__dd_Dashboard_printIndicators1119:
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_Dashboard_printIndicators1120
	GOTO	L__dd_Dashboard_printIndicators774
L__dd_Dashboard_printIndicators1120:
; index end address is: 8 (W4)
	GOTO	L_dd_Dashboard_printIndicators282
L__dd_Dashboard_printIndicators775:
; index start address is: 8 (W4)
L__dd_Dashboard_printIndicators774:
;dd_dashboard.c,107 :: 		
	MOV.B	W4, W10
; index end address is: 8 (W4)
	CALL	_dd_printIndicator
;dd_dashboard.c,108 :: 		
L_dd_Dashboard_printIndicators282:
;dd_dashboard.c,103 :: 		
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
;dd_dashboard.c,109 :: 		
	GOTO	L_dd_Dashboard_printIndicators277
L_dd_Dashboard_printIndicators278:
;dd_dashboard.c,110 :: 		
L_end_dd_Dashboard_printIndicators:
	POP	W10
	ULNK
	RETURN
; end of _dd_Dashboard_printIndicators

_dd_Dashboard_getIndicatorIndex:

;dd_dashboard.c,112 :: 		
;dd_dashboard.c,114 :: 		
; i start address is: 8 (W4)
	CLR	W4
; i end address is: 8 (W4)
L_dd_Dashboard_getIndicatorIndex283:
;dd_dashboard.c,115 :: 		
; i start address is: 8 (W4)
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	MOV.B	[W0], W0
	CP.B	W0, W10
	BRA Z	L__dd_Dashboard_getIndicatorIndex1122
	GOTO	L_dd_Dashboard_getIndicatorIndex286
L__dd_Dashboard_getIndicatorIndex1122:
;dd_dashboard.c,116 :: 		
	MOV.B	W4, W0
; i end address is: 8 (W4)
	GOTO	L_end_dd_Dashboard_getIndicatorIndex
;dd_dashboard.c,117 :: 		
L_dd_Dashboard_getIndicatorIndex286:
;dd_dashboard.c,114 :: 		
; i start address is: 0 (W0)
; i start address is: 8 (W4)
	ADD.B	W4, #1, W0
; i end address is: 8 (W4)
;dd_dashboard.c,118 :: 		
	MOV.B	W0, W4
; i end address is: 0 (W0)
	GOTO	L_dd_Dashboard_getIndicatorIndex283
;dd_dashboard.c,120 :: 		
L_end_dd_Dashboard_getIndicatorIndex:
	RETURN
; end of _dd_Dashboard_getIndicatorIndex

_dd_Dashboard_getIndicatorIndexAtPosition:

;dd_dashboard.c,122 :: 		
;dd_dashboard.c,124 :: 		
; index start address is: 8 (W4)
	CLR	W4
; index end address is: 8 (W4)
L_dd_Dashboard_getIndicatorIndexAtPosition287:
; index start address is: 8 (W4)
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	CP.B	W4, [W0]
	BRA LTU	L__dd_Dashboard_getIndicatorIndexAtPosition1124
	GOTO	L_dd_Dashboard_getIndicatorIndexAtPosition288
L__dd_Dashboard_getIndicatorIndexAtPosition1124:
;dd_dashboard.c,125 :: 		
	PUSH	W10
	MOV.B	W4, W10
	CALL	_dd_Indicator_isVisible
	POP	W10
	CP0.B	W0
	BRA NZ	L__dd_Dashboard_getIndicatorIndexAtPosition1125
	GOTO	L__dd_Dashboard_getIndicatorIndexAtPosition772
L__dd_Dashboard_getIndicatorIndexAtPosition1125:
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #3, W0
	CP.B	W10, [W0]
	BRA Z	L__dd_Dashboard_getIndicatorIndexAtPosition1126
	GOTO	L__dd_Dashboard_getIndicatorIndexAtPosition771
L__dd_Dashboard_getIndicatorIndexAtPosition1126:
L__dd_Dashboard_getIndicatorIndexAtPosition770:
;dd_dashboard.c,126 :: 		
	MOV.B	W4, W0
; index end address is: 8 (W4)
	GOTO	L_end_dd_Dashboard_getIndicatorIndexAtPosition
;dd_dashboard.c,125 :: 		
L__dd_Dashboard_getIndicatorIndexAtPosition772:
; index start address is: 8 (W4)
L__dd_Dashboard_getIndicatorIndexAtPosition771:
;dd_dashboard.c,124 :: 		
; index start address is: 0 (W0)
	ADD.B	W4, #1, W0
; index end address is: 8 (W4)
;dd_dashboard.c,128 :: 		
	MOV.B	W0, W4
; index end address is: 0 (W0)
	GOTO	L_dd_Dashboard_getIndicatorIndexAtPosition287
L_dd_Dashboard_getIndicatorIndexAtPosition288:
;dd_dashboard.c,129 :: 		
	CLR	W0
;dd_dashboard.c,130 :: 		
L_end_dd_Dashboard_getIndicatorIndexAtPosition:
	RETURN
; end of _dd_Dashboard_getIndicatorIndexAtPosition

_dd_Dashboard_setAlertTimeout:

;dd_dashboard.c,132 :: 		
;dd_dashboard.c,133 :: 		
	MOV	#52429, W2
	MOV	#15820, W3
	MOV.D	W10, W0
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#16128, W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	W0, _dd_alertTicks
;dd_dashboard.c,134 :: 		
L_end_dd_Dashboard_setAlertTimeout:
	RETURN
; end of _dd_Dashboard_setAlertTimeout

_dd_Dashboard_startupLogo:

;dd_dashboard.c,136 :: 		
;dd_dashboard.c,140 :: 		
	PUSH	W10
	PUSH	W11
	MOV	#___Lib_System_DefaultPage, W0
	MOV	#lo_addr(_DYNAMIS_LOGO), W10
	MOV	W0, W11
	CALL	_Glcd_Image
;dd_dashboard.c,141 :: 		
	CALL	_dLedStripe_clear
;dd_dashboard.c,142 :: 		
	MOV	#9, W8
	MOV	#29047, W7
L_dd_Dashboard_startupLogo293:
	DEC	W7
	BRA NZ	L_dd_Dashboard_startupLogo293
	DEC	W8
	BRA NZ	L_dd_Dashboard_startupLogo293
;dd_dashboard.c,143 :: 		
	MOV	#lo_addr(dd_Dashboard_startupLogo_step1_L0), W10
	CALL	_dLedStripe_setLedStripe
;dd_dashboard.c,144 :: 		
	MOV	#9, W8
	MOV	#29047, W7
L_dd_Dashboard_startupLogo295:
	DEC	W7
	BRA NZ	L_dd_Dashboard_startupLogo295
	DEC	W8
	BRA NZ	L_dd_Dashboard_startupLogo295
;dd_dashboard.c,145 :: 		
	MOV	#lo_addr(dd_Dashboard_startupLogo_step2_L0), W10
	CALL	_dLedStripe_setLedStripe
;dd_dashboard.c,146 :: 		
	MOV	#9, W8
	MOV	#29047, W7
L_dd_Dashboard_startupLogo297:
	DEC	W7
	BRA NZ	L_dd_Dashboard_startupLogo297
	DEC	W8
	BRA NZ	L_dd_Dashboard_startupLogo297
;dd_dashboard.c,147 :: 		
	MOV	#lo_addr(dd_Dashboard_startupLogo_step3_L0), W10
	CALL	_dLedStripe_setLedStripe
;dd_dashboard.c,148 :: 		
	MOV	#9, W8
	MOV	#29047, W7
L_dd_Dashboard_startupLogo299:
	DEC	W7
	BRA NZ	L_dd_Dashboard_startupLogo299
	DEC	W8
	BRA NZ	L_dd_Dashboard_startupLogo299
;dd_dashboard.c,149 :: 		
	MOV	#9, W8
	MOV	#29047, W7
L_dd_Dashboard_startupLogo301:
	DEC	W7
	BRA NZ	L_dd_Dashboard_startupLogo301
	DEC	W8
	BRA NZ	L_dd_Dashboard_startupLogo301
;dd_dashboard.c,150 :: 		
	MOV	#lo_addr(dd_Dashboard_startupLogo_step2_L0), W10
	CALL	_dLedStripe_setLedStripe
;dd_dashboard.c,151 :: 		
	MOV	#9, W8
	MOV	#29047, W7
L_dd_Dashboard_startupLogo303:
	DEC	W7
	BRA NZ	L_dd_Dashboard_startupLogo303
	DEC	W8
	BRA NZ	L_dd_Dashboard_startupLogo303
;dd_dashboard.c,152 :: 		
	MOV	#lo_addr(dd_Dashboard_startupLogo_step1_L0), W10
	CALL	_dLedStripe_setLedStripe
;dd_dashboard.c,153 :: 		
	MOV	#9, W8
	MOV	#29047, W7
L_dd_Dashboard_startupLogo305:
	DEC	W7
	BRA NZ	L_dd_Dashboard_startupLogo305
	DEC	W8
	BRA NZ	L_dd_Dashboard_startupLogo305
;dd_dashboard.c,154 :: 		
	CALL	_dLedStripe_clear
;dd_dashboard.c,155 :: 		
	MOV	#51, W8
	MOV	#56549, W7
L_dd_Dashboard_startupLogo307:
	DEC	W7
	BRA NZ	L_dd_Dashboard_startupLogo307
	DEC	W8
	BRA NZ	L_dd_Dashboard_startupLogo307
;dd_dashboard.c,156 :: 		
L_end_dd_Dashboard_startupLogo:
	POP	W11
	POP	W10
	RETURN
; end of _dd_Dashboard_startupLogo

_dd_Interface_printMessage:

;dd_interfaces.c,10 :: 		
;dd_interfaces.c,12 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA NZ	L__dd_Interface_printMessage1130
	GOTO	L_dd_Interface_printMessage309
L__dd_Interface_printMessage1130:
;dd_interfaces.c,13 :: 		
	CALL	_eGlcd_invertColors
;dd_interfaces.c,14 :: 		
	CALL	_eGlcd_clear
;dd_interfaces.c,15 :: 		
	CALL	_dd_Interface_drawTitle
;dd_interfaces.c,16 :: 		
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
;dd_interfaces.c,17 :: 		
	MOV	#lo_addr(_dd_alertMessage), W10
	CALL	_dd_Interface_getTitleX
;dd_interfaces.c,19 :: 		
	MOV.B	#32, W12
	MOV.B	W0, W11
	MOV	#lo_addr(_dd_alertMessage), W10
	CALL	_eGlcd_writeText
;dd_interfaces.c,20 :: 		
	CALL	_eGlcd_invertColors
;dd_interfaces.c,21 :: 		
L_dd_Interface_printMessage309:
;dd_interfaces.c,22 :: 		
L_end_dd_Interface_printMessage:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_Interface_printMessage

_dd_Interface_printDashboard:

;dd_interfaces.c,24 :: 		
;dd_interfaces.c,25 :: 		
	CALL	_dd_Dashboard_printGearLetter
;dd_interfaces.c,26 :: 		
	CALL	_dd_Dashboard_printIndicators
;dd_interfaces.c,27 :: 		
L_end_dd_Interface_printDashboard:
	RETURN
; end of _dd_Interface_printDashboard

_dd_Interface_printSettings:

;dd_interfaces.c,29 :: 		
;dd_interfaces.c,30 :: 		
	PUSH	W10
	PUSH	W11
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA NZ	L__dd_Interface_printSettings1133
	GOTO	L_dd_Interface_printSettings310
L__dd_Interface_printSettings1133:
;dd_interfaces.c,31 :: 		
	CALL	_dd_Menu_reset
;dd_interfaces.c,32 :: 		
	MOV.B	#3, W10
	CALL	_dd_Menu_setY_OFFSET
;dd_interfaces.c,33 :: 		
	MOV.B	#5, W10
	CALL	_dd_Menu_setHeight
;dd_interfaces.c,34 :: 		
	MOV	#lo_addr(?lstr32_DP9_AAC), W11
	CLR	W10
	CALL	_dd_Menu_addLine
;dd_interfaces.c,35 :: 		
	MOV	#lo_addr(?lstr33_DP9_AAC), W11
	MOV.B	#1, W10
	CALL	_dd_Menu_addLine
;dd_interfaces.c,36 :: 		
	MOV	#lo_addr(?lstr34_DP9_AAC), W11
	MOV.B	#2, W10
	CALL	_dd_Menu_addLine
;dd_interfaces.c,37 :: 		
	MOV	#lo_addr(?lstr35_DP9_AAC), W11
	MOV.B	#3, W10
	CALL	_dd_Menu_addLine
;dd_interfaces.c,38 :: 		
	MOV	#lo_addr(?lstr36_DP9_AAC), W11
	MOV.B	#4, W10
	CALL	_dd_Menu_addLine
;dd_interfaces.c,39 :: 		
	MOV	#lo_addr(?lstr37_DP9_AAC), W11
	MOV.B	#5, W10
	CALL	_dd_Menu_addLine
;dd_interfaces.c,41 :: 		
	CLR	W10
	CALL	_dd_Dashboard_getIndicatorIndexAtPosition
	ZE	W0, W0
	MOV	W0, _dd_menuLines+26
;dd_interfaces.c,42 :: 		
	MOV	#lo_addr(_dd_menuLines+32), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_interfaces.c,44 :: 		
	CLR	W10
	CALL	_dd_Dashboard_getIndicatorIndexAtPosition
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #7, W0
	MOV	W0, W11
;dd_interfaces.c,43 :: 		
	CLR	W10
;dd_interfaces.c,44 :: 		
	CALL	_dd_MenuLine_setStringValue
;dd_interfaces.c,46 :: 		
	MOV.B	#1, W10
	CALL	_dd_Dashboard_getIndicatorIndexAtPosition
	ZE	W0, W0
	MOV	W0, _dd_menuLines+64
;dd_interfaces.c,47 :: 		
	MOV	#lo_addr(_dd_menuLines+70), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_interfaces.c,49 :: 		
	MOV.B	#1, W10
	CALL	_dd_Dashboard_getIndicatorIndexAtPosition
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #7, W0
	MOV	W0, W11
;dd_interfaces.c,48 :: 		
	MOV.B	#1, W10
;dd_interfaces.c,49 :: 		
	CALL	_dd_MenuLine_setStringValue
;dd_interfaces.c,52 :: 		
	MOV.B	#2, W10
	CALL	_dd_Dashboard_getIndicatorIndexAtPosition
	ZE	W0, W0
	MOV	W0, _dd_menuLines+102
;dd_interfaces.c,53 :: 		
	MOV	#lo_addr(_dd_menuLines+70), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;dd_interfaces.c,55 :: 		
	MOV.B	#2, W10
	CALL	_dd_Dashboard_getIndicatorIndexAtPosition
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #7, W0
	MOV	W0, W11
;dd_interfaces.c,54 :: 		
	MOV.B	#2, W10
;dd_interfaces.c,55 :: 		
	CALL	_dd_MenuLine_setStringValue
;dd_interfaces.c,58 :: 		
	MOV.B	#3, W10
	CALL	_dd_Dashboard_getIndicatorIndexAtPosition
	ZE	W0, W0
	MOV	W0, _dd_menuLines+140
;dd_interfaces.c,59 :: 		
	MOV	#lo_addr(_dd_menuLines+70), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;dd_interfaces.c,62 :: 		
	MOV.B	#3, W10
	CALL	_dd_Dashboard_getIndicatorIndexAtPosition
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #7, W0
	MOV	W0, W11
;dd_interfaces.c,61 :: 		
	MOV.B	#3, W10
;dd_interfaces.c,62 :: 		
	CALL	_dd_MenuLine_setStringValue
;dd_interfaces.c,63 :: 		
	CALL	_dd_GraphicController_areColorsInverted
	MOV.B	W0, W11
	MOV.B	#4, W10
	CALL	_dd_MenuLine_setBoolValue
;dd_interfaces.c,65 :: 		
	CALL	_dGear_isShiftingCheckBypassed
	MOV.B	W0, W11
	MOV.B	#5, W10
	CALL	_dd_MenuLine_setBoolValue
;dd_interfaces.c,67 :: 		
	MOV	#lo_addr(?lstr38_DP9_AAC), W10
	CALL	_dd_Interface_drawTitle
;dd_interfaces.c,68 :: 		
L_dd_Interface_printSettings310:
;dd_interfaces.c,69 :: 		
	CALL	_dd_printMenu
;dd_interfaces.c,70 :: 		
L_end_dd_Interface_printSettings:
	POP	W11
	POP	W10
	RETURN
; end of _dd_Interface_printSettings

_dd_Interface_onSettingsChange:

;dd_interfaces.c,77 :: 		
;dd_interfaces.c,79 :: 		
	PUSH	W10
	PUSH	W11
; position start address is: 12 (W6)
	MOV.B	#50, W6
;dd_interfaces.c,80 :: 		
	GOTO	L_dd_Interface_onSettingsChange311
; position end address is: 12 (W6)
;dd_interfaces.c,81 :: 		
L_dd_Interface_onSettingsChange313:
;dd_interfaces.c,82 :: 		
; position start address is: 8 (W4)
	CLR	W4
;dd_interfaces.c,83 :: 		
; position end address is: 8 (W4)
	GOTO	L_dd_Interface_onSettingsChange312
;dd_interfaces.c,84 :: 		
L_dd_Interface_onSettingsChange314:
;dd_interfaces.c,85 :: 		
; position start address is: 8 (W4)
	MOV.B	#1, W4
;dd_interfaces.c,86 :: 		
; position end address is: 8 (W4)
	GOTO	L_dd_Interface_onSettingsChange312
;dd_interfaces.c,87 :: 		
L_dd_Interface_onSettingsChange315:
;dd_interfaces.c,88 :: 		
; position start address is: 8 (W4)
	MOV.B	#2, W4
;dd_interfaces.c,89 :: 		
; position end address is: 8 (W4)
	GOTO	L_dd_Interface_onSettingsChange312
;dd_interfaces.c,90 :: 		
L_dd_Interface_onSettingsChange316:
;dd_interfaces.c,91 :: 		
; position start address is: 8 (W4)
	MOV.B	#3, W4
;dd_interfaces.c,92 :: 		
; position end address is: 8 (W4)
	GOTO	L_dd_Interface_onSettingsChange312
;dd_interfaces.c,93 :: 		
L_dd_Interface_onSettingsChange317:
;dd_interfaces.c,94 :: 		
; position start address is: 12 (W6)
	CALL	_dd_GraphicController_invertColors
;dd_interfaces.c,95 :: 		
	PUSH	W10
	MOV.B	#4, W10
	CALL	_dd_MenuLine_switchBoolValue
	POP	W10
;dd_interfaces.c,96 :: 		
	MOV.B	W6, W4
	GOTO	L_dd_Interface_onSettingsChange312
;dd_interfaces.c,97 :: 		
L_dd_Interface_onSettingsChange318:
;dd_interfaces.c,98 :: 		
	CALL	_dGear_isShiftingCheckBypassed
	CP0.B	W0
	BRA NZ	L__dd_Interface_onSettingsChange1135
	GOTO	L_dd_Interface_onSettingsChange319
L__dd_Interface_onSettingsChange1135:
;dd_interfaces.c,99 :: 		
	CALL	_dGear_enableShiftCheck
;dd_interfaces.c,100 :: 		
	PUSH	W10
	CLR	W11
	MOV.B	#5, W10
	CALL	_dd_MenuLine_setBoolValue
	POP	W10
;dd_interfaces.c,101 :: 		
	GOTO	L_dd_Interface_onSettingsChange320
L_dd_Interface_onSettingsChange319:
;dd_interfaces.c,102 :: 		
	CALL	_dGear_disableShiftCheck
;dd_interfaces.c,103 :: 		
	PUSH	W10
	MOV.B	#1, W11
	MOV.B	#5, W10
	CALL	_dd_MenuLine_setBoolValue
	POP	W10
;dd_interfaces.c,104 :: 		
L_dd_Interface_onSettingsChange320:
;dd_interfaces.c,105 :: 		
	MOV.B	W6, W4
	GOTO	L_dd_Interface_onSettingsChange312
;dd_interfaces.c,106 :: 		
L_dd_Interface_onSettingsChange321:
;dd_interfaces.c,107 :: 		
	MOV.B	W6, W4
	GOTO	L_dd_Interface_onSettingsChange312
;dd_interfaces.c,108 :: 		
L_dd_Interface_onSettingsChange311:
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__dd_Interface_onSettingsChange1136
	GOTO	L_dd_Interface_onSettingsChange313
L__dd_Interface_onSettingsChange1136:
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__dd_Interface_onSettingsChange1137
	GOTO	L_dd_Interface_onSettingsChange314
L__dd_Interface_onSettingsChange1137:
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__dd_Interface_onSettingsChange1138
	GOTO	L_dd_Interface_onSettingsChange315
L__dd_Interface_onSettingsChange1138:
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__dd_Interface_onSettingsChange1139
	GOTO	L_dd_Interface_onSettingsChange316
L__dd_Interface_onSettingsChange1139:
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__dd_Interface_onSettingsChange1140
	GOTO	L_dd_Interface_onSettingsChange317
L__dd_Interface_onSettingsChange1140:
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__dd_Interface_onSettingsChange1141
	GOTO	L_dd_Interface_onSettingsChange318
L__dd_Interface_onSettingsChange1141:
	GOTO	L_dd_Interface_onSettingsChange321
; position end address is: 12 (W6)
L_dd_Interface_onSettingsChange312:
;dd_interfaces.c,109 :: 		
; position start address is: 8 (W4)
	MOV.B	#50, W0
	CP.B	W4, W0
	BRA NZ	L__dd_Interface_onSettingsChange1142
	GOTO	L_dd_Interface_onSettingsChange322
L__dd_Interface_onSettingsChange1142:
;dd_interfaces.c,112 :: 		
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #26, W0
; indexIndicator start address is: 2 (W1)
	MOV.B	[W0], W1
;dd_interfaces.c,114 :: 		
	CP.B	W10, #1
	BRA Z	L__dd_Interface_onSettingsChange1143
	GOTO	L_dd_Interface_onSettingsChange323
L__dd_Interface_onSettingsChange1143:
;dd_interfaces.c,115 :: 		
	ZE	W1, W0
; indexIndicator end address is: 2 (W1)
	ADD	W0, #1, W1
; indexIndicator start address is: 4 (W2)
	MOV.B	W1, W2
;dd_interfaces.c,116 :: 		
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	CP.B	W1, [W0]
	BRA Z	L__dd_Interface_onSettingsChange1144
	GOTO	L__dd_Interface_onSettingsChange776
L__dd_Interface_onSettingsChange1144:
; indexIndicator end address is: 4 (W2)
;dd_interfaces.c,117 :: 		
; indexIndicator start address is: 0 (W0)
	CLR	W0
; indexIndicator end address is: 0 (W0)
	MOV.B	W0, W5
;dd_interfaces.c,118 :: 		
	GOTO	L_dd_Interface_onSettingsChange324
L__dd_Interface_onSettingsChange776:
;dd_interfaces.c,116 :: 		
	MOV.B	W2, W5
;dd_interfaces.c,118 :: 		
L_dd_Interface_onSettingsChange324:
;dd_interfaces.c,119 :: 		
; indexIndicator start address is: 10 (W5)
; indexIndicator end address is: 10 (W5)
	GOTO	L_dd_Interface_onSettingsChange325
L_dd_Interface_onSettingsChange323:
;dd_interfaces.c,120 :: 		
; indexIndicator start address is: 2 (W1)
	CP.B	W1, #0
	BRA GTU	L__dd_Interface_onSettingsChange1145
	GOTO	L_dd_Interface_onSettingsChange326
L__dd_Interface_onSettingsChange1145:
;dd_interfaces.c,121 :: 		
; indexIndicator start address is: 0 (W0)
	SUB.B	W1, #1, W0
; indexIndicator end address is: 2 (W1)
;dd_interfaces.c,122 :: 		
	MOV.B	W0, W5
; indexIndicator end address is: 0 (W0)
	GOTO	L_dd_Interface_onSettingsChange327
L_dd_Interface_onSettingsChange326:
;dd_interfaces.c,123 :: 		
	MOV	#lo_addr(_dd_Dashboard_indicatorsCount), W0
	MOV.B	[W0], W0
; indexIndicator start address is: 0 (W0)
	DEC.B	W0
; indexIndicator end address is: 0 (W0)
	MOV.B	W0, W5
;dd_interfaces.c,124 :: 		
L_dd_Interface_onSettingsChange327:
;dd_interfaces.c,125 :: 		
; indexIndicator start address is: 10 (W5)
; indexIndicator end address is: 10 (W5)
L_dd_Interface_onSettingsChange325:
;dd_interfaces.c,127 :: 		
; indexIndicator start address is: 10 (W5)
	MOV	#lo_addr(_indexIndicatorToChange), W0
	MOV.B	W5, [W0]
;dd_interfaces.c,128 :: 		
	MOV	#lo_addr(_positionToChange), W0
	MOV.B	W4, [W0]
; position end address is: 8 (W4)
;dd_interfaces.c,129 :: 		
	MOV	#38, W1
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	ZE	[W0], W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_dd_menuLines), W0
	ADD	W0, W2, W0
	ADD	W0, #26, W1
	ZE	W5, W0
	MOV	W0, [W1]
;dd_interfaces.c,130 :: 		
	ZE	W5, W1
; indexIndicator end address is: 10 (W5)
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #7, W1
	MOV	#lo_addr(_dd_Menu_SelectedLine), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_dd_MenuLine_setStringValue
;dd_interfaces.c,131 :: 		
L_dd_Interface_onSettingsChange322:
;dd_interfaces.c,132 :: 		
L_end_dd_Interface_onSettingsChange:
	POP	W11
	POP	W10
	RETURN
; end of _dd_Interface_onSettingsChange

_dd_Interface_applySettings:

;dd_interfaces.c,134 :: 		
;dd_interfaces.c,135 :: 		
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_indexIndicatorToChange), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA NZ	L__dd_Interface_applySettings1147
	GOTO	L_dd_Interface_applySettings328
L__dd_Interface_applySettings1147:
;dd_interfaces.c,136 :: 		
	MOV	#lo_addr(_indexIndicatorToChange), W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_positionToChange), W0
	MOV.B	[W0], W11
	MOV.B	W1, W10
	CALL	_dd_Indicator_setPrintPosition
;dd_interfaces.c,137 :: 		
L_dd_Interface_applySettings328:
;dd_interfaces.c,138 :: 		
L_end_dd_Interface_applySettings:
	POP	W11
	POP	W10
	RETURN
; end of _dd_Interface_applySettings

_dd_Interface_printDebug:
	LNK	#2

;dd_interfaces.c,140 :: 		
;dd_interfaces.c,142 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA NZ	L__dd_Interface_printDebug1149
	GOTO	L_dd_Interface_printDebug329
L__dd_Interface_printDebug1149:
;dd_interfaces.c,143 :: 		
	MOV	#lo_addr(?lstr39_DP9_AAC), W10
	CALL	_dd_Interface_drawTitle
;dd_interfaces.c,144 :: 		
	CALL	_dd_Menu_reset
;dd_interfaces.c,145 :: 		
	MOV.B	#3, W10
	CALL	_dd_Menu_setY_OFFSET
;dd_interfaces.c,146 :: 		
	MOV.B	#5, W10
	CALL	_dd_Menu_setHeight
;dd_interfaces.c,147 :: 		
; i start address is: 8 (W4)
	CLR	W4
; i end address is: 8 (W4)
L_dd_Interface_printDebug330:
; i start address is: 8 (W4)
	CP.B	W4, #22
	BRA LTU	L__dd_Interface_printDebug1150
	GOTO	L_dd_Interface_printDebug331
L__dd_Interface_printDebug1150:
;dd_interfaces.c,148 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #7, W0
	MOV	W0, W11
	MOV.B	W4, W10
	CALL	_dd_Menu_addLine
;dd_interfaces.c,147 :: 		
; i start address is: 0 (W0)
	ADD.B	W4, #1, W0
; i end address is: 8 (W4)
;dd_interfaces.c,149 :: 		
	MOV.B	W0, W4
; i end address is: 0 (W0)
	GOTO	L_dd_Interface_printDebug330
L_dd_Interface_printDebug331:
;dd_interfaces.c,150 :: 		
L_dd_Interface_printDebug329:
;dd_interfaces.c,151 :: 		
; i start address is: 8 (W4)
	CLR	W4
; i end address is: 8 (W4)
L_dd_Interface_printDebug333:
; i start address is: 8 (W4)
	CP.B	W4, #22
	BRA LTU	L__dd_Interface_printDebug1151
	GOTO	L_dd_Interface_printDebug334
L__dd_Interface_printDebug1151:
;dd_interfaces.c,153 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W0
	MOV	W0, [W14+0]
	GOTO	L_dd_Interface_printDebug336
;dd_interfaces.c,154 :: 		
L_dd_Interface_printDebug338:
;dd_interfaces.c,155 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	PUSH	W4
	MOV	W0, W11
	MOV.B	W4, W10
	CALL	_dd_MenuLine_setStringValue
	POP	W4
;dd_interfaces.c,156 :: 		
	GOTO	L_dd_Interface_printDebug337
;dd_interfaces.c,157 :: 		
L_dd_Interface_printDebug339:
;dd_interfaces.c,158 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #22, W0
	PUSH	W4
	MOV	[W0], W11
	MOV.B	W4, W10
	CALL	_dd_MenuLine_setIntValue
	POP	W4
;dd_interfaces.c,159 :: 		
	GOTO	L_dd_Interface_printDebug337
;dd_interfaces.c,160 :: 		
L_dd_Interface_printDebug340:
;dd_interfaces.c,161 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #24, W0
	PUSH	W4
	MOV	[W0++], W11
	MOV	[W0--], W12
	MOV.B	W4, W10
	CALL	_dd_MenuLine_setFloatValue
	POP	W4
;dd_interfaces.c,162 :: 		
	GOTO	L_dd_Interface_printDebug337
;dd_interfaces.c,163 :: 		
L_dd_Interface_printDebug341:
;dd_interfaces.c,164 :: 		
	ZE	W4, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #28, W0
	PUSH	W4
	MOV.B	[W0], W11
	MOV.B	W4, W10
	CALL	_dd_MenuLine_setBoolValue
	POP	W4
;dd_interfaces.c,165 :: 		
	GOTO	L_dd_Interface_printDebug337
;dd_interfaces.c,166 :: 		
L_dd_Interface_printDebug342:
;dd_interfaces.c,167 :: 		
	GOTO	L_dd_Interface_printDebug337
;dd_interfaces.c,168 :: 		
L_dd_Interface_printDebug336:
	MOV	[W14+0], W1
	MOV.B	[W1], W0
	CP.B	W0, #0
	BRA NZ	L__dd_Interface_printDebug1152
	GOTO	L_dd_Interface_printDebug338
L__dd_Interface_printDebug1152:
	MOV.B	[W1], W0
	CP.B	W0, #1
	BRA NZ	L__dd_Interface_printDebug1153
	GOTO	L_dd_Interface_printDebug339
L__dd_Interface_printDebug1153:
	MOV.B	[W1], W0
	CP.B	W0, #2
	BRA NZ	L__dd_Interface_printDebug1154
	GOTO	L_dd_Interface_printDebug340
L__dd_Interface_printDebug1154:
	MOV.B	[W1], W0
	CP.B	W0, #3
	BRA NZ	L__dd_Interface_printDebug1155
	GOTO	L_dd_Interface_printDebug341
L__dd_Interface_printDebug1155:
	GOTO	L_dd_Interface_printDebug342
L_dd_Interface_printDebug337:
;dd_interfaces.c,151 :: 		
; i start address is: 0 (W0)
	ADD.B	W4, #1, W0
; i end address is: 8 (W4)
;dd_interfaces.c,169 :: 		
	MOV.B	W0, W4
; i end address is: 0 (W0)
	GOTO	L_dd_Interface_printDebug333
L_dd_Interface_printDebug334:
;dd_interfaces.c,170 :: 		
	CALL	_dd_printMenu
;dd_interfaces.c,171 :: 		
L_end_dd_Interface_printDebug:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_Interface_printDebug

_dd_Interface_printParameterPage:
	LNK	#4

;dd_interfaces.c,173 :: 		
;dd_interfaces.c,175 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_dd_Dashboard_getIndicatorIndex
	MOV.B	W0, [W14+3]
;dd_interfaces.c,176 :: 		
	ZE	W0, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #6, W0
	MOV.B	[W0], W0
	MOV.B	W0, [W14+2]
;dd_interfaces.c,178 :: 		
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA NZ	L__dd_Interface_printParameterPage1157
	GOTO	L_dd_Interface_printParameterPage343
L__dd_Interface_printParameterPage1157:
;dd_interfaces.c,179 :: 		
	ADD	W14, #3, W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #7, W0
	MOV	W0, W10
	CALL	_dd_Interface_drawTitle
;dd_interfaces.c,180 :: 		
L_dd_Interface_printParameterPage343:
;dd_interfaces.c,182 :: 		
	CALL	_dd_GraphicController_isFrameUpdateForced
;dd_interfaces.c,183 :: 		
	CP0.B	W0
	BRA Z	L__dd_Interface_printParameterPage1158
	GOTO	L__dd_Interface_printParameterPage779
L__dd_Interface_printParameterPage1158:
	MOV.B	[W14+3], W10
	CALL	_dd_Dashboard_isPrintedIndicatorRequestingUpdate
	CP0.B	W0
	BRA Z	L__dd_Interface_printParameterPage1159
	GOTO	L__dd_Interface_printParameterPage778
L__dd_Interface_printParameterPage1159:
L__dd_Interface_printParameterPage777:
;dd_interfaces.c,184 :: 		
	GOTO	L_end_dd_Interface_printParameterPage
;dd_interfaces.c,183 :: 		
L__dd_Interface_printParameterPage779:
L__dd_Interface_printParameterPage778:
;dd_interfaces.c,187 :: 		
	MOV	#45, W13
	MOV.B	#31, W12
	MOV.B	#32, W11
	MOV	#lo_addr(_DynamisFont_Big32x31), W10
	CALL	_xGlcd_Set_Font
;dd_interfaces.c,189 :: 		
	ADD	W14, #3, W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	MOV	W0, W10
	CALL	_dd_Interface_getTitleX
	MOV.B	W0, [W14+0]
;dd_interfaces.c,190 :: 		
	CALL	_dd_Interface_getParameterValueY
	MOV.B	W0, [W14+1]
;dd_interfaces.c,192 :: 		
	ADD	W14, #3, W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	MOV.B	[W14+1], W12
	MOV.B	[W14+0], W11
	MOV	W0, W10
	CALL	_eGlcd_clearText
;dd_interfaces.c,194 :: 		
	MOV.B	[W14+3], W10
	CALL	_dd_Indicator_makeTextValue
;dd_interfaces.c,195 :: 		
	ADD	W14, #3, W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #6, W1
	MOV.B	[W14+2], W0
	CP.B	W0, [W1]
	BRA NZ	L__dd_Interface_printParameterPage1160
	GOTO	L_dd_Interface_printParameterPage347
L__dd_Interface_printParameterPage1160:
;dd_interfaces.c,197 :: 		
	ADD	W14, #3, W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	MOV	W0, W10
	CALL	_dd_Interface_getTitleX
	MOV.B	W0, [W14+0]
;dd_interfaces.c,198 :: 		
L_dd_Interface_printParameterPage347:
;dd_interfaces.c,199 :: 		
	ADD	W14, #3, W0
	ZE	[W0], W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #17, W0
	MOV.B	[W14+1], W12
	MOV.B	[W14+0], W11
	MOV	W0, W10
	CALL	_eGlcd_writeText
;dd_interfaces.c,201 :: 		
	MOV.B	[W14+3], W10
	CALL	_dd_Dashboard_clearIndicatorPrintUpdateRequest
;dd_interfaces.c,202 :: 		
L_end_dd_Interface_printParameterPage:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _dd_Interface_printParameterPage

_dd_Interface_drawTitle:
	LNK	#2

;dd_interfaces.c,204 :: 		
;dd_interfaces.c,205 :: 		
	PUSH	W11
	PUSH	W12
	PUSH	W13
	PUSH	W10
	MOV	#32, W13
	MOV.B	#16, W12
	MOV.B	#16, W11
	MOV	#lo_addr(_DynamisFont_Dashboard16x16), W10
	CALL	_xGlcd_Set_Font
	POP	W10
;dd_interfaces.c,206 :: 		
	CALL	_dd_Interface_getTitleY
	MOV.B	W0, [W14+0]
	CALL	_dd_Interface_getTitleX
	MOV.B	[W14+0], W1
	MOV.B	W1, W12
	MOV.B	W0, W11
	CALL	_eGlcd_writeText
;dd_interfaces.c,207 :: 		
	CALL	_dd_Interface_drawTitleContainers
;dd_interfaces.c,208 :: 		
L_end_dd_Interface_drawTitle:
	POP	W13
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _dd_Interface_drawTitle

_dd_Interface_drawTitleContainers:

;dd_interfaces.c,210 :: 		
;dd_interfaces.c,212 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV.B	#22, W13
	MOV.B	#126, W12
	MOV.B	#1, W11
	MOV.B	#1, W10
	MOV	#lo_addr(_BLACK), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#3, W0
	PUSH	W0
	CALL	_Glcd_Rectangle_Round_Edges
	SUB	#4, W15
;dd_interfaces.c,220 :: 		
L_end_dd_Interface_drawTitleContainers:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_Interface_drawTitleContainers

_dd_Interface_getTitleX:

;dd_interfaces.c,222 :: 		
;dd_interfaces.c,223 :: 		
	CALL	_eGlcd_getTextPixelLength
	LSR	W0, #1, W1
	MOV	#64, W0
	SUB	W0, W1, W0
;dd_interfaces.c,224 :: 		
L_end_dd_Interface_getTitleX:
	RETURN
; end of _dd_Interface_getTitleX

_dd_Interface_getTitleY:

;dd_interfaces.c,226 :: 		
;dd_interfaces.c,227 :: 		
	MOV.B	#4, W0
;dd_interfaces.c,228 :: 		
L_end_dd_Interface_getTitleY:
	RETURN
; end of _dd_Interface_getTitleY

_dd_Interface_getParameterValueX:

;dd_interfaces.c,230 :: 		
;dd_interfaces.c,232 :: 		
	ZE	W10, W1
	MOV	#30, W0
	MUL.UU	W0, W1, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #6, W0
	ZE	[W0], W1
	MOV	#24, W0
	MUL.SS	W1, W0, W0
	ASR	W0, #1, W1
	MOV	#64, W0
	SUB	W0, W1, W0
;dd_interfaces.c,233 :: 		
L_end_dd_Interface_getParameterValueX:
	RETURN
; end of _dd_Interface_getParameterValueX

_dd_Interface_getParameterValueY:

;dd_interfaces.c,235 :: 		
;dd_interfaces.c,238 :: 		
	MOV.B	#28, W0
;dd_interfaces.c,239 :: 		
L_end_dd_Interface_getParameterValueY:
	RETURN
; end of _dd_Interface_getParameterValueY

_dd_GraphicController_init:

;dd_graphic_controller.c,13 :: 		
;dd_graphic_controller.c,14 :: 		
	PUSH	W10
	BCLR	TRISB15_bit, BitPos(TRISB15_bit+0)
;dd_graphic_controller.c,15 :: 		
	CALL	_dd_GraphicController_turnOnBacklight
;dd_graphic_controller.c,16 :: 		
	CALL	_eGlcd_init
;dd_graphic_controller.c,18 :: 		
	CALL	_dd_Dashboard_init
;dd_graphic_controller.c,19 :: 		
	CALL	_eGlcd_clear
;dd_graphic_controller.c,20 :: 		
	CLR	W10
	CALL	_dd_GraphicController_setInterface
;dd_graphic_controller.c,21 :: 		
	CALL	_dd_GraphicController_printFrame
;dd_graphic_controller.c,22 :: 		
	CALL	_dd_GraphicController_timerSetup
;dd_graphic_controller.c,23 :: 		
L_end_dd_GraphicController_init:
	POP	W10
	RETURN
; end of _dd_GraphicController_init

_dd_GraphicController_turnOnBacklight:

;dd_graphic_controller.c,25 :: 		
;dd_graphic_controller.c,26 :: 		
	BSET	RB15_bit, BitPos(RB15_bit+0)
;dd_graphic_controller.c,27 :: 		
L_end_dd_GraphicController_turnOnBacklight:
	RETURN
; end of _dd_GraphicController_turnOnBacklight

_dd_GraphicController_turnOffBacklight:

;dd_graphic_controller.c,29 :: 		
;dd_graphic_controller.c,30 :: 		
	BCLR	RB15_bit, BitPos(RB15_bit+0)
;dd_graphic_controller.c,31 :: 		
L_end_dd_GraphicController_turnOffBacklight:
	RETURN
; end of _dd_GraphicController_turnOffBacklight

_dd_GraphicController_switchBacklight:

;dd_graphic_controller.c,33 :: 		
;dd_graphic_controller.c,34 :: 		
	BTG	RB15_bit, BitPos(RB15_bit+0)
;dd_graphic_controller.c,35 :: 		
L_end_dd_GraphicController_switchBacklight:
	RETURN
; end of _dd_GraphicController_switchBacklight

_dd_GraphicController_invertColors:

;dd_graphic_controller.c,37 :: 		
;dd_graphic_controller.c,38 :: 		
	CALL	_dd_GraphicController_queueColorInversion
;dd_graphic_controller.c,39 :: 		
	CALL	_dd_GraphicController_forceNextFrameUpdate
;dd_graphic_controller.c,40 :: 		
L_end_dd_GraphicController_invertColors:
	RETURN
; end of _dd_GraphicController_invertColors

_dd_GraphicController_areColorsInverted:

;dd_graphic_controller.c,42 :: 		
;dd_graphic_controller.c,43 :: 		
	MOV	#lo_addr(_BLACK), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	CLR.B	W0
	BRA NZ	L__dd_GraphicController_areColorsInverted1173
	INC.B	W0
L__dd_GraphicController_areColorsInverted1173:
;dd_graphic_controller.c,44 :: 		
L_end_dd_GraphicController_areColorsInverted:
	RETURN
; end of _dd_GraphicController_areColorsInverted

_dd_GraphicController_setInterface:

;dd_graphic_controller.c,46 :: 		
;dd_graphic_controller.c,48 :: 		
	MOV	#lo_addr(_dd_isInterfaceChangedFromLastFrame), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,49 :: 		
	CALL	_dd_GraphicController_saveInterfaceIndex
;dd_graphic_controller.c,50 :: 		
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,51 :: 		
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_dd_GraphicController_setInterface348:
; i start address is: 4 (W2)
	CP.B	W2, #10
	BRA LTU	L__dd_GraphicController_setInterface1175
	GOTO	L_dd_GraphicController_setInterface349
L__dd_GraphicController_setInterface1175:
;dd_graphic_controller.c,52 :: 		
	ZE	W2, W1
	MOV	#lo_addr(_INTERFACE_LIST), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, W10
	BRA Z	L__dd_GraphicController_setInterface1176
	GOTO	L_dd_GraphicController_setInterface351
L__dd_GraphicController_setInterface1176:
;dd_graphic_controller.c,53 :: 		
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W0
	MOV.B	W2, [W0]
; i end address is: 4 (W2)
;dd_graphic_controller.c,54 :: 		
	GOTO	L_dd_GraphicController_setInterface349
;dd_graphic_controller.c,55 :: 		
L_dd_GraphicController_setInterface351:
;dd_graphic_controller.c,51 :: 		
; i start address is: 0 (W0)
; i start address is: 4 (W2)
	ADD.B	W2, #1, W0
; i end address is: 4 (W2)
;dd_graphic_controller.c,56 :: 		
	MOV.B	W0, W2
; i end address is: 0 (W0)
	GOTO	L_dd_GraphicController_setInterface348
L_dd_GraphicController_setInterface349:
;dd_graphic_controller.c,57 :: 		
L_end_dd_GraphicController_setInterface:
	RETURN
; end of _dd_GraphicController_setInterface

_dd_GraphicController_getInterface:

;dd_graphic_controller.c,59 :: 		
;dd_graphic_controller.c,60 :: 		
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W0
	ZE	[W0], W1
	MOV	#lo_addr(_INTERFACE_LIST), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
;dd_graphic_controller.c,61 :: 		
L_end_dd_GraphicController_getInterface:
	RETURN
; end of _dd_GraphicController_getInterface

_dd_GraphicController_isInterfaceChangedFromLastFrame:

;dd_graphic_controller.c,63 :: 		
;dd_graphic_controller.c,64 :: 		
	MOV	#lo_addr(_dd_isInterfaceChangedFromLastFrame), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,65 :: 		
L_end_dd_GraphicController_isInterfaceChangedFromLastFrame:
	RETURN
; end of _dd_GraphicController_isInterfaceChangedFromLastFrame

_dd_GraphicController_switchNextInterface:

;dd_graphic_controller.c,67 :: 		
;dd_graphic_controller.c,68 :: 		
	CALL	_dd_GraphicController_saveInterfaceIndex
;dd_graphic_controller.c,69 :: 		
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA LTU	L__dd_GraphicController_switchNextInterface1180
	GOTO	L_dd_GraphicController_switchNextInterface352
L__dd_GraphicController_switchNextInterface1180:
;dd_graphic_controller.c,70 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W0
	ADD.B	W1, [W0], [W0]
;dd_graphic_controller.c,71 :: 		
L_dd_GraphicController_switchNextInterface352:
;dd_graphic_controller.c,72 :: 		
	MOV	#lo_addr(_dd_isInterfaceChangedFromLastFrame), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,73 :: 		
L_end_dd_GraphicController_switchNextInterface:
	RETURN
; end of _dd_GraphicController_switchNextInterface

_dd_GraphicController_switchPreviousInterface:

;dd_graphic_controller.c,75 :: 		
;dd_graphic_controller.c,76 :: 		
	CALL	_dd_GraphicController_saveInterfaceIndex
;dd_graphic_controller.c,77 :: 		
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GTU	L__dd_GraphicController_switchPreviousInterface1182
	GOTO	L_dd_GraphicController_switchPreviousInterface353
L__dd_GraphicController_switchPreviousInterface1182:
;dd_graphic_controller.c,78 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W0
	SUBR.B	W1, [W0], [W0]
;dd_graphic_controller.c,79 :: 		
L_dd_GraphicController_switchPreviousInterface353:
;dd_graphic_controller.c,80 :: 		
	MOV	#lo_addr(_dd_isInterfaceChangedFromLastFrame), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,81 :: 		
L_end_dd_GraphicController_switchPreviousInterface:
	RETURN
; end of _dd_GraphicController_switchPreviousInterface

_dd_GraphicController_switchLastInterface:

;dd_graphic_controller.c,83 :: 		
;dd_graphic_controller.c,84 :: 		
	PUSH	W10
	MOV	#lo_addr(_dd_lastGraphicInterfaceIndex), W0
	ZE	[W0], W1
	MOV	#lo_addr(_INTERFACE_LIST), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W10
	CALL	_dd_GraphicController_setInterface
;dd_graphic_controller.c,85 :: 		
L_end_dd_GraphicController_switchLastInterface:
	POP	W10
	RETURN
; end of _dd_GraphicController_switchLastInterface

_dd_GraphicController_saveInterfaceIndex:

;dd_graphic_controller.c,87 :: 		
;dd_graphic_controller.c,88 :: 		
	MOV	#lo_addr(_dd_lastGraphicInterfaceIndex), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W0
	CP.B	W1, [W0]
	BRA NZ	L__dd_GraphicController_saveInterfaceIndex1185
	GOTO	L_dd_GraphicController_saveInterfaceIndex354
L__dd_GraphicController_saveInterfaceIndex1185:
;dd_graphic_controller.c,89 :: 		
	MOV	#lo_addr(_dd_lastGraphicInterfaceIndex), W1
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W0
	MOV.B	[W0], [W1]
;dd_graphic_controller.c,90 :: 		
L_dd_GraphicController_saveInterfaceIndex354:
;dd_graphic_controller.c,91 :: 		
L_end_dd_GraphicController_saveInterfaceIndex:
	RETURN
; end of _dd_GraphicController_saveInterfaceIndex

_dd_GraphicController_printFrame:
	LNK	#2

;dd_graphic_controller.c,93 :: 		
;dd_graphic_controller.c,94 :: 		
	PUSH	W10
	CALL	_dd_GraphicController_isColorInversionQueued
	CP0.B	W0
	BRA NZ	L__dd_GraphicController_printFrame1187
	GOTO	L_dd_GraphicController_printFrame355
L__dd_GraphicController_printFrame1187:
;dd_graphic_controller.c,95 :: 		
	CALL	_eGlcd_invertColors
;dd_graphic_controller.c,96 :: 		
	MOV	#lo_addr(_dd_isColorInversionQueued), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,97 :: 		
L_dd_GraphicController_printFrame355:
;dd_graphic_controller.c,98 :: 		
	CALL	_dd_GraphicController_isInterfaceChangedFromLastFrame
	CP0.B	W0
	BRA Z	L__dd_GraphicController_printFrame1188
	GOTO	L__dd_GraphicController_printFrame782
L__dd_GraphicController_printFrame1188:
	CALL	_dd_GraphicController_isNextFrameUpdateForced
	CP0.B	W0
	BRA Z	L__dd_GraphicController_printFrame1189
	GOTO	L__dd_GraphicController_printFrame781
L__dd_GraphicController_printFrame1189:
	GOTO	L_dd_GraphicController_printFrame358
L__dd_GraphicController_printFrame782:
L__dd_GraphicController_printFrame781:
;dd_graphic_controller.c,99 :: 		
	CALL	_eGlcd_clear
;dd_graphic_controller.c,100 :: 		
	CALL	_dd_GraphicController_forceFullFrameUpdate
;dd_graphic_controller.c,101 :: 		
	MOV	#lo_addr(_dd_isInterfaceChangedFromLastFrame), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,102 :: 		
L_dd_GraphicController_printFrame358:
;dd_graphic_controller.c,103 :: 		
	MOV	#lo_addr(_dd_graphicInterfaceIndex), W0
	ZE	[W0], W1
	MOV	#lo_addr(_INTERFACE_LIST), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+0]
	GOTO	L_dd_GraphicController_printFrame359
;dd_graphic_controller.c,104 :: 		
L_dd_GraphicController_printFrame361:
;dd_graphic_controller.c,105 :: 		
	CALL	_dd_Interface_printDashboard
;dd_graphic_controller.c,106 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,107 :: 		
L_dd_GraphicController_printFrame362:
;dd_graphic_controller.c,108 :: 		
	MOV.B	#14, W10
	CALL	_dd_Interface_printParameterPage
;dd_graphic_controller.c,109 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,110 :: 		
L_dd_GraphicController_printFrame363:
;dd_graphic_controller.c,111 :: 		
	CLR	W10
	CALL	_dd_Interface_printParameterPage
;dd_graphic_controller.c,112 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,113 :: 		
L_dd_GraphicController_printFrame364:
;dd_graphic_controller.c,114 :: 		
	MOV.B	#8, W10
	CALL	_dd_Interface_printParameterPage
;dd_graphic_controller.c,115 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,116 :: 		
L_dd_GraphicController_printFrame365:
;dd_graphic_controller.c,117 :: 		
	MOV.B	#9, W10
	CALL	_dd_Interface_printParameterPage
;dd_graphic_controller.c,118 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,119 :: 		
L_dd_GraphicController_printFrame366:
;dd_graphic_controller.c,120 :: 		
	CALL	_dd_Interface_printSettings
;dd_graphic_controller.c,121 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,122 :: 		
L_dd_GraphicController_printFrame367:
;dd_graphic_controller.c,123 :: 		
	CALL	_dd_Interface_printDebug
;dd_graphic_controller.c,124 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,125 :: 		
L_dd_GraphicController_printFrame368:
;dd_graphic_controller.c,126 :: 		
	MOV	#lo_addr(?lstr40_DP9_AAC), W10
	CALL	_dd_Interface_printMessage
;dd_graphic_controller.c,127 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,128 :: 		
L_dd_GraphicController_printFrame369:
;dd_graphic_controller.c,129 :: 		
	MOV	#lo_addr(?lstr41_DP9_AAC), W10
	CALL	_dd_Interface_printMessage
;dd_graphic_controller.c,130 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,131 :: 		
L_dd_GraphicController_printFrame370:
;dd_graphic_controller.c,132 :: 		
	MOV	#lo_addr(?lstr42_DP9_AAC), W10
	CALL	_dd_Interface_printMessage
;dd_graphic_controller.c,133 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,134 :: 		
L_dd_GraphicController_printFrame371:
;dd_graphic_controller.c,135 :: 		
	GOTO	L_dd_GraphicController_printFrame360
;dd_graphic_controller.c,136 :: 		
L_dd_GraphicController_printFrame359:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV	[W14+0], W1
	MOV.B	[W1], W0
	CP.B	W0, #0
	BRA NZ	L__dd_GraphicController_printFrame1190
	GOTO	L_dd_GraphicController_printFrame361
L__dd_GraphicController_printFrame1190:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #10
	BRA NZ	L__dd_GraphicController_printFrame1191
	GOTO	L_dd_GraphicController_printFrame362
L__dd_GraphicController_printFrame1191:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #20
	BRA NZ	L__dd_GraphicController_printFrame1192
	GOTO	L_dd_GraphicController_printFrame363
L__dd_GraphicController_printFrame1192:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #11
	BRA NZ	L__dd_GraphicController_printFrame1193
	GOTO	L_dd_GraphicController_printFrame364
L__dd_GraphicController_printFrame1193:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #12
	BRA NZ	L__dd_GraphicController_printFrame1194
	GOTO	L_dd_GraphicController_printFrame365
L__dd_GraphicController_printFrame1194:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #2
	BRA NZ	L__dd_GraphicController_printFrame1195
	GOTO	L_dd_GraphicController_printFrame366
L__dd_GraphicController_printFrame1195:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #1
	BRA NZ	L__dd_GraphicController_printFrame1196
	GOTO	L_dd_GraphicController_printFrame367
L__dd_GraphicController_printFrame1196:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #3
	BRA NZ	L__dd_GraphicController_printFrame1197
	GOTO	L_dd_GraphicController_printFrame368
L__dd_GraphicController_printFrame1197:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #5
	BRA NZ	L__dd_GraphicController_printFrame1198
	GOTO	L_dd_GraphicController_printFrame369
L__dd_GraphicController_printFrame1198:
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #4
	BRA NZ	L__dd_GraphicController_printFrame1199
	GOTO	L_dd_GraphicController_printFrame370
L__dd_GraphicController_printFrame1199:
	GOTO	L_dd_GraphicController_printFrame371
L_dd_GraphicController_printFrame360:
;dd_graphic_controller.c,137 :: 		
	CALL	_dd_GraphicController_isFrameUpdateForced
	CP0.B	W0
	BRA NZ	L__dd_GraphicController_printFrame1200
	GOTO	L_dd_GraphicController_printFrame372
L__dd_GraphicController_printFrame1200:
;dd_graphic_controller.c,138 :: 		
	MOV	#lo_addr(_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,139 :: 		
L_dd_GraphicController_printFrame372:
;dd_graphic_controller.c,140 :: 		
	CALL	_dd_GraphicController_isNextFrameUpdateForced
	CP0.B	W0
	BRA NZ	L__dd_GraphicController_printFrame1201
	GOTO	L_dd_GraphicController_printFrame373
L__dd_GraphicController_printFrame1201:
;dd_graphic_controller.c,141 :: 		
	MOV	#lo_addr(_dd_isNextFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,142 :: 		
L_dd_GraphicController_printFrame373:
;dd_graphic_controller.c,143 :: 		
	CALL	_dd_GraphicController_handleAlert
;dd_graphic_controller.c,144 :: 		
L_end_dd_GraphicController_printFrame:
	POP	W10
	ULNK
	RETURN
; end of _dd_GraphicController_printFrame

_dd_GraphicController_forceFullFrameUpdate:

;dd_graphic_controller.c,146 :: 		
;dd_graphic_controller.c,147 :: 		
	MOV	#lo_addr(_dd_isFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,148 :: 		
L_end_dd_GraphicController_forceFullFrameUpdate:
	RETURN
; end of _dd_GraphicController_forceFullFrameUpdate

_dd_GraphicController_releaseFullFrameUpdate:

;dd_graphic_controller.c,150 :: 		
;dd_graphic_controller.c,151 :: 		
	MOV	#lo_addr(_dd_isFrameUpdateForced), W1
	CLR	W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,152 :: 		
L_end_dd_GraphicController_releaseFullFrameUpdate:
	RETURN
; end of _dd_GraphicController_releaseFullFrameUpdate

_dd_GraphicController_forceNextFrameUpdate:

;dd_graphic_controller.c,154 :: 		
;dd_graphic_controller.c,155 :: 		
	MOV	#lo_addr(_dd_isNextFrameUpdateForced), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,156 :: 		
L_end_dd_GraphicController_forceNextFrameUpdate:
	RETURN
; end of _dd_GraphicController_forceNextFrameUpdate

_dd_GraphicController_isFrameUpdateForced:

;dd_graphic_controller.c,158 :: 		
;dd_graphic_controller.c,159 :: 		
	MOV	#lo_addr(_dd_isFrameUpdateForced), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,160 :: 		
L_end_dd_GraphicController_isFrameUpdateForced:
	RETURN
; end of _dd_GraphicController_isFrameUpdateForced

_dd_GraphicController_isNextFrameUpdateForced:

;dd_graphic_controller.c,162 :: 		
;dd_graphic_controller.c,163 :: 		
	MOV	#lo_addr(_dd_isNextFrameUpdateForced), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,164 :: 		
L_end_dd_GraphicController_isNextFrameUpdateForced:
	RETURN
; end of _dd_GraphicController_isNextFrameUpdateForced

_dd_GraphicController_queueColorInversion:

;dd_graphic_controller.c,166 :: 		
;dd_graphic_controller.c,167 :: 		
	MOV	#lo_addr(_dd_isColorInversionQueued), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;dd_graphic_controller.c,168 :: 		
L_end_dd_GraphicController_queueColorInversion:
	RETURN
; end of _dd_GraphicController_queueColorInversion

_dd_GraphicController_isColorInversionQueued:

;dd_graphic_controller.c,170 :: 		
;dd_graphic_controller.c,171 :: 		
	MOV	#lo_addr(_dd_isColorInversionQueued), W0
	MOV.B	[W0], W0
;dd_graphic_controller.c,172 :: 		
L_end_dd_GraphicController_isColorInversionQueued:
	RETURN
; end of _dd_GraphicController_isColorInversionQueued

_dd_GraphicController_handleAlert:

;dd_graphic_controller.c,174 :: 		
;dd_graphic_controller.c,175 :: 		
	MOV	_dd_alertTicks, W0
	CP	W0, #0
	BRA GTU	L__dd_GraphicController_handleAlert1210
	GOTO	L_dd_GraphicController_handleAlert374
L__dd_GraphicController_handleAlert1210:
;dd_graphic_controller.c,176 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_dd_alertTicks), W0
	SUBR	W1, [W0], [W0]
;dd_graphic_controller.c,177 :: 		
	MOV	_dd_alertTicks, W0
	CP	W0, #0
	BRA Z	L__dd_GraphicController_handleAlert1211
	GOTO	L_dd_GraphicController_handleAlert375
L__dd_GraphicController_handleAlert1211:
;dd_graphic_controller.c,178 :: 		
	CALL	_dd_Dashboard_clearAlerts
;dd_graphic_controller.c,179 :: 		
L_dd_GraphicController_handleAlert375:
;dd_graphic_controller.c,180 :: 		
L_dd_GraphicController_handleAlert374:
;dd_graphic_controller.c,181 :: 		
L_end_dd_GraphicController_handleAlert:
	RETURN
; end of _dd_GraphicController_handleAlert

_dd_GraphicController_timerSetup:

;dd_graphic_controller.c,183 :: 		
;dd_graphic_controller.c,184 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#52429, W11
	MOV	#15820, W12
	MOV.B	#1, W10
	CALL	_setTimer
;dd_graphic_controller.c,185 :: 		
	MOV.B	#2, W11
	MOV.B	#1, W10
	CALL	_setInterruptPriority
;dd_graphic_controller.c,186 :: 		
	BCLR	IFS0bits, #3
;dd_graphic_controller.c,187 :: 		
L_end_dd_GraphicController_timerSetup:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dd_GraphicController_timerSetup

_dd_GraphicController_onTimerInterrupt:

;dd_graphic_controller.c,189 :: 		
;dd_graphic_controller.c,190 :: 		
	BCLR	IFS0bits, #3
;dd_graphic_controller.c,195 :: 		
	CALL	_dd_GraphicController_printFrame
;dd_graphic_controller.c,199 :: 		
L_end_dd_GraphicController_onTimerInterrupt:
	RETURN
; end of _dd_GraphicController_onTimerInterrupt

_dSignalLed_init:

;d_signalled.c,7 :: 		
;d_signalled.c,8 :: 		
	PUSH	W10
	BCLR	TRISF5_bit, BitPos(TRISF5_bit+0)
;d_signalled.c,9 :: 		
	BCLR	TRISF4_bit, BitPos(TRISF4_bit+0)
;d_signalled.c,10 :: 		
	BCLR	TRISG1_bit, BitPos(TRISG1_bit+0)
;d_signalled.c,11 :: 		
	MOV.B	#1, W10
	CALL	_dSignalLed_set
;d_signalled.c,12 :: 		
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_signalled.c,13 :: 		
	CLR	W10
	CALL	_dSignalLed_set
;d_signalled.c,14 :: 		
	MOV	#11, W8
	MOV	#11309, W7
L_dSignalLed_init376:
	DEC	W7
	BRA NZ	L_dSignalLed_init376
	DEC	W8
	BRA NZ	L_dSignalLed_init376
;d_signalled.c,15 :: 		
	MOV.B	#1, W10
	CALL	_dSignalLed_unset
;d_signalled.c,16 :: 		
	MOV.B	#2, W10
	CALL	_dSignalLed_unset
;d_signalled.c,17 :: 		
	CLR	W10
	CALL	_dSignalLed_unset
;d_signalled.c,18 :: 		
L_end_dSignalLed_init:
	POP	W10
	RETURN
; end of _dSignalLed_init

_dSignalLed_switch:

;d_signalled.c,20 :: 		
;d_signalled.c,21 :: 		
	GOTO	L_dSignalLed_switch378
;d_signalled.c,22 :: 		
L_dSignalLed_switch380:
;d_signalled.c,23 :: 		
	BTG	RF5_bit, BitPos(RF5_bit+0)
;d_signalled.c,24 :: 		
	GOTO	L_dSignalLed_switch379
;d_signalled.c,25 :: 		
L_dSignalLed_switch381:
;d_signalled.c,26 :: 		
	BTG	RF4_bit, BitPos(RF4_bit+0)
;d_signalled.c,27 :: 		
	GOTO	L_dSignalLed_switch379
;d_signalled.c,28 :: 		
L_dSignalLed_switch382:
;d_signalled.c,29 :: 		
	BTG	RG1_bit, BitPos(RG1_bit+0)
;d_signalled.c,30 :: 		
	GOTO	L_dSignalLed_switch379
;d_signalled.c,31 :: 		
L_dSignalLed_switch378:
	CP.B	W10, #0
	BRA NZ	L__dSignalLed_switch1216
	GOTO	L_dSignalLed_switch380
L__dSignalLed_switch1216:
	CP.B	W10, #1
	BRA NZ	L__dSignalLed_switch1217
	GOTO	L_dSignalLed_switch381
L__dSignalLed_switch1217:
	CP.B	W10, #2
	BRA NZ	L__dSignalLed_switch1218
	GOTO	L_dSignalLed_switch382
L__dSignalLed_switch1218:
L_dSignalLed_switch379:
;d_signalled.c,32 :: 		
L_end_dSignalLed_switch:
	RETURN
; end of _dSignalLed_switch

_dSignalLed_set:

;d_signalled.c,34 :: 		
;d_signalled.c,35 :: 		
	GOTO	L_dSignalLed_set383
;d_signalled.c,36 :: 		
L_dSignalLed_set385:
;d_signalled.c,37 :: 		
	BSET	RF5_bit, BitPos(RF5_bit+0)
;d_signalled.c,38 :: 		
	GOTO	L_dSignalLed_set384
;d_signalled.c,39 :: 		
L_dSignalLed_set386:
;d_signalled.c,40 :: 		
	BSET	RF4_bit, BitPos(RF4_bit+0)
;d_signalled.c,41 :: 		
	GOTO	L_dSignalLed_set384
;d_signalled.c,42 :: 		
L_dSignalLed_set387:
;d_signalled.c,43 :: 		
	BSET	RG1_bit, BitPos(RG1_bit+0)
;d_signalled.c,44 :: 		
	GOTO	L_dSignalLed_set384
;d_signalled.c,45 :: 		
L_dSignalLed_set383:
	CP.B	W10, #0
	BRA NZ	L__dSignalLed_set1220
	GOTO	L_dSignalLed_set385
L__dSignalLed_set1220:
	CP.B	W10, #1
	BRA NZ	L__dSignalLed_set1221
	GOTO	L_dSignalLed_set386
L__dSignalLed_set1221:
	CP.B	W10, #2
	BRA NZ	L__dSignalLed_set1222
	GOTO	L_dSignalLed_set387
L__dSignalLed_set1222:
L_dSignalLed_set384:
;d_signalled.c,46 :: 		
L_end_dSignalLed_set:
	RETURN
; end of _dSignalLed_set

_dSignalLed_unset:

;d_signalled.c,48 :: 		
;d_signalled.c,49 :: 		
	GOTO	L_dSignalLed_unset388
;d_signalled.c,50 :: 		
L_dSignalLed_unset390:
;d_signalled.c,51 :: 		
	BCLR	RF5_bit, BitPos(RF5_bit+0)
;d_signalled.c,52 :: 		
	GOTO	L_dSignalLed_unset389
;d_signalled.c,53 :: 		
L_dSignalLed_unset391:
;d_signalled.c,54 :: 		
	BCLR	RF4_bit, BitPos(RF4_bit+0)
;d_signalled.c,55 :: 		
	GOTO	L_dSignalLed_unset389
;d_signalled.c,56 :: 		
L_dSignalLed_unset392:
;d_signalled.c,57 :: 		
	BCLR	RG1_bit, BitPos(RG1_bit+0)
;d_signalled.c,58 :: 		
	GOTO	L_dSignalLed_unset389
;d_signalled.c,59 :: 		
L_dSignalLed_unset388:
	CP.B	W10, #0
	BRA NZ	L__dSignalLed_unset1224
	GOTO	L_dSignalLed_unset390
L__dSignalLed_unset1224:
	CP.B	W10, #1
	BRA NZ	L__dSignalLed_unset1225
	GOTO	L_dSignalLed_unset391
L__dSignalLed_unset1225:
	CP.B	W10, #2
	BRA NZ	L__dSignalLed_unset1226
	GOTO	L_dSignalLed_unset392
L__dSignalLed_unset1226:
L_dSignalLed_unset389:
;d_signalled.c,60 :: 		
L_end_dSignalLed_unset:
	RETURN
; end of _dSignalLed_unset

_dPaddle_init:

;d_paddle.c,9 :: 		
;d_paddle.c,10 :: 		
	PUSH	W10
	CALL	_setupAnalogSampling
;d_paddle.c,11 :: 		
	MOV.B	#14, W10
	CALL	_setAnalogPIN
;d_paddle.c,12 :: 		
	CALL	_turnOnAnalogModule
;d_paddle.c,13 :: 		
L_end_dPaddle_init:
	POP	W10
	RETURN
; end of _dPaddle_init

_dPaddle_getValue:

;d_paddle.c,16 :: 		
;d_paddle.c,17 :: 		
	MOV	#38, W2
	MOV	_dPaddle_value, W0
	REPEAT	#17
	DIV.U	W0, W2
;d_paddle.c,18 :: 		
L_end_dPaddle_getValue:
	RETURN
; end of _dPaddle_getValue

_dPaddle_readSample:
	LNK	#4

;d_paddle.c,20 :: 		
;d_paddle.c,22 :: 		
	CALL	_getAnalogValue
; analogValue start address is: 4 (W2)
	MOV	W0, W2
;d_paddle.c,23 :: 		
	CP	W0, #0
	BRA LEU	L__dPaddle_readSample1230
	GOTO	L_dPaddle_readSample393
L__dPaddle_readSample1230:
; analogValue end address is: 4 (W2)
;d_paddle.c,24 :: 		
	CLR	W0
	MOV	W0, _dPaddle_value
;d_paddle.c,25 :: 		
	GOTO	L_dPaddle_readSample394
L_dPaddle_readSample393:
; analogValue start address is: 4 (W2)
	MOV	#3800, W0
	CP	W2, W0
	BRA GTU	L__dPaddle_readSample1231
	GOTO	L_dPaddle_readSample395
L__dPaddle_readSample1231:
; analogValue end address is: 4 (W2)
;d_paddle.c,26 :: 		
	MOV	#3800, W0
	MOV	W0, _dPaddle_value
;d_paddle.c,27 :: 		
	GOTO	L_dPaddle_readSample396
L_dPaddle_readSample395:
;d_paddle.c,28 :: 		
; analogValue start address is: 4 (W2)
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
; analogValue end address is: 4 (W2)
	MOV	#52429, W2
	MOV	#16204, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	_dPaddle_value, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15948, W3
	CALL	__Mul_FP
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__AddSub_FP
	CALL	__Float2Longint
	MOV	W0, _dPaddle_value
;d_paddle.c,29 :: 		
L_dPaddle_readSample396:
L_dPaddle_readSample394:
;d_paddle.c,30 :: 		
L_end_dPaddle_readSample:
	ULNK
	RETURN
; end of _dPaddle_readSample

_dLedStripe_init:

;d_ledstripe.c,11 :: 		
;d_ledstripe.c,12 :: 		
	BCLR	TRISD2_bit, BitPos(TRISD2_bit+0)
;d_ledstripe.c,13 :: 		
	BCLR	TRISD3_bit, BitPos(TRISD3_bit+0)
;d_ledstripe.c,14 :: 		
	BCLR	TRISD4_bit, BitPos(TRISD4_bit+0)
;d_ledstripe.c,15 :: 		
	BCLR	TRISD5_bit, BitPos(TRISD5_bit+0)
;d_ledstripe.c,16 :: 		
	BCLR	TRISD6_bit, BitPos(TRISD6_bit+0)
;d_ledstripe.c,17 :: 		
	BCLR	TRISD7_bit, BitPos(TRISD7_bit+0)
;d_ledstripe.c,18 :: 		
	BCLR	TRISG12_bit, BitPos(TRISG12_bit+0)
;d_ledstripe.c,19 :: 		
	BCLR	TRISG0_bit, BitPos(TRISG0_bit+0)
;d_ledstripe.c,20 :: 		
	BCLR	TRISG14_bit, BitPos(TRISG14_bit+0)
;d_ledstripe.c,21 :: 		
	CALL	_dLedStripe_clear
;d_ledstripe.c,22 :: 		
L_end_dLedStripe_init:
	RETURN
; end of _dLedStripe_init

_dLedStripe_debugByte:

;d_ledstripe.c,24 :: 		
;d_ledstripe.c,26 :: 		
	PUSH	W11
; i start address is: 4 (W2)
	MOV.B	#6, W2
; i end address is: 4 (W2)
L_dLedStripe_debugByte397:
; i start address is: 4 (W2)
	CP.B	W2, #0
	BRA GTU	L__dLedStripe_debugByte1234
	GOTO	L_dLedStripe_debugByte398
L__dLedStripe_debugByte1234:
;d_ledstripe.c,27 :: 		
	BTSS	W10, #0
	GOTO	L_dLedStripe_debugByte400
;d_ledstripe.c,28 :: 		
	ZE	W2, W0
	DEC	W0
	PUSH	W10
	MOV.B	W0, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
	POP	W10
;d_ledstripe.c,29 :: 		
	GOTO	L_dLedStripe_debugByte401
L_dLedStripe_debugByte400:
;d_ledstripe.c,30 :: 		
	ZE	W2, W0
	DEC	W0
	PUSH	W10
	MOV.B	W0, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
	POP	W10
;d_ledstripe.c,31 :: 		
L_dLedStripe_debugByte401:
;d_ledstripe.c,32 :: 		
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;d_ledstripe.c,26 :: 		
; i start address is: 0 (W0)
	SUB.B	W2, #1, W0
; i end address is: 4 (W2)
;d_ledstripe.c,33 :: 		
	MOV.B	W0, W2
; i end address is: 0 (W0)
	GOTO	L_dLedStripe_debugByte397
L_dLedStripe_debugByte398:
;d_ledstripe.c,34 :: 		
L_end_dLedStripe_debugByte:
	POP	W11
	RETURN
; end of _dLedStripe_debugByte

_dLedStripe_clear:

;d_ledstripe.c,36 :: 		
;d_ledstripe.c,37 :: 		
	PUSH	W10
	PUSH	W11
;d_ledstripe.c,38 :: 		
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_dLedStripe_clear402:
; i start address is: 4 (W2)
	CP.B	W2, #6
	BRA LTU	L__dLedStripe_clear1236
	GOTO	L_dLedStripe_clear403
L__dLedStripe_clear1236:
;d_ledstripe.c,39 :: 		
	MOV.B	W2, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_ledstripe.c,38 :: 		
; i start address is: 0 (W0)
	ADD.B	W2, #1, W0
; i end address is: 4 (W2)
;d_ledstripe.c,40 :: 		
	MOV.B	W0, W2
; i end address is: 0 (W0)
	GOTO	L_dLedStripe_clear402
L_dLedStripe_clear403:
;d_ledstripe.c,41 :: 		
L_end_dLedStripe_clear:
	POP	W11
	POP	W10
	RETURN
; end of _dLedStripe_clear

_dLedStripe_setLedColorAtPosition:

;d_ledstripe.c,43 :: 		
;d_ledstripe.c,44 :: 		
	PUSH	W10
	PUSH	W12
	ZE	W10, W0
	AND	W0, #1, W0
	PUSH	W10
	MOV.B	W0, W12
	MOV	#lo_addr(_dLedStripe_redStripe), W10
	CALL	_dLedStripe_setLedFromByteStripe
	POP	W10
;d_ledstripe.c,45 :: 		
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;d_ledstripe.c,46 :: 		
	ZE	W0, W0
	AND	W0, #1, W0
	PUSH	W10
	MOV.B	W0, W12
	MOV	#lo_addr(_dLedStripe_greenStripe), W10
	CALL	_dLedStripe_setLedFromByteStripe
	POP	W10
;d_ledstripe.c,47 :: 		
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;d_ledstripe.c,48 :: 		
	ZE	W0, W0
	AND	W0, #1, W0
	MOV.B	W0, W12
	MOV	#lo_addr(_dLedStripe_blueStripe), W10
	CALL	_dLedStripe_setLedFromByteStripe
;d_ledstripe.c,49 :: 		
L_end_dLedStripe_setLedColorAtPosition:
	POP	W12
	POP	W10
	RETURN
; end of _dLedStripe_setLedColorAtPosition

_dLedStripe_setLedStripe:

;d_ledstripe.c,51 :: 		
;d_ledstripe.c,53 :: 		
	PUSH	W11
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_dLedStripe_setLedStripe405:
; i start address is: 4 (W2)
	CP.B	W2, #6
	BRA LTU	L__dLedStripe_setLedStripe1239
	GOTO	L_dLedStripe_setLedStripe406
L__dLedStripe_setLedStripe1239:
;d_ledstripe.c,54 :: 		
	ZE	W2, W0
	ADD	W10, W0, W0
	PUSH	W10
	MOV.B	W2, W11
	MOV.B	[W0], W10
	CALL	_dLedStripe_setLedColorAtPosition
	POP	W10
;d_ledstripe.c,53 :: 		
; i start address is: 0 (W0)
	ADD.B	W2, #1, W0
; i end address is: 4 (W2)
;d_ledstripe.c,55 :: 		
	MOV.B	W0, W2
; i end address is: 0 (W0)
	GOTO	L_dLedStripe_setLedStripe405
L_dLedStripe_setLedStripe406:
;d_ledstripe.c,56 :: 		
L_end_dLedStripe_setLedStripe:
	POP	W11
	RETURN
; end of _dLedStripe_setLedStripe

_dLedStripe_switchLedColorAtPosition:

;d_ledstripe.c,58 :: 		
;d_ledstripe.c,60 :: 		
	PUSH	W10
	PUSH	W10
	MOV.B	W11, W10
	CALL	_dLedStripe_getLedColorAtPosition
	POP	W10
;d_ledstripe.c,61 :: 		
	CP.B	W10, W0
	BRA Z	L__dLedStripe_switchLedColorAtPosition1241
	GOTO	L_dLedStripe_switchLedColorAtPosition408
L__dLedStripe_switchLedColorAtPosition1241:
;d_ledstripe.c,62 :: 		
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_ledstripe.c,63 :: 		
	GOTO	L_dLedStripe_switchLedColorAtPosition409
L_dLedStripe_switchLedColorAtPosition408:
;d_ledstripe.c,64 :: 		
	CALL	_dLedStripe_setLedColorAtPosition
;d_ledstripe.c,65 :: 		
L_dLedStripe_switchLedColorAtPosition409:
;d_ledstripe.c,66 :: 		
L_end_dLedStripe_switchLedColorAtPosition:
	POP	W10
	RETURN
; end of _dLedStripe_switchLedColorAtPosition

_dLedStripe_getLedColorAtPosition:

;d_ledstripe.c,68 :: 		
;d_ledstripe.c,70 :: 		
; finalColor start address is: 2 (W1)
	CLR	W1
;d_ledstripe.c,71 :: 		
	MOV	#lo_addr(_dLedStripe_redStripe), W0
	ZE	[W0], W0
	ZE	W10, W2
	LSR	W0, W2, W0
	BTSS	W0, #0
	GOTO	L__dLedStripe_getLedColorAtPosition783
;d_ledstripe.c,72 :: 		
; finalColor start address is: 2 (W1)
	IOR.B	W1, #1, W1
; finalColor end address is: 2 (W1)
; finalColor end address is: 2 (W1)
;d_ledstripe.c,73 :: 		
	GOTO	L_dLedStripe_getLedColorAtPosition410
L__dLedStripe_getLedColorAtPosition783:
;d_ledstripe.c,71 :: 		
;d_ledstripe.c,73 :: 		
L_dLedStripe_getLedColorAtPosition410:
;d_ledstripe.c,74 :: 		
; finalColor start address is: 2 (W1)
	MOV	#lo_addr(_dLedStripe_greenStripe), W0
	ZE	[W0], W0
	ZE	W10, W2
	LSR	W0, W2, W0
	BTSS	W0, #0
	GOTO	L__dLedStripe_getLedColorAtPosition784
;d_ledstripe.c,75 :: 		
; finalColor start address is: 2 (W1)
	IOR.B	W1, #2, W1
; finalColor end address is: 2 (W1)
; finalColor end address is: 2 (W1)
;d_ledstripe.c,76 :: 		
	GOTO	L_dLedStripe_getLedColorAtPosition411
L__dLedStripe_getLedColorAtPosition784:
;d_ledstripe.c,74 :: 		
;d_ledstripe.c,76 :: 		
L_dLedStripe_getLedColorAtPosition411:
;d_ledstripe.c,77 :: 		
; finalColor start address is: 2 (W1)
	MOV	#lo_addr(_dLedStripe_blueStripe), W0
	ZE	[W0], W0
	ZE	W10, W2
	LSR	W0, W2, W0
	BTSS	W0, #0
	GOTO	L__dLedStripe_getLedColorAtPosition785
;d_ledstripe.c,78 :: 		
; finalColor start address is: 2 (W1)
	IOR.B	W1, #4, W1
; finalColor end address is: 2 (W1)
; finalColor end address is: 2 (W1)
;d_ledstripe.c,79 :: 		
	GOTO	L_dLedStripe_getLedColorAtPosition412
L__dLedStripe_getLedColorAtPosition785:
;d_ledstripe.c,77 :: 		
;d_ledstripe.c,79 :: 		
L_dLedStripe_getLedColorAtPosition412:
;d_ledstripe.c,80 :: 		
; finalColor start address is: 2 (W1)
	MOV.B	W1, W0
; finalColor end address is: 2 (W1)
;d_ledstripe.c,81 :: 		
L_end_dLedStripe_getLedColorAtPosition:
	RETURN
; end of _dLedStripe_getLedColorAtPosition

_dLedStripe_setLedFromByteStripe:

;d_ledstripe.c,83 :: 		
;d_ledstripe.c,84 :: 		
	CP0.B	W12
	BRA NZ	L__dLedStripe_setLedFromByteStripe1244
	GOTO	L_dLedStripe_setLedFromByteStripe413
L__dLedStripe_setLedFromByteStripe1244:
;d_ledstripe.c,85 :: 		
	ZE	W11, W1
	MOV	#1, W0
	SL	W0, W1, W1
	ZE	[W10], W0
	IOR	W0, W1, W0
	MOV.B	W0, [W10]
;d_ledstripe.c,86 :: 		
	GOTO	L_dLedStripe_setLedFromByteStripe414
L_dLedStripe_setLedFromByteStripe413:
;d_ledstripe.c,87 :: 		
	ZE	W11, W1
	MOV	#1, W0
	SL	W0, W1, W0
	COM.B	W0, W1
	ZE	[W10], W0
	AND	W0, W1, W0
	MOV.B	W0, [W10]
;d_ledstripe.c,88 :: 		
L_dLedStripe_setLedFromByteStripe414:
;d_ledstripe.c,89 :: 		
L_end_dLedStripe_setLedFromByteStripe:
	RETURN
; end of _dLedStripe_setLedFromByteStripe

_dLedStripe_updateFrame:

;d_ledstripe.c,91 :: 		
;d_ledstripe.c,92 :: 		
	PUSH	W10
	CALL	_dLedStripe_hardClearColors
;d_ledstripe.c,93 :: 		
	GOTO	L_dLedStripe_updateFrame415
;d_ledstripe.c,94 :: 		
L_dLedStripe_updateFrame417:
;d_ledstripe.c,95 :: 		
	MOV	#lo_addr(_dLedStripe_redStripe), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetLedStripe
;d_ledstripe.c,96 :: 		
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetColor
;d_ledstripe.c,97 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_dRedPersistenceCounter), W0
	ADD.B	W1, [W0], [W0]
;d_ledstripe.c,98 :: 		
	MOV	#lo_addr(_dRedPersistenceCounter), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA Z	L__dLedStripe_updateFrame1246
	GOTO	L_dLedStripe_updateFrame418
L__dLedStripe_updateFrame1246:
;d_ledstripe.c,99 :: 		
	MOV	#lo_addr(_dLedStripe_colorSelector), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;d_ledstripe.c,100 :: 		
	MOV	#lo_addr(_dRedPersistenceCounter), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_ledstripe.c,101 :: 		
L_dLedStripe_updateFrame418:
;d_ledstripe.c,102 :: 		
	GOTO	L_dLedStripe_updateFrame416
;d_ledstripe.c,103 :: 		
L_dLedStripe_updateFrame419:
;d_ledstripe.c,104 :: 		
	MOV	#lo_addr(_dLedStripe_greenStripe), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetLedStripe
;d_ledstripe.c,105 :: 		
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetColor
;d_ledstripe.c,106 :: 		
	MOV	#lo_addr(_dLedStripe_colorSelector), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;d_ledstripe.c,107 :: 		
	GOTO	L_dLedStripe_updateFrame416
;d_ledstripe.c,108 :: 		
L_dLedStripe_updateFrame420:
;d_ledstripe.c,109 :: 		
	MOV	#lo_addr(_dLedStripe_blueStripe), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetLedStripe
;d_ledstripe.c,110 :: 		
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W10
	CALL	_dLedStripe_hardSetColor
;d_ledstripe.c,111 :: 		
	MOV	#lo_addr(_dLedStripe_colorSelector), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_ledstripe.c,112 :: 		
	GOTO	L_dLedStripe_updateFrame416
;d_ledstripe.c,113 :: 		
L_dLedStripe_updateFrame415:
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__dLedStripe_updateFrame1247
	GOTO	L_dLedStripe_updateFrame417
L__dLedStripe_updateFrame1247:
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__dLedStripe_updateFrame1248
	GOTO	L_dLedStripe_updateFrame419
L__dLedStripe_updateFrame1248:
	MOV	#lo_addr(_dLedStripe_colorSelector), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__dLedStripe_updateFrame1249
	GOTO	L_dLedStripe_updateFrame420
L__dLedStripe_updateFrame1249:
L_dLedStripe_updateFrame416:
;d_ledstripe.c,114 :: 		
L_end_dLedStripe_updateFrame:
	POP	W10
	RETURN
; end of _dLedStripe_updateFrame

_dLedStripe_hardSetLedStripe:

;d_ledstripe.c,116 :: 		
;d_ledstripe.c,118 :: 		
; i start address is: 2 (W1)
	CLR	W1
; i end address is: 2 (W1)
L_dLedStripe_hardSetLedStripe421:
; i start address is: 2 (W1)
	CP.B	W1, #6
	BRA LTU	L__dLedStripe_hardSetLedStripe1251
	GOTO	L_dLedStripe_hardSetLedStripe422
L__dLedStripe_hardSetLedStripe1251:
;d_ledstripe.c,119 :: 		
	BTSS	W10, #0
	GOTO	L_dLedStripe_hardSetLedStripe424
;d_ledstripe.c,120 :: 		
	PUSH	W10
	MOV.B	W1, W10
	CALL	_dLedStripe_hardSetLedPin
	POP	W10
;d_ledstripe.c,121 :: 		
	GOTO	L_dLedStripe_hardSetLedStripe425
L_dLedStripe_hardSetLedStripe424:
;d_ledstripe.c,122 :: 		
	PUSH	W10
	MOV.B	W1, W10
	CALL	_dLedStripe_hardUnsetLedPin
	POP	W10
;d_ledstripe.c,123 :: 		
L_dLedStripe_hardSetLedStripe425:
;d_ledstripe.c,124 :: 		
	ZE	W10, W0
	LSR	W0, #1, W0
	MOV.B	W0, W10
;d_ledstripe.c,118 :: 		
; i start address is: 0 (W0)
	ADD.B	W1, #1, W0
; i end address is: 2 (W1)
;d_ledstripe.c,125 :: 		
	MOV.B	W0, W1
; i end address is: 0 (W0)
	GOTO	L_dLedStripe_hardSetLedStripe421
L_dLedStripe_hardSetLedStripe422:
;d_ledstripe.c,126 :: 		
L_end_dLedStripe_hardSetLedStripe:
	RETURN
; end of _dLedStripe_hardSetLedStripe

_dLedStripe_hardClearColors:

;d_ledstripe.c,128 :: 		
;d_ledstripe.c,129 :: 		
	BSET	LATG12_bit, BitPos(LATG12_bit+0)
;d_ledstripe.c,130 :: 		
	BSET	RG14_bit, BitPos(RG14_bit+0)
;d_ledstripe.c,131 :: 		
	BSET	RG0_bit, BitPos(RG0_bit+0)
;d_ledstripe.c,132 :: 		
L_end_dLedStripe_hardClearColors:
	RETURN
; end of _dLedStripe_hardClearColors

_dLedStripe_hardSetColor:

;d_ledstripe.c,134 :: 		
;d_ledstripe.c,135 :: 		
	GOTO	L_dLedStripe_hardSetColor426
;d_ledstripe.c,136 :: 		
L_dLedStripe_hardSetColor428:
;d_ledstripe.c,137 :: 		
	BCLR	LATG12_bit, BitPos(LATG12_bit+0)
;d_ledstripe.c,138 :: 		
	GOTO	L_dLedStripe_hardSetColor427
;d_ledstripe.c,139 :: 		
L_dLedStripe_hardSetColor429:
;d_ledstripe.c,140 :: 		
	BCLR	RG0_bit, BitPos(RG0_bit+0)
;d_ledstripe.c,141 :: 		
	GOTO	L_dLedStripe_hardSetColor427
;d_ledstripe.c,142 :: 		
L_dLedStripe_hardSetColor430:
;d_ledstripe.c,143 :: 		
	BCLR	RG14_bit, BitPos(RG14_bit+0)
;d_ledstripe.c,144 :: 		
	GOTO	L_dLedStripe_hardSetColor427
;d_ledstripe.c,145 :: 		
L_dLedStripe_hardSetColor426:
	CP.B	W10, #1
	BRA NZ	L__dLedStripe_hardSetColor1254
	GOTO	L_dLedStripe_hardSetColor428
L__dLedStripe_hardSetColor1254:
	CP.B	W10, #2
	BRA NZ	L__dLedStripe_hardSetColor1255
	GOTO	L_dLedStripe_hardSetColor429
L__dLedStripe_hardSetColor1255:
	CP.B	W10, #4
	BRA NZ	L__dLedStripe_hardSetColor1256
	GOTO	L_dLedStripe_hardSetColor430
L__dLedStripe_hardSetColor1256:
L_dLedStripe_hardSetColor427:
;d_ledstripe.c,146 :: 		
L_end_dLedStripe_hardSetColor:
	RETURN
; end of _dLedStripe_hardSetColor

_dLedStripe_hardSetLedPin:

;d_ledstripe.c,148 :: 		
;d_ledstripe.c,149 :: 		
	GOTO	L_dLedStripe_hardSetLedPin431
;d_ledstripe.c,150 :: 		
L_dLedStripe_hardSetLedPin433:
;d_ledstripe.c,151 :: 		
	BSET	RD2_bit, BitPos(RD2_bit+0)
;d_ledstripe.c,152 :: 		
	GOTO	L_dLedStripe_hardSetLedPin432
;d_ledstripe.c,153 :: 		
L_dLedStripe_hardSetLedPin434:
;d_ledstripe.c,154 :: 		
	BSET	RD3_bit, BitPos(RD3_bit+0)
;d_ledstripe.c,155 :: 		
	GOTO	L_dLedStripe_hardSetLedPin432
;d_ledstripe.c,156 :: 		
L_dLedStripe_hardSetLedPin435:
;d_ledstripe.c,157 :: 		
	BSET	RD4_bit, BitPos(RD4_bit+0)
;d_ledstripe.c,158 :: 		
	GOTO	L_dLedStripe_hardSetLedPin432
;d_ledstripe.c,159 :: 		
L_dLedStripe_hardSetLedPin436:
;d_ledstripe.c,160 :: 		
	BSET	RD5_bit, BitPos(RD5_bit+0)
;d_ledstripe.c,161 :: 		
	GOTO	L_dLedStripe_hardSetLedPin432
;d_ledstripe.c,162 :: 		
L_dLedStripe_hardSetLedPin437:
;d_ledstripe.c,163 :: 		
	BSET	RD6_bit, BitPos(RD6_bit+0)
;d_ledstripe.c,164 :: 		
	GOTO	L_dLedStripe_hardSetLedPin432
;d_ledstripe.c,165 :: 		
L_dLedStripe_hardSetLedPin438:
;d_ledstripe.c,166 :: 		
	BSET	RD7_bit, BitPos(RD7_bit+0)
;d_ledstripe.c,167 :: 		
	GOTO	L_dLedStripe_hardSetLedPin432
;d_ledstripe.c,168 :: 		
L_dLedStripe_hardSetLedPin431:
	CP.B	W10, #0
	BRA NZ	L__dLedStripe_hardSetLedPin1258
	GOTO	L_dLedStripe_hardSetLedPin433
L__dLedStripe_hardSetLedPin1258:
	CP.B	W10, #1
	BRA NZ	L__dLedStripe_hardSetLedPin1259
	GOTO	L_dLedStripe_hardSetLedPin434
L__dLedStripe_hardSetLedPin1259:
	CP.B	W10, #2
	BRA NZ	L__dLedStripe_hardSetLedPin1260
	GOTO	L_dLedStripe_hardSetLedPin435
L__dLedStripe_hardSetLedPin1260:
	CP.B	W10, #3
	BRA NZ	L__dLedStripe_hardSetLedPin1261
	GOTO	L_dLedStripe_hardSetLedPin436
L__dLedStripe_hardSetLedPin1261:
	CP.B	W10, #4
	BRA NZ	L__dLedStripe_hardSetLedPin1262
	GOTO	L_dLedStripe_hardSetLedPin437
L__dLedStripe_hardSetLedPin1262:
	CP.B	W10, #5
	BRA NZ	L__dLedStripe_hardSetLedPin1263
	GOTO	L_dLedStripe_hardSetLedPin438
L__dLedStripe_hardSetLedPin1263:
L_dLedStripe_hardSetLedPin432:
;d_ledstripe.c,169 :: 		
L_end_dLedStripe_hardSetLedPin:
	RETURN
; end of _dLedStripe_hardSetLedPin

_dLedStripe_hardUnsetLedPin:

;d_ledstripe.c,171 :: 		
;d_ledstripe.c,172 :: 		
	GOTO	L_dLedStripe_hardUnsetLedPin439
;d_ledstripe.c,173 :: 		
L_dLedStripe_hardUnsetLedPin441:
;d_ledstripe.c,174 :: 		
	BCLR	RD2_bit, BitPos(RD2_bit+0)
;d_ledstripe.c,175 :: 		
	GOTO	L_dLedStripe_hardUnsetLedPin440
;d_ledstripe.c,176 :: 		
L_dLedStripe_hardUnsetLedPin442:
;d_ledstripe.c,177 :: 		
	BCLR	RD3_bit, BitPos(RD3_bit+0)
;d_ledstripe.c,178 :: 		
	GOTO	L_dLedStripe_hardUnsetLedPin440
;d_ledstripe.c,179 :: 		
L_dLedStripe_hardUnsetLedPin443:
;d_ledstripe.c,180 :: 		
	BCLR	RD4_bit, BitPos(RD4_bit+0)
;d_ledstripe.c,181 :: 		
	GOTO	L_dLedStripe_hardUnsetLedPin440
;d_ledstripe.c,182 :: 		
L_dLedStripe_hardUnsetLedPin444:
;d_ledstripe.c,183 :: 		
	BCLR	RD5_bit, BitPos(RD5_bit+0)
;d_ledstripe.c,184 :: 		
	GOTO	L_dLedStripe_hardUnsetLedPin440
;d_ledstripe.c,185 :: 		
L_dLedStripe_hardUnsetLedPin445:
;d_ledstripe.c,186 :: 		
	BCLR	RD6_bit, BitPos(RD6_bit+0)
;d_ledstripe.c,187 :: 		
	GOTO	L_dLedStripe_hardUnsetLedPin440
;d_ledstripe.c,188 :: 		
L_dLedStripe_hardUnsetLedPin446:
;d_ledstripe.c,189 :: 		
	BCLR	RD7_bit, BitPos(RD7_bit+0)
;d_ledstripe.c,190 :: 		
	GOTO	L_dLedStripe_hardUnsetLedPin440
;d_ledstripe.c,191 :: 		
L_dLedStripe_hardUnsetLedPin439:
	CP.B	W10, #0
	BRA NZ	L__dLedStripe_hardUnsetLedPin1265
	GOTO	L_dLedStripe_hardUnsetLedPin441
L__dLedStripe_hardUnsetLedPin1265:
	CP.B	W10, #1
	BRA NZ	L__dLedStripe_hardUnsetLedPin1266
	GOTO	L_dLedStripe_hardUnsetLedPin442
L__dLedStripe_hardUnsetLedPin1266:
	CP.B	W10, #2
	BRA NZ	L__dLedStripe_hardUnsetLedPin1267
	GOTO	L_dLedStripe_hardUnsetLedPin443
L__dLedStripe_hardUnsetLedPin1267:
	CP.B	W10, #3
	BRA NZ	L__dLedStripe_hardUnsetLedPin1268
	GOTO	L_dLedStripe_hardUnsetLedPin444
L__dLedStripe_hardUnsetLedPin1268:
	CP.B	W10, #4
	BRA NZ	L__dLedStripe_hardUnsetLedPin1269
	GOTO	L_dLedStripe_hardUnsetLedPin445
L__dLedStripe_hardUnsetLedPin1269:
	CP.B	W10, #5
	BRA NZ	L__dLedStripe_hardUnsetLedPin1270
	GOTO	L_dLedStripe_hardUnsetLedPin446
L__dLedStripe_hardUnsetLedPin1270:
L_dLedStripe_hardUnsetLedPin440:
;d_ledstripe.c,192 :: 		
L_end_dLedStripe_hardUnsetLedPin:
	RETURN
; end of _dLedStripe_hardUnsetLedPin

_external0:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buttons.c,10 :: 		
;buttons.c,11 :: 		
	PUSH	W10
	MOV	#6666, W7
L_external0447:
	DEC	W7
	BRA NZ	L_external0447
	NOP
	NOP
;buttons.c,12 :: 		
	BTSC	RF3_bit, BitPos(RF3_bit+0)
	GOTO	L_external0449
;buttons.c,13 :: 		
	CALL	_button_onBRDown
;buttons.c,14 :: 		
	GOTO	L_external0450
L_external0449:
	BTSC	RF2_bit, BitPos(RF2_bit+0)
	GOTO	L_external0451
;buttons.c,15 :: 		
	CALL	_button_onBLDown
;buttons.c,16 :: 		
L_external0451:
L_external0450:
;buttons.c,17 :: 		
	MOV.B	#4, W10
	CALL	_clearExternalInterrupt
;buttons.c,18 :: 		
L_end_external0:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external0

_external1:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buttons.c,20 :: 		
;buttons.c,21 :: 		
	PUSH	W10
	MOV	#6666, W7
L_external1452:
	DEC	W7
	BRA NZ	L_external1452
	NOP
	NOP
;buttons.c,22 :: 		
	BTSC	RB11_bit, BitPos(RB11_bit+0)
	GOTO	L_external1454
;buttons.c,23 :: 		
	CALL	_button_onL1Down
;buttons.c,24 :: 		
	GOTO	L_external1455
L_external1454:
	BTSC	RB12_bit, BitPos(RB12_bit+0)
	GOTO	L_external1456
;buttons.c,25 :: 		
	CALL	_button_onL2Down
;buttons.c,26 :: 		
	GOTO	L_external1457
L_external1456:
	BTSC	RG2_bit, BitPos(RG2_bit+0)
	GOTO	L_external1458
;buttons.c,27 :: 		
	CALL	_button_onL3Down
;buttons.c,28 :: 		
L_external1458:
L_external1457:
L_external1455:
;buttons.c,29 :: 		
	MOV.B	#5, W10
	CALL	_clearExternalInterrupt
;buttons.c,30 :: 		
L_end_external1:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external1

_external2:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buttons.c,32 :: 		
;buttons.c,33 :: 		
	PUSH	W10
	MOV	#6666, W7
L_external2459:
	DEC	W7
	BRA NZ	L_external2459
	NOP
	NOP
;buttons.c,34 :: 		
	BTSC	RB9_bit, BitPos(RB9_bit+0)
	GOTO	L_external2461
;buttons.c,35 :: 		
	CALL	_button_onR1Down
;buttons.c,36 :: 		
	GOTO	L_external2462
L_external2461:
	BTSC	RB10_bit, BitPos(RB10_bit+0)
	GOTO	L_external2463
;buttons.c,37 :: 		
	CALL	_button_onR2Down
;buttons.c,38 :: 		
	GOTO	L_external2464
L_external2463:
	BTSC	RG3_bit, BitPos(RG3_bit+0)
	GOTO	L_external2465
;buttons.c,39 :: 		
	CALL	_button_onR3Down
;buttons.c,40 :: 		
L_external2465:
L_external2464:
L_external2462:
;buttons.c,41 :: 		
	MOV.B	#6, W10
	CALL	_clearExternalInterrupt
;buttons.c,42 :: 		
L_end_external2:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external2

_external4:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buttons.c,44 :: 		
;buttons.c,45 :: 		
	PUSH	W10
	MOV	#6666, W7
L_external4466:
	DEC	W7
	BRA NZ	L_external4466
	NOP
	NOP
;buttons.c,46 :: 		
	CALL	_button_onCDown
;buttons.c,47 :: 		
	MOV.B	#8, W10
	CALL	_clearExternalInterrupt
;buttons.c,48 :: 		
L_end_external4:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external4

_Buttons_init:

;buttons.c,50 :: 		
;buttons.c,51 :: 		
	PUSH	W10
	PUSH	W11
	BSET	TRISB9_bit, BitPos(TRISB9_bit+0)
;buttons.c,52 :: 		
	BSET	TRISB10_bit, BitPos(TRISB10_bit+0)
;buttons.c,53 :: 		
	BSET	TRISG3_bit, BitPos(TRISG3_bit+0)
;buttons.c,54 :: 		
	BSET	TRISB11_bit, BitPos(TRISB11_bit+0)
;buttons.c,55 :: 		
	BSET	TRISB12_bit, BitPos(TRISB12_bit+0)
;buttons.c,56 :: 		
	BSET	TRISG2_bit, BitPos(TRISG2_bit+0)
;buttons.c,57 :: 		
	BSET	TRISF2_bit, BitPos(TRISF2_bit+0)
;buttons.c,58 :: 		
	BSET	TRISF3_bit, BitPos(TRISF3_bit+0)
;buttons.c,60 :: 		
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_setExternalInterrupt
;buttons.c,61 :: 		
	MOV.B	#1, W11
	MOV.B	#5, W10
	CALL	_setExternalInterrupt
;buttons.c,62 :: 		
	MOV.B	#1, W11
	MOV.B	#6, W10
	CALL	_setExternalInterrupt
;buttons.c,63 :: 		
	MOV.B	#1, W11
	MOV.B	#8, W10
	CALL	_setExternalInterrupt
;buttons.c,64 :: 		
L_end_Buttons_init:
	POP	W11
	POP	W10
	RETURN
; end of _Buttons_init

_Buttons_protractPress:

;buttons.c,70 :: 		
;buttons.c,71 :: 		
	CALL	_Buttons_isPressureProtracted
	CP0.B	W0
	BRA Z	L__Buttons_protractPress1277
	GOTO	L_Buttons_protractPress468
L__Buttons_protractPress1277:
;buttons.c,72 :: 		
	MOV	W11, _buttons_pressureProtraction
;buttons.c,73 :: 		
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	W10, [W0]
;buttons.c,74 :: 		
	MOV	#lo_addr(_buttons_pressureProtractionFlag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;buttons.c,75 :: 		
L_Buttons_protractPress468:
;buttons.c,76 :: 		
L_end_Buttons_protractPress:
	RETURN
; end of _Buttons_protractPress

_Buttons_tick:

;buttons.c,78 :: 		
;buttons.c,79 :: 		
	MOV	_buttons_pressureProtraction, W0
	CP	W0, #0
	BRA GTU	L__Buttons_tick1279
	GOTO	L_Buttons_tick469
L__Buttons_tick1279:
;buttons.c,80 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_buttons_pressureProtraction), W0
	SUBR	W1, [W0], [W0]
;buttons.c,81 :: 		
	MOV	_buttons_pressureProtraction, W0
	CP	W0, #0
	BRA Z	L__Buttons_tick1280
	GOTO	L_Buttons_tick470
L__Buttons_tick1280:
;buttons.c,82 :: 		
	GOTO	L_Buttons_tick471
;buttons.c,83 :: 		
L_Buttons_tick473:
;buttons.c,84 :: 		
	CALL	_button_onR1Down
;buttons.c,85 :: 		
	GOTO	L_Buttons_tick472
;buttons.c,86 :: 		
L_Buttons_tick474:
;buttons.c,87 :: 		
	CALL	_button_onR2Down
;buttons.c,88 :: 		
	GOTO	L_Buttons_tick472
;buttons.c,89 :: 		
L_Buttons_tick475:
;buttons.c,90 :: 		
	CALL	_button_onR3Down
;buttons.c,91 :: 		
	GOTO	L_Buttons_tick472
;buttons.c,92 :: 		
L_Buttons_tick476:
;buttons.c,93 :: 		
	CALL	_button_onL1Down
;buttons.c,94 :: 		
	GOTO	L_Buttons_tick472
;buttons.c,95 :: 		
L_Buttons_tick477:
;buttons.c,96 :: 		
	CALL	_button_onL2Down
;buttons.c,97 :: 		
	GOTO	L_Buttons_tick472
;buttons.c,98 :: 		
L_Buttons_tick478:
;buttons.c,99 :: 		
	CALL	_button_onL3Down
;buttons.c,100 :: 		
	GOTO	L_Buttons_tick472
;buttons.c,101 :: 		
L_Buttons_tick479:
;buttons.c,102 :: 		
	CALL	_button_onBLDown
;buttons.c,103 :: 		
	GOTO	L_Buttons_tick472
;buttons.c,104 :: 		
L_Buttons_tick480:
;buttons.c,105 :: 		
	CALL	_button_onBRDown
;buttons.c,106 :: 		
	GOTO	L_Buttons_tick472
;buttons.c,107 :: 		
L_Buttons_tick481:
;buttons.c,108 :: 		
	GOTO	L_Buttons_tick472
;buttons.c,109 :: 		
L_Buttons_tick471:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Buttons_tick1281
	GOTO	L_Buttons_tick473
L__Buttons_tick1281:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__Buttons_tick1282
	GOTO	L_Buttons_tick474
L__Buttons_tick1282:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__Buttons_tick1283
	GOTO	L_Buttons_tick475
L__Buttons_tick1283:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__Buttons_tick1284
	GOTO	L_Buttons_tick476
L__Buttons_tick1284:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__Buttons_tick1285
	GOTO	L_Buttons_tick477
L__Buttons_tick1285:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__Buttons_tick1286
	GOTO	L_Buttons_tick478
L__Buttons_tick1286:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__Buttons_tick1287
	GOTO	L_Buttons_tick479
L__Buttons_tick1287:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__Buttons_tick1288
	GOTO	L_Buttons_tick480
L__Buttons_tick1288:
	GOTO	L_Buttons_tick481
L_Buttons_tick472:
;buttons.c,110 :: 		
	GOTO	L_Buttons_tick482
L_Buttons_tick470:
;buttons.c,111 :: 		
	GOTO	L_Buttons_tick483
;buttons.c,112 :: 		
L_Buttons_tick485:
;buttons.c,113 :: 		
	BTSS	RB9_bit, BitPos(RB9_bit+0)
	GOTO	L_Buttons_tick486
;buttons.c,114 :: 		
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,115 :: 		
	CALL	_Buttons_clearPressureProtraction
;buttons.c,116 :: 		
L_Buttons_tick486:
;buttons.c,117 :: 		
	GOTO	L_Buttons_tick484
;buttons.c,118 :: 		
L_Buttons_tick487:
;buttons.c,119 :: 		
	BTSS	RB10_bit, BitPos(RB10_bit+0)
	GOTO	L_Buttons_tick488
;buttons.c,120 :: 		
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,121 :: 		
	CALL	_Buttons_clearPressureProtraction
;buttons.c,122 :: 		
L_Buttons_tick488:
;buttons.c,123 :: 		
	GOTO	L_Buttons_tick484
;buttons.c,124 :: 		
L_Buttons_tick489:
;buttons.c,125 :: 		
	BTSS	RG3_bit, BitPos(RG3_bit+0)
	GOTO	L_Buttons_tick490
;buttons.c,126 :: 		
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,127 :: 		
	CALL	_Buttons_clearPressureProtraction
;buttons.c,128 :: 		
L_Buttons_tick490:
;buttons.c,129 :: 		
	GOTO	L_Buttons_tick484
;buttons.c,130 :: 		
L_Buttons_tick491:
;buttons.c,131 :: 		
	BTSS	RB11_bit, BitPos(RB11_bit+0)
	GOTO	L_Buttons_tick492
;buttons.c,132 :: 		
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,133 :: 		
	CALL	_Buttons_clearPressureProtraction
;buttons.c,134 :: 		
L_Buttons_tick492:
;buttons.c,135 :: 		
	GOTO	L_Buttons_tick484
;buttons.c,136 :: 		
L_Buttons_tick493:
;buttons.c,137 :: 		
	BTSS	RB12_bit, BitPos(RB12_bit+0)
	GOTO	L_Buttons_tick494
;buttons.c,138 :: 		
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,139 :: 		
	CALL	_Buttons_clearPressureProtraction
;buttons.c,140 :: 		
L_Buttons_tick494:
;buttons.c,141 :: 		
	GOTO	L_Buttons_tick484
;buttons.c,142 :: 		
L_Buttons_tick495:
;buttons.c,143 :: 		
	BTSS	RG2_bit, BitPos(RG2_bit+0)
	GOTO	L_Buttons_tick496
;buttons.c,144 :: 		
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,145 :: 		
	CALL	_Buttons_clearPressureProtraction
;buttons.c,146 :: 		
L_Buttons_tick496:
;buttons.c,147 :: 		
	GOTO	L_Buttons_tick484
;buttons.c,148 :: 		
L_Buttons_tick497:
;buttons.c,149 :: 		
	BTSS	RF2_bit, BitPos(RF2_bit+0)
	GOTO	L_Buttons_tick498
;buttons.c,150 :: 		
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,151 :: 		
	CALL	_Buttons_clearPressureProtraction
;buttons.c,152 :: 		
L_Buttons_tick498:
;buttons.c,153 :: 		
	GOTO	L_Buttons_tick484
;buttons.c,154 :: 		
L_Buttons_tick499:
;buttons.c,155 :: 		
	BTSS	RF3_bit, BitPos(RF3_bit+0)
	GOTO	L_Buttons_tick500
;buttons.c,156 :: 		
	CLR	W0
	MOV	W0, _buttons_pressureProtraction
;buttons.c,157 :: 		
	CALL	_Buttons_clearPressureProtraction
;buttons.c,158 :: 		
L_Buttons_tick500:
;buttons.c,159 :: 		
	GOTO	L_Buttons_tick484
;buttons.c,160 :: 		
L_Buttons_tick501:
;buttons.c,161 :: 		
	GOTO	L_Buttons_tick484
;buttons.c,162 :: 		
L_Buttons_tick483:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Buttons_tick1289
	GOTO	L_Buttons_tick485
L__Buttons_tick1289:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__Buttons_tick1290
	GOTO	L_Buttons_tick487
L__Buttons_tick1290:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__Buttons_tick1291
	GOTO	L_Buttons_tick489
L__Buttons_tick1291:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__Buttons_tick1292
	GOTO	L_Buttons_tick491
L__Buttons_tick1292:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__Buttons_tick1293
	GOTO	L_Buttons_tick493
L__Buttons_tick1293:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__Buttons_tick1294
	GOTO	L_Buttons_tick495
L__Buttons_tick1294:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__Buttons_tick1295
	GOTO	L_Buttons_tick497
L__Buttons_tick1295:
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__Buttons_tick1296
	GOTO	L_Buttons_tick499
L__Buttons_tick1296:
	GOTO	L_Buttons_tick501
L_Buttons_tick484:
;buttons.c,163 :: 		
L_Buttons_tick482:
;buttons.c,164 :: 		
L_Buttons_tick469:
;buttons.c,165 :: 		
L_end_Buttons_tick:
	RETURN
; end of _Buttons_tick

_Buttons_isPressureProtracted:

;buttons.c,167 :: 		
;buttons.c,168 :: 		
	MOV	#lo_addr(_buttons_pressureProtractionFlag), W0
	MOV.B	[W0], W0
;buttons.c,169 :: 		
L_end_Buttons_isPressureProtracted:
	RETURN
; end of _Buttons_isPressureProtracted

_Buttons_clearPressureProtraction:

;buttons.c,171 :: 		
;buttons.c,172 :: 		
	MOV	#lo_addr(_buttons_pressureProtractionFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;buttons.c,173 :: 		
L_end_Buttons_clearPressureProtraction:
	RETURN
; end of _Buttons_clearPressureProtraction

_button_onBRDown:

;d_buttons.c,7 :: 		
;d_buttons.c,9 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dGear_canGearUp
	CP0.B	W0
	BRA Z	L__button_onBRDown1300
	GOTO	L__button_onBRDown788
L__button_onBRDown1300:
	MOV	#lo_addr(_d_isNeutralSet), W0
	CP0.B	[W0]
	BRA Z	L__button_onBRDown1301
	GOTO	L__button_onBRDown787
L__button_onBRDown1301:
	GOTO	L_button_onBRDown504
L__button_onBRDown788:
L__button_onBRDown787:
;d_buttons.c,10 :: 		
	MOV	#400, W12
	MOV	#1280, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_buttons.c,11 :: 		
	GOTO	L_button_onBRDown505
L_button_onBRDown504:
;d_buttons.c,13 :: 		
L_button_onBRDown505:
;d_buttons.c,14 :: 		
L_end_button_onBRDown:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _button_onBRDown

_button_onBLDown:

;d_buttons.c,16 :: 		
;d_buttons.c,18 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dGear_canGearDown
	CP0.B	W0
	BRA Z	L__button_onBLDown1303
	GOTO	L__button_onBLDown791
L__button_onBLDown1303:
	MOV	#lo_addr(_d_isNeutralSet), W0
	CP0.B	[W0]
	BRA Z	L__button_onBLDown1304
	GOTO	L__button_onBLDown790
L__button_onBLDown1304:
	GOTO	L_button_onBLDown508
L__button_onBLDown791:
L__button_onBLDown790:
;d_buttons.c,19 :: 		
	MOV	#200, W12
	MOV	#1280, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_buttons.c,20 :: 		
	GOTO	L_button_onBLDown509
L_button_onBLDown508:
;d_buttons.c,22 :: 		
L_button_onBLDown509:
;d_buttons.c,23 :: 		
L_end_button_onBLDown:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _button_onBLDown

_button_onCDown:

;d_buttons.c,25 :: 		
;d_buttons.c,26 :: 		
	PUSH	W10
	MOV.B	#8, W10
	CALL	_getExternalInterruptEdge
	CP.B	W0, #1
	BRA Z	L__button_onCDown1306
	GOTO	L_button_onCDown510
L__button_onCDown1306:
;d_buttons.c,27 :: 		
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_buttons.c,28 :: 		
	CALL	_dStart_switchOn
;d_buttons.c,29 :: 		
	MOV.B	#8, W10
	CALL	_switchExternalInterruptEdge
;d_buttons.c,30 :: 		
	GOTO	L_button_onCDown511
L_button_onCDown510:
;d_buttons.c,31 :: 		
	MOV.B	#2, W10
	CALL	_dSignalLed_unset
;d_buttons.c,32 :: 		
	CALL	_dStart_switchOff
;d_buttons.c,33 :: 		
	MOV.B	#8, W10
	CALL	_switchExternalInterruptEdge
;d_buttons.c,34 :: 		
L_button_onCDown511:
;d_buttons.c,35 :: 		
L_end_button_onCDown:
	POP	W10
	RETURN
; end of _button_onCDown

_button_onL3Down:

;d_buttons.c,37 :: 		
;d_buttons.c,38 :: 		
	PUSH	W10
	PUSH	W11
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #2
	BRA Z	L__button_onL3Down1308
	GOTO	L_button_onL3Down512
L__button_onL3Down1308:
;d_buttons.c,39 :: 		
	CALL	_dd_Interface_applySettings
;d_buttons.c,40 :: 		
L_button_onL3Down512:
;d_buttons.c,41 :: 		
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #20
	BRA Z	L__button_onL3Down1309
	GOTO	L_button_onL3Down513
L__button_onL3Down1309:
;d_buttons.c,42 :: 		
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__button_onL3Down1310
	GOTO	L_button_onL3Down514
L__button_onL3Down1310:
;d_buttons.c,43 :: 		
	CALL	_dEbb_calibrateSwitch
;d_buttons.c,44 :: 		
L_button_onL3Down514:
;d_buttons.c,45 :: 		
L_button_onL3Down513:
;d_buttons.c,46 :: 		
	CALL	_dd_GraphicController_getInterface
;d_buttons.c,47 :: 		
	CP.B	W0, #4
	BRA NZ	L__button_onL3Down1311
	GOTO	L__button_onL3Down797
L__button_onL3Down1311:
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #3
	BRA NZ	L__button_onL3Down1312
	GOTO	L__button_onL3Down796
L__button_onL3Down1312:
L__button_onL3Down793:
;d_buttons.c,48 :: 		
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #0
	BRA Z	L__button_onL3Down1313
	GOTO	L__button_onL3Down795
L__button_onL3Down1313:
	MOV	#lo_addr(_d_isNeutralSet), W0
	CP0.B	[W0]
	BRA Z	L__button_onL3Down1314
	GOTO	L__button_onL3Down794
L__button_onL3Down1314:
L__button_onL3Down792:
;d_buttons.c,49 :: 		
	CALL	_Buttons_isPressureProtracted
	CP0.B	W0
	BRA Z	L__button_onL3Down1315
	GOTO	L_button_onL3Down521
L__button_onL3Down1315:
;d_buttons.c,50 :: 		
	MOV	#1000, W11
	MOV.B	#5, W10
	CALL	_Buttons_protractPress
;d_buttons.c,51 :: 		
	GOTO	L_button_onL3Down522
L_button_onL3Down521:
;d_buttons.c,52 :: 		
	CALL	_Buttons_clearPressureProtraction
;d_buttons.c,53 :: 		
	CALL	_dd_GraphicController_switchPreviousInterface
;d_buttons.c,54 :: 		
L_button_onL3Down522:
;d_buttons.c,55 :: 		
	GOTO	L_button_onL3Down523
;d_buttons.c,48 :: 		
L__button_onL3Down795:
L__button_onL3Down794:
;d_buttons.c,56 :: 		
	CALL	_dd_GraphicController_switchPreviousInterface
;d_buttons.c,57 :: 		
L_button_onL3Down523:
;d_buttons.c,47 :: 		
L__button_onL3Down797:
L__button_onL3Down796:
;d_buttons.c,59 :: 		
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #1
	BRA Z	L__button_onL3Down1316
	GOTO	L_button_onL3Down524
L__button_onL3Down1316:
;d_buttons.c,61 :: 		
	CALL	_Buttons_isPressureProtracted
	CP0.B	W0
	BRA Z	L__button_onL3Down1317
	GOTO	L_button_onL3Down525
L__button_onL3Down1317:
;d_buttons.c,63 :: 		
	MOV	#1000, W11
	MOV.B	#5, W10
	CALL	_Buttons_protractPress
;d_buttons.c,64 :: 		
	GOTO	L_button_onL3Down526
L_button_onL3Down525:
;d_buttons.c,67 :: 		
	CALL	_Buttons_clearPressureProtraction
;d_buttons.c,68 :: 		
	CALL	_dRio_zeroAcquisition
;d_buttons.c,69 :: 		
L_button_onL3Down526:
;d_buttons.c,70 :: 		
L_button_onL3Down524:
;d_buttons.c,71 :: 		
L_end_button_onL3Down:
	POP	W11
	POP	W10
	RETURN
; end of _button_onL3Down

_button_onR3Down:

;d_buttons.c,73 :: 		
;d_buttons.c,74 :: 		
	PUSH	W10
	PUSH	W11
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #2
	BRA Z	L__button_onR3Down1319
	GOTO	L_button_onR3Down527
L__button_onR3Down1319:
;d_buttons.c,75 :: 		
	CALL	_dd_Interface_applySettings
;d_buttons.c,76 :: 		
L_button_onR3Down527:
;d_buttons.c,77 :: 		
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #20
	BRA Z	L__button_onR3Down1320
	GOTO	L_button_onR3Down528
L__button_onR3Down1320:
;d_buttons.c,78 :: 		
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__button_onR3Down1321
	GOTO	L_button_onR3Down529
L__button_onR3Down1321:
;d_buttons.c,79 :: 		
	CALL	_dEbb_calibrateSwitch
;d_buttons.c,80 :: 		
L_button_onR3Down529:
;d_buttons.c,81 :: 		
L_button_onR3Down528:
;d_buttons.c,82 :: 		
	CALL	_dd_GraphicController_getInterface
;d_buttons.c,83 :: 		
	CP.B	W0, #4
	BRA NZ	L__button_onR3Down1322
	GOTO	L__button_onR3Down803
L__button_onR3Down1322:
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #3
	BRA NZ	L__button_onR3Down1323
	GOTO	L__button_onR3Down802
L__button_onR3Down1323:
L__button_onR3Down799:
;d_buttons.c,84 :: 		
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #0
	BRA Z	L__button_onR3Down1324
	GOTO	L__button_onR3Down801
L__button_onR3Down1324:
	MOV	#lo_addr(_d_isNeutralSet), W0
	CP0.B	[W0]
	BRA Z	L__button_onR3Down1325
	GOTO	L__button_onR3Down800
L__button_onR3Down1325:
L__button_onR3Down798:
;d_buttons.c,85 :: 		
	CALL	_Buttons_isPressureProtracted
	CP0.B	W0
	BRA Z	L__button_onR3Down1326
	GOTO	L_button_onR3Down536
L__button_onR3Down1326:
;d_buttons.c,86 :: 		
	MOV	#1000, W11
	MOV.B	#2, W10
	CALL	_Buttons_protractPress
;d_buttons.c,87 :: 		
	GOTO	L_button_onR3Down537
L_button_onR3Down536:
;d_buttons.c,88 :: 		
	CALL	_Buttons_clearPressureProtraction
;d_buttons.c,89 :: 		
	CALL	_dd_GraphicController_switchNextInterface
;d_buttons.c,90 :: 		
L_button_onR3Down537:
;d_buttons.c,91 :: 		
	GOTO	L_button_onR3Down538
;d_buttons.c,84 :: 		
L__button_onR3Down801:
L__button_onR3Down800:
;d_buttons.c,92 :: 		
	CALL	_dd_GraphicController_switchNextInterface
;d_buttons.c,93 :: 		
L_button_onR3Down538:
;d_buttons.c,83 :: 		
L__button_onR3Down803:
L__button_onR3Down802:
;d_buttons.c,95 :: 		
L_end_button_onR3Down:
	POP	W11
	POP	W10
	RETURN
; end of _button_onR3Down

_button_onL2Down:

;d_buttons.c,97 :: 		
;d_buttons.c,98 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_d_isNeutralSet), W0
	CP0.B	[W0]
	BRA Z	L__button_onL2Down1328
	GOTO	L_button_onL2Down539
L__button_onL2Down1328:
;d_buttons.c,99 :: 		
	CALL	_dGear_get
	CP.B	W0, #1
	BRA Z	L__button_onL2Down1329
	GOTO	L_button_onL2Down540
L__button_onL2Down1329:
;d_buttons.c,100 :: 		
	MOV	#50, W12
	MOV	#1280, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_buttons.c,101 :: 		
	GOTO	L_button_onL2Down541
L_button_onL2Down540:
	CALL	_dGear_get
	CP.B	W0, #2
	BRA Z	L__button_onL2Down1330
	GOTO	L_button_onL2Down542
L__button_onL2Down1330:
;d_buttons.c,102 :: 		
	MOV	#100, W12
	MOV	#1280, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_buttons.c,103 :: 		
L_button_onL2Down542:
L_button_onL2Down541:
;d_buttons.c,104 :: 		
L_button_onL2Down539:
;d_buttons.c,105 :: 		
L_end_button_onL2Down:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _button_onL2Down

_button_onR1Down:

;d_buttons.c,107 :: 		
;d_buttons.c,108 :: 		
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #0
	BRA Z	L__button_onR1Down1332
	GOTO	L_button_onR1Down543
L__button_onR1Down1332:
;d_buttons.c,109 :: 		
	CALL	_dHardReset_reset
;d_buttons.c,110 :: 		
	GOTO	L_button_onR1Down544
L_button_onR1Down543:
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #20
	BRA Z	L__button_onR1Down1333
	GOTO	L_button_onR1Down545
L__button_onR1Down1333:
;d_buttons.c,111 :: 		
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__button_onR1Down1334
	GOTO	L_button_onR1Down546
L__button_onR1Down1334:
;d_buttons.c,112 :: 		
	CALL	_dEbb_increase
;d_buttons.c,113 :: 		
L_button_onR1Down546:
;d_buttons.c,114 :: 		
	GOTO	L_button_onR1Down547
L_button_onR1Down545:
;d_buttons.c,124 :: 		
	CALL	_dd_Menu_selectUp
;d_buttons.c,125 :: 		
L_button_onR1Down547:
L_button_onR1Down544:
;d_buttons.c,126 :: 		
L_end_button_onR1Down:
	RETURN
; end of _button_onR1Down

_button_onR2Down:

;d_buttons.c,128 :: 		
;d_buttons.c,129 :: 		
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #20
	BRA Z	L__button_onR2Down1336
	GOTO	L_button_onR2Down548
L__button_onR2Down1336:
;d_buttons.c,130 :: 		
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__button_onR2Down1337
	GOTO	L_button_onR2Down549
L__button_onR2Down1337:
;d_buttons.c,131 :: 		
	CALL	_dEbb_decrease
;d_buttons.c,132 :: 		
L_button_onR2Down549:
;d_buttons.c,133 :: 		
	GOTO	L_button_onR2Down550
L_button_onR2Down548:
;d_buttons.c,143 :: 		
	CALL	_dd_Menu_selectDown
;d_buttons.c,144 :: 		
L_button_onR2Down550:
;d_buttons.c,145 :: 		
L_end_button_onR2Down:
	RETURN
; end of _button_onR2Down

_button_onL1Down:

;d_buttons.c,147 :: 		
;d_buttons.c,148 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #2
	BRA Z	L__button_onL1Down1339
	GOTO	L_button_onL1Down551
L__button_onL1Down1339:
;d_buttons.c,149 :: 		
	MOV.B	#1, W10
	CALL	_dd_Interface_onSettingsChange
;d_buttons.c,150 :: 		
	GOTO	L_button_onL1Down552
L_button_onL1Down551:
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #20
	BRA Z	L__button_onL1Down1340
	GOTO	L_button_onL1Down553
L__button_onL1Down1340:
;d_buttons.c,151 :: 		
	CALL	_dEbb_calibrateSwitch
;d_buttons.c,152 :: 		
	GOTO	L_button_onL1Down554
L_button_onL1Down553:
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #1
	BRA Z	L__button_onL1Down1341
	GOTO	L_button_onL1Down555
L__button_onL1Down1341:
;d_buttons.c,153 :: 		
	CALL	_dRio_switchAcquisition
;d_buttons.c,154 :: 		
	GOTO	L_button_onL1Down556
L_button_onL1Down555:
	CALL	_dd_GraphicController_getInterface
	CP.B	W0, #0
	BRA Z	L__button_onL1Down1342
	GOTO	L_button_onL1Down557
L__button_onL1Down1342:
;d_buttons.c,155 :: 		
	CALL	_dAcc_isAutoAccelerationActive
	CP0.B	W0
	BRA Z	L__button_onL1Down1343
	GOTO	L_button_onL1Down558
L__button_onL1Down1343:
;d_buttons.c,156 :: 		
	CALL	_Buttons_isPressureProtracted
	CP0.B	W0
	BRA Z	L__button_onL1Down1344
	GOTO	L_button_onL1Down559
L__button_onL1Down1344:
;d_buttons.c,157 :: 		
	MOV	#1000, W11
	MOV.B	#3, W10
	CALL	_Buttons_protractPress
;d_buttons.c,158 :: 		
	GOTO	L_button_onL1Down560
L_button_onL1Down559:
;d_buttons.c,159 :: 		
	CALL	_Buttons_clearPressureProtraction
;d_buttons.c,161 :: 		
	CLR	W12
	MOV	#1776, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_buttons.c,162 :: 		
L_button_onL1Down560:
;d_buttons.c,163 :: 		
	GOTO	L_button_onL1Down561
L_button_onL1Down558:
;d_buttons.c,164 :: 		
	CALL	_dAcc_isReleasingClutch
	CP0.B	W0
	BRA NZ	L__button_onL1Down1345
	GOTO	L_button_onL1Down562
L__button_onL1Down1345:
;d_buttons.c,166 :: 		
	CLR	W12
	MOV	#1776, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_buttons.c,167 :: 		
	GOTO	L_button_onL1Down563
L_button_onL1Down562:
;d_buttons.c,169 :: 		
	CLR	W12
	MOV	#1776, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_buttons.c,170 :: 		
L_button_onL1Down563:
;d_buttons.c,171 :: 		
L_button_onL1Down561:
;d_buttons.c,172 :: 		
L_button_onL1Down557:
L_button_onL1Down556:
L_button_onL1Down554:
L_button_onL1Down552:
;d_buttons.c,173 :: 		
L_end_button_onL1Down:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _button_onL1Down

_timer4_interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buzzer.c,9 :: 		
;buzzer.c,10 :: 		
	BCLR	IFS1bits, #5
;buzzer.c,11 :: 		
	CALL	_Buzzer_tick
;buzzer.c,19 :: 		
L_end_timer4_interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _timer4_interrupt

_Buzzer_init:

;buzzer.c,21 :: 		
;buzzer.c,22 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	TRISD0_bit, BitPos(TRISD0_bit+0)
;buzzer.c,23 :: 		
	BCLR	RD0_bit, BitPos(RD0_bit+0)
;buzzer.c,24 :: 		
	MOV	#4719, W11
	MOV	#14851, W12
	MOV.B	#3, W10
	CALL	_setTimer
;buzzer.c,25 :: 		
	MOV.B	#5, W11
	MOV.B	#3, W10
	CALL	_setInterruptPriority
;buzzer.c,26 :: 		
	MOV	#200, W0
	MOV	W0, _buzzer_bipTicks
;buzzer.c,27 :: 		
L_end_Buzzer_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Buzzer_init

_Buzzer_tick:

;buzzer.c,29 :: 		
;buzzer.c,30 :: 		
	MOV	_buzzer_ticks, W0
	CP	W0, #0
	BRA GTU	L__Buzzer_tick1349
	GOTO	L_Buzzer_tick564
L__Buzzer_tick1349:
;buzzer.c,31 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_buzzer_ticks), W0
	SUBR	W1, [W0], [W0]
;buzzer.c,32 :: 		
	BTG	RD0_bit, BitPos(RD0_bit+0)
;buzzer.c,33 :: 		
L_Buzzer_tick564:
;buzzer.c,34 :: 		
L_end_Buzzer_tick:
	RETURN
; end of _Buzzer_tick

_Buzzer_bip:

;buzzer.c,36 :: 		
;buzzer.c,37 :: 		
	MOV	_buzzer_bipTicks, W0
	MOV	W0, _buzzer_ticks
;buzzer.c,38 :: 		
L_end_Buzzer_bip:
	RETURN
; end of _Buzzer_bip

_dClutch_send:

;d_clutch.c,9 :: 		
;d_clutch.c,10 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_dClutch_value), W0
	MOV.B	[W0], W12
	MOV	#1537, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_clutch.c,11 :: 		
L_end_dClutch_send:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dClutch_send

_dClutch_set:

;d_clutch.c,13 :: 		
;d_clutch.c,14 :: 		
	MOV.B	#100, W0
	CP.B	W10, W0
	BRA GTU	L__dClutch_set1353
	GOTO	L_dClutch_set565
L__dClutch_set1353:
;d_clutch.c,15 :: 		
	MOV.B	#100, W10
;d_clutch.c,16 :: 		
L_dClutch_set565:
;d_clutch.c,17 :: 		
	MOV	#lo_addr(_dClutch_value), W0
	MOV.B	W10, [W0]
;d_clutch.c,18 :: 		
L_end_dClutch_set:
	RETURN
; end of _dClutch_set

_dClutch_injectActualValue:

;d_clutch.c,20 :: 		
;d_clutch.c,21 :: 		
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dClutch_actualValue), W0
	MOV.B	W10, [W0]
;d_clutch.c,22 :: 		
	ZE	W10, W11
	MOV.B	#4, W10
	CALL	_dd_Indicator_setIntValue
;d_clutch.c,24 :: 		
L_end_dClutch_injectActualValue:
	POP	W11
	POP	W10
	RETURN
; end of _dClutch_injectActualValue

_dClutch_get:

;d_clutch.c,26 :: 		
;d_clutch.c,27 :: 		
	MOV	#lo_addr(_dClutch_actualValue), W0
	MOV.B	[W0], W0
;d_clutch.c,28 :: 		
L_end_dClutch_get:
	RETURN
; end of _dClutch_get

_dEfiSense_heartbeat:

;d_efisense.c,10 :: 		
;d_efisense.c,11 :: 		
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dEfiSense_detectReset), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_efisense.c,12 :: 		
	MOV	#lo_addr(_dEfiSense_dead), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_efisense.c,13 :: 		
	MOV	#1000, W0
	MOV	W0, _dEfiSense_ticks
;d_efisense.c,14 :: 		
	CALL	_dEfiSense_isDead
	CP0.B	W0
	CLR.B	W0
	BRA NZ	L__dEfiSense_heartbeat1357
	INC.B	W0
L__dEfiSense_heartbeat1357:
	MOV.B	W0, W11
	MOV.B	#7, W10
	CALL	_dd_Indicator_setBoolValue
;d_efisense.c,15 :: 		
	CLR	W10
	CALL	_dSignalLed_set
;d_efisense.c,16 :: 		
L_end_dEfiSense_heartbeat:
	POP	W11
	POP	W10
	RETURN
; end of _dEfiSense_heartbeat

_dEfiSense_tick:

;d_efisense.c,18 :: 		
;d_efisense.c,19 :: 		
	MOV	_dEfiSense_ticks, W0
	CP	W0, #0
	BRA GTU	L__dEfiSense_tick1359
	GOTO	L_dEfiSense_tick566
L__dEfiSense_tick1359:
;d_efisense.c,20 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_dEfiSense_ticks), W0
	SUBR	W1, [W0], [W0]
;d_efisense.c,21 :: 		
	MOV	_dEfiSense_ticks, W0
	CP	W0, #0
	BRA Z	L__dEfiSense_tick1360
	GOTO	L_dEfiSense_tick567
L__dEfiSense_tick1360:
;d_efisense.c,22 :: 		
	CALL	_dEfiSense_die
;d_efisense.c,23 :: 		
	MOV	#lo_addr(_dEfiSense_detectReset), W0
	CP0.B	[W0]
	BRA NZ	L__dEfiSense_tick1361
	GOTO	L_dEfiSense_tick568
L__dEfiSense_tick1361:
;d_efisense.c,24 :: 		
	CALL	_dHardReset_reset
;d_efisense.c,25 :: 		
L_dEfiSense_tick568:
;d_efisense.c,26 :: 		
L_dEfiSense_tick567:
;d_efisense.c,27 :: 		
L_dEfiSense_tick566:
;d_efisense.c,28 :: 		
L_end_dEfiSense_tick:
	RETURN
; end of _dEfiSense_tick

_dEfiSense_die:

;d_efisense.c,30 :: 		
;d_efisense.c,31 :: 		
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dEfiSense_dead), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_efisense.c,32 :: 		
	CALL	_dEfiSense_isDead
	CP0.B	W0
	CLR.B	W0
	BRA NZ	L__dEfiSense_die1363
	INC.B	W0
L__dEfiSense_die1363:
	MOV.B	W0, W11
	MOV.B	#7, W10
	CALL	_dd_Indicator_setBoolValue
;d_efisense.c,33 :: 		
	CLR	W10
	CALL	_dSignalLed_unset
;d_efisense.c,34 :: 		
L_end_dEfiSense_die:
	POP	W11
	POP	W10
	RETURN
; end of _dEfiSense_die

_dEfiSense_isDead:

;d_efisense.c,36 :: 		
;d_efisense.c,37 :: 		
	MOV	#lo_addr(_dEfiSense_dead), W0
	MOV.B	[W0], W0
;d_efisense.c,38 :: 		
L_end_dEfiSense_isDead:
	RETURN
; end of _dEfiSense_isDead

_dEfiSense_calculateTemperature:

;d_efisense.c,40 :: 		
;d_efisense.c,41 :: 		
	MOV	#160, W0
	MUL.UU	W10, W0, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17280, W3
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Sub_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_efisense.c,42 :: 		
L_end_dEfiSense_calculateTemperature:
	RETURN
; end of _dEfiSense_calculateTemperature

_dEfiSense_calculatePressure:

;d_efisense.c,44 :: 		
;d_efisense.c,45 :: 		
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W10, W2
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_efisense.c,46 :: 		
L_end_dEfiSense_calculatePressure:
	RETURN
; end of _dEfiSense_calculatePressure

_dEfiSense_calculateVoltage:

;d_efisense.c,48 :: 		
;d_efisense.c,49 :: 		
	MOV	#18, W0
	MUL.UU	W10, W0, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17536, W3
	CALL	__Div_FP
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_efisense.c,50 :: 		
L_end_dEfiSense_calculateVoltage:
	RETURN
; end of _dEfiSense_calculateVoltage

_dEbb_init:

;d_ebb.c,15 :: 		
;d_ebb.c,16 :: 		
	PUSH	W10
	PUSH	W11
	MOV	_dEbb_value, W11
	CLR	W10
	CALL	_dd_Indicator_setIntValue
;d_ebb.c,17 :: 		
L_end_dEbb_init:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_init

_dEbb_calibrateSwitch:

;d_ebb.c,19 :: 		
;d_ebb.c,20 :: 		
	PUSH	W10
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__dEbb_calibrateSwitch1370
	GOTO	L_dEbb_calibrateSwitch569
L__dEbb_calibrateSwitch1370:
;d_ebb.c,21 :: 		
	CALL	_dEbb_calibrateStop
;d_ebb.c,22 :: 		
	CLR	W0
	MOV	W0, _calibrationState
;d_ebb.c,23 :: 		
	CLR	W10
	CALL	_dSignalLed_switch
;d_ebb.c,24 :: 		
	GOTO	L_dEbb_calibrateSwitch570
L_dEbb_calibrateSwitch569:
	CALL	_dEbb_isCalibrateing
	CP	W0, #0
	BRA Z	L__dEbb_calibrateSwitch1371
	GOTO	L_dEbb_calibrateSwitch571
L__dEbb_calibrateSwitch1371:
;d_ebb.c,25 :: 		
	MOV	#1, W0
	MOV	W0, _calibrationState
;d_ebb.c,26 :: 		
	CLR	W10
	CALL	_dSignalLed_switch
;d_ebb.c,27 :: 		
L_dEbb_calibrateSwitch571:
L_dEbb_calibrateSwitch570:
;d_ebb.c,28 :: 		
L_end_dEbb_calibrateSwitch:
	POP	W10
	RETURN
; end of _dEbb_calibrateSwitch

_dEbb_isCalibrateing:

;d_ebb.c,30 :: 		
;d_ebb.c,31 :: 		
	MOV	_calibrationState, W0
;d_ebb.c,32 :: 		
L_end_dEbb_isCalibrateing:
	RETURN
; end of _dEbb_isCalibrateing

_dEbb_calibrateUp:

;d_ebb.c,34 :: 		
;d_ebb.c,35 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#101, W12
	MOV	#1613, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,36 :: 		
L_end_dEbb_calibrateUp:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateUp

_dEbb_calibrateDown:

;d_ebb.c,38 :: 		
;d_ebb.c,39 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#99, W12
	MOV	#1613, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,40 :: 		
L_end_dEbb_calibrateDown:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateDown

_dEbb_calibratePause:

;d_ebb.c,42 :: 		
;d_ebb.c,43 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#100, W12
	MOV	#1613, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,44 :: 		
L_end_dEbb_calibratePause:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibratePause

_dEbb_calibrateStop:

;d_ebb.c,46 :: 		
;d_ebb.c,47 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#4, W12
	MOV	#1613, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,48 :: 		
	CLR	W0
	MOV	W0, _dEbb_localValue
;d_ebb.c,50 :: 		
L_end_dEbb_calibrateStop:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_calibrateStop

_dEbb_increase:

;d_ebb.c,52 :: 		
;d_ebb.c,53 :: 		
	PUSH	W10
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_increase1378
	GOTO	L_dEbb_increase572
L__dEbb_increase1378:
;d_ebb.c,54 :: 		
	MOV	#65533, W1
	MOV	#lo_addr(_dEbb_localValue), W0
	CP	W1, [W0]
	BRA LT	L__dEbb_increase1379
	GOTO	L_dEbb_increase573
L__dEbb_increase1379:
;d_ebb.c,55 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_dEbb_localValue), W0
	SUBR	W1, [W0], [W0]
;d_ebb.c,56 :: 		
	MOV.B	#1, W10
	CALL	_dEbb_propagateSteeringWheelChange
;d_ebb.c,57 :: 		
L_dEbb_increase573:
;d_ebb.c,58 :: 		
L_dEbb_increase572:
;d_ebb.c,59 :: 		
L_end_dEbb_increase:
	POP	W10
	RETURN
; end of _dEbb_increase

_dEbb_decrease:

;d_ebb.c,61 :: 		
;d_ebb.c,62 :: 		
	PUSH	W10
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_decrease1381
	GOTO	L_dEbb_decrease574
L__dEbb_decrease1381:
;d_ebb.c,63 :: 		
	MOV	_dEbb_localValue, W0
	CP	W0, #3
	BRA LT	L__dEbb_decrease1382
	GOTO	L_dEbb_decrease575
L__dEbb_decrease1382:
;d_ebb.c,64 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_dEbb_localValue), W0
	ADD	W1, [W0], [W0]
;d_ebb.c,65 :: 		
	CLR	W10
	CALL	_dEbb_propagateSteeringWheelChange
;d_ebb.c,66 :: 		
L_dEbb_decrease575:
;d_ebb.c,67 :: 		
L_dEbb_decrease574:
;d_ebb.c,68 :: 		
L_end_dEbb_decrease:
	POP	W10
	RETURN
; end of _dEbb_decrease

_dEbb_setEbbValueFromCAN:

;d_ebb.c,70 :: 		
;d_ebb.c,71 :: 		
	GOTO	L_dEbb_setEbbValueFromCAN576
;d_ebb.c,72 :: 		
L_dEbb_setEbbValueFromCAN578:
;d_ebb.c,73 :: 		
	MOV	#100, W0
	MOV	W0, _dEbb_state
;d_ebb.c,74 :: 		
	GOTO	L_dEbb_setEbbValueFromCAN577
;d_ebb.c,75 :: 		
L_dEbb_setEbbValueFromCAN579:
;d_ebb.c,76 :: 		
	MOV	#122, W0
	MOV	W0, _dEbb_state
;d_ebb.c,77 :: 		
	GOTO	L_dEbb_setEbbValueFromCAN577
;d_ebb.c,78 :: 		
L_dEbb_setEbbValueFromCAN580:
;d_ebb.c,79 :: 		
	MOV	#124, W0
	MOV	W0, _dEbb_state
;d_ebb.c,80 :: 		
	GOTO	L_dEbb_setEbbValueFromCAN577
;d_ebb.c,81 :: 		
L_dEbb_setEbbValueFromCAN581:
;d_ebb.c,82 :: 		
	MOV	#10, W0
	MOV	W0, _dEbb_state
;d_ebb.c,83 :: 		
	GOTO	L_dEbb_setEbbValueFromCAN577
;d_ebb.c,84 :: 		
L_dEbb_setEbbValueFromCAN582:
;d_ebb.c,85 :: 		
	MOV	#112, W0
	MOV	W0, _dEbb_state
;d_ebb.c,86 :: 		
	SUB	W10, #4, W0
	MOV	W0, _dEbb_value
;d_ebb.c,87 :: 		
	MOV	W0, _dEbb_localValue
;d_ebb.c,88 :: 		
	GOTO	L_dEbb_setEbbValueFromCAN577
;d_ebb.c,89 :: 		
L_dEbb_setEbbValueFromCAN576:
	MOV	#100, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN1384
	GOTO	L_dEbb_setEbbValueFromCAN578
L__dEbb_setEbbValueFromCAN1384:
	MOV	#122, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN1385
	GOTO	L_dEbb_setEbbValueFromCAN579
L__dEbb_setEbbValueFromCAN1385:
	MOV	#124, W0
	CP	W10, W0
	BRA NZ	L__dEbb_setEbbValueFromCAN1386
	GOTO	L_dEbb_setEbbValueFromCAN580
L__dEbb_setEbbValueFromCAN1386:
	CP	W10, #10
	BRA NZ	L__dEbb_setEbbValueFromCAN1387
	GOTO	L_dEbb_setEbbValueFromCAN581
L__dEbb_setEbbValueFromCAN1387:
	GOTO	L_dEbb_setEbbValueFromCAN582
L_dEbb_setEbbValueFromCAN577:
;d_ebb.c,90 :: 		
L_end_dEbb_setEbbValueFromCAN:
	RETURN
; end of _dEbb_setEbbValueFromCAN

_dEbb_setEbbMotorStateFromCAN:

;d_ebb.c,92 :: 		
;d_ebb.c,93 :: 		
	MOV	W10, _dEbb_motorState
;d_ebb.c,94 :: 		
L_end_dEbb_setEbbMotorStateFromCAN:
	RETURN
; end of _dEbb_setEbbMotorStateFromCAN

_dEbb_setEbbMotorSenseFromCAN:

;d_ebb.c,96 :: 		
;d_ebb.c,97 :: 		
	MOV	W10, _dEbb_motorSense
;d_ebb.c,98 :: 		
L_end_dEbb_setEbbMotorSenseFromCAN:
	RETURN
; end of _dEbb_setEbbMotorSenseFromCAN

_dEbb_propagateSteeringWheelChange:

;d_ebb.c,100 :: 		
;d_ebb.c,101 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	_dEbb_localValue, W0
	ADD	W0, #4, W0
	MOV.B	W0, W12
	MOV	#1613, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_ebb.c,102 :: 		
L_end_dEbb_propagateSteeringWheelChange:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateSteeringWheelChange

_dEbb_propagateEbbChange:

;d_ebb.c,104 :: 		
;d_ebb.c,105 :: 		
	PUSH	W10
	PUSH	W11
	GOTO	L_dEbb_propagateEbbChange583
;d_ebb.c,106 :: 		
L_dEbb_propagateEbbChange585:
;d_ebb.c,107 :: 		
	MOV	#lo_addr(?lstr43_DP9_AAC), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,108 :: 		
	GOTO	L_dEbb_propagateEbbChange584
;d_ebb.c,109 :: 		
L_dEbb_propagateEbbChange586:
;d_ebb.c,110 :: 		
	MOV	#lo_addr(?lstr44_DP9_AAC), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,111 :: 		
	GOTO	L_dEbb_propagateEbbChange584
;d_ebb.c,112 :: 		
L_dEbb_propagateEbbChange587:
;d_ebb.c,113 :: 		
	MOV	#lo_addr(?lstr45_DP9_AAC), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,114 :: 		
	GOTO	L_dEbb_propagateEbbChange584
;d_ebb.c,115 :: 		
L_dEbb_propagateEbbChange588:
;d_ebb.c,116 :: 		
	MOV	#lo_addr(?lstr46_DP9_AAC), W11
	CLR	W10
	CALL	_dd_Indicator_setStringValue
;d_ebb.c,117 :: 		
	GOTO	L_dEbb_propagateEbbChange584
;d_ebb.c,118 :: 		
L_dEbb_propagateEbbChange589:
;d_ebb.c,119 :: 		
	MOV	_dEbb_value, W0
	SUBR	W0, #0, W0
	MOV	W0, W11
	CLR	W10
	CALL	_dd_Indicator_setIntValue
;d_ebb.c,120 :: 		
	GOTO	L_dEbb_propagateEbbChange584
;d_ebb.c,121 :: 		
L_dEbb_propagateEbbChange583:
	MOV	#100, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange1392
	GOTO	L_dEbb_propagateEbbChange585
L__dEbb_propagateEbbChange1392:
	MOV	#122, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange1393
	GOTO	L_dEbb_propagateEbbChange586
L__dEbb_propagateEbbChange1393:
	MOV	#124, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_propagateEbbChange1394
	GOTO	L_dEbb_propagateEbbChange587
L__dEbb_propagateEbbChange1394:
	MOV	_dEbb_state, W0
	CP	W0, #10
	BRA NZ	L__dEbb_propagateEbbChange1395
	GOTO	L_dEbb_propagateEbbChange588
L__dEbb_propagateEbbChange1395:
	GOTO	L_dEbb_propagateEbbChange589
L_dEbb_propagateEbbChange584:
;d_ebb.c,122 :: 		
L_end_dEbb_propagateEbbChange:
	POP	W11
	POP	W10
	RETURN
; end of _dEbb_propagateEbbChange

_dEbb_tick:

;d_ebb.c,124 :: 		
;d_ebb.c,125 :: 		
	PUSH	W10
	GOTO	L_dEbb_tick590
;d_ebb.c,126 :: 		
L_dEbb_tick592:
;d_ebb.c,127 :: 		
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_ebb.c,128 :: 		
	MOV	#1, W0
	MOV	W0, _stateFlag
;d_ebb.c,129 :: 		
	GOTO	L_dEbb_tick591
;d_ebb.c,130 :: 		
L_dEbb_tick593:
;d_ebb.c,131 :: 		
	MOV	#1, W0
	MOV	W0, _stateFlag
;d_ebb.c,132 :: 		
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_ebb.c,133 :: 		
	GOTO	L_dEbb_tick591
;d_ebb.c,134 :: 		
L_dEbb_tick594:
;d_ebb.c,135 :: 		
	MOV	_stateFlag, W0
	CP	W0, #1
	BRA Z	L__dEbb_tick1397
	GOTO	L_dEbb_tick595
L__dEbb_tick1397:
;d_ebb.c,136 :: 		
	MOV.B	#2, W10
	CALL	_dSignalLed_unset
;d_ebb.c,137 :: 		
	CLR	W0
	MOV	W0, _stateFlag
;d_ebb.c,138 :: 		
L_dEbb_tick595:
;d_ebb.c,139 :: 		
	GOTO	L_dEbb_tick591
;d_ebb.c,140 :: 		
L_dEbb_tick590:
	MOV	#122, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_tick1398
	GOTO	L_dEbb_tick592
L__dEbb_tick1398:
	MOV	#124, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA NZ	L__dEbb_tick1399
	GOTO	L_dEbb_tick593
L__dEbb_tick1399:
	GOTO	L_dEbb_tick594
L_dEbb_tick591:
;d_ebb.c,141 :: 		
	CALL	_dEbb_isCalibrateing
	CP	W0, #1
	BRA Z	L__dEbb_tick1400
	GOTO	L_dEbb_tick596
L__dEbb_tick1400:
;d_ebb.c,142 :: 		
	MOV	#122, W1
	MOV	#lo_addr(_dEbb_state), W0
	CP	W1, [W0]
	BRA Z	L__dEbb_tick1401
	GOTO	L_dEbb_tick597
L__dEbb_tick1401:
;d_ebb.c,143 :: 		
	CALL	_dEbb_calibrateSwitch
;d_ebb.c,144 :: 		
	GOTO	L_dEbb_tick598
L_dEbb_tick597:
	BTSC	RB9_bit, BitPos(RB9_bit+0)
	GOTO	L_dEbb_tick599
;d_ebb.c,145 :: 		
	CALL	_dEbb_calibrateDown
;d_ebb.c,146 :: 		
	GOTO	L_dEbb_tick600
L_dEbb_tick599:
	BTSC	RB10_bit, BitPos(RB10_bit+0)
	GOTO	L_dEbb_tick601
;d_ebb.c,147 :: 		
	CALL	_dEbb_calibrateUp
;d_ebb.c,148 :: 		
	GOTO	L_dEbb_tick602
L_dEbb_tick601:
;d_ebb.c,149 :: 		
	CALL	_dEbb_calibratePause
L_dEbb_tick602:
L_dEbb_tick600:
L_dEbb_tick598:
;d_ebb.c,150 :: 		
L_dEbb_tick596:
;d_ebb.c,151 :: 		
L_end_dEbb_tick:
	POP	W10
	RETURN
; end of _dEbb_tick

_dGear_propagate:

;d_gears.c,7 :: 		
;d_gears.c,8 :: 		
	CALL	_dGear_unsetError
;d_gears.c,9 :: 		
	CP	W10, #0
	BRA Z	L__dGear_propagate1403
	GOTO	L_dGear_propagate603
L__dGear_propagate1403:
;d_gears.c,10 :: 		
	CALL	_dGear_setNeutral
;d_gears.c,11 :: 		
	GOTO	L_dGear_propagate604
L_dGear_propagate603:
	CP	W10, #8
	BRA Z	L__dGear_propagate1404
	GOTO	L_dGear_propagate605
L__dGear_propagate1404:
;d_gears.c,12 :: 		
	CALL	_dGear_setError
;d_gears.c,13 :: 		
	GOTO	L_dGear_propagate606
L_dGear_propagate605:
;d_gears.c,14 :: 		
	CALL	_dGear_unsetNeutral
;d_gears.c,15 :: 		
	CALL	_dGear_set
;d_gears.c,16 :: 		
L_dGear_propagate606:
L_dGear_propagate604:
;d_gears.c,17 :: 		
L_end_dGear_propagate:
	RETURN
; end of _dGear_propagate

_dGear_getCurrentGearLetter:

;d_gears.c,19 :: 		
;d_gears.c,20 :: 		
	MOV	#lo_addr(_d_isNeutralSet), W0
	CP0.B	[W0]
	BRA NZ	L__dGear_getCurrentGearLetter1406
	GOTO	L_dGear_getCurrentGearLetter607
L__dGear_getCurrentGearLetter1406:
;d_gears.c,21 :: 		
	MOV.B	#58, W0
	GOTO	L_end_dGear_getCurrentGearLetter
;d_gears.c,22 :: 		
L_dGear_getCurrentGearLetter607:
	MOV	#lo_addr(_dGear_error), W0
	CP0.B	[W0]
	BRA NZ	L__dGear_getCurrentGearLetter1407
	GOTO	L_dGear_getCurrentGearLetter609
L__dGear_getCurrentGearLetter1407:
;d_gears.c,23 :: 		
	MOV.B	#59, W0
	GOTO	L_end_dGear_getCurrentGearLetter
;d_gears.c,24 :: 		
L_dGear_getCurrentGearLetter609:
;d_gears.c,25 :: 		
	MOV	#lo_addr(_d_currentGear), W0
	ZE	[W0], W1
	MOV	#48, W0
	ADD	W1, W0, W0
;d_gears.c,27 :: 		
L_end_dGear_getCurrentGearLetter:
	RETURN
; end of _dGear_getCurrentGearLetter

_dGear_setNeutral:

;d_gears.c,29 :: 		
;d_gears.c,30 :: 		
	MOV	#lo_addr(_d_isNeutralSet), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_gears.c,31 :: 		
L_end_dGear_setNeutral:
	RETURN
; end of _dGear_setNeutral

_dGear_unsetNeutral:

;d_gears.c,33 :: 		
;d_gears.c,34 :: 		
	MOV	#lo_addr(_d_isNeutralSet), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_gears.c,35 :: 		
L_end_dGear_unsetNeutral:
	RETURN
; end of _dGear_unsetNeutral

_dGear_setError:

;d_gears.c,37 :: 		
;d_gears.c,38 :: 		
	MOV	#lo_addr(_dGear_error), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_gears.c,39 :: 		
L_end_dGear_setError:
	RETURN
; end of _dGear_setError

_dGear_unsetError:

;d_gears.c,41 :: 		
;d_gears.c,42 :: 		
	MOV	#lo_addr(_dGear_error), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_gears.c,43 :: 		
L_end_dGear_unsetError:
	RETURN
; end of _dGear_unsetError

_dGear_set:

;d_gears.c,45 :: 		
;d_gears.c,46 :: 		
	CP.B	W10, #4
	BRA GTU	L__dGear_set1413
	GOTO	L_dGear_set611
L__dGear_set1413:
;d_gears.c,47 :: 		
	MOV.B	#4, W10
;d_gears.c,48 :: 		
	GOTO	L_dGear_set612
L_dGear_set611:
	CP.B	W10, #1
	BRA LTU	L__dGear_set1414
	GOTO	L_dGear_set613
L__dGear_set1414:
;d_gears.c,49 :: 		
	MOV.B	#1, W10
;d_gears.c,50 :: 		
L_dGear_set613:
L_dGear_set612:
;d_gears.c,51 :: 		
	MOV	#lo_addr(_d_currentGear), W0
	MOV.B	W10, [W0]
;d_gears.c,52 :: 		
L_end_dGear_set:
	RETURN
; end of _dGear_set

_dGear_get:

;d_gears.c,54 :: 		
;d_gears.c,55 :: 		
	MOV	#lo_addr(_d_currentGear), W0
	MOV.B	[W0], W0
;d_gears.c,56 :: 		
L_end_dGear_get:
	RETURN
; end of _dGear_get

_dGear_up:

;d_gears.c,58 :: 		
;d_gears.c,59 :: 		
	CALL	_dGear_canGearUp
	CP0.B	W0
	BRA NZ	L__dGear_up1417
	GOTO	L_dGear_up614
L__dGear_up1417:
;d_gears.c,60 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_d_currentGear), W0
	ADD.B	W1, [W0], [W0]
;d_gears.c,61 :: 		
L_dGear_up614:
;d_gears.c,62 :: 		
L_end_dGear_up:
	RETURN
; end of _dGear_up

_dGear_down:

;d_gears.c,64 :: 		
;d_gears.c,65 :: 		
	CALL	_dGear_canGearDown
	CP0.B	W0
	BRA NZ	L__dGear_down1419
	GOTO	L_dGear_down615
L__dGear_down1419:
;d_gears.c,66 :: 		
	MOV.B	#1, W1
	MOV	#lo_addr(_d_currentGear), W0
	SUBR.B	W1, [W0], [W0]
;d_gears.c,67 :: 		
L_dGear_down615:
;d_gears.c,68 :: 		
L_end_dGear_down:
	RETURN
; end of _dGear_down

_dGear_canGearUp:

;d_gears.c,70 :: 		
;d_gears.c,71 :: 		
	MOV	#lo_addr(_d_currentGear), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA GEU	L__dGear_canGearUp1421
	GOTO	L_dGear_canGearUp617
L__dGear_canGearUp1421:
	CALL	_dGear_isShiftingCheckBypassed
	CP0.B	W0
	BRA Z	L__dGear_canGearUp1422
	GOTO	L_dGear_canGearUp617
L__dGear_canGearUp1422:
	CLR	W1
	GOTO	L_dGear_canGearUp616
L_dGear_canGearUp617:
	MOV.B	#1, W0
	MOV.B	W0, W1
L_dGear_canGearUp616:
	MOV.B	W1, W0
;d_gears.c,72 :: 		
L_end_dGear_canGearUp:
	RETURN
; end of _dGear_canGearUp

_dGear_canGearDown:

;d_gears.c,74 :: 		
;d_gears.c,75 :: 		
	MOV	#lo_addr(_d_currentGear), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LEU	L__dGear_canGearDown1424
	GOTO	L_dGear_canGearDown619
L__dGear_canGearDown1424:
	CALL	_dGear_isShiftingCheckBypassed
	CP0.B	W0
	BRA Z	L__dGear_canGearDown1425
	GOTO	L_dGear_canGearDown619
L__dGear_canGearDown1425:
	CLR	W1
	GOTO	L_dGear_canGearDown618
L_dGear_canGearDown619:
	MOV.B	#1, W0
	MOV.B	W0, W1
L_dGear_canGearDown618:
	MOV.B	W1, W0
;d_gears.c,76 :: 		
L_end_dGear_canGearDown:
	RETURN
; end of _dGear_canGearDown

_dGear_isShiftingCheckBypassed:

;d_gears.c,78 :: 		
;d_gears.c,79 :: 		
	MOV	#lo_addr(_dGear_bypassShiftCheck), W0
	MOV.B	[W0], W0
;d_gears.c,80 :: 		
L_end_dGear_isShiftingCheckBypassed:
	RETURN
; end of _dGear_isShiftingCheckBypassed

_dGear_enableShiftCheck:

;d_gears.c,82 :: 		
;d_gears.c,83 :: 		
	MOV	#lo_addr(_dGear_bypassShiftCheck), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_gears.c,84 :: 		
L_end_dGear_enableShiftCheck:
	RETURN
; end of _dGear_enableShiftCheck

_dGear_disableShiftCheck:

;d_gears.c,86 :: 		
;d_gears.c,87 :: 		
	MOV	#lo_addr(_dGear_bypassShiftCheck), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_gears.c,88 :: 		
L_end_dGear_disableShiftCheck:
	RETURN
; end of _dGear_disableShiftCheck

_d_setGearMotorState:

;d_gears.c,90 :: 		
;d_gears.c,91 :: 		
	MOV	W10, _d_gearMotorState
;d_gears.c,92 :: 		
L_end_d_setGearMotorState:
	RETURN
; end of _d_setGearMotorState

_d_getGearMotorState:

;d_gears.c,94 :: 		
;d_gears.c,95 :: 		
	MOV	_d_gearMotorState, W0
;d_gears.c,96 :: 		
L_end_d_getGearMotorState:
	RETURN
; end of _d_getGearMotorState

_d_canSetGear:

;d_gears.c,98 :: 		
;d_gears.c,99 :: 		
	MOV	_d_gearMotorState, W0
	CP	W0, #0
	CLR.B	W0
	BRA NZ	L__d_canSetGear1432
	INC.B	W0
L__d_canSetGear1432:
;d_gears.c,100 :: 		
L_end_d_canSetGear:
	RETURN
; end of _d_canSetGear

_dRpm_set:

;d_rpm.c,9 :: 		
;d_rpm.c,10 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	W10, _dRpm
;d_rpm.c,11 :: 		
	CALL	_dRpm_getDisplayValue
	MOV	W0, W11
	MOV	W1, W12
	MOV.B	#3, W10
	CALL	_dd_Indicator_setFloatValue
;d_rpm.c,12 :: 		
L_end_dRpm_set:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dRpm_set

_dRpm_get:

;d_rpm.c,14 :: 		
;d_rpm.c,15 :: 		
	MOV	_dRpm, W0
;d_rpm.c,16 :: 		
L_end_dRpm_get:
	RETURN
; end of _dRpm_get

_dRpm_getDisplayValue:

;d_rpm.c,18 :: 		
;d_rpm.c,19 :: 		
	CALL	_dRpm_get
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
;d_rpm.c,20 :: 		
L_end_dRpm_getDisplayValue:
	RETURN
; end of _dRpm_getDisplayValue

_dRpm_canUpdateLedStripe:

;d_rpm.c,22 :: 		
;d_rpm.c,23 :: 		
	MOV	#lo_addr(_dRpm_ledStripeOutputEnable), W0
	MOV.B	[W0], W0
;d_rpm.c,24 :: 		
L_end_dRpm_canUpdateLedStripe:
	RETURN
; end of _dRpm_canUpdateLedStripe

_dRpm_disableLedStripeOutput:

;d_rpm.c,26 :: 		
;d_rpm.c,27 :: 		
	MOV	#lo_addr(_dRpm_ledStripeOutputEnable), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_rpm.c,28 :: 		
L_end_dRpm_disableLedStripeOutput:
	RETURN
; end of _dRpm_disableLedStripeOutput

_dRpm_enableLedStripeOutput:

;d_rpm.c,30 :: 		
;d_rpm.c,31 :: 		
	MOV	#lo_addr(_dRpm_ledStripeOutputEnable), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_rpm.c,32 :: 		
L_end_dRpm_enableLedStripeOutput:
	RETURN
; end of _dRpm_enableLedStripeOutput

_dRpm_updateLedStripe:

;d_rpm.c,87 :: 		
;d_rpm.c,89 :: 		
	PUSH	W10
	PUSH	W11
	MOV	_dRpm, W1
	MOV	#5000, W0
	CP	W1, W0
	BRA GTU	L__dRpm_updateLedStripe1440
	GOTO	L_dRpm_updateLedStripe620
L__dRpm_updateLedStripe1440:
;d_rpm.c,90 :: 		
	MOV	_dRpm, W1
	MOV	#5000, W0
	SUB	W1, W0, W1
	MOV	#750, W2
	REPEAT	#17
	DIV.U	W1, W2
; dLedStripeState start address is: 0 (W0)
;d_rpm.c,91 :: 		
; dLedStripeState end address is: 0 (W0)
	GOTO	L_dRpm_updateLedStripe621
L_dRpm_updateLedStripe620:
;d_rpm.c,92 :: 		
; dLedStripeState start address is: 0 (W0)
	CLR	W0
; dLedStripeState end address is: 0 (W0)
;d_rpm.c,93 :: 		
L_dRpm_updateLedStripe621:
;d_rpm.c,94 :: 		
; dLedStripeState start address is: 0 (W0)
	GOTO	L_dRpm_updateLedStripe622
; dLedStripeState end address is: 0 (W0)
;d_rpm.c,95 :: 		
L_dRpm_updateLedStripe624:
;d_rpm.c,96 :: 		
	CALL	_dLedStripe_clear
;d_rpm.c,97 :: 		
	GOTO	L_dRpm_updateLedStripe623
;d_rpm.c,98 :: 		
L_dRpm_updateLedStripe625:
;d_rpm.c,99 :: 		
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,100 :: 		
	MOV.B	#1, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,101 :: 		
	MOV.B	#2, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,102 :: 		
	MOV.B	#3, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,103 :: 		
	MOV.B	#4, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,104 :: 		
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,105 :: 		
	GOTO	L_dRpm_updateLedStripe623
;d_rpm.c,106 :: 		
L_dRpm_updateLedStripe626:
;d_rpm.c,107 :: 		
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,108 :: 		
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,109 :: 		
	MOV.B	#2, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,110 :: 		
	MOV.B	#3, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,111 :: 		
	MOV.B	#4, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,112 :: 		
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,113 :: 		
	GOTO	L_dRpm_updateLedStripe623
;d_rpm.c,114 :: 		
L_dRpm_updateLedStripe627:
;d_rpm.c,115 :: 		
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,116 :: 		
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,117 :: 		
	MOV.B	#2, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,118 :: 		
	MOV.B	#3, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,119 :: 		
	MOV.B	#4, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,120 :: 		
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,121 :: 		
	GOTO	L_dRpm_updateLedStripe623
;d_rpm.c,122 :: 		
L_dRpm_updateLedStripe628:
;d_rpm.c,123 :: 		
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,124 :: 		
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,125 :: 		
	MOV.B	#2, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,126 :: 		
	MOV.B	#3, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,127 :: 		
	MOV.B	#4, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,128 :: 		
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,129 :: 		
	GOTO	L_dRpm_updateLedStripe623
;d_rpm.c,130 :: 		
L_dRpm_updateLedStripe629:
;d_rpm.c,131 :: 		
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,132 :: 		
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,133 :: 		
	MOV.B	#2, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,134 :: 		
	MOV.B	#3, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,135 :: 		
	MOV.B	#4, W11
	MOV.B	#4, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,136 :: 		
	MOV.B	#5, W11
	CLR	W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,137 :: 		
	GOTO	L_dRpm_updateLedStripe623
;d_rpm.c,138 :: 		
L_dRpm_updateLedStripe630:
;d_rpm.c,139 :: 		
	CLR	W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,140 :: 		
	MOV.B	#1, W11
	MOV.B	#2, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,141 :: 		
	MOV.B	#2, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,142 :: 		
	MOV.B	#3, W11
	MOV.B	#1, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,143 :: 		
	MOV.B	#4, W11
	MOV.B	#4, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,144 :: 		
	MOV.B	#5, W11
	MOV.B	#4, W10
	CALL	_dLedStripe_setLedColorAtPosition
;d_rpm.c,145 :: 		
	GOTO	L_dRpm_updateLedStripe623
;d_rpm.c,146 :: 		
L_dRpm_updateLedStripe622:
; dLedStripeState start address is: 0 (W0)
	CP.B	W0, #0
	BRA NZ	L__dRpm_updateLedStripe1441
	GOTO	L_dRpm_updateLedStripe624
L__dRpm_updateLedStripe1441:
	CP.B	W0, #1
	BRA NZ	L__dRpm_updateLedStripe1442
	GOTO	L_dRpm_updateLedStripe625
L__dRpm_updateLedStripe1442:
	CP.B	W0, #2
	BRA NZ	L__dRpm_updateLedStripe1443
	GOTO	L_dRpm_updateLedStripe626
L__dRpm_updateLedStripe1443:
	CP.B	W0, #3
	BRA NZ	L__dRpm_updateLedStripe1444
	GOTO	L_dRpm_updateLedStripe627
L__dRpm_updateLedStripe1444:
	CP.B	W0, #4
	BRA NZ	L__dRpm_updateLedStripe1445
	GOTO	L_dRpm_updateLedStripe628
L__dRpm_updateLedStripe1445:
	CP.B	W0, #5
	BRA NZ	L__dRpm_updateLedStripe1446
	GOTO	L_dRpm_updateLedStripe629
L__dRpm_updateLedStripe1446:
	CP.B	W0, #6
	BRA NZ	L__dRpm_updateLedStripe1447
	GOTO	L_dRpm_updateLedStripe630
L__dRpm_updateLedStripe1447:
; dLedStripeState end address is: 0 (W0)
L_dRpm_updateLedStripe623:
;d_rpm.c,147 :: 		
L_end_dRpm_updateLedStripe:
	POP	W11
	POP	W10
	RETURN
; end of _dRpm_updateLedStripe

_dStart_switchOn:

;d_start.c,9 :: 		
;d_start.c,10 :: 		
	MOV	#lo_addr(_dStart_isSwitchOnFlag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_start.c,11 :: 		
L_end_dStart_switchOn:
	RETURN
; end of _dStart_switchOn

_dStart_switchOff:

;d_start.c,13 :: 		
;d_start.c,14 :: 		
	MOV	#lo_addr(_dStart_isSwitchOnFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_start.c,15 :: 		
L_end_dStart_switchOff:
	RETURN
; end of _dStart_switchOff

_dStart_isSwitchedOn:

;d_start.c,17 :: 		
;d_start.c,18 :: 		
	MOV	#lo_addr(_dStart_isSwitchOnFlag), W0
	MOV.B	[W0], W0
;d_start.c,19 :: 		
L_end_dStart_isSwitchedOn:
	RETURN
; end of _dStart_isSwitchedOn

_dStart_sendStartMessage:

;d_start.c,21 :: 		
;d_start.c,22 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#1, W12
	MOV	#1728, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_start.c,23 :: 		
L_end_dStart_sendStartMessage:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dStart_sendStartMessage

_dHardReset_init:

;d_hardreset.c,10 :: 		
;d_hardreset.c,14 :: 		
	PUSH	W10
	PUSH	W11
	CALL	_dHardReset_getCounter
	MOV	W0, _dHardReset_counter
;d_hardreset.c,15 :: 		
	MOV	W0, W11
	MOV.B	#10, W10
	CALL	_dd_Indicator_setIntValue
;d_hardreset.c,16 :: 		
L_end_dHardReset_init:
	POP	W11
	POP	W10
	RETURN
; end of _dHardReset_init

_dHardReset_reset:

;d_hardreset.c,18 :: 		
;d_hardreset.c,20 :: 		
	PUSH	W10
	CALL	_dHardReset_setFlag
;d_hardreset.c,21 :: 		
	MOV.B	#1, W10
	CALL	_dSignalLed_set
;d_hardreset.c,22 :: 		
	CLR	W10
	CALL	_dSignalLed_set
;d_hardreset.c,23 :: 		
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_hardreset.c,25 :: 		
	RESET
;d_hardreset.c,27 :: 		
L_end_dHardReset_reset:
	POP	W10
	RETURN
; end of _dHardReset_reset

_dHardReset_hasBeenReset:

;d_hardreset.c,29 :: 		
;d_hardreset.c,30 :: 		
	CLR.B	W0
	BTSC	RCONbits, #6
	INC.B	W0
;d_hardreset.c,31 :: 		
L_end_dHardReset_hasBeenReset:
	RETURN
; end of _dHardReset_hasBeenReset

_dHardReset_setFlag:

;d_hardreset.c,33 :: 		
;d_hardreset.c,34 :: 		
	PUSH	W10
	PUSH	W11
	CALL	_dHardReset_getCounter
	INC	W0
	MOV	W0, W11
	MOV	#64932, W10
	CALL	_EEPROM_writeInt
;d_hardreset.c,35 :: 		
L_end_dHardReset_setFlag:
	POP	W11
	POP	W10
	RETURN
; end of _dHardReset_setFlag

_dHardReset_unsetFlag:

;d_hardreset.c,37 :: 		
;d_hardreset.c,38 :: 		
	BCLR	RCONbits, #6
;d_hardreset.c,39 :: 		
L_end_dHardReset_unsetFlag:
	RETURN
; end of _dHardReset_unsetFlag

_dHardReset_getCounter:

;d_hardreset.c,41 :: 		
;d_hardreset.c,42 :: 		
	PUSH	W10
	MOV	#64932, W10
	CALL	_EEPROM_readInt
;d_hardreset.c,43 :: 		
;d_hardreset.c,42 :: 		
;d_hardreset.c,43 :: 		
L_end_dHardReset_getCounter:
	POP	W10
	RETURN
; end of _dHardReset_getCounter

_dRio_switchAcquisition:

;d_rio.c,10 :: 		
;d_rio.c,11 :: 		
	MOV	#lo_addr(_dRio_isAcquiring), W0
	CP0.B	[W0]
	BRA NZ	L__dRio_switchAcquisition1459
	GOTO	L_dRio_switchAcquisition631
L__dRio_switchAcquisition1459:
;d_rio.c,12 :: 		
	CALL	_dRio_stopAcquisition
;d_rio.c,13 :: 		
	GOTO	L_dRio_switchAcquisition632
L_dRio_switchAcquisition631:
;d_rio.c,14 :: 		
	CALL	_dRio_startAcquisition
;d_rio.c,15 :: 		
L_dRio_switchAcquisition632:
;d_rio.c,16 :: 		
L_end_dRio_switchAcquisition:
	RETURN
; end of _dRio_switchAcquisition

_dRio_startAcquisition:

;d_rio.c,18 :: 		
;d_rio.c,19 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	MOV	#lo_addr(?lstr47_DP9_AAC), W12
	MOV	#0, W10
	MOV	#16320, W11
	CALL	_dd_Dashboard_fireTimedMessage
;d_rio.c,20 :: 		
	MOV	#1, W12
	MOV	#1799, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_rio.c,21 :: 		
L_end_dRio_startAcquisition:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dRio_startAcquisition

_dRio_stopAcquisition:

;d_rio.c,23 :: 		
;d_rio.c,24 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	MOV	#lo_addr(?lstr48_DP9_AAC), W12
	MOV	#0, W10
	MOV	#16320, W11
	CALL	_dd_Dashboard_fireTimedMessage
;d_rio.c,25 :: 		
	MOV	#2, W12
	MOV	#1799, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_rio.c,26 :: 		
L_end_dRio_stopAcquisition:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dRio_stopAcquisition

_dRio_zeroAcquisition:

;d_rio.c,28 :: 		
;d_rio.c,29 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	MOV	#lo_addr(?lstr49_DP9_AAC), W12
	MOV	#0, W10
	MOV	#16320, W11
	CALL	_dd_Dashboard_fireTimedMessage
;d_rio.c,30 :: 		
	MOV	#3, W12
	MOV	#1799, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_rio.c,31 :: 		
L_end_dRio_zeroAcquisition:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dRio_zeroAcquisition

_dRio_heartBeat:

;d_rio.c,33 :: 		
;d_rio.c,34 :: 		
	PUSH	W10
	PUSH	W11
	MOV	#2000, W0
	MOV	W0, _dRio_isAliveCounter
;d_rio.c,35 :: 		
	MOV.B	#1, W11
	MOV.B	#6, W10
	CALL	_dd_Indicator_setBoolValue
;d_rio.c,36 :: 		
	MOV	#lo_addr(_dRio_isAcquiring), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_rio.c,37 :: 		
L_end_dRio_heartBeat:
	POP	W11
	POP	W10
	RETURN
; end of _dRio_heartBeat

_dRio_die:

;d_rio.c,39 :: 		
;d_rio.c,40 :: 		
	PUSH	W10
	PUSH	W11
	CLR	W11
	MOV.B	#6, W10
	CALL	_dd_Indicator_setBoolValue
;d_rio.c,41 :: 		
	MOV	#lo_addr(_dRio_isAcquiring), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_rio.c,42 :: 		
L_end_dRio_die:
	POP	W11
	POP	W10
	RETURN
; end of _dRio_die

_dRio_tick:

;d_rio.c,44 :: 		
;d_rio.c,45 :: 		
	MOV	_dRio_isAliveCounter, W0
	CP	W0, #0
	BRA GTU	L__dRio_tick1466
	GOTO	L_dRio_tick633
L__dRio_tick1466:
;d_rio.c,46 :: 		
	MOV	#1, W1
	MOV	#lo_addr(_dRio_isAliveCounter), W0
	SUBR	W1, [W0], [W0]
;d_rio.c,47 :: 		
	MOV	_dRio_isAliveCounter, W0
	CP	W0, #0
	BRA Z	L__dRio_tick1467
	GOTO	L_dRio_tick634
L__dRio_tick1467:
;d_rio.c,48 :: 		
	CALL	_dRio_die
;d_rio.c,49 :: 		
L_dRio_tick634:
;d_rio.c,50 :: 		
L_dRio_tick633:
;d_rio.c,51 :: 		
L_end_dRio_tick:
	RETURN
; end of _dRio_tick

_dAcc_init:

;d_acceleration.c,7 :: 		
;d_acceleration.c,8 :: 		
	MOV	#lo_addr(_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,9 :: 		
	MOV	#lo_addr(_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,15 :: 		
L_end_dAcc_init:
	RETURN
; end of _dAcc_init

_dAcc_startAutoAcceleration:

;d_acceleration.c,82 :: 		
;d_acceleration.c,83 :: 		
	MOV	#lo_addr(_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_startAutoAcceleration1470
	GOTO	L_dAcc_startAutoAcceleration635
L__dAcc_startAutoAcceleration1470:
;d_acceleration.c,84 :: 		
	MOV	#lo_addr(_dAcc_autoAcceleration), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,85 :: 		
	MOV	#lo_addr(_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,87 :: 		
L_dAcc_startAutoAcceleration635:
;d_acceleration.c,88 :: 		
L_end_dAcc_startAutoAcceleration:
	RETURN
; end of _dAcc_startAutoAcceleration

_dAcc_startClutchRelease:

;d_acceleration.c,90 :: 		
;d_acceleration.c,91 :: 		
	MOV	#lo_addr(_dAcc_releasingClutch), W0
	CP0.B	[W0]
	BRA Z	L__dAcc_startClutchRelease1472
	GOTO	L_dAcc_startClutchRelease636
L__dAcc_startClutchRelease1472:
;d_acceleration.c,92 :: 		
	MOV	#lo_addr(_dAcc_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_acceleration.c,94 :: 		
L_dAcc_startClutchRelease636:
;d_acceleration.c,96 :: 		
L_end_dAcc_startClutchRelease:
	RETURN
; end of _dAcc_startClutchRelease

_dAcc_stopAutoAcceleration:

;d_acceleration.c,98 :: 		
;d_acceleration.c,99 :: 		
	MOV	#lo_addr(_dAcc_autoAcceleration), W0
	CP0.B	[W0]
	BRA NZ	L__dAcc_stopAutoAcceleration1474
	GOTO	L_dAcc_stopAutoAcceleration637
L__dAcc_stopAutoAcceleration1474:
;d_acceleration.c,100 :: 		
	MOV	#lo_addr(_dAcc_autoAcceleration), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,101 :: 		
	MOV	#lo_addr(_dAcc_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_acceleration.c,103 :: 		
L_dAcc_stopAutoAcceleration637:
;d_acceleration.c,104 :: 		
L_end_dAcc_stopAutoAcceleration:
	RETURN
; end of _dAcc_stopAutoAcceleration

_dAcc_isAutoAccelerationActive:

;d_acceleration.c,106 :: 		
;d_acceleration.c,107 :: 		
	MOV	#lo_addr(_dAcc_autoAcceleration), W0
	MOV.B	[W0], W0
;d_acceleration.c,108 :: 		
L_end_dAcc_isAutoAccelerationActive:
	RETURN
; end of _dAcc_isAutoAccelerationActive

_dAcc_isReleasingClutch:

;d_acceleration.c,110 :: 		
;d_acceleration.c,111 :: 		
	MOV	#lo_addr(_dAcc_releasingClutch), W0
	MOV.B	[W0], W0
;d_acceleration.c,112 :: 		
L_end_dAcc_isReleasingClutch:
	RETURN
; end of _dAcc_isReleasingClutch

_dWarnings_init:

;d_warnings.c,8 :: 		
;d_warnings.c,10 :: 		
; ii start address is: 4 (W2)
	CLR	W2
; ii end address is: 4 (W2)
L_dWarnings_init638:
; ii start address is: 4 (W2)
	CP	W2, #3
	BRA LTU	L__dWarnings_init1478
	GOTO	L_dWarnings_init639
L__dWarnings_init1478:
;d_warnings.c,11 :: 		
	SL	W2, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV	W0, [W1]
;d_warnings.c,10 :: 		
	INC	W2
;d_warnings.c,12 :: 		
; ii end address is: 4 (W2)
	GOTO	L_dWarnings_init638
L_dWarnings_init639:
;d_warnings.c,13 :: 		
L_end_dWarnings_init:
	RETURN
; end of _dWarnings_init

_dWarinings_check:
	LNK	#4

;d_warnings.c,15 :: 		
;d_warnings.c,17 :: 		
	PUSH	W10
; ii start address is: 8 (W4)
	CLR	W4
; ii end address is: 8 (W4)
L_dWarinings_check641:
; ii start address is: 8 (W4)
	CP	W4, #3
	BRA LTU	L__dWarinings_check1480
	GOTO	L_dWarinings_check642
L__dWarinings_check1480:
;d_warnings.c,18 :: 		
	MOV	#lo_addr(_WARNINGS_LIST), W0
	ADD	W0, W4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	PUSH	W4
	MOV.B	[W1], W10
	CALL	_dd_Dashboard_getIndicatorIndex
	POP	W4
; indicatorsIndex start address is: 10 (W5)
	ZE	W0, W5
;d_warnings.c,19 :: 		
	MOV	#30, W0
	MUL.UU	W0, W5, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__dWarinings_check1481
	GOTO	L_dWarinings_check644
L__dWarinings_check1481:
;d_warnings.c,20 :: 		
	MOV	#30, W0
	MUL.UU	W0, W5, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #22, W0
	MOV	[W0], W2
	MOV	#lo_addr(_WARNINGS_LIMIT), W0
	ADD	W0, W4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	CP	W2, W0
	BRA GT	L__dWarinings_check1482
	GOTO	L_dWarinings_check645
L__dWarinings_check1482:
; indicatorsIndex end address is: 10 (W5)
;d_warnings.c,21 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA Z	L__dWarinings_check1483
	GOTO	L_dWarinings_check646
L__dWarinings_check1483:
;d_warnings.c,22 :: 		
	PUSH	W4
	MOV	W4, W10
	CALL	_dWarnings_setParameter
	POP	W4
;d_warnings.c,23 :: 		
	GOTO	L_dWarinings_check647
L_dWarinings_check646:
;d_warnings.c,25 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	MOV	[W1], W0
	INC	W0
	MOV	W0, [W1]
;d_warnings.c,26 :: 		
L_dWarinings_check647:
;d_warnings.c,27 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #10
	BRA GEU	L__dWarinings_check1484
	GOTO	L_dWarinings_check648
L__dWarinings_check1484:
;d_warnings.c,28 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV	W0, [W1]
;d_warnings.c,29 :: 		
L_dWarinings_check648:
;d_warnings.c,30 :: 		
	GOTO	L_dWarinings_check649
L_dWarinings_check645:
;d_warnings.c,31 :: 		
; indicatorsIndex start address is: 10 (W5)
	MOV	#30, W0
	MUL.UU	W0, W5, W2
; indicatorsIndex end address is: 10 (W5)
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #22, W0
	MOV	[W0], W2
	MOV	#lo_addr(_WARNINGS_LIMIT), W0
	ADD	W0, W4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W0
	CP	W2, W0
	BRA LE	L__dWarinings_check1485
	GOTO	L_dWarinings_check650
L__dWarinings_check1485:
;d_warnings.c,32 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #1
	BRA GEU	L__dWarinings_check1486
	GOTO	L_dWarinings_check651
L__dWarinings_check1486:
;d_warnings.c,33 :: 		
	MOV	W4, W10
	CALL	_dWarnings_unsetParameter
;d_warnings.c,34 :: 		
L_dWarinings_check651:
;d_warnings.c,35 :: 		
L_dWarinings_check650:
L_dWarinings_check649:
;d_warnings.c,36 :: 		
	GOTO	L_dWarinings_check652
L_dWarinings_check644:
;d_warnings.c,37 :: 		
; indicatorsIndex start address is: 10 (W5)
	MOV	#30, W0
	MUL.UU	W0, W5, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #4, W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__dWarinings_check1487
	GOTO	L_dWarinings_check653
L__dWarinings_check1487:
;d_warnings.c,38 :: 		
	MOV	#lo_addr(_WARNINGS_LIST), W0
	ADD	W0, W4, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	CP.B	W0, #2
	BRA Z	L__dWarinings_check1488
	GOTO	L_dWarinings_check654
L__dWarinings_check1488:
;d_warnings.c,39 :: 		
	MOV	#30, W0
	MUL.UU	W0, W5, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #24, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#lo_addr(_WARNINGS_LIMIT), W0
	ADD	W0, W4, W2
	PUSH.D	W4
	ZE	[W2], W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LE	L__dWarinings_check1489
	INC.B	W0
L__dWarinings_check1489:
	POP.D	W4
	CP0.B	W0
	BRA NZ	L__dWarinings_check1490
	GOTO	L_dWarinings_check655
L__dWarinings_check1490:
; indicatorsIndex end address is: 10 (W5)
;d_warnings.c,40 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA Z	L__dWarinings_check1491
	GOTO	L_dWarinings_check656
L__dWarinings_check1491:
;d_warnings.c,41 :: 		
	PUSH	W4
	MOV	W4, W10
	CALL	_dWarnings_setParameter
	POP	W4
;d_warnings.c,42 :: 		
	GOTO	L_dWarinings_check657
L_dWarinings_check656:
;d_warnings.c,44 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	MOV	[W1], W0
	INC	W0
	MOV	W0, [W1]
;d_warnings.c,45 :: 		
L_dWarinings_check657:
;d_warnings.c,46 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #10
	BRA GEU	L__dWarinings_check1492
	GOTO	L_dWarinings_check658
L__dWarinings_check1492:
;d_warnings.c,47 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV	W0, [W1]
;d_warnings.c,48 :: 		
L_dWarinings_check658:
;d_warnings.c,49 :: 		
	GOTO	L_dWarinings_check659
L_dWarinings_check655:
;d_warnings.c,50 :: 		
; indicatorsIndex start address is: 10 (W5)
	MOV	#30, W0
	MUL.UU	W0, W5, W2
; indicatorsIndex end address is: 10 (W5)
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #24, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#lo_addr(_WARNINGS_LIMIT), W0
	ADD	W0, W4, W2
	PUSH	W4
	ZE	[W2], W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GT	L__dWarinings_check1493
	INC.B	W0
L__dWarinings_check1493:
	POP	W4
	CP0.B	W0
	BRA NZ	L__dWarinings_check1494
	GOTO	L_dWarinings_check660
L__dWarinings_check1494:
;d_warnings.c,51 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #1
	BRA GEU	L__dWarinings_check1495
	GOTO	L_dWarinings_check661
L__dWarinings_check1495:
;d_warnings.c,52 :: 		
	MOV	W4, W10
	CALL	_dWarnings_unsetParameter
;d_warnings.c,53 :: 		
L_dWarinings_check661:
;d_warnings.c,54 :: 		
L_dWarinings_check660:
L_dWarinings_check659:
;d_warnings.c,55 :: 		
	GOTO	L_dWarinings_check662
L_dWarinings_check654:
;d_warnings.c,56 :: 		
; indicatorsIndex start address is: 10 (W5)
	MOV	#30, W0
	MUL.UU	W0, W5, W2
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #24, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#lo_addr(_WARNINGS_LIMIT), W0
	ADD	W0, W4, W2
	PUSH.D	W4
	ZE	[W2], W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR.B	W0
	BRA GE	L__dWarinings_check1496
	INC.B	W0
L__dWarinings_check1496:
	POP.D	W4
	CP0.B	W0
	BRA NZ	L__dWarinings_check1497
	GOTO	L_dWarinings_check663
L__dWarinings_check1497:
; indicatorsIndex end address is: 10 (W5)
;d_warnings.c,57 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #0
	BRA Z	L__dWarinings_check1498
	GOTO	L_dWarinings_check664
L__dWarinings_check1498:
;d_warnings.c,58 :: 		
	PUSH	W4
	MOV	W4, W10
	CALL	_dWarnings_setParameter
	POP	W4
;d_warnings.c,59 :: 		
	GOTO	L_dWarinings_check665
L_dWarinings_check664:
;d_warnings.c,61 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	MOV	[W1], W0
	INC	W0
	MOV	W0, [W1]
;d_warnings.c,62 :: 		
L_dWarinings_check665:
;d_warnings.c,63 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #10
	BRA GEU	L__dWarinings_check1499
	GOTO	L_dWarinings_check666
L__dWarinings_check1499:
;d_warnings.c,64 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV	W0, [W1]
;d_warnings.c,65 :: 		
L_dWarinings_check666:
;d_warnings.c,66 :: 		
	GOTO	L_dWarinings_check667
L_dWarinings_check663:
;d_warnings.c,67 :: 		
; indicatorsIndex start address is: 10 (W5)
	MOV	#30, W0
	MUL.UU	W0, W5, W2
; indicatorsIndex end address is: 10 (W5)
	MOV	#lo_addr(_dd_indicators), W0
	ADD	W0, W2, W0
	ADD	W0, #24, W2
	MOV.D	[W2], W0
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#lo_addr(_WARNINGS_LIMIT), W0
	ADD	W0, W4, W2
	PUSH	W4
	ZE	[W2], W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR.B	W0
	BRA LT	L__dWarinings_check1500
	INC.B	W0
L__dWarinings_check1500:
	POP	W4
	CP0.B	W0
	BRA NZ	L__dWarinings_check1501
	GOTO	L_dWarinings_check668
L__dWarinings_check1501:
;d_warnings.c,68 :: 		
	SL	W4, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CP	W0, #1
	BRA GEU	L__dWarinings_check1502
	GOTO	L_dWarinings_check669
L__dWarinings_check1502:
;d_warnings.c,69 :: 		
	MOV	W4, W10
	CALL	_dWarnings_unsetParameter
;d_warnings.c,70 :: 		
L_dWarinings_check669:
;d_warnings.c,71 :: 		
L_dWarinings_check668:
L_dWarinings_check667:
L_dWarinings_check662:
;d_warnings.c,72 :: 		
L_dWarinings_check653:
L_dWarinings_check652:
;d_warnings.c,17 :: 		
	INC	W4
;d_warnings.c,73 :: 		
; ii end address is: 8 (W4)
	GOTO	L_dWarinings_check641
L_dWarinings_check642:
;d_warnings.c,74 :: 		
L_end_dWarinings_check:
	POP	W10
	ULNK
	RETURN
; end of _dWarinings_check

_dWarnings_flash:

;d_warnings.c,76 :: 		
;d_warnings.c,77 :: 		
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_Buzzer_bip
;d_warnings.c,78 :: 		
	SL	W10, #1, W1
	MOV	#lo_addr(_LIMITS_DESCRIPTIONS), W0
	ADD	W0, W1, W0
	MOV.B	#1, W13
	MOV	[W0], W12
	MOV	#13107, W10
	MOV	#16179, W11
	CALL	_dd_Dashboard_fireTimedMessage
;d_warnings.c,79 :: 		
L_end_dWarnings_flash:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dWarnings_flash

_dWarnings_setParameter:

;d_warnings.c,81 :: 		
;d_warnings.c,82 :: 		
	SL	W10, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	MOV	#1, W0
	MOV	W0, [W1]
;d_warnings.c,83 :: 		
	PUSH	W10
	MOV.B	#1, W10
	CALL	_dSignalLed_set
	POP	W10
;d_warnings.c,84 :: 		
	CALL	_dWarnings_flash
;d_warnings.c,85 :: 		
L_end_dWarnings_setParameter:
	RETURN
; end of _dWarnings_setParameter

_dWarnings_unsetParameter:

;d_warnings.c,87 :: 		
;d_warnings.c,88 :: 		
; or start address is: 4 (W2)
	CLR	W2
;d_warnings.c,89 :: 		
	SL	W10, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV	W0, [W1]
;d_warnings.c,90 :: 		
; nn start address is: 0 (W0)
	CLR	W0
; or end address is: 4 (W2)
; nn end address is: 0 (W0)
	MOV	W2, W3
	MOV	W0, W2
L_dWarnings_unsetParameter670:
; nn start address is: 4 (W2)
; or start address is: 6 (W3)
	CP	W2, #3
	BRA LT	L__dWarnings_unsetParameter1506
	GOTO	L_dWarnings_unsetParameter671
L__dWarnings_unsetParameter1506:
;d_warnings.c,91 :: 		
	SL	W2, #1, W1
	MOV	#lo_addr(_WARNINGS_FLAG), W0
	ADD	W0, W1, W0
	ADD	W3, [W0], W3
;d_warnings.c,90 :: 		
	INC	W2
;d_warnings.c,92 :: 		
; nn end address is: 4 (W2)
	GOTO	L_dWarnings_unsetParameter670
L_dWarnings_unsetParameter671:
;d_warnings.c,93 :: 		
	CP	W3, #0
	BRA Z	L__dWarnings_unsetParameter1507
	GOTO	L_dWarnings_unsetParameter673
L__dWarnings_unsetParameter1507:
; or end address is: 6 (W3)
;d_warnings.c,94 :: 		
	PUSH	W10
	MOV.B	#1, W10
	CALL	_dSignalLed_unset
	POP	W10
;d_warnings.c,95 :: 		
L_dWarnings_unsetParameter673:
;d_warnings.c,96 :: 		
L_end_dWarnings_unsetParameter:
	RETURN
; end of _dWarnings_unsetParameter

_init:

;DP9_AAC.c,61 :: 		void init(void) {
;DP9_AAC.c,62 :: 		delay_ms(100);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#11, W8
	MOV	#11309, W7
L_init674:
	DEC	W7
	BRA NZ	L_init674
	DEC	W8
	BRA NZ	L_init674
;DP9_AAC.c,63 :: 		setAllPinAsDigital();
	CALL	_setAllPinAsDigital
;DP9_AAC.c,66 :: 		setTimer(TIMER2_DEVICE, 0.001);
	MOV	#4719, W11
	MOV	#14979, W12
	MOV.B	#2, W10
	CALL	_setTimer
;DP9_AAC.c,67 :: 		setInterruptPriority(TIMER2_DEVICE, LOW_PRIORITY);
	MOV.B	#5, W11
	MOV.B	#2, W10
	CALL	_setInterruptPriority
;DP9_AAC.c,68 :: 		delay_ms(200);
	MOV	#21, W8
	MOV	#22619, W7
L_init676:
	DEC	W7
	BRA NZ	L_init676
	DEC	W8
	BRA NZ	L_init676
;DP9_AAC.c,69 :: 		dd_GraphicController_init();
	CALL	_dd_GraphicController_init
;DP9_AAC.c,70 :: 		delay_ms(100);
	MOV	#11, W8
	MOV	#11309, W7
L_init678:
	DEC	W7
	BRA NZ	L_init678
	DEC	W8
	BRA NZ	L_init678
;DP9_AAC.c,72 :: 		Buttons_init();
	CALL	_Buttons_init
;DP9_AAC.c,73 :: 		Buzzer_init();
	CALL	_Buzzer_init
;DP9_AAC.c,74 :: 		dPaddle_init();
	CALL	_dPaddle_init
;DP9_AAC.c,75 :: 		dLedStripe_init();
	CALL	_dLedStripe_init
;DP9_AAC.c,76 :: 		dSignalLed_init();
	CALL	_dSignalLed_init
;DP9_AAC.c,77 :: 		dRpm_set(0);
	CLR	W10
	CALL	_dRpm_set
;DP9_AAC.c,78 :: 		dRpm_disableLedStripeOutput();
	CALL	_dRpm_disableLedStripeOutput
;DP9_AAC.c,80 :: 		dHardReset_init();
	CALL	_dHardReset_init
;DP9_AAC.c,81 :: 		Can_init();
	CALL	_Can_init
;DP9_AAC.c,82 :: 		dAcc_init();
	CALL	_dAcc_init
;DP9_AAC.c,83 :: 		dEbb_init();              //Calibrate to zero the ebb
	CALL	_dEbb_init
;DP9_AAC.c,84 :: 		dWarnings_init();
	CALL	_dWarnings_init
;DP9_AAC.c,86 :: 		dRpm_enableLedStripeOutput();
	CALL	_dRpm_enableLedStripeOutput
;DP9_AAC.c,87 :: 		dLedStripe_clear();
	CALL	_dLedStripe_clear
;DP9_AAC.c,88 :: 		}
L_end_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _init

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;DP9_AAC.c,90 :: 		void main() {
;DP9_AAC.c,93 :: 		if (!dHardReset_hasBeenReset()) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA Z	L__main1510
	GOTO	L_main680
L__main1510:
;DP9_AAC.c,94 :: 		Delay_ms(250); //Secure power on startup
	MOV	#26, W8
	MOV	#28274, W7
L_main681:
	DEC	W7
	BRA NZ	L_main681
	DEC	W8
	BRA NZ	L_main681
;DP9_AAC.c,95 :: 		}
L_main680:
;DP9_AAC.c,96 :: 		init();
	CALL	_init
;DP9_AAC.c,103 :: 		if (dHardReset_hasBeenReset()) {
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA NZ	L__main1511
	GOTO	L_main683
L__main1511:
;DP9_AAC.c,104 :: 		dd_Dashboard_fireTimedMessage(0.7, "RESET OK", MESSAGE_TYPE_MESSAGE);
	CLR	W13
	MOV	#lo_addr(?lstr53_DP9_AAC), W12
	MOV	#13107, W10
	MOV	#16179, W11
	CALL	_dd_Dashboard_fireTimedMessage
;DP9_AAC.c,105 :: 		dHardReset_unsetFlag();
	CALL	_dHardReset_unsetFlag
;DP9_AAC.c,106 :: 		} else {
	GOTO	L_main684
L_main683:
;DP9_AAC.c,107 :: 		dd_lastPrintedGearLetter = GEAR_INIT_VALUE; //Avoid N graphical glitch
	MOV	#lo_addr(_dd_lastPrintedGearLetter), W1
	MOV.B	#54, W0
	MOV.B	W0, [W1]
;DP9_AAC.c,110 :: 		}
L_main684:
;DP9_AAC.c,112 :: 		while (1);
L_main685:
	GOTO	L_main685
;DP9_AAC.c,113 :: 		}
L_end_main:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main

_timer1_interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;DP9_AAC.c,116 :: 		onTimer1Interrupt{
;DP9_AAC.c,117 :: 		dd_GraphicController_onTimerInterrupt();
	CALL	_dd_GraphicController_onTimerInterrupt
;DP9_AAC.c,118 :: 		}
L_end_timer1_interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _timer1_interrupt

_timer2_interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;DP9_AAC.c,121 :: 		onTimer2Interrupt{
;DP9_AAC.c,122 :: 		clearTimer2();
	PUSH	W10
	BCLR	IFS0bits, #6
;DP9_AAC.c,123 :: 		Buttons_tick();
	CALL	_Buttons_tick
;DP9_AAC.c,124 :: 		dRio_tick();
	CALL	_dRio_tick
;DP9_AAC.c,125 :: 		dEfiSense_tick();
	CALL	_dEfiSense_tick
;DP9_AAC.c,126 :: 		dLedStripe_updateFrame();
	CALL	_dLedStripe_updateFrame
;DP9_AAC.c,127 :: 		timer2_counter0 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter0), W0
	ADD	W1, [W0], [W0]
;DP9_AAC.c,128 :: 		timer2_counter1 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter1), W0
	ADD	W1, [W0], [W0]
;DP9_AAC.c,129 :: 		timer2_counter2 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter2), W0
	ADD	W1, [W0], [W0]
;DP9_AAC.c,130 :: 		timer2_counter3 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter3), W0
	ADD	W1, [W0], [W0]
;DP9_AAC.c,132 :: 		timer2_counter5 += 1;
	MOV	#1, W1
	MOV	#lo_addr(_timer2_counter5), W0
	ADD	W1, [W0], [W0]
;DP9_AAC.c,134 :: 		if (timer2_counter0 >= 5) {
	MOV	_timer2_counter0, W0
	CP	W0, #5
	BRA GE	L__timer2_interrupt1515
	GOTO	L_timer2_interrupt687
L__timer2_interrupt1515:
;DP9_AAC.c,135 :: 		dPaddle_readSample();
	CALL	_dPaddle_readSample
;DP9_AAC.c,136 :: 		timer2_counter0 = 0;
	CLR	W0
	MOV	W0, _timer2_counter0
;DP9_AAC.c,137 :: 		}
L_timer2_interrupt687:
;DP9_AAC.c,138 :: 		if (timer2_counter1 >= 25) {
	MOV	_timer2_counter1, W0
	CP	W0, #25
	BRA GE	L__timer2_interrupt1516
	GOTO	L_timer2_interrupt688
L__timer2_interrupt1516:
;DP9_AAC.c,139 :: 		if (dStart_isSwitchedOn()) {
	CALL	_dStart_isSwitchedOn
	CP0.B	W0
	BRA NZ	L__timer2_interrupt1517
	GOTO	L_timer2_interrupt689
L__timer2_interrupt1517:
;DP9_AAC.c,140 :: 		dStart_sendStartMessage();
	CALL	_dStart_sendStartMessage
;DP9_AAC.c,141 :: 		}
L_timer2_interrupt689:
;DP9_AAC.c,143 :: 		timer2_counter1 = 0;
	CLR	W0
	MOV	W0, _timer2_counter1
;DP9_AAC.c,144 :: 		}
L_timer2_interrupt688:
;DP9_AAC.c,145 :: 		if (timer2_counter3 >= 100) {
	MOV	#100, W1
	MOV	#lo_addr(_timer2_counter3), W0
	CP	W1, [W0]
	BRA LE	L__timer2_interrupt1518
	GOTO	L_timer2_interrupt690
L__timer2_interrupt1518:
;DP9_AAC.c,146 :: 		if (dRpm_canUpdateLedStripe()) {
	CALL	_dRpm_canUpdateLedStripe
	CP0.B	W0
	BRA NZ	L__timer2_interrupt1519
	GOTO	L_timer2_interrupt691
L__timer2_interrupt1519:
;DP9_AAC.c,147 :: 		dRpm_updateLedStripe();
	CALL	_dRpm_updateLedStripe
;DP9_AAC.c,148 :: 		}
L_timer2_interrupt691:
;DP9_AAC.c,149 :: 		dEbb_tick();
	CALL	_dEbb_tick
;DP9_AAC.c,151 :: 		timer2_counter3 = 0;
	CLR	W0
	MOV	W0, _timer2_counter3
;DP9_AAC.c,152 :: 		}
L_timer2_interrupt690:
;DP9_AAC.c,154 :: 		if (timer2_counter2 >= 10) {
	MOV	_timer2_counter2, W0
	CP	W0, #10
	BRA GE	L__timer2_interrupt1520
	GOTO	L_timer2_interrupt692
L__timer2_interrupt1520:
;DP9_AAC.c,155 :: 		dClutch_set(dPaddle_getValue());
	CALL	_dPaddle_getValue
	MOV.B	W0, W10
	CALL	_dClutch_set
;DP9_AAC.c,156 :: 		dClutch_send();
	CALL	_dClutch_send
;DP9_AAC.c,157 :: 		timer2_counter2 = 0;
	CLR	W0
	MOV	W0, _timer2_counter2
;DP9_AAC.c,158 :: 		}//*/
L_timer2_interrupt692:
;DP9_AAC.c,161 :: 		if (timer2_counter5 >= 1000) {
	MOV	_timer2_counter5, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA GE	L__timer2_interrupt1521
	GOTO	L_timer2_interrupt693
L__timer2_interrupt1521:
;DP9_AAC.c,162 :: 		dSignalLed_switch(DSIGNAL_LED_2);
	MOV.B	#2, W10
	CALL	_dSignalLed_switch
;DP9_AAC.c,164 :: 		timer2_counter5 = 0;
	CLR	W0
	MOV	W0, _timer2_counter5
;DP9_AAC.c,165 :: 		}//*/
L_timer2_interrupt693:
;DP9_AAC.c,166 :: 		}
L_end_timer2_interrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _timer2_interrupt

_CAN_Interrupt:
	LNK	#26
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;DP9_AAC.c,168 :: 		onCanInterrupt{
;DP9_AAC.c,172 :: 		unsigned int dataLen = 0, flags = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV	W0, [W14+20]
	MOV	#0, W0
	MOV	W0, [W14+22]
;DP9_AAC.c,175 :: 		IEC1BITS.C1IE = 0;
	BCLR	IEC1bits, #11
;DP9_AAC.c,176 :: 		Can_clearInterrupt();
	CALL	_Can_clearInterrupt
;DP9_AAC.c,177 :: 		if (0 == Can_read(&id, dataBuffer, &dataLen, &flags))
	ADD	W14, #22, W3
	ADD	W14, #20, W2
	ADD	W14, #12, W1
	ADD	W14, #8, W0
	MOV	W3, W13
	MOV	W2, W12
	MOV	W1, W11
	MOV	W0, W10
	CALL	_Can_read
	CP	W0, #0
	BRA Z	L__CAN_Interrupt1523
	GOTO	L_CAN_Interrupt694
L__CAN_Interrupt1523:
;DP9_AAC.c,178 :: 		Buzzer_bip();
	CALL	_Buzzer_bip
L_CAN_Interrupt694:
;DP9_AAC.c,186 :: 		if (dataLen >= 2) {
	MOV	[W14+20], W0
	CP	W0, #2
	BRA GEU	L__CAN_Interrupt1524
	GOTO	L_CAN_Interrupt695
L__CAN_Interrupt1524:
;DP9_AAC.c,187 :: 		firstInt = (unsigned int) ((dataBuffer[0] << 8) | (dataBuffer[1] & 0xFF));
	ADD	W14, #12, W1
	MOV.B	[W1], W0
	ZE	W0, W0
	SL	W0, #8, W2
	ADD	W1, #1, W0
	ZE	[W0], W1
	MOV	#255, W0
	AND	W1, W0, W1
	ADD	W14, #0, W0
	IOR	W2, W1, [W0]
;DP9_AAC.c,188 :: 		}
L_CAN_Interrupt695:
;DP9_AAC.c,189 :: 		if (dataLen >= 4) {
	MOV	[W14+20], W0
	CP	W0, #4
	BRA GEU	L__CAN_Interrupt1525
	GOTO	L_CAN_Interrupt696
L__CAN_Interrupt1525:
;DP9_AAC.c,190 :: 		secondInt = (unsigned int) ((dataBuffer[2] << 8) | (dataBuffer[3] & 0xFF));
	ADD	W14, #12, W1
	ADD	W1, #2, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #8, W2
	ADD	W1, #3, W0
	ZE	[W0], W1
	MOV	#255, W0
	AND	W1, W0, W1
	ADD	W14, #2, W0
	IOR	W2, W1, [W0]
;DP9_AAC.c,191 :: 		}
L_CAN_Interrupt696:
;DP9_AAC.c,192 :: 		if (dataLen >= 6) {
	MOV	[W14+20], W0
	CP	W0, #6
	BRA GEU	L__CAN_Interrupt1526
	GOTO	L_CAN_Interrupt697
L__CAN_Interrupt1526:
;DP9_AAC.c,193 :: 		thirdInt = (unsigned int) ((dataBuffer[4] << 8) | (dataBuffer[5] & 0xFF));
	ADD	W14, #12, W1
	ADD	W1, #4, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #8, W2
	ADD	W1, #5, W0
	ZE	[W0], W1
	MOV	#255, W0
	AND	W1, W0, W1
	ADD	W14, #4, W0
	IOR	W2, W1, [W0]
;DP9_AAC.c,194 :: 		}
L_CAN_Interrupt697:
;DP9_AAC.c,195 :: 		if (dataLen >= 8) {
	MOV	[W14+20], W0
	CP	W0, #8
	BRA GEU	L__CAN_Interrupt1527
	GOTO	L_CAN_Interrupt698
L__CAN_Interrupt1527:
;DP9_AAC.c,196 :: 		fourthInt = (unsigned int) ((dataBuffer[6] << 8) | (dataBuffer[7] & 0xFF));
	ADD	W14, #12, W1
	ADD	W1, #6, W0
	MOV.B	[W0], W0
	ZE	W0, W0
	SL	W0, #8, W2
	ADD	W1, #7, W0
	ZE	[W0], W1
	MOV	#255, W0
	AND	W1, W0, W1
	ADD	W14, #6, W0
	IOR	W2, W1, [W0]
;DP9_AAC.c,197 :: 		}
L_CAN_Interrupt698:
;DP9_AAC.c,199 :: 		switch (id) {
	GOTO	L_CAN_Interrupt699
;DP9_AAC.c,200 :: 		case SW_RIO_GEAR_BRK_STEER_ID:
L_CAN_Interrupt701:
;DP9_AAC.c,201 :: 		dd_Indicator_setIntValue(BRK_P_FRONT, firstInt);
	MOV	[W14+0], W11
	MOV.B	#18, W10
	CALL	_dd_Indicator_setIntValue
;DP9_AAC.c,202 :: 		dd_Indicator_setIntValue(BRK_P_REAR, secondInt);
	MOV	[W14+2], W11
	MOV.B	#19, W10
	CALL	_dd_Indicator_setIntValue
;DP9_AAC.c,203 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,204 :: 		case GCU_SENSE_ID:
L_CAN_Interrupt702:
;DP9_AAC.c,205 :: 		dd_Indicator_setFloatValue(FAN_CURRENT, ((int) ((firstInt - 396.0) * 1.221)) / 100.0);
	MOV	[W14+0], W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17350, W3
	CALL	__Sub_FP
	MOV	#18874, W2
	MOV	#16284, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	MOV	W0, W11
	MOV	W1, W12
	MOV.B	#15, W10
	CALL	_dd_Indicator_setFloatValue
;DP9_AAC.c,206 :: 		dd_Indicator_setFloatValue(FUEL_PUMP_CURRENT, ((int) ((firstInt - 396.0) * 1.221)) / 100.0);
	MOV	[W14+0], W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17350, W3
	CALL	__Sub_FP
	MOV	#18874, W2
	MOV	#16284, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	MOV	W0, W11
	MOV	W1, W12
	MOV.B	#17, W10
	CALL	_dd_Indicator_setFloatValue
;DP9_AAC.c,207 :: 		dd_Indicator_setFloatValue(GCU_TEMP, (thirdInt * 0.1221) - 50);
	MOV	[W14+4], W0
	CLR	W1
	CALL	__Long2Float
	MOV	#3985, W2
	MOV	#15866, W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16968, W3
	CALL	__Sub_FP
	MOV	W0, W11
	MOV	W1, W12
	MOV.B	#18, W10
	CALL	_dd_Indicator_setFloatValue
;DP9_AAC.c,208 :: 		dd_Indicator_setIntValue(H2O_PUMP_CURRENT, ((int) ((firstInt - 396.0) * 1.221)) / 100.0);
	MOV	[W14+0], W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17350, W3
	CALL	__Sub_FP
	MOV	#18874, W2
	MOV	#16284, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, W11
	MOV.B	#16, W10
	CALL	_dd_Indicator_setIntValue
;DP9_AAC.c,209 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,210 :: 		case GCU_MOTOR_ID:
L_CAN_Interrupt703:
;DP9_AAC.c,213 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,214 :: 		case GCU_CLUTCH_ID:
L_CAN_Interrupt704:
;DP9_AAC.c,216 :: 		dClutch_injectActualValue((unsigned char)secondInt);
	MOV.B	[W14+2], W10
	CALL	_dClutch_injectActualValue
;DP9_AAC.c,217 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,218 :: 		case EBB_ID:
L_CAN_Interrupt705:
;DP9_AAC.c,219 :: 		dEbb_setEbbValueFromCAN(firstInt);
	MOV	[W14+0], W10
	CALL	_dEbb_setEbbValueFromCAN
;DP9_AAC.c,220 :: 		dEbb_setEbbMotorSenseFromCAN(secondInt);
	MOV	[W14+2], W10
	CALL	_dEbb_setEbbMotorSenseFromCAN
;DP9_AAC.c,221 :: 		dEbb_setEbbMotorStateFromCAN(thirdInt);
	MOV	[W14+4], W10
	CALL	_dEbb_setEbbMotorStateFromCAN
;DP9_AAC.c,222 :: 		dEbb_propagateEbbChange();
	CALL	_dEbb_propagateEbbChange
;DP9_AAC.c,223 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,224 :: 		case EFI_H2O_ID:
L_CAN_Interrupt706:
;DP9_AAC.c,225 :: 		dd_Indicator_setFloatValue(TH2O, dEfiSense_calculateTemperature(secondInt));
	MOV	[W14+2], W10
	CALL	_dEfiSense_calculateTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV.B	#1, W10
	CALL	_dd_Indicator_setFloatValue
;DP9_AAC.c,226 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DP9_AAC.c,227 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,228 :: 		case EFI_FUEL_RPM_ID:
L_CAN_Interrupt707:
;DP9_AAC.c,229 :: 		dRpm_set(fourthInt);
	MOV	[W14+6], W10
	CALL	_dRpm_set
;DP9_AAC.c,230 :: 		dEfiSense_heartbeat();           //aggiunto dopo
	CALL	_dEfiSense_heartbeat
;DP9_AAC.c,231 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,232 :: 		case EFI_MIXED_ID:
L_CAN_Interrupt708:
;DP9_AAC.c,233 :: 		dd_Indicator_setIntValue(MAP, firstInt);
	MOV	[W14+0], W11
	MOV.B	#11, W10
	CALL	_dd_Indicator_setIntValue
;DP9_AAC.c,234 :: 		dd_Indicator_setIntValue(FAN_STATE, secondInt);
	MOV	[W14+2], W11
	MOV.B	#12, W10
	CALL	_dd_Indicator_setIntValue
;DP9_AAC.c,235 :: 		dd_Indicator_setFloatValue(AIR_TEMPERATURE, dEfiSense_calculateTemperature(thirdInt));
	MOV	[W14+4], W10
	CALL	_dEfiSense_calculateTemperature
	MOV	W0, W11
	MOV	W1, W12
	MOV.B	#13, W10
	CALL	_dd_Indicator_setFloatValue
;DP9_AAC.c,236 :: 		dEfiSense_heartbeat();           //aggiunto dopo
	CALL	_dEfiSense_heartbeat
;DP9_AAC.c,237 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,238 :: 		case EFI_GEAR_ID:
L_CAN_Interrupt709:
;DP9_AAC.c,239 :: 		dGear_propagate(firstInt);
	MOV	[W14+0], W10
	CALL	_dGear_propagate
;DP9_AAC.c,240 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DP9_AAC.c,241 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,242 :: 		case EFI_OIL_BATT_ID:
L_CAN_Interrupt710:
;DP9_AAC.c,243 :: 		dd_Indicator_setFloatValue(OIL_PRESS, dEfiSense_calculatePressure(firstInt));
	MOV	[W14+0], W10
	CALL	_dEfiSense_calculatePressure
	MOV	W0, W11
	MOV	W1, W12
	MOV.B	#5, W10
	CALL	_dd_Indicator_setFloatValue
;DP9_AAC.c,244 :: 		dd_Indicator_setFloatValue(VBAT, dEfiSense_calculateVoltage(fourthInt));
	MOV	[W14+6], W10
	CALL	_dEfiSense_calculateVoltage
	MOV	W0, W11
	MOV	W1, W12
	MOV.B	#2, W10
	CALL	_dd_Indicator_setFloatValue
;DP9_AAC.c,245 :: 		dEfiSense_heartbeat();
	CALL	_dEfiSense_heartbeat
;DP9_AAC.c,246 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,247 :: 		case SW_COMMAND_ID:
L_CAN_Interrupt711:
;DP9_AAC.c,248 :: 		if (firstInt == 1) {
	MOV	[W14+0], W0
	CP	W0, #1
	BRA Z	L__CAN_Interrupt1528
	GOTO	L_CAN_Interrupt712
L__CAN_Interrupt1528:
;DP9_AAC.c,249 :: 		dRio_heartBeat();
	CALL	_dRio_heartBeat
;DP9_AAC.c,250 :: 		}
L_CAN_Interrupt712:
;DP9_AAC.c,251 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,252 :: 		case SW_AUX_ID:
L_CAN_Interrupt713:
;DP9_AAC.c,253 :: 		switch(dataBuffer[0]){
	ADD	W14, #12, W0
	MOV	W0, [W14+24]
	GOTO	L_CAN_Interrupt714
;DP9_AAC.c,254 :: 		case MEX_READY:
L_CAN_Interrupt716:
;DP9_AAC.c,255 :: 		dAcc_startAutoAcceleration();
	CALL	_dAcc_startAutoAcceleration
;DP9_AAC.c,256 :: 		dd_Dashboard_fireTimedMessage(1, "ACC READY", MESSAGE_TYPE_MESSAGE);
	CLR	W13
	MOV	#lo_addr(?lstr54_DP9_AAC), W12
	MOV	#0, W10
	MOV	#16256, W11
	CALL	_dd_Dashboard_fireTimedMessage
;DP9_AAC.c,257 :: 		break;
	GOTO	L_CAN_Interrupt715
;DP9_AAC.c,258 :: 		case MEX_GO:
L_CAN_Interrupt717:
;DP9_AAC.c,259 :: 		dAcc_startClutchRelease();
	CALL	_dAcc_startClutchRelease
;DP9_AAC.c,260 :: 		dd_Dashboard_fireTimedMessage(1, "GO", MESSAGE_TYPE_MESSAGE);
	CLR	W13
	MOV	#lo_addr(?lstr55_DP9_AAC), W12
	MOV	#0, W10
	MOV	#16256, W11
	CALL	_dd_Dashboard_fireTimedMessage
;DP9_AAC.c,261 :: 		Buzzer_bip();
	CALL	_Buzzer_bip
;DP9_AAC.c,262 :: 		break;
	GOTO	L_CAN_Interrupt715
;DP9_AAC.c,263 :: 		case MEX_OFF:
L_CAN_Interrupt718:
;DP9_AAC.c,264 :: 		dAcc_stopAutoAcceleration();
	CALL	_dAcc_stopAutoAcceleration
;DP9_AAC.c,265 :: 		dd_Dashboard_fireTimedMessage(1, "ACC OFF", MESSAGE_TYPE_MESSAGE);
	CLR	W13
	MOV	#lo_addr(?lstr56_DP9_AAC), W12
	MOV	#0, W10
	MOV	#16256, W11
	CALL	_dd_Dashboard_fireTimedMessage
;DP9_AAC.c,266 :: 		break;
	GOTO	L_CAN_Interrupt715
;DP9_AAC.c,267 :: 		}
L_CAN_Interrupt714:
	MOV	[W14+24], W1
	MOV.B	[W1], W0
	CP.B	W0, #1
	BRA NZ	L__CAN_Interrupt1529
	GOTO	L_CAN_Interrupt716
L__CAN_Interrupt1529:
	MOV.B	[W1], W0
	CP.B	W0, #2
	BRA NZ	L__CAN_Interrupt1530
	GOTO	L_CAN_Interrupt717
L__CAN_Interrupt1530:
	MOV.B	[W1], W0
	CP.B	W0, #3
	BRA NZ	L__CAN_Interrupt1531
	GOTO	L_CAN_Interrupt718
L__CAN_Interrupt1531:
L_CAN_Interrupt715:
;DP9_AAC.c,268 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,269 :: 		default:
L_CAN_Interrupt719:
;DP9_AAC.c,270 :: 		break;
	GOTO	L_CAN_Interrupt700
;DP9_AAC.c,271 :: 		}
L_CAN_Interrupt699:
	MOV	#1280, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1532
	GOTO	L_CAN_Interrupt701
L__CAN_Interrupt1532:
	MOV	#1742, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1533
	GOTO	L_CAN_Interrupt702
L__CAN_Interrupt1533:
	MOV	#1590, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1534
	GOTO	L_CAN_Interrupt703
L__CAN_Interrupt1534:
	MOV	#1559, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1535
	GOTO	L_CAN_Interrupt704
L__CAN_Interrupt1535:
	MOV	#1638, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1536
	GOTO	L_CAN_Interrupt705
L__CAN_Interrupt1536:
	MOV	#782, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1537
	GOTO	L_CAN_Interrupt706
L__CAN_Interrupt1537:
	MOV	#779, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1538
	GOTO	L_CAN_Interrupt707
L__CAN_Interrupt1538:
	MOV	#783, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1539
	GOTO	L_CAN_Interrupt708
L__CAN_Interrupt1539:
	MOV	#776, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1540
	GOTO	L_CAN_Interrupt709
L__CAN_Interrupt1540:
	MOV	#781, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1541
	GOTO	L_CAN_Interrupt710
L__CAN_Interrupt1541:
	MOV	#1799, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1542
	GOTO	L_CAN_Interrupt711
L__CAN_Interrupt1542:
	MOV	#1776, W1
	MOV	#0, W2
	ADD	W14, #8, W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__CAN_Interrupt1543
	GOTO	L_CAN_Interrupt713
L__CAN_Interrupt1543:
	GOTO	L_CAN_Interrupt719
L_CAN_Interrupt700:
;DP9_AAC.c,274 :: 		IEC1BITS.C1IE = 1;
	BSET	IEC1bits, #11
;DP9_AAC.c,275 :: 		}
L_end_CAN_Interrupt:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	ULNK
	RETFIE
; end of _CAN_Interrupt
