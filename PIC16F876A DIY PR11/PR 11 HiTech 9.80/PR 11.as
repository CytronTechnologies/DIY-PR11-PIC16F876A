opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F876A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 12 "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	psect config,class=CONFIG,delta=2 ;#
# 12 "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	dw 0x3F32 ;#
	FNCALL	_main,_send_config
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_send_char
	FNCALL	_main,_read_adc
	FNCALL	_main,_read_temp
	FNCALL	_main,___lwdiv
	FNCALL	_main,_dis_num
	FNCALL	_main,___lwmod
	FNCALL	_main,_delay
	FNCALL	_dis_num,___lldiv
	FNCALL	_dis_num,___llmod
	FNCALL	_dis_num,_send_char
	FNCALL	_lcd_goto,_send_config
	FNCALL	_send_char,_delay
	FNCALL	_send_char,_e_pulse
	FNCALL	_send_config,_delay
	FNCALL	_send_config,_e_pulse
	FNCALL	_e_pulse,_delay
	FNCALL	_read_adc,___lldiv
	FNROOT	_main
	global	_result
	global	_temp
	global	_tempA
	global	_tempB
	global	_ADCON0
psect	text272,local,class=CODE,delta=2
global __ptext272
__ptext272:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_ADGO
_ADGO	set	250
	global	_RA2
_RA2	set	42
	global	_RA5
_RA5	set	45
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	file	"PR 11.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_result:
       ds      2

_temp:
       ds      2

_tempA:
       ds      2

_tempB:
       ds      2

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_send_config
?_send_config:	; 0 bytes @ 0x0
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x0
	global	?_send_char
?_send_char:	; 0 bytes @ 0x0
	global	?_read_adc
?_read_adc:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_e_pulse
?_e_pulse:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_read_temp
?_read_temp:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___llmod
?___llmod:	; 4 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	delay@i
delay@i:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___llmod@divisor
___llmod@divisor:	; 4 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	2
	global	??_send_config
??_send_config:	; 0 bytes @ 0x2
	global	??_send_char
??_send_char:	; 0 bytes @ 0x2
	global	??_read_temp
??_read_temp:	; 0 bytes @ 0x2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	??_e_pulse
??_e_pulse:	; 0 bytes @ 0x2
	global	send_config@data
send_config@data:	; 1 bytes @ 0x2
	global	send_char@data
send_char@data:	; 1 bytes @ 0x2
	global	read_temp@temp
read_temp@temp:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x3
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	lcd_goto@data
lcd_goto@data:	; 1 bytes @ 0x4
	global	___llmod@dividend
___llmod@dividend:	; 4 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	??___llmod
??___llmod:	; 0 bytes @ 0x8
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0x8
	ds	1
	global	___llmod@counter
___llmod@counter:	; 1 bytes @ 0x9
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x9
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_read_adc
??_read_adc:	; 0 bytes @ 0x0
	global	?_dis_num
?_dis_num:	; 0 bytes @ 0x0
	global	dis_num@data
dis_num@data:	; 4 bytes @ 0x0
	ds	4
	global	??_dis_num
??_dis_num:	; 0 bytes @ 0x4
	global	read_adc@result_temp
read_adc@result_temp:	; 4 bytes @ 0x4
	ds	1
	global	dis_num@hundred_thousand
dis_num@hundred_thousand:	; 1 bytes @ 0x5
	ds	1
	global	dis_num@ten_thousand
dis_num@ten_thousand:	; 1 bytes @ 0x6
	ds	1
	global	dis_num@thousand
dis_num@thousand:	; 1 bytes @ 0x7
	ds	1
	global	dis_num@hundred
dis_num@hundred:	; 1 bytes @ 0x8
	global	read_adc@i
read_adc@i:	; 2 bytes @ 0x8
	ds	1
	global	dis_num@tenth
dis_num@tenth:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 8, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     10      18
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_read_temp	unsigned short  size(1) Largest target is 0
;;
;; ?___llmod	unsigned long  size(1) Largest target is 0
;;
;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _dis_num->___lldiv
;;   _lcd_goto->_send_config
;;   _send_char->_delay
;;   _send_config->_delay
;;   _e_pulse->_delay
;;   _read_adc->___lldiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_read_adc
;;   _main->_dis_num
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    2281
;;                        _send_config
;;                           _lcd_goto
;;                          _send_char
;;                           _read_adc
;;                          _read_temp
;;                            ___lwdiv
;;                            _dis_num
;;                            ___lwmod
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _dis_num                                             10     6      4    1235
;;                                              0 BANK0     10     6      4
;;                            ___lldiv
;;                            ___llmod
;;                          _send_char
;;                            ___lwdiv (ARG)
;;                            ___lwmod (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     2      0     201
;;                                              3 COMMON     2     2      0
;;                        _send_config
;; ---------------------------------------------------------------------------------
;; (2) _send_char                                            1     1      0     112
;;                                              2 COMMON     1     1      0
;;                              _delay
;;                            _e_pulse
;; ---------------------------------------------------------------------------------
;; (2) _send_config                                          1     1      0     112
;;                                              2 COMMON     1     1      0
;;                              _delay
;;                            _e_pulse
;; ---------------------------------------------------------------------------------
;; (3) _e_pulse                                              0     0      0      45
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _read_adc                                            10    10      0     232
;;                                              0 BANK0     10    10      0
;;                            ___lldiv
;; ---------------------------------------------------------------------------------
;; (2) ___lldiv                                             14     6      8     162
;;                                              0 COMMON    14     6      8
;; ---------------------------------------------------------------------------------
;; (2) ___llmod                                             10     2      8     159
;;                                              0 COMMON    10     2      8
;; ---------------------------------------------------------------------------------
;; (1) ___lwmod                                              6     2      4     159
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (1) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                2     0      2      45
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _read_temp                                            4     2      2      23
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _send_config
;;     _delay
;;     _e_pulse
;;       _delay
;;   _lcd_goto
;;     _send_config
;;       _delay
;;       _e_pulse
;;         _delay
;;   _send_char
;;     _delay
;;     _e_pulse
;;       _delay
;;   _read_adc
;;     ___lldiv
;;   _read_temp
;;   ___lwdiv
;;   _dis_num
;;     ___lldiv
;;     ___llmod
;;     _send_char
;;       _delay
;;       _e_pulse
;;         _delay
;;     ___lwdiv (ARG)
;;     ___lwmod (ARG)
;;   ___lwmod
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0      20       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      A      12       5       22.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      24      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 43 in file "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_send_config
;;		_lcd_goto
;;		_send_char
;;		_read_adc
;;		_read_temp
;;		___lwdiv
;;		_dis_num
;;		___lwmod
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	line	43
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	44
	
l2398:	
;PR11.c: 44: ADRESH=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	45
;PR11.c: 45: ADRESL=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(158)^080h	;volatile
	line	48
	
l2400:	
;PR11.c: 48: ADCON1=0b11000101;
	movlw	(0C5h)
	movwf	(159)^080h	;volatile
	line	51
	
l2402:	
;PR11.c: 51: TRISA=0b11011011;
	movlw	(0DBh)
	movwf	(133)^080h	;volatile
	line	52
;PR11.c: 52: TRISB=0b00000000;
	clrf	(134)^080h	;volatile
	line	53
;PR11.c: 53: TRISC=0b00000000;
	clrf	(135)^080h	;volatile
	line	55
;PR11.c: 55: PORTA=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	56
;PR11.c: 56: PORTB=0;
	clrf	(6)	;volatile
	goto	l2404
	line	58
;PR11.c: 58: while(1)
	
l519:	
	line	60
	
l2404:	
;PR11.c: 59: {
;PR11.c: 60: send_config(0b00000001);
	movlw	(01h)
	fcall	_send_config
	line	61
	
l2406:	
;PR11.c: 61: send_config(0b00000010);
	movlw	(02h)
	fcall	_send_config
	line	62
	
l2408:	
;PR11.c: 62: send_config(0b00000110);
	movlw	(06h)
	fcall	_send_config
	line	63
	
l2410:	
;PR11.c: 63: send_config(0b00001100);
	movlw	(0Ch)
	fcall	_send_config
	line	64
	
l2412:	
;PR11.c: 64: send_config(0b00111000);
	movlw	(038h)
	fcall	_send_config
	line	66
	
l2414:	
;PR11.c: 66: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	69
	
l2416:	
;PR11.c: 69: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	70
	
l2418:	
;PR11.c: 70: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	71
	
l2420:	
;PR11.c: 71: send_char('E');
	movlw	(045h)
	fcall	_send_char
	line	72
	
l2422:	
;PR11.c: 72: send_char('M');
	movlw	(04Dh)
	fcall	_send_char
	line	73
	
l2424:	
;PR11.c: 73: send_char('P');
	movlw	(050h)
	fcall	_send_char
	line	74
	
l2426:	
;PR11.c: 74: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	75
	
l2428:	
;PR11.c: 75: send_char('A');
	movlw	(041h)
	fcall	_send_char
	line	76
	
l2430:	
;PR11.c: 76: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	line	78
	
l2432:	
;PR11.c: 78: lcd_goto(20);
	movlw	(014h)
	fcall	_lcd_goto
	line	81
	
l2434:	
;PR11.c: 81: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	82
	
l2436:	
;PR11.c: 82: send_char('T');
	movlw	(054h)
	fcall	_send_char
	line	83
	
l2438:	
;PR11.c: 83: send_char('E');
	movlw	(045h)
	fcall	_send_char
	line	84
	
l2440:	
;PR11.c: 84: send_char('M');
	movlw	(04Dh)
	fcall	_send_char
	line	85
	
l2442:	
;PR11.c: 85: send_char('P');
	movlw	(050h)
	fcall	_send_char
	line	86
	
l2444:	
;PR11.c: 86: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	87
	
l2446:	
;PR11.c: 87: send_char('B');
	movlw	(042h)
	fcall	_send_char
	line	88
	
l2448:	
;PR11.c: 88: send_char('=');
	movlw	(03Dh)
	fcall	_send_char
	goto	l2450
	line	90
;PR11.c: 90: while(1)
	
l520:	
	line	93
	
l2450:	
;PR11.c: 91: {
;PR11.c: 93: ADCON0=0b10000001;
	movlw	(081h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	94
	
l2452:	
;PR11.c: 94: lcd_goto(8);
	movlw	(08h)
	fcall	_lcd_goto
	line	96
	
l2454:	
;PR11.c: 96: read_adc();
	fcall	_read_adc
	line	98
	
l2456:	
;PR11.c: 98: temp=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_temp+1)
	addwf	(_temp+1)
	movf	(0+(?_read_temp)),w
	clrf	(_temp)
	addwf	(_temp)

	line	99
	
l2458:	
;PR11.c: 99: dis_num(temp/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(_temp+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_temp),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwdiv)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	100
	
l2460:	
;PR11.c: 100: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	101
	
l2462:	
;PR11.c: 101: dis_num(temp%10);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_temp+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_temp),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwmod)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	102
	
l2464:	
;PR11.c: 102: send_char(0b11011111);
	movlw	(0DFh)
	fcall	_send_char
	line	103
	
l2466:	
;PR11.c: 103: send_char('C');
	movlw	(043h)
	fcall	_send_char
	line	104
	
l2468:	
;PR11.c: 104: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	105
	
l2470:	
;PR11.c: 105: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	107
	
l2472:	
;PR11.c: 107: tempA=temp;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_temp+1),w
	clrf	(_tempA+1)
	addwf	(_tempA+1)
	movf	(_temp),w
	clrf	(_tempA)
	addwf	(_tempA)

	line	110
	
l2474:	
;PR11.c: 110: ADCON0=0b10001001;
	movlw	(089h)
	movwf	(31)	;volatile
	line	112
	
l2476:	
;PR11.c: 112: lcd_goto(28);
	movlw	(01Ch)
	fcall	_lcd_goto
	line	114
	
l2478:	
;PR11.c: 114: read_adc();
	fcall	_read_adc
	line	116
	
l2480:	
;PR11.c: 116: temp=read_temp();
	fcall	_read_temp
	movf	(1+(?_read_temp)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_temp+1)
	addwf	(_temp+1)
	movf	(0+(?_read_temp)),w
	clrf	(_temp)
	addwf	(_temp)

	line	117
	
l2482:	
;PR11.c: 117: dis_num(temp/10);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(_temp+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_temp),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwdiv)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	118
	
l2484:	
;PR11.c: 118: send_char('.');
	movlw	(02Eh)
	fcall	_send_char
	line	119
	
l2486:	
;PR11.c: 119: dis_num(temp%10);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_temp+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_temp),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_dis_num)
	movf	(1+(?___lwmod)),w
	movwf	((?_dis_num))+1
	clrf	2+((?_dis_num))
	clrf	3+((?_dis_num))
	fcall	_dis_num
	line	120
	
l2488:	
;PR11.c: 120: send_char(0b11011111);
	movlw	(0DFh)
	fcall	_send_char
	line	121
	
l2490:	
;PR11.c: 121: send_char('C');
	movlw	(043h)
	fcall	_send_char
	line	122
	
l2492:	
;PR11.c: 122: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	123
	
l2494:	
;PR11.c: 123: send_char(' ');
	movlw	(020h)
	fcall	_send_char
	line	125
	
l2496:	
;PR11.c: 125: tempB=temp;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_temp+1),w
	clrf	(_tempB+1)
	addwf	(_tempB+1)
	movf	(_temp),w
	clrf	(_tempB)
	addwf	(_tempB)

	line	127
	
l2498:	
;PR11.c: 127: if((tempA>400)&&(tempB<350))
	movlw	high(0191h)
	subwf	(_tempA+1),w
	movlw	low(0191h)
	skipnz
	subwf	(_tempA),w
	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l2504
u2800:
	
l2500:	
	movlw	high(015Eh)
	subwf	(_tempB+1),w
	movlw	low(015Eh)
	skipnz
	subwf	(_tempB),w
	skipnc
	goto	u2811
	goto	u2810
u2811:
	goto	l2504
u2810:
	line	129
	
l2502:	
;PR11.c: 128: {
;PR11.c: 129: RB2=1;
	bsf	(50/8),(50)&7
	line	130
;PR11.c: 130: RB1=0;
	bcf	(49/8),(49)&7
	line	131
;PR11.c: 131: RB4=1;
	bsf	(52/8),(52)&7
	line	132
;PR11.c: 132: RB3=0;
	bcf	(51/8),(51)&7
	line	133
;PR11.c: 133: RB5=0;
	bcf	(53/8),(53)&7
	line	134
;PR11.c: 134: }
	goto	l2522
	line	136
	
l521:	
	
l2504:	
;PR11.c: 136: else if((tempB>350)&&(tempA<400))
	movlw	high(015Fh)
	subwf	(_tempB+1),w
	movlw	low(015Fh)
	skipnz
	subwf	(_tempB),w
	skipc
	goto	u2821
	goto	u2820
u2821:
	goto	l2510
u2820:
	
l2506:	
	movlw	high(0190h)
	subwf	(_tempA+1),w
	movlw	low(0190h)
	skipnz
	subwf	(_tempA),w
	skipnc
	goto	u2831
	goto	u2830
u2831:
	goto	l2510
u2830:
	line	138
	
l2508:	
;PR11.c: 137: {
;PR11.c: 138: RB2=0;
	bcf	(50/8),(50)&7
	line	139
;PR11.c: 139: RB1=1;
	bsf	(49/8),(49)&7
	line	140
;PR11.c: 140: RB4=0;
	bcf	(52/8),(52)&7
	line	141
;PR11.c: 141: RB3=1;
	bsf	(51/8),(51)&7
	line	142
;PR11.c: 142: RB5=0;
	bcf	(53/8),(53)&7
	line	143
;PR11.c: 143: }
	goto	l2522
	line	145
	
l523:	
	
l2510:	
;PR11.c: 145: else if((tempB>350)&&(tempA>400))
	movlw	high(015Fh)
	subwf	(_tempB+1),w
	movlw	low(015Fh)
	skipnz
	subwf	(_tempB),w
	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l2516
u2840:
	
l2512:	
	movlw	high(0191h)
	subwf	(_tempA+1),w
	movlw	low(0191h)
	skipnz
	subwf	(_tempA),w
	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l2516
u2850:
	line	147
	
l2514:	
;PR11.c: 146: {
;PR11.c: 147: RB1=1;
	bsf	(49/8),(49)&7
	line	148
;PR11.c: 148: RB2=1;
	bsf	(50/8),(50)&7
	line	149
;PR11.c: 149: RB4=1;
	bsf	(52/8),(52)&7
	line	150
;PR11.c: 150: RB3=1;
	bsf	(51/8),(51)&7
	line	151
;PR11.c: 151: RB5=1;
	bsf	(53/8),(53)&7
	line	152
;PR11.c: 152: }
	goto	l2522
	line	154
	
l525:	
	
l2516:	
;PR11.c: 154: else if((tempB<350)&&(tempA<400))
	movlw	high(015Eh)
	subwf	(_tempB+1),w
	movlw	low(015Eh)
	skipnz
	subwf	(_tempB),w
	skipnc
	goto	u2861
	goto	u2860
u2861:
	goto	l2522
u2860:
	
l2518:	
	movlw	high(0190h)
	subwf	(_tempA+1),w
	movlw	low(0190h)
	skipnz
	subwf	(_tempA),w
	skipnc
	goto	u2871
	goto	u2870
u2871:
	goto	l2522
u2870:
	line	156
	
l2520:	
;PR11.c: 155: {
;PR11.c: 156: RB1=0;
	bcf	(49/8),(49)&7
	line	157
;PR11.c: 157: RB2=0;
	bcf	(50/8),(50)&7
	line	158
;PR11.c: 158: RB4=0;
	bcf	(52/8),(52)&7
	line	159
;PR11.c: 159: RB3=0;
	bcf	(51/8),(51)&7
	line	160
;PR11.c: 160: RB5=0;
	bcf	(53/8),(53)&7
	goto	l2522
	line	161
	
l527:	
	goto	l2522
	line	163
	
l526:	
	goto	l2522
	
l524:	
	goto	l2522
	
l522:	
	
l2522:	
;PR11.c: 161: }
;PR11.c: 163: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	goto	l2450
	line	165
	
l528:	
	line	90
	goto	l2450
	
l529:	
	goto	l2404
	line	167
	
l530:	
	line	58
	goto	l2404
	
l531:	
	line	169
	
l532:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_dis_num
psect	text273,local,class=CODE,delta=2
global __ptext273
__ptext273:

;; *************** function _dis_num *****************
;; Defined at:
;;		line 223 in file "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
;; Parameters:    Size  Location     Type
;;  data            4    0[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  tenth           1    9[BANK0 ] unsigned char 
;;  hundred         1    8[BANK0 ] unsigned char 
;;  thousand        1    7[BANK0 ] unsigned char 
;;  ten_thousand    1    6[BANK0 ] unsigned char 
;;  hundred_thou    1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lldiv
;;		___llmod
;;		_send_char
;; This function is called by:
;;		_main
;;		_increment
;; This function uses a non-reentrant model
;;
psect	text273
	file	"C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	line	223
	global	__size_of_dis_num
	__size_of_dis_num	equ	__end_of_dis_num-_dis_num
	
_dis_num:	
	opt	stack 4
; Regs used in _dis_num: [wreg+status,2+status,0+pclath+cstack]
	line	230
	
l2374:	
;PR11.c: 224: unsigned char hundred_thousand;
;PR11.c: 225: unsigned char ten_thousand;
;PR11.c: 226: unsigned char thousand;
;PR11.c: 227: unsigned char hundred;
;PR11.c: 228: unsigned char tenth;
;PR11.c: 230: hundred_thousand = data/100000;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	01h
	movwf	(?___lldiv+2)
	movlw	086h
	movwf	(?___lldiv+1)
	movlw	0A0h
	movwf	(?___lldiv)

	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@hundred_thousand)
	line	231
;PR11.c: 231: data = data % 100000;
	movlw	0
	movwf	(?___llmod+3)
	movlw	01h
	movwf	(?___llmod+2)
	movlw	086h
	movwf	(?___llmod+1)
	movlw	0A0h
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	232
;PR11.c: 232: ten_thousand = data/10000;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	027h
	movwf	(?___lldiv+1)
	movlw	010h
	movwf	(?___lldiv)

	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@ten_thousand)
	line	233
;PR11.c: 233: data = data % 10000;
	movlw	0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	027h
	movwf	(?___llmod+1)
	movlw	010h
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	234
;PR11.c: 234: thousand = data / 1000;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	03h
	movwf	(?___lldiv+1)
	movlw	0E8h
	movwf	(?___lldiv)

	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@thousand)
	line	235
;PR11.c: 235: data = data % 1000;
	movlw	0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	03h
	movwf	(?___llmod+1)
	movlw	0E8h
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	236
;PR11.c: 236: hundred = data / 100;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	0
	movwf	(?___lldiv+1)
	movlw	064h
	movwf	(?___lldiv)

	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@hundred)
	line	237
;PR11.c: 237: data = data % 100;
	movlw	0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	0
	movwf	(?___llmod+1)
	movlw	064h
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	238
;PR11.c: 238: tenth = data / 10;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	0
	movwf	(?___lldiv+1)
	movlw	0Ah
	movwf	(?___lldiv)

	movf	(dis_num@data+3),w
	movwf	3+(?___lldiv)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___lldiv)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___lldiv)+04h
	movf	(dis_num@data),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	0+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dis_num+0)+0
	movf	(??_dis_num+0)+0,w
	movwf	(dis_num@tenth)
	line	239
;PR11.c: 239: data = data % 10;
	movlw	0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	0
	movwf	(?___llmod+1)
	movlw	0Ah
	movwf	(?___llmod)

	movf	(dis_num@data+3),w
	movwf	3+(?___llmod)+04h
	movf	(dis_num@data+2),w
	movwf	2+(?___llmod)+04h
	movf	(dis_num@data+1),w
	movwf	1+(?___llmod)+04h
	movf	(dis_num@data),w
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	movf	(3+(?___llmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dis_num@data+3)
	movf	(2+(?___llmod)),w
	movwf	(dis_num@data+2)
	movf	(1+(?___llmod)),w
	movwf	(dis_num@data+1)
	movf	(0+(?___llmod)),w
	movwf	(dis_num@data)

	line	241
	
l2376:	
;PR11.c: 241: if(hundred_thousand>0)
	movf	(dis_num@hundred_thousand),w
	skipz
	goto	u2750
	goto	l2380
u2750:
	line	243
	
l2378:	
;PR11.c: 242: {
;PR11.c: 243: send_char(hundred_thousand + 0x30);
	movf	(dis_num@hundred_thousand),w
	addlw	030h
	fcall	_send_char
	line	244
;PR11.c: 244: send_char(ten_thousand + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@ten_thousand),w
	addlw	030h
	fcall	_send_char
	line	245
;PR11.c: 245: send_char(thousand + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@thousand),w
	addlw	030h
	fcall	_send_char
	line	246
;PR11.c: 246: send_char(hundred + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	247
;PR11.c: 247: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	248
;PR11.c: 248: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	249
;PR11.c: 249: }
	goto	l562
	line	251
	
l552:	
	
l2380:	
;PR11.c: 251: else if(ten_thousand>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@ten_thousand),w
	skipz
	goto	u2760
	goto	l2384
u2760:
	line	253
	
l2382:	
;PR11.c: 252: {
;PR11.c: 253: send_char(ten_thousand + 0x30);
	movf	(dis_num@ten_thousand),w
	addlw	030h
	fcall	_send_char
	line	254
;PR11.c: 254: send_char(thousand + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@thousand),w
	addlw	030h
	fcall	_send_char
	line	255
;PR11.c: 255: send_char(hundred + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	256
;PR11.c: 256: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	257
;PR11.c: 257: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	258
;PR11.c: 258: }
	goto	l562
	line	259
	
l554:	
	
l2384:	
;PR11.c: 259: else if(thousand>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@thousand),w
	skipz
	goto	u2770
	goto	l2388
u2770:
	line	261
	
l2386:	
;PR11.c: 260: {
;PR11.c: 261: send_char(thousand + 0x30);
	movf	(dis_num@thousand),w
	addlw	030h
	fcall	_send_char
	line	262
;PR11.c: 262: send_char(hundred + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	263
;PR11.c: 263: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	264
;PR11.c: 264: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	265
;PR11.c: 265: }
	goto	l562
	line	266
	
l556:	
	
l2388:	
;PR11.c: 266: else if(hundred>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@hundred),w
	skipz
	goto	u2780
	goto	l2392
u2780:
	line	268
	
l2390:	
;PR11.c: 267: {
;PR11.c: 268: send_char(hundred + 0x30);
	movf	(dis_num@hundred),w
	addlw	030h
	fcall	_send_char
	line	269
;PR11.c: 269: send_char(tenth + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	270
;PR11.c: 270: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	271
;PR11.c: 271: }
	goto	l562
	line	272
	
l558:	
	
l2392:	
;PR11.c: 272: else if(tenth>0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@tenth),w
	skipz
	goto	u2790
	goto	l2396
u2790:
	line	274
	
l2394:	
;PR11.c: 273: {
;PR11.c: 274: send_char(tenth + 0x30);
	movf	(dis_num@tenth),w
	addlw	030h
	fcall	_send_char
	line	275
;PR11.c: 275: send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	line	276
;PR11.c: 276: }
	goto	l562
	line	277
	
l560:	
	
l2396:	
;PR11.c: 277: else send_char(data + 0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(dis_num@data),w
	addlw	030h
	fcall	_send_char
	goto	l562
	
l561:	
	goto	l562
	
l559:	
	goto	l562
	
l557:	
	goto	l562
	
l555:	
	goto	l562
	
l553:	
	line	278
	
l562:	
	return
	opt stack 0
GLOBAL	__end_of_dis_num
	__end_of_dis_num:
;; =============== function _dis_num ends ============

	signat	_dis_num,4216
	global	_lcd_goto
psect	text274,local,class=CODE,delta=2
global __ptext274
__ptext274:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 201 in file "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_send_config
;; This function is called by:
;;		_main
;;		_increment
;; This function uses a non-reentrant model
;;
psect	text274
	file	"C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	line	201
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 4
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto@data stored from wreg
	movwf	(lcd_goto@data)
	line	202
	
l2366:	
;PR11.c: 202: if(data<16)
	movlw	(010h)
	subwf	(lcd_goto@data),w
	skipnc
	goto	u2741
	goto	u2740
u2741:
	goto	l2370
u2740:
	line	204
	
l2368:	
;PR11.c: 203: {
;PR11.c: 204: send_config(0x80+data);
	movf	(lcd_goto@data),w
	addlw	080h
	fcall	_send_config
	line	205
;PR11.c: 205: }
	goto	l546
	line	206
	
l544:	
	line	208
	
l2370:	
;PR11.c: 206: else
;PR11.c: 207: {
;PR11.c: 208: data=data-20;
	movf	(lcd_goto@data),w
	addlw	0ECh
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(lcd_goto@data)
	line	209
	
l2372:	
;PR11.c: 209: send_config(0xc0+data);
	movf	(lcd_goto@data),w
	addlw	0C0h
	fcall	_send_config
	goto	l546
	line	210
	
l545:	
	line	211
	
l546:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,4216
	global	_send_char
psect	text275,local,class=CODE,delta=2
global __ptext275
__ptext275:

;; *************** function _send_char *****************
;; Defined at:
;;		line 192 in file "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;;		_e_pulse
;; This function is called by:
;;		_main
;;		_dis_num
;; This function uses a non-reentrant model
;;
psect	text275
	file	"C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	line	192
	global	__size_of_send_char
	__size_of_send_char	equ	__end_of_send_char-_send_char
	
_send_char:	
	opt	stack 4
; Regs used in _send_char: [wreg+status,2+status,0+pclath+cstack]
;send_char@data stored from wreg
	movwf	(send_char@data)
	line	193
	
l2358:	
;PR11.c: 193: RA2=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	line	194
	
l2360:	
;PR11.c: 194: PORTC=data;
	movf	(send_char@data),w
	movwf	(7)	;volatile
	line	195
	
l2362:	
;PR11.c: 195: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	196
	
l2364:	
;PR11.c: 196: e_pulse();
	fcall	_e_pulse
	line	197
	
l541:	
	return
	opt stack 0
GLOBAL	__end_of_send_char
	__end_of_send_char:
;; =============== function _send_char ends ============

	signat	_send_char,4216
	global	_send_config
psect	text276,local,class=CODE,delta=2
global __ptext276
__ptext276:

;; *************** function _send_config *****************
;; Defined at:
;;		line 176 in file "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;;		_e_pulse
;; This function is called by:
;;		_main
;;		_lcd_goto
;;		_lcd_clr
;; This function uses a non-reentrant model
;;
psect	text276
	file	"C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	line	176
	global	__size_of_send_config
	__size_of_send_config	equ	__end_of_send_config-_send_config
	
_send_config:	
	opt	stack 4
; Regs used in _send_config: [wreg+status,2+status,0+pclath+cstack]
;send_config@data stored from wreg
	movwf	(send_config@data)
	line	177
	
l2350:	
;PR11.c: 177: RA2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
	line	178
	
l2352:	
;PR11.c: 178: PORTC=data;
	movf	(send_config@data),w
	movwf	(7)	;volatile
	line	179
	
l2354:	
;PR11.c: 179: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	180
	
l2356:	
;PR11.c: 180: e_pulse();
	fcall	_e_pulse
	line	181
	
l535:	
	return
	opt stack 0
GLOBAL	__end_of_send_config
	__end_of_send_config:
;; =============== function _send_config ends ============

	signat	_send_config,4216
	global	_e_pulse
psect	text277,local,class=CODE,delta=2
global __ptext277
__ptext277:

;; *************** function _e_pulse *****************
;; Defined at:
;;		line 184 in file "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_send_config
;;		_send_char
;; This function uses a non-reentrant model
;;
psect	text277
	file	"C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	line	184
	global	__size_of_e_pulse
	__size_of_e_pulse	equ	__end_of_e_pulse-_e_pulse
	
_e_pulse:	
	opt	stack 4
; Regs used in _e_pulse: [wreg+status,2+status,0+pclath+cstack]
	line	185
	
l2344:	
;PR11.c: 185: RA5=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	line	186
	
l2346:	
;PR11.c: 186: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	187
	
l2348:	
;PR11.c: 187: RA5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	line	188
;PR11.c: 188: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	189
	
l538:	
	return
	opt stack 0
GLOBAL	__end_of_e_pulse
	__end_of_e_pulse:
;; =============== function _e_pulse ends ============

	signat	_e_pulse,88
	global	_read_adc
psect	text278,local,class=CODE,delta=2
global __ptext278
__ptext278:

;; *************** function _read_adc *****************
;; Defined at:
;;		line 295 in file "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  result_temp     4    4[BANK0 ] unsigned long 
;;  i               2    8[BANK0 ] unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lldiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text278
	file	"C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	line	295
	global	__size_of_read_adc
	__size_of_read_adc	equ	__end_of_read_adc-_read_adc
	
_read_adc:	
	opt	stack 6
; Regs used in _read_adc: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	297
	
l2324:	
;PR11.c: 296: unsigned short i;
;PR11.c: 297: unsigned long result_temp=0;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(read_adc@result_temp+3)
	movlw	0
	movwf	(read_adc@result_temp+2)
	movlw	0
	movwf	(read_adc@result_temp+1)
	movlw	0
	movwf	(read_adc@result_temp)

	line	298
;PR11.c: 298: for(i=2000;i>0;i-=1)
	movlw	low(07D0h)
	movwf	(read_adc@i)
	movlw	high(07D0h)
	movwf	((read_adc@i))+1
	
l2326:	
	movf	((read_adc@i+1)),w
	iorwf	((read_adc@i)),w
	skipz
	goto	u2691
	goto	u2690
u2691:
	goto	l570
u2690:
	goto	l2342
	
l2328:	
	goto	l2342
	line	299
	
l570:	
	line	300
;PR11.c: 299: {
;PR11.c: 300: ADGO = 1;
	bsf	(250/8),(250)&7
	line	301
;PR11.c: 301: while(ADGO==1);
	goto	l572
	
l573:	
	
l572:	
	btfsc	(250/8),(250)&7
	goto	u2701
	goto	u2700
u2701:
	goto	l572
u2700:
	goto	l2330
	
l574:	
	line	302
	
l2330:	
;PR11.c: 302: result=ADRESH;
	movf	(30),w	;volatile
	movwf	(??_read_adc+0)+0
	clrf	(??_read_adc+0)+0+1
	movf	0+(??_read_adc+0)+0,w
	movwf	(_result)
	movf	1+(??_read_adc+0)+0,w
	movwf	(_result+1)
	line	303
	
l2332:	
;PR11.c: 303: result=result<<8;
	movf	(_result+1),w
	movwf	(??_read_adc+0)+0+1
	movf	(_result),w
	movwf	(??_read_adc+0)+0
	movlw	08h
	movwf	btemp+1
u2715:
	clrc
	rlf	(??_read_adc+0)+0,f
	rlf	(??_read_adc+0)+1,f
	decfsz	btemp+1,f
	goto	u2715
	movf	0+(??_read_adc+0)+0,w
	movwf	(_result)
	movf	1+(??_read_adc+0)+0,w
	movwf	(_result+1)
	line	304
	
l2334:	
;PR11.c: 304: result=result|ADRESL;
	movf	(_result),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	iorwf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_result)
	movf	(_result+1),w
	movwf	1+(_result)
	line	306
	
l2336:	
;PR11.c: 306: result_temp+=result;
	movf	(_result),w
	movwf	((??_read_adc+0)+0)
	movf	(_result+1),w
	movwf	((??_read_adc+0)+0+1)
	clrf	((??_read_adc+0)+0+2)
	clrf	((??_read_adc+0)+0+3)
	movf	0+(??_read_adc+0)+0,w
	addwf	(read_adc@result_temp),f
	movf	1+(??_read_adc+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2721
	addwf	(read_adc@result_temp+1),f
u2721:
	movf	2+(??_read_adc+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2722
	addwf	(read_adc@result_temp+2),f
u2722:
	movf	3+(??_read_adc+0)+0,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2723
	addwf	(read_adc@result_temp+3),f
u2723:

	line	298
	
l2338:	
	movlw	low(01h)
	subwf	(read_adc@i),f
	movlw	high(01h)
	skipc
	decf	(read_adc@i+1),f
	subwf	(read_adc@i+1),f
	
l2340:	
	movf	((read_adc@i+1)),w
	iorwf	((read_adc@i)),w
	skipz
	goto	u2731
	goto	u2730
u2731:
	goto	l570
u2730:
	goto	l2342
	
l571:	
	line	308
	
l2342:	
;PR11.c: 307: }
;PR11.c: 308: result = result_temp/2000;
	movlw	0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	07h
	movwf	(?___lldiv+1)
	movlw	0D0h
	movwf	(?___lldiv)

	movf	(read_adc@result_temp+3),w
	movwf	3+(?___lldiv)+04h
	movf	(read_adc@result_temp+2),w
	movwf	2+(?___lldiv)+04h
	movf	(read_adc@result_temp+1),w
	movwf	1+(?___lldiv)+04h
	movf	(read_adc@result_temp),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	1+(((0+(?___lldiv)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_result+1)
	addwf	(_result+1)
	movf	0+(((0+(?___lldiv)))),w
	clrf	(_result)
	addwf	(_result)

	line	310
	
l575:	
	return
	opt stack 0
GLOBAL	__end_of_read_adc
	__end_of_read_adc:
;; =============== function _read_adc ends ============

	signat	_read_adc,88
	global	___lldiv
psect	text279,local,class=CODE,delta=2
global __ptext279
__ptext279:

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\sources\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] unsigned long 
;;  dividend        4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    9[COMMON] unsigned long 
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         5       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        14       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_dis_num
;;		_read_adc
;; This function uses a non-reentrant model
;;
psect	text279
	file	"C:\Program Files\HI-TECH Software\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 6
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l2300:	
	movlw	0
	movwf	(___lldiv@quotient+3)
	movlw	0
	movwf	(___lldiv@quotient+2)
	movlw	0
	movwf	(___lldiv@quotient+1)
	movlw	0
	movwf	(___lldiv@quotient)

	line	10
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u2621
	goto	u2620
u2621:
	goto	l2320
u2620:
	line	11
	
l2302:	
	clrf	(___lldiv@counter)
	bsf	status,0
	rlf	(___lldiv@counter),f
	line	12
	goto	l2306
	
l766:	
	line	13
	
l2304:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u2635:
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	decfsz	(??___lldiv+0)+0
	goto	u2635
	line	14
	movlw	(01h)
	movwf	(??___lldiv+0)+0
	movf	(??___lldiv+0)+0,w
	addwf	(___lldiv@counter),f
	goto	l2306
	line	15
	
l765:	
	line	12
	
l2306:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u2641
	goto	u2640
u2641:
	goto	l2304
u2640:
	goto	l2308
	
l767:	
	goto	l2308
	line	16
	
l768:	
	line	17
	
l2308:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u2655:
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	decfsz	(??___lldiv+0)+0
	goto	u2655
	line	18
	
l2310:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u2665
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u2665
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u2665
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u2665:
	skipc
	goto	u2661
	goto	u2660
u2661:
	goto	l2316
u2660:
	line	19
	
l2312:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	20
	
l2314:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	goto	l2316
	line	21
	
l769:	
	line	22
	
l2316:	
	movlw	01h
u2675:
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	addlw	-1
	skipz
	goto	u2675

	line	23
	
l2318:	
	movlw	low(01h)
	subwf	(___lldiv@counter),f
	btfss	status,2
	goto	u2681
	goto	u2680
u2681:
	goto	l2308
u2680:
	goto	l2320
	
l770:	
	goto	l2320
	line	24
	
l764:	
	line	25
	
l2320:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	goto	l771
	
l2322:	
	line	26
	
l771:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___llmod
psect	text280,local,class=CODE,delta=2
global __ptext280
__ptext280:

;; *************** function ___llmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\sources\llmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] unsigned long 
;;  dividend        4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  counter         1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        10       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_dis_num
;; This function uses a non-reentrant model
;;
psect	text280
	file	"C:\Program Files\HI-TECH Software\sources\llmod.c"
	line	5
	global	__size_of___llmod
	__size_of___llmod	equ	__end_of___llmod-___llmod
	
___llmod:	
	opt	stack 6
; Regs used in ___llmod: [wreg+status,2+status,0]
	line	8
	
l2280:	
	movf	(___llmod@divisor+3),w
	iorwf	(___llmod@divisor+2),w
	iorwf	(___llmod@divisor+1),w
	iorwf	(___llmod@divisor),w
	skipnz
	goto	u2561
	goto	u2560
u2561:
	goto	l2296
u2560:
	line	9
	
l2282:	
	clrf	(___llmod@counter)
	bsf	status,0
	rlf	(___llmod@counter),f
	line	10
	goto	l2286
	
l747:	
	line	11
	
l2284:	
	movlw	01h
	movwf	(??___llmod+0)+0
u2575:
	clrc
	rlf	(___llmod@divisor),f
	rlf	(___llmod@divisor+1),f
	rlf	(___llmod@divisor+2),f
	rlf	(___llmod@divisor+3),f
	decfsz	(??___llmod+0)+0
	goto	u2575
	line	12
	movlw	(01h)
	movwf	(??___llmod+0)+0
	movf	(??___llmod+0)+0,w
	addwf	(___llmod@counter),f
	goto	l2286
	line	13
	
l746:	
	line	10
	
l2286:	
	btfss	(___llmod@divisor+3),(31)&7
	goto	u2581
	goto	u2580
u2581:
	goto	l2284
u2580:
	goto	l2288
	
l748:	
	goto	l2288
	line	14
	
l749:	
	line	15
	
l2288:	
	movf	(___llmod@divisor+3),w
	subwf	(___llmod@dividend+3),w
	skipz
	goto	u2595
	movf	(___llmod@divisor+2),w
	subwf	(___llmod@dividend+2),w
	skipz
	goto	u2595
	movf	(___llmod@divisor+1),w
	subwf	(___llmod@dividend+1),w
	skipz
	goto	u2595
	movf	(___llmod@divisor),w
	subwf	(___llmod@dividend),w
u2595:
	skipc
	goto	u2591
	goto	u2590
u2591:
	goto	l2292
u2590:
	line	16
	
l2290:	
	movf	(___llmod@divisor),w
	subwf	(___llmod@dividend),f
	movf	(___llmod@divisor+1),w
	skipc
	incfsz	(___llmod@divisor+1),w
	subwf	(___llmod@dividend+1),f
	movf	(___llmod@divisor+2),w
	skipc
	incfsz	(___llmod@divisor+2),w
	subwf	(___llmod@dividend+2),f
	movf	(___llmod@divisor+3),w
	skipc
	incfsz	(___llmod@divisor+3),w
	subwf	(___llmod@dividend+3),f
	goto	l2292
	
l750:	
	line	17
	
l2292:	
	movlw	01h
u2605:
	clrc
	rrf	(___llmod@divisor+3),f
	rrf	(___llmod@divisor+2),f
	rrf	(___llmod@divisor+1),f
	rrf	(___llmod@divisor),f
	addlw	-1
	skipz
	goto	u2605

	line	18
	
l2294:	
	movlw	low(01h)
	subwf	(___llmod@counter),f
	btfss	status,2
	goto	u2611
	goto	u2610
u2611:
	goto	l2288
u2610:
	goto	l2296
	
l751:	
	goto	l2296
	line	19
	
l745:	
	line	20
	
l2296:	
	movf	(___llmod@dividend+3),w
	movwf	(?___llmod+3)
	movf	(___llmod@dividend+2),w
	movwf	(?___llmod+2)
	movf	(___llmod@dividend+1),w
	movwf	(?___llmod+1)
	movf	(___llmod@dividend),w
	movwf	(?___llmod)

	goto	l752
	
l2298:	
	line	21
	
l752:	
	return
	opt stack 0
GLOBAL	__end_of___llmod
	__end_of___llmod:
;; =============== function ___llmod ends ============

	signat	___llmod,8316
	global	___lwmod
psect	text281,local,class=CODE,delta=2
global __ptext281
__ptext281:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text281
	file	"C:\Program Files\HI-TECH Software\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 7
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l2258:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2501
	goto	u2500
u2501:
	goto	l2276
u2500:
	line	9
	
l2260:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l2266
	
l610:	
	line	11
	
l2262:	
	movlw	01h
	
u2515:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2515
	line	12
	
l2264:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l2266
	line	13
	
l609:	
	line	10
	
l2266:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2521
	goto	u2520
u2521:
	goto	l2262
u2520:
	goto	l2268
	
l611:	
	goto	l2268
	line	14
	
l612:	
	line	15
	
l2268:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2535
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2535:
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l2272
u2530:
	line	16
	
l2270:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l2272
	
l613:	
	line	17
	
l2272:	
	movlw	01h
	
u2545:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2545
	line	18
	
l2274:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2551
	goto	u2550
u2551:
	goto	l2268
u2550:
	goto	l2276
	
l614:	
	goto	l2276
	line	19
	
l608:	
	line	20
	
l2276:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l615
	
l2278:	
	line	21
	
l615:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text282,local,class=CODE,delta=2
global __ptext282
__ptext282:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text282
	file	"C:\Program Files\HI-TECH Software\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 7
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l2234:	
	movlw	low(0)
	movwf	(___lwdiv@quotient)
	movlw	high(0)
	movwf	((___lwdiv@quotient))+1
	line	10
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2431
	goto	u2430
u2431:
	goto	l2254
u2430:
	line	11
	
l2236:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l2242
	
l600:	
	line	13
	
l2238:	
	movlw	01h
	
u2445:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2445
	line	14
	
l2240:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l2242
	line	15
	
l599:	
	line	12
	
l2242:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l2238
u2450:
	goto	l2244
	
l601:	
	goto	l2244
	line	16
	
l602:	
	line	17
	
l2244:	
	movlw	01h
	
u2465:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2465
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2475
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2475:
	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l2250
u2470:
	line	19
	
l2246:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l2248:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l2250
	line	21
	
l603:	
	line	22
	
l2250:	
	movlw	01h
	
u2485:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2485
	line	23
	
l2252:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2491
	goto	u2490
u2491:
	goto	l2244
u2490:
	goto	l2254
	
l604:	
	goto	l2254
	line	24
	
l598:	
	line	25
	
l2254:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l605
	
l2256:	
	line	26
	
l605:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_delay
psect	text283,local,class=CODE,delta=2
global __ptext283
__ptext283:

;; *************** function _delay *****************
;; Defined at:
;;		line 322 in file "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
;; Parameters:    Size  Location     Type
;;  i               2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_send_config
;;		_e_pulse
;;		_send_char
;;		_lcd_clr
;;		_increment
;; This function uses a non-reentrant model
;;
psect	text283
	file	"C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	line	322
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg+status,2+status,0]
	line	323
	
l2204:	
;PR11.c: 323: for(;i>0;i--);
	movf	((delay@i+1)),w
	iorwf	((delay@i)),w
	skipz
	goto	u2381
	goto	u2380
u2381:
	goto	l2208
u2380:
	goto	l583
	
l2206:	
	goto	l583
	
l581:	
	
l2208:	
	movlw	low(01h)
	subwf	(delay@i),f
	movlw	high(01h)
	skipc
	decf	(delay@i+1),f
	subwf	(delay@i+1),f
	
l2210:	
	movf	((delay@i+1)),w
	iorwf	((delay@i)),w
	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l2208
u2390:
	goto	l583
	
l582:	
	line	324
	
l583:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_read_temp
psect	text284,local,class=CODE,delta=2
global __ptext284
__ptext284:

;; *************** function _read_temp *****************
;; Defined at:
;;		line 313 in file "C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            2    2[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text284
	file	"C:\Users\Phang\Desktop\9.80\PR 11\PR11.c"
	line	313
	global	__size_of_read_temp
	__size_of_read_temp	equ	__end_of_read_temp-_read_temp
	
_read_temp:	
	opt	stack 7
; Regs used in _read_temp: [wreg+status,2+status,0]
	line	315
	
l2200:	
;PR11.c: 314: unsigned short temp;
;PR11.c: 315: temp=result;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_result+1),w
	clrf	(read_temp@temp+1)
	addwf	(read_temp@temp+1)
	movf	(_result),w
	clrf	(read_temp@temp)
	addwf	(read_temp@temp)

	line	316
;PR11.c: 316: return temp;
	movf	(read_temp@temp+1),w
	clrf	(?_read_temp+1)
	addwf	(?_read_temp+1)
	movf	(read_temp@temp),w
	clrf	(?_read_temp)
	addwf	(?_read_temp)

	goto	l578
	
l2202:	
	line	318
	
l578:	
	return
	opt stack 0
GLOBAL	__end_of_read_temp
	__end_of_read_temp:
;; =============== function _read_temp ends ============

	signat	_read_temp,90
psect	text285,local,class=CODE,delta=2
global __ptext285
__ptext285:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
