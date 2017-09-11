
;CodeVisionAVR C Compiler V2.05.3 Standard
;(C) Copyright 1998-2011 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Chip type                : ATxmega128A1
;Program type             : Application
;Clock frequency          : 2.000000 MHz
;Memory model             : Small
;Optimize for             : Size
;(s)printf features       : float, width, precision
;(s)scanf features        : long, width
;External RAM size        : 0
;Data Stack size          : 2048 byte(s)
;Heap size                : 0 byte(s)
;Promote 'char' to 'int'  : Yes
;'char' is unsigned       : Yes
;8 bit enums              : Yes
;Global 'const' stored in FLASH     : No
;Enhanced function parameter passing: Yes
;Enhanced core instructions         : On
;Smart register allocation          : On
;Automatic register allocation      : On

	#pragma AVRPART ADMIN PART_NAME ATxmega128A1
	#pragma AVRPART MEMORY PROG_FLASH 135168
	#pragma AVRPART MEMORY EEPROM 2048
	#pragma AVRPART MEMORY INT_SRAM SIZE 16383
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x2000

	#define CALL_SUPPORTED 1

	.LISTMAC
	.EQU CCP=0x34
	.EQU RAMPD=0x38
	.EQU RAMPX=0x39
	.EQU RAMPY=0x3A
	.EQU RAMPZ=0x3B
	.EQU EIND=0x3C
	.EQU WDT_CTRL=0x80
	.EQU PMIC_CTRL=0xA2
	.EQU NVM_ADDR0=0X01C0
	.EQU NVM_ADDR1=NVM_ADDR0+1
	.EQU NVM_ADDR2=NVM_ADDR1+1
	.EQU NVM_DATA0=NVM_ADDR0+4
	.EQU NVM_CMD=NVM_ADDR0+0xA
	.EQU NVM_CTRLA=NVM_ADDR0+0xB
	.EQU NVM_CTRLB=NVM_ADDR0+0xC
	.EQU NVM_STATUS=NVM_ADDR0+0xF
	.EQU PORTCFG_MPCMASK=0xB0
	.EQU PORTH_DIR=0x6E0
	.EQU PORTH_OUT=0x6E4
	.EQU PORTH_PIN0CTRL=0x6F0
	.EQU PORTJ_DIR=0x700
	.EQU PORTJ_OUT=0x704
	.EQU PORTJ_PIN0CTRL=0x710
	.EQU PORTK_DIR=0x720
	.EQU PORTK_OUT=0x724
	.EQU PORTK_PIN0CTRL=0x730
	.EQU EBI_CTRL=0x0440
	.EQU EBI_SDRAMCTRLA=EBI_CTRL+1
	.EQU EBI_REFRESHL=EBI_CTRL+4
	.EQU EBI_REFRESHH=EBI_CTRL+5
	.EQU EBI_INITDLYL=EBI_CTRL+6
	.EQU EBI_INITDLYH=EBI_CTRL+7
	.EQU EBI_SDRAMCTRLB=EBI_CTRL+8
	.EQU EBI_SDRAMCTRLC=EBI_CTRL+9
	.EQU EBI_CS0_CTRLA=EBI_CTRL+0x10
	.EQU EBI_CS0_CTRLB=EBI_CS0_CTRLA+1
	.EQU EBI_CS0_BASEADDRL=EBI_CS0_CTRLA+2
	.EQU EBI_CS0_BASEADDRH=EBI_CS0_CTRLA+3
	.EQU EBI_CS1_CTRLA=EBI_CTRL+0x14
	.EQU EBI_CS1_CTRLB=EBI_CS1_CTRLA+1
	.EQU EBI_CS1_BASEADDRL=EBI_CS1_CTRLA+2
	.EQU EBI_CS1_BASEADDRH=EBI_CS1_CTRLA+3
	.EQU EBI_CS2_CTRLA=EBI_CTRL+0x18
	.EQU EBI_CS2_CTRLB=EBI_CS2_CTRLA+1
	.EQU EBI_CS2_BASEADDRL=EBI_CS2_CTRLA+2
	.EQU EBI_CS2_BASEADDRH=EBI_CS2_CTRLA+3
	.EQU EBI_CS3_CTRLA=EBI_CTRL+0x1C
	.EQU EBI_CS3_CTRLB=EBI_CS3_CTRLA+1
	.EQU EBI_CS3_BASEADDRL=EBI_CS3_CTRLA+2
	.EQU EBI_CS3_BASEADDRH=EBI_CS3_CTRLA+3
	.EQU EBI_SDCAS_bp=3
	.EQU EBI_SDCAS_bm=8
	.EQU EBI_SDROW_bp=2
	.EQU EBI_SDROW_bm=4
	.EQU EBI_SDCOL_bp=0
	.EQU EBI_MRDLY_bp=6
	.EQU EBI_ROWCYCDLY_bp=3
	.EQU EBI_RPDLY_bp=0
	.EQU EBI_WRDLY_bp=6
	.EQU EBI_ESRDLY_bp=3
	.EQU EBI_ROWCOLDLY_bp=0
	.EQU EBI_CS_SDSREN_bm=4
	.EQU EBI_CS_ASPACE_256B_gc=0x00<<2
	.EQU EBI_CS_ASPACE_512B_gc=0x01<<2
	.EQU EBI_CS_ASPACE_1KB_gc=0x02<<2
	.EQU EBI_CS_ASPACE_2KB_gc=0x03<<2
	.EQU EBI_CS_ASPACE_4KB_gc=0x04<<2
	.EQU EBI_CS_ASPACE_8KB_gc=0x05<<2
	.EQU EBI_CS_ASPACE_16KB_gc=0x06<<2
	.EQU EBI_CS_ASPACE_32KB_gc=0x07<<2
	.EQU EBI_CS_ASPACE_64KB_gc=0x08<<2
	.EQU EBI_CS_ASPACE_128KB_gc=0x09<<2
	.EQU EBI_CS_ASPACE_256KB_gc=0x0A<<2
	.EQU EBI_CS_ASPACE_512KB_gc=0x0B<<2
	.EQU EBI_CS_ASPACE_1MB_gc=0x0C<<2
	.EQU EBI_CS_ASPACE_2MB_gc=0x0D<<2
	.EQU EBI_CS_ASPACE_4MB_gc=0x0E<<2
	.EQU EBI_CS_ASPACE_8MB_gc=0x0F<<2
	.EQU EBI_CS_ASPACE_16M_gc=0x10<<2
	.EQU EBI_CS_MODE_DISABLED_gc=0x00
	.EQU EBI_CS_MODE_SRAM_gc=0x01
	.EQU EBI_CS_MODE_LPC_gc=0x02
	.EQU EBI_CS_MODE_SDRAM_gc=0x03
	.EQU EBI_SDDATAW_4BIT_gc=0x00<<6
	.EQU EBI_SDDATAW_8BIT_gc=0x01<<6
	.EQU EBI_LPCMODE_ALE1_gc=0x00<<4
	.EQU EBI_LPCMODE_ALE12_gc=0x02<<4
	.EQU EBI_SRMODE_ALE1_gc=0x00<<2
	.EQU EBI_SRMODE_ALE2_gc=0x01<<2
	.EQU EBI_SRMODE_ALE12_gc=0x02<<2
	.EQU EBI_SRMODE_NOALE_gc=0x03<<2
	.EQU EBI_IFMODE_DISABLED_gc=0x00
	.EQU EBI_IFMODE_3PORT_gc=0x01
	.EQU EBI_IFMODE_4PORT_gc=0x02
	.EQU EBI_IFMODE_2PORT_gc=0x03
	.EQU EBI_SDCOL_8BIT_gc=0x00
	.EQU EBI_SDCOL_9BIT_gc=0x01
	.EQU EBI_SDCOL_10BIT_gc=0x02
	.EQU EBI_SDCOL_11BIT_gc=0x03
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F
	.EQU GPIO0=0x00
	.EQU GPIO1=0x01
	.EQU GPIO2=0x02
	.EQU GPIO3=0x03
	.EQU GPIO4=0x04
	.EQU GPIO5=0x05
	.EQU GPIO6=0x06
	.EQU GPIO7=0x07
	.EQU GPIO8=0x08
	.EQU GPIO9=0x09
	.EQU GPIO10=0x0A
	.EQU GPIO11=0x0B
	.EQU GPIO12=0x0C
	.EQU GPIO13=0x0D
	.EQU GPIO14=0x0E
	.EQU GPIO15=0x0F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x2000
	.EQU __SRAM_END=0x3FFF
	.EQU __DSTACK_SIZE=0x0800
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTW2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD2FN
	LDI  R26,LOW(2*@0+(@1))
	LDI  R27,HIGH(2*@0+(@1))
	LDI  R24,BYTE3(2*@0+(@1))
	LDI  R25,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	CALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMRDW
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X
	.ENDM

	.MACRO __GETD1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X+
	LD   R22,X
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	CALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF _ten_ms=R2
	.DEF _sec=R4
	.DEF _rx_wr_index_usartc0=R7
	.DEF _rx_rd_index_usartc0=R6
	.DEF _rx_counter_usartc0=R9
	.DEF _rx_wr_index_usartd0=R8
	.DEF _rx_rd_index_usartd0=R11
	.DEF _rx_counter_usartd0=R10
	.DEF _adca_offset=R13

;GPIO0-GPIO15 INITIALIZATION VALUES
	.EQU __GPIO0_INIT=0x00
	.EQU __GPIO1_INIT=0x00
	.EQU __GPIO2_INIT=0x00
	.EQU __GPIO3_INIT=0x00
	.EQU __GPIO4_INIT=0x00
	.EQU __GPIO5_INIT=0x00
	.EQU __GPIO6_INIT=0x00
	.EQU __GPIO7_INIT=0x00
	.EQU __GPIO8_INIT=0x00
	.EQU __GPIO9_INIT=0x00
	.EQU __GPIO10_INIT=0x00
	.EQU __GPIO11_INIT=0x00
	.EQU __GPIO12_INIT=0x00
	.EQU __GPIO13_INIT=0x00
	.EQU __GPIO14_INIT=0x00
	.EQU __GPIO15_INIT=0x00

;GLOBAL REGISTER VARIABLES INITIALIZATION VALUES
	.EQU __R2_INIT=0x00
	.EQU __R3_INIT=0x00
	.EQU __R4_INIT=0x00
	.EQU __R5_INIT=0x00
	.EQU __R6_INIT=0x00
	.EQU __R7_INIT=0x00
	.EQU __R8_INIT=0x00
	.EQU __R9_INIT=0x00
	.EQU __R10_INIT=0x00
	.EQU __R11_INIT=0x00
	.EQU __R12_INIT=0x00
	.EQU __R13_INIT=0x00
	.EQU __R14_INIT=0x00

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	JMP  __RESET
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  _rtcxm_overflow_isr
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  _tcc0_overflow_isr
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  _usartc0_rx_isr
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  _usartd0_rx_isr
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00

_0x39:
	.DB  0x90,0x1
_0x3A:
	.DB  0x95,0x1
_0x3B:
	.DB  0x1C
_0x3C:
	.DB  0xA0,0xF
_0x3D:
	.DB  0x1
_0x3E:
	.DB  0x30,0x30,0x30,0x2E,0x30,0x30
_0x3F:
	.DB  0x30,0x30,0x30,0x2E,0x30,0x30
_0x9C:
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	.DB  0x0,0x0,0x0,0x0,0x0,0x0
_0x0:
	.DB  0x2C,0x20,0x25,0x64,0x2C,0x20,0x25,0x33
	.DB  0x2E,0x32,0x66,0x0
_0x2000000:
	.DB  0x2D,0x4E,0x41,0x4E,0x0
_0x2040060:
	.DB  0x1
_0x2040000:
	.DB  0x2D,0x4E,0x41,0x4E,0x0,0x49,0x4E,0x46
	.DB  0x0

__GLOBAL_INI_TBL:
	.DW  0x06
	.DW  _Ta
	.DW  _0x3E*2

	.DW  0x06
	.DW  _Rh
	.DW  _0x3F*2

	.DW  0x01
	.DW  __seed_G102
	.DW  _0x2040060*2

_0xFFFFFFFF:
	.DW  0

__RESET:
	CLI
	CLR  R30
	OUT  RAMPD,R30
	OUT  RAMPX,R30
	OUT  RAMPY,R30

;MEMORY MAPPED EEPROM ACCESS IS USED
	LDS  R31,NVM_CTRLB
	ORI  R31,0x08
	STS  NVM_CTRLB,R31

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,0xD8
	OUT  CCP,R31
	STS  PMIC_CTRL,R30

;NO EXTERNAL RAM IS USED
	STS  EBI_CTRL,R30

;DISABLE WATCHDOG
	LDS  R26,WDT_CTRL
	CBR  R26,2
	SBR  R26,1
	OUT  CCP,R31
	STS  WDT_CTRL,R26

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,LOW(__SRAM_START)
	LDI  R27,HIGH(__SRAM_START)
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

	OUT  RAMPZ,R24

;GPIO0-GPIO15 INITIALIZATION
	LDI  R30,__GPIO0_INIT
	OUT  GPIO0,R30
	;__GPIO1_INIT = __GPIO0_INIT
	OUT  GPIO1,R30
	;__GPIO2_INIT = __GPIO0_INIT
	OUT  GPIO2,R30
	;__GPIO3_INIT = __GPIO0_INIT
	OUT  GPIO3,R30
	;__GPIO4_INIT = __GPIO0_INIT
	OUT  GPIO4,R30
	;__GPIO5_INIT = __GPIO0_INIT
	OUT  GPIO5,R30
	;__GPIO6_INIT = __GPIO0_INIT
	OUT  GPIO6,R30
	;__GPIO7_INIT = __GPIO0_INIT
	OUT  GPIO7,R30
	;__GPIO8_INIT = __GPIO0_INIT
	OUT  GPIO8,R30
	;__GPIO9_INIT = __GPIO0_INIT
	OUT  GPIO9,R30
	;__GPIO10_INIT = __GPIO0_INIT
	OUT  GPIO10,R30
	;__GPIO11_INIT = __GPIO0_INIT
	OUT  GPIO11,R30
	;__GPIO12_INIT = __GPIO0_INIT
	OUT  GPIO12,R30
	;__GPIO13_INIT = __GPIO0_INIT
	OUT  GPIO13,R30
	;__GPIO14_INIT = __GPIO0_INIT
	OUT  GPIO14,R30
	;__GPIO15_INIT = __GPIO0_INIT
	OUT  GPIO15,R30

;GLOBAL REGISTER VARIABLES INITIALIZATION
	;__R2_INIT = __GPIO0_INIT
	MOV  R2,R30
	;__R3_INIT = __GPIO0_INIT
	MOV  R3,R30
	;__R4_INIT = __GPIO0_INIT
	MOV  R4,R30
	;__R5_INIT = __GPIO0_INIT
	MOV  R5,R30
	;__R6_INIT = __GPIO0_INIT
	MOV  R6,R30
	;__R7_INIT = __GPIO0_INIT
	MOV  R7,R30
	;__R8_INIT = __GPIO0_INIT
	MOV  R8,R30
	;__R9_INIT = __GPIO0_INIT
	MOV  R9,R30
	;__R10_INIT = __GPIO0_INIT
	MOV  R10,R30
	;__R11_INIT = __GPIO0_INIT
	MOV  R11,R30
	;__R13_INIT = __GPIO0_INIT
	MOV  R13,R30

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	JMP  _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x2800

	.CSEG
;/*****************************************************
;This program was produced by the
;CodeWizardAVR V2.05.3 Standard
;Automatic Program Generator
;� Copyright 1998-2011 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;Version :
;Date    : 2014-11-15
;Author  : PerTic@n
;Company : If You Like This Software,Buy It
;Comments:
;
;
;Chip type               : ATxmega128A1
;Program type            : Application
;AVR Core Clock frequency: 2.000000 MHz
;Memory model            : Small
;Data Stack size         : 2048
;*****************************************************/
;
;// I/O Registers definitions
;#include <io.h>
;
;// Standard Input/Output functions
;#include <stdio.h>
;#include <math.h>
;#include <stdlib.h>
;#include <string.h>
;// Delay functions
;#include <delay.h>
;
;// Declare your global variables here
;
;// System Clocks initialization
;void system_clocks_init(void)
; 0000 0026 {

	.CSEG
_system_clocks_init:
; 0000 0027 unsigned char n,s;
; 0000 0028 
; 0000 0029 // Optimize for speed
; 0000 002A #pragma optsize-
; 0000 002B // Save interrupts enabled/disabled state
; 0000 002C s=SREG;
	ST   -Y,R17
	ST   -Y,R16
;	n -> R17
;	s -> R16
	IN   R16,63
; 0000 002D // Disable interrupts
; 0000 002E #asm("cli")
	cli
; 0000 002F 
; 0000 0030 // Internal 2 MHz RC oscillator initialization
; 0000 0031 // Enable the internal 2 MHz RC oscillator
; 0000 0032 OSC.CTRL|=OSC_RC2MEN_bm;
	LDS  R30,80
	ORI  R30,1
	STS  80,R30
; 0000 0033 
; 0000 0034 // System Clock prescaler A division factor: 1
; 0000 0035 // System Clock prescalers B & C division factors: B:1, C:1
; 0000 0036 // ClkPer4: 2000.000 kHz
; 0000 0037 // ClkPer2: 2000.000 kHz
; 0000 0038 // ClkPer:  2000.000 kHz
; 0000 0039 // ClkCPU:  2000.000 kHz
; 0000 003A n=(CLK.PSCTRL & (~(CLK_PSADIV_gm | CLK_PSBCDIV1_bm | CLK_PSBCDIV0_bm))) |
; 0000 003B 	CLK_PSADIV_1_gc | CLK_PSBCDIV_1_1_gc;
	LDS  R30,65
	ANDI R30,LOW(0x80)
	MOV  R17,R30
; 0000 003C CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0000 003D CLK.PSCTRL=n;
	STS  65,R17
; 0000 003E 
; 0000 003F // Disable the autocalibration of the internal 2 MHz RC oscillator
; 0000 0040 DFLLRC2M.CTRL&= ~DFLL_ENABLE_bm;
	LDS  R30,104
	ANDI R30,0xFE
	STS  104,R30
; 0000 0041 
; 0000 0042 // Wait for the internal 2 MHz RC oscillator to stabilize
; 0000 0043 while ((OSC.STATUS & OSC_RC2MRDY_bm)==0);
_0x3:
	LDS  R30,81
	ANDI R30,LOW(0x1)
	BREQ _0x3
; 0000 0044 
; 0000 0045 // Select the system clock source: 2 MHz Internal RC Osc.
; 0000 0046 n=(CLK.CTRL & (~CLK_SCLKSEL_gm)) | CLK_SCLKSEL_RC2M_gc;
	LDS  R30,64
	ANDI R30,LOW(0xF8)
	MOV  R17,R30
; 0000 0047 CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0000 0048 CLK.CTRL=n;
	STS  64,R17
; 0000 0049 
; 0000 004A // Disable the unused oscillators: 32 MHz, 32 kHz, external clock/crystal oscillator, PLL
; 0000 004B OSC.CTRL&= ~(OSC_RC32MEN_bm | OSC_RC32KEN_bm | OSC_XOSCEN_bm | OSC_PLLEN_bm);
	LDS  R30,80
	ANDI R30,LOW(0xE1)
	STS  80,R30
; 0000 004C 
; 0000 004D // Peripheral Clock output: Disabled
; 0000 004E PORTCFG.CLKEVOUT=(PORTCFG.CLKEVOUT & (~PORTCFG_CLKOUT_gm)) | PORTCFG_CLKOUT_OFF_gc;
	LDS  R30,180
	ANDI R30,LOW(0xFC)
	STS  180,R30
; 0000 004F 
; 0000 0050 // Restore interrupts enabled/disabled state
; 0000 0051 SREG=s;
	OUT  0x3F,R16
; 0000 0052 // Restore optimization for size if needed
; 0000 0053 #pragma optsize_default
; 0000 0054 }
	RJMP _0x20A000F
;
;// Ports initialization
;void ports_init(void)
; 0000 0058 {
_ports_init:
; 0000 0059 // PORTA initialization
; 0000 005A // OUT register
; 0000 005B PORTA.OUT=0x00;
	LDI  R30,LOW(0)
	STS  1540,R30
; 0000 005C // Bit0: Input
; 0000 005D // Bit1: Input
; 0000 005E // Bit2: Input
; 0000 005F // Bit3: Input
; 0000 0060 // Bit4: Input
; 0000 0061 // Bit5: Input
; 0000 0062 // Bit6: Input
; 0000 0063 // Bit7: Input
; 0000 0064 PORTA.DIR=0x00;
	STS  1536,R30
; 0000 0065 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0066 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0067 // Bit0 inverted: Off
; 0000 0068 // Bit0 slew rate limitation: Off
; 0000 0069 PORTA.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1552,R30
; 0000 006A // Bit1 Output/Pull configuration: Totempole/No
; 0000 006B // Bit1 Input/Sense configuration: Sense both edges
; 0000 006C // Bit1 inverted: Off
; 0000 006D // Bit1 slew rate limitation: Off
; 0000 006E PORTA.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1553,R30
; 0000 006F // Bit2 Output/Pull configuration: Totempole/No
; 0000 0070 // Bit2 Input/Sense configuration: Sense both edges
; 0000 0071 // Bit2 inverted: Off
; 0000 0072 // Bit2 slew rate limitation: Off
; 0000 0073 PORTA.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1554,R30
; 0000 0074 // Bit3 Output/Pull configuration: Totempole/No
; 0000 0075 // Bit3 Input/Sense configuration: Sense both edges
; 0000 0076 // Bit3 inverted: Off
; 0000 0077 // Bit3 slew rate limitation: Off
; 0000 0078 PORTA.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1555,R30
; 0000 0079 // Bit4 Output/Pull configuration: Totempole/No
; 0000 007A // Bit4 Input/Sense configuration: Sense both edges
; 0000 007B // Bit4 inverted: Off
; 0000 007C // Bit4 slew rate limitation: Off
; 0000 007D PORTA.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1556,R30
; 0000 007E // Bit5 Output/Pull configuration: Totempole/No
; 0000 007F // Bit5 Input/Sense configuration: Sense both edges
; 0000 0080 // Bit5 inverted: Off
; 0000 0081 // Bit5 slew rate limitation: Off
; 0000 0082 PORTA.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1557,R30
; 0000 0083 // Bit6 Output/Pull configuration: Totempole/No
; 0000 0084 // Bit6 Input/Sense configuration: Sense both edges
; 0000 0085 // Bit6 inverted: Off
; 0000 0086 // Bit6 slew rate limitation: Off
; 0000 0087 PORTA.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1558,R30
; 0000 0088 // Bit7 Output/Pull configuration: Totempole/No
; 0000 0089 // Bit7 Input/Sense configuration: Sense both edges
; 0000 008A // Bit7 inverted: Off
; 0000 008B // Bit7 slew rate limitation: Off
; 0000 008C PORTA.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1559,R30
; 0000 008D // Interrupt 0 level: Disabled
; 0000 008E // Interrupt 1 level: Disabled
; 0000 008F PORTA.INTCTRL=(PORTA.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0090 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1545
	ANDI R30,LOW(0xF0)
	STS  1545,R30
; 0000 0091 // Bit0 pin change interrupt 0: Off
; 0000 0092 // Bit1 pin change interrupt 0: Off
; 0000 0093 // Bit2 pin change interrupt 0: Off
; 0000 0094 // Bit3 pin change interrupt 0: Off
; 0000 0095 // Bit4 pin change interrupt 0: Off
; 0000 0096 // Bit5 pin change interrupt 0: Off
; 0000 0097 // Bit6 pin change interrupt 0: Off
; 0000 0098 // Bit7 pin change interrupt 0: Off
; 0000 0099 PORTA.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1546,R30
; 0000 009A // Bit0 pin change interrupt 1: Off
; 0000 009B // Bit1 pin change interrupt 1: Off
; 0000 009C // Bit2 pin change interrupt 1: Off
; 0000 009D // Bit3 pin change interrupt 1: Off
; 0000 009E // Bit4 pin change interrupt 1: Off
; 0000 009F // Bit5 pin change interrupt 1: Off
; 0000 00A0 // Bit6 pin change interrupt 1: Off
; 0000 00A1 // Bit7 pin change interrupt 1: Off
; 0000 00A2 PORTA.INT1MASK=0x00;
	STS  1547,R30
; 0000 00A3 
; 0000 00A4 // PORTB initialization
; 0000 00A5 // OUT register
; 0000 00A6 PORTB.OUT=0x00;
	STS  1572,R30
; 0000 00A7 // Bit0: Input
; 0000 00A8 // Bit1: Input
; 0000 00A9 // Bit2: Input
; 0000 00AA // Bit3: Input
; 0000 00AB // Bit4: Input
; 0000 00AC // Bit5: Input
; 0000 00AD // Bit6: Input
; 0000 00AE // Bit7: Input
; 0000 00AF PORTB.DIR=0x00;
	STS  1568,R30
; 0000 00B0 // Bit0 Output/Pull configuration: Totempole/No
; 0000 00B1 // Bit0 Input/Sense configuration: Sense both edges
; 0000 00B2 // Bit0 inverted: Off
; 0000 00B3 // Bit0 slew rate limitation: Off
; 0000 00B4 PORTB.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1584,R30
; 0000 00B5 // Bit1 Output/Pull configuration: Totempole/No
; 0000 00B6 // Bit1 Input/Sense configuration: Sense both edges
; 0000 00B7 // Bit1 inverted: Off
; 0000 00B8 // Bit1 slew rate limitation: Off
; 0000 00B9 PORTB.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1585,R30
; 0000 00BA // Bit2 Output/Pull configuration: Totempole/No
; 0000 00BB // Bit2 Input/Sense configuration: Sense both edges
; 0000 00BC // Bit2 inverted: Off
; 0000 00BD // Bit2 slew rate limitation: Off
; 0000 00BE PORTB.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1586,R30
; 0000 00BF // Bit3 Output/Pull configuration: Totempole/No
; 0000 00C0 // Bit3 Input/Sense configuration: Sense both edges
; 0000 00C1 // Bit3 inverted: Off
; 0000 00C2 // Bit3 slew rate limitation: Off
; 0000 00C3 PORTB.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1587,R30
; 0000 00C4 // Bit4 Output/Pull configuration: Totempole/No
; 0000 00C5 // Bit4 Input/Sense configuration: Sense both edges
; 0000 00C6 // Bit4 inverted: Off
; 0000 00C7 // Bit4 slew rate limitation: Off
; 0000 00C8 PORTB.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1588,R30
; 0000 00C9 // Bit5 Output/Pull configuration: Totempole/No
; 0000 00CA // Bit5 Input/Sense configuration: Sense both edges
; 0000 00CB // Bit5 inverted: Off
; 0000 00CC // Bit5 slew rate limitation: Off
; 0000 00CD PORTB.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1589,R30
; 0000 00CE // Bit6 Output/Pull configuration: Totempole/No
; 0000 00CF // Bit6 Input/Sense configuration: Sense both edges
; 0000 00D0 // Bit6 inverted: Off
; 0000 00D1 // Bit6 slew rate limitation: Off
; 0000 00D2 PORTB.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1590,R30
; 0000 00D3 // Bit7 Output/Pull configuration: Totempole/No
; 0000 00D4 // Bit7 Input/Sense configuration: Sense both edges
; 0000 00D5 // Bit7 inverted: Off
; 0000 00D6 // Bit7 slew rate limitation: Off
; 0000 00D7 PORTB.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1591,R30
; 0000 00D8 // Interrupt 0 level: Disabled
; 0000 00D9 // Interrupt 1 level: Disabled
; 0000 00DA PORTB.INTCTRL=(PORTB.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 00DB 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1577
	ANDI R30,LOW(0xF0)
	STS  1577,R30
; 0000 00DC // Bit0 pin change interrupt 0: Off
; 0000 00DD // Bit1 pin change interrupt 0: Off
; 0000 00DE // Bit2 pin change interrupt 0: Off
; 0000 00DF // Bit3 pin change interrupt 0: Off
; 0000 00E0 // Bit4 pin change interrupt 0: Off
; 0000 00E1 // Bit5 pin change interrupt 0: Off
; 0000 00E2 // Bit6 pin change interrupt 0: Off
; 0000 00E3 // Bit7 pin change interrupt 0: Off
; 0000 00E4 PORTB.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1578,R30
; 0000 00E5 // Bit0 pin change interrupt 1: Off
; 0000 00E6 // Bit1 pin change interrupt 1: Off
; 0000 00E7 // Bit2 pin change interrupt 1: Off
; 0000 00E8 // Bit3 pin change interrupt 1: Off
; 0000 00E9 // Bit4 pin change interrupt 1: Off
; 0000 00EA // Bit5 pin change interrupt 1: Off
; 0000 00EB // Bit6 pin change interrupt 1: Off
; 0000 00EC // Bit7 pin change interrupt 1: Off
; 0000 00ED PORTB.INT1MASK=0x00;
	STS  1579,R30
; 0000 00EE 
; 0000 00EF // PORTC initialization
; 0000 00F0 // OUT register
; 0000 00F1 PORTC.OUT=0x08;
	LDI  R30,LOW(8)
	STS  1604,R30
; 0000 00F2 // Bit0: Input
; 0000 00F3 // Bit1: Input
; 0000 00F4 // Bit2: Input
; 0000 00F5 // Bit3: Output
; 0000 00F6 // Bit4: Input
; 0000 00F7 // Bit5: Input
; 0000 00F8 // Bit6: Input
; 0000 00F9 // Bit7: Input
; 0000 00FA PORTC.DIR=0x08;
	STS  1600,R30
; 0000 00FB // Bit0 Output/Pull configuration: Totempole/No
; 0000 00FC // Bit0 Input/Sense configuration: Sense both edges
; 0000 00FD // Bit0 inverted: Off
; 0000 00FE // Bit0 slew rate limitation: Off
; 0000 00FF PORTC.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	LDI  R30,LOW(0)
	STS  1616,R30
; 0000 0100 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0101 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0102 // Bit1 inverted: Off
; 0000 0103 // Bit1 slew rate limitation: Off
; 0000 0104 PORTC.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1617,R30
; 0000 0105 // Bit2 Output/Pull configuration: Totempole/No
; 0000 0106 // Bit2 Input/Sense configuration: Sense both edges
; 0000 0107 // Bit2 inverted: Off
; 0000 0108 // Bit2 slew rate limitation: Off
; 0000 0109 PORTC.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1618,R30
; 0000 010A // Bit3 Output/Pull configuration: Totempole/No
; 0000 010B // Bit3 Input/Sense configuration: Sense both edges
; 0000 010C // Bit3 inverted: Off
; 0000 010D // Bit3 slew rate limitation: Off
; 0000 010E PORTC.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1619,R30
; 0000 010F // Bit4 Output/Pull configuration: Totempole/No
; 0000 0110 // Bit4 Input/Sense configuration: Sense both edges
; 0000 0111 // Bit4 inverted: Off
; 0000 0112 // Bit4 slew rate limitation: Off
; 0000 0113 PORTC.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1620,R30
; 0000 0114 // Bit5 Output/Pull configuration: Totempole/No
; 0000 0115 // Bit5 Input/Sense configuration: Sense both edges
; 0000 0116 // Bit5 inverted: Off
; 0000 0117 // Bit5 slew rate limitation: Off
; 0000 0118 PORTC.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1621,R30
; 0000 0119 // Bit6 Output/Pull configuration: Totempole/No
; 0000 011A // Bit6 Input/Sense configuration: Sense both edges
; 0000 011B // Bit6 inverted: Off
; 0000 011C // Bit6 slew rate limitation: Off
; 0000 011D PORTC.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1622,R30
; 0000 011E // Bit7 Output/Pull configuration: Totempole/No
; 0000 011F // Bit7 Input/Sense configuration: Sense both edges
; 0000 0120 // Bit7 inverted: Off
; 0000 0121 // Bit7 slew rate limitation: Off
; 0000 0122 PORTC.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1623,R30
; 0000 0123 // Interrupt 0 level: Disabled
; 0000 0124 // Interrupt 1 level: Disabled
; 0000 0125 PORTC.INTCTRL=(PORTC.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0126 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1609
	ANDI R30,LOW(0xF0)
	STS  1609,R30
; 0000 0127 // Bit0 pin change interrupt 0: Off
; 0000 0128 // Bit1 pin change interrupt 0: Off
; 0000 0129 // Bit2 pin change interrupt 0: Off
; 0000 012A // Bit3 pin change interrupt 0: Off
; 0000 012B // Bit4 pin change interrupt 0: Off
; 0000 012C // Bit5 pin change interrupt 0: Off
; 0000 012D // Bit6 pin change interrupt 0: Off
; 0000 012E // Bit7 pin change interrupt 0: Off
; 0000 012F PORTC.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1610,R30
; 0000 0130 // Bit0 pin change interrupt 1: Off
; 0000 0131 // Bit1 pin change interrupt 1: Off
; 0000 0132 // Bit2 pin change interrupt 1: Off
; 0000 0133 // Bit3 pin change interrupt 1: Off
; 0000 0134 // Bit4 pin change interrupt 1: Off
; 0000 0135 // Bit5 pin change interrupt 1: Off
; 0000 0136 // Bit6 pin change interrupt 1: Off
; 0000 0137 // Bit7 pin change interrupt 1: Off
; 0000 0138 PORTC.INT1MASK=0x00;
	STS  1611,R30
; 0000 0139 
; 0000 013A // PORTD initialization
; 0000 013B // OUT register
; 0000 013C PORTD.OUT=0x08;
	LDI  R30,LOW(8)
	STS  1636,R30
; 0000 013D // Bit0: Input
; 0000 013E // Bit1: Input
; 0000 013F // Bit2: Input
; 0000 0140 // Bit3: Output
; 0000 0141 // Bit4: Input
; 0000 0142 // Bit5: Input
; 0000 0143 // Bit6: Input
; 0000 0144 // Bit7: Input
; 0000 0145 PORTD.DIR=0x08;
	STS  1632,R30
; 0000 0146 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0147 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0148 // Bit0 inverted: Off
; 0000 0149 // Bit0 slew rate limitation: Off
; 0000 014A PORTD.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	LDI  R30,LOW(0)
	STS  1648,R30
; 0000 014B // Bit1 Output/Pull configuration: Totempole/No
; 0000 014C // Bit1 Input/Sense configuration: Sense both edges
; 0000 014D // Bit1 inverted: Off
; 0000 014E // Bit1 slew rate limitation: Off
; 0000 014F PORTD.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1649,R30
; 0000 0150 // Bit2 Output/Pull configuration: Totempole/No
; 0000 0151 // Bit2 Input/Sense configuration: Sense both edges
; 0000 0152 // Bit2 inverted: Off
; 0000 0153 // Bit2 slew rate limitation: Off
; 0000 0154 PORTD.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1650,R30
; 0000 0155 // Bit3 Output/Pull configuration: Totempole/No
; 0000 0156 // Bit3 Input/Sense configuration: Sense both edges
; 0000 0157 // Bit3 inverted: Off
; 0000 0158 // Bit3 slew rate limitation: Off
; 0000 0159 PORTD.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1651,R30
; 0000 015A // Bit4 Output/Pull configuration: Totempole/No
; 0000 015B // Bit4 Input/Sense configuration: Sense both edges
; 0000 015C // Bit4 inverted: Off
; 0000 015D // Bit4 slew rate limitation: Off
; 0000 015E PORTD.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1652,R30
; 0000 015F // Bit5 Output/Pull configuration: Totempole/No
; 0000 0160 // Bit5 Input/Sense configuration: Sense both edges
; 0000 0161 // Bit5 inverted: Off
; 0000 0162 // Bit5 slew rate limitation: Off
; 0000 0163 PORTD.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1653,R30
; 0000 0164 // Bit6 Output/Pull configuration: Totempole/No
; 0000 0165 // Bit6 Input/Sense configuration: Sense both edges
; 0000 0166 // Bit6 inverted: Off
; 0000 0167 // Bit6 slew rate limitation: Off
; 0000 0168 PORTD.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1654,R30
; 0000 0169 // Bit7 Output/Pull configuration: Totempole/No
; 0000 016A // Bit7 Input/Sense configuration: Sense both edges
; 0000 016B // Bit7 inverted: Off
; 0000 016C // Bit7 slew rate limitation: Off
; 0000 016D PORTD.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1655,R30
; 0000 016E // Interrupt 0 level: Disabled
; 0000 016F // Interrupt 1 level: Disabled
; 0000 0170 PORTD.INTCTRL=(PORTD.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0171 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1641
	ANDI R30,LOW(0xF0)
	STS  1641,R30
; 0000 0172 // Bit0 pin change interrupt 0: Off
; 0000 0173 // Bit1 pin change interrupt 0: Off
; 0000 0174 // Bit2 pin change interrupt 0: Off
; 0000 0175 // Bit3 pin change interrupt 0: Off
; 0000 0176 // Bit4 pin change interrupt 0: Off
; 0000 0177 // Bit5 pin change interrupt 0: Off
; 0000 0178 // Bit6 pin change interrupt 0: Off
; 0000 0179 // Bit7 pin change interrupt 0: Off
; 0000 017A PORTD.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1642,R30
; 0000 017B // Bit0 pin change interrupt 1: Off
; 0000 017C // Bit1 pin change interrupt 1: Off
; 0000 017D // Bit2 pin change interrupt 1: Off
; 0000 017E // Bit3 pin change interrupt 1: Off
; 0000 017F // Bit4 pin change interrupt 1: Off
; 0000 0180 // Bit5 pin change interrupt 1: Off
; 0000 0181 // Bit6 pin change interrupt 1: Off
; 0000 0182 // Bit7 pin change interrupt 1: Off
; 0000 0183 PORTD.INT1MASK=0x00;
	STS  1643,R30
; 0000 0184 
; 0000 0185 // PORTE initialization
; 0000 0186 // OUT register
; 0000 0187 PORTE.OUT=0x00;
	STS  1668,R30
; 0000 0188 // Bit0: Input
; 0000 0189 // Bit1: Input
; 0000 018A // Bit2: Input
; 0000 018B // Bit3: Input
; 0000 018C // Bit4: Input
; 0000 018D // Bit5: Input
; 0000 018E // Bit6: Input
; 0000 018F // Bit7: Input
; 0000 0190 PORTE.DIR=0x00;
	STS  1664,R30
; 0000 0191 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0192 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0193 // Bit0 inverted: Off
; 0000 0194 // Bit0 slew rate limitation: Off
; 0000 0195 PORTE.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1680,R30
; 0000 0196 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0197 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0198 // Bit1 inverted: Off
; 0000 0199 // Bit1 slew rate limitation: Off
; 0000 019A PORTE.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1681,R30
; 0000 019B // Bit2 Output/Pull configuration: Totempole/No
; 0000 019C // Bit2 Input/Sense configuration: Sense both edges
; 0000 019D // Bit2 inverted: Off
; 0000 019E // Bit2 slew rate limitation: Off
; 0000 019F PORTE.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1682,R30
; 0000 01A0 // Bit3 Output/Pull configuration: Totempole/No
; 0000 01A1 // Bit3 Input/Sense configuration: Sense both edges
; 0000 01A2 // Bit3 inverted: Off
; 0000 01A3 // Bit3 slew rate limitation: Off
; 0000 01A4 PORTE.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1683,R30
; 0000 01A5 // Bit4 Output/Pull configuration: Totempole/No
; 0000 01A6 // Bit4 Input/Sense configuration: Sense both edges
; 0000 01A7 // Bit4 inverted: Off
; 0000 01A8 // Bit4 slew rate limitation: Off
; 0000 01A9 PORTE.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1684,R30
; 0000 01AA // Bit5 Output/Pull configuration: Totempole/No
; 0000 01AB // Bit5 Input/Sense configuration: Sense both edges
; 0000 01AC // Bit5 inverted: Off
; 0000 01AD // Bit5 slew rate limitation: Off
; 0000 01AE PORTE.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1685,R30
; 0000 01AF // Bit6 Output/Pull configuration: Totempole/No
; 0000 01B0 // Bit6 Input/Sense configuration: Sense both edges
; 0000 01B1 // Bit6 inverted: Off
; 0000 01B2 // Bit6 slew rate limitation: Off
; 0000 01B3 PORTE.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1686,R30
; 0000 01B4 // Bit7 Output/Pull configuration: Totempole/No
; 0000 01B5 // Bit7 Input/Sense configuration: Sense both edges
; 0000 01B6 // Bit7 inverted: Off
; 0000 01B7 // Bit7 slew rate limitation: Off
; 0000 01B8 PORTE.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1687,R30
; 0000 01B9 // Interrupt 0 level: Disabled
; 0000 01BA // Interrupt 1 level: Disabled
; 0000 01BB PORTE.INTCTRL=(PORTE.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 01BC 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1673
	ANDI R30,LOW(0xF0)
	STS  1673,R30
; 0000 01BD // Bit0 pin change interrupt 0: Off
; 0000 01BE // Bit1 pin change interrupt 0: Off
; 0000 01BF // Bit2 pin change interrupt 0: Off
; 0000 01C0 // Bit3 pin change interrupt 0: Off
; 0000 01C1 // Bit4 pin change interrupt 0: Off
; 0000 01C2 // Bit5 pin change interrupt 0: Off
; 0000 01C3 // Bit6 pin change interrupt 0: Off
; 0000 01C4 // Bit7 pin change interrupt 0: Off
; 0000 01C5 PORTE.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1674,R30
; 0000 01C6 // Bit0 pin change interrupt 1: Off
; 0000 01C7 // Bit1 pin change interrupt 1: Off
; 0000 01C8 // Bit2 pin change interrupt 1: Off
; 0000 01C9 // Bit3 pin change interrupt 1: Off
; 0000 01CA // Bit4 pin change interrupt 1: Off
; 0000 01CB // Bit5 pin change interrupt 1: Off
; 0000 01CC // Bit6 pin change interrupt 1: Off
; 0000 01CD // Bit7 pin change interrupt 1: Off
; 0000 01CE PORTE.INT1MASK=0x00;
	STS  1675,R30
; 0000 01CF 
; 0000 01D0 // PORTF initialization
; 0000 01D1 // OUT register
; 0000 01D2 PORTF.OUT=0x00;
	STS  1700,R30
; 0000 01D3 // Bit0: Input
; 0000 01D4 // Bit1: Input
; 0000 01D5 // Bit2: Input
; 0000 01D6 // Bit3: Input
; 0000 01D7 // Bit4: Input
; 0000 01D8 // Bit5: Input
; 0000 01D9 // Bit6: Input
; 0000 01DA // Bit7: Input
; 0000 01DB PORTF.DIR=0x00;
	STS  1696,R30
; 0000 01DC // Bit0 Output/Pull configuration: Totempole/No
; 0000 01DD // Bit0 Input/Sense configuration: Sense both edges
; 0000 01DE // Bit0 inverted: Off
; 0000 01DF // Bit0 slew rate limitation: Off
; 0000 01E0 PORTF.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1712,R30
; 0000 01E1 // Bit1 Output/Pull configuration: Totempole/No
; 0000 01E2 // Bit1 Input/Sense configuration: Sense both edges
; 0000 01E3 // Bit1 inverted: Off
; 0000 01E4 // Bit1 slew rate limitation: Off
; 0000 01E5 PORTF.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1713,R30
; 0000 01E6 // Bit2 Output/Pull configuration: Totempole/No
; 0000 01E7 // Bit2 Input/Sense configuration: Sense both edges
; 0000 01E8 // Bit2 inverted: Off
; 0000 01E9 // Bit2 slew rate limitation: Off
; 0000 01EA PORTF.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1714,R30
; 0000 01EB // Bit3 Output/Pull configuration: Totempole/No
; 0000 01EC // Bit3 Input/Sense configuration: Sense both edges
; 0000 01ED // Bit3 inverted: Off
; 0000 01EE // Bit3 slew rate limitation: Off
; 0000 01EF PORTF.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1715,R30
; 0000 01F0 // Bit4 Output/Pull configuration: Totempole/No
; 0000 01F1 // Bit4 Input/Sense configuration: Sense both edges
; 0000 01F2 // Bit4 inverted: Off
; 0000 01F3 // Bit4 slew rate limitation: Off
; 0000 01F4 PORTF.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1716,R30
; 0000 01F5 // Bit5 Output/Pull configuration: Totempole/No
; 0000 01F6 // Bit5 Input/Sense configuration: Sense both edges
; 0000 01F7 // Bit5 inverted: Off
; 0000 01F8 // Bit5 slew rate limitation: Off
; 0000 01F9 PORTF.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1717,R30
; 0000 01FA // Bit6 Output/Pull configuration: Totempole/No
; 0000 01FB // Bit6 Input/Sense configuration: Sense both edges
; 0000 01FC // Bit6 inverted: Off
; 0000 01FD // Bit6 slew rate limitation: Off
; 0000 01FE PORTF.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1718,R30
; 0000 01FF // Bit7 Output/Pull configuration: Totempole/No
; 0000 0200 // Bit7 Input/Sense configuration: Sense both edges
; 0000 0201 // Bit7 inverted: Off
; 0000 0202 // Bit7 slew rate limitation: Off
; 0000 0203 PORTF.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1719,R30
; 0000 0204 // Interrupt 0 level: Disabled
; 0000 0205 // Interrupt 1 level: Disabled
; 0000 0206 PORTF.INTCTRL=(PORTF.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0207 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1705
	ANDI R30,LOW(0xF0)
	STS  1705,R30
; 0000 0208 // Bit0 pin change interrupt 0: Off
; 0000 0209 // Bit1 pin change interrupt 0: Off
; 0000 020A // Bit2 pin change interrupt 0: Off
; 0000 020B // Bit3 pin change interrupt 0: Off
; 0000 020C // Bit4 pin change interrupt 0: Off
; 0000 020D // Bit5 pin change interrupt 0: Off
; 0000 020E // Bit6 pin change interrupt 0: Off
; 0000 020F // Bit7 pin change interrupt 0: Off
; 0000 0210 PORTF.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1706,R30
; 0000 0211 // Bit0 pin change interrupt 1: Off
; 0000 0212 // Bit1 pin change interrupt 1: Off
; 0000 0213 // Bit2 pin change interrupt 1: Off
; 0000 0214 // Bit3 pin change interrupt 1: Off
; 0000 0215 // Bit4 pin change interrupt 1: Off
; 0000 0216 // Bit5 pin change interrupt 1: Off
; 0000 0217 // Bit6 pin change interrupt 1: Off
; 0000 0218 // Bit7 pin change interrupt 1: Off
; 0000 0219 PORTF.INT1MASK=0x00;
	STS  1707,R30
; 0000 021A 
; 0000 021B // PORTH initialization
; 0000 021C // OUT register
; 0000 021D PORTH.OUT=0x00;
	STS  1764,R30
; 0000 021E // Bit0: Input
; 0000 021F // Bit1: Input
; 0000 0220 // Bit2: Input
; 0000 0221 // Bit3: Input
; 0000 0222 // Bit4: Input
; 0000 0223 // Bit5: Input
; 0000 0224 // Bit6: Input
; 0000 0225 // Bit7: Input
; 0000 0226 PORTH.DIR=0x00;
	STS  1760,R30
; 0000 0227 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0228 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0229 // Bit0 inverted: Off
; 0000 022A // Bit0 slew rate limitation: Off
; 0000 022B PORTH.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1776,R30
; 0000 022C // Bit1 Output/Pull configuration: Totempole/No
; 0000 022D // Bit1 Input/Sense configuration: Sense both edges
; 0000 022E // Bit1 inverted: Off
; 0000 022F // Bit1 slew rate limitation: Off
; 0000 0230 PORTH.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1777,R30
; 0000 0231 // Bit2 Output/Pull configuration: Totempole/No
; 0000 0232 // Bit2 Input/Sense configuration: Sense both edges
; 0000 0233 // Bit2 inverted: Off
; 0000 0234 // Bit2 slew rate limitation: Off
; 0000 0235 PORTH.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1778,R30
; 0000 0236 // Bit3 Output/Pull configuration: Totempole/No
; 0000 0237 // Bit3 Input/Sense configuration: Sense both edges
; 0000 0238 // Bit3 inverted: Off
; 0000 0239 // Bit3 slew rate limitation: Off
; 0000 023A PORTH.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1779,R30
; 0000 023B // Bit4 Output/Pull configuration: Totempole/No
; 0000 023C // Bit4 Input/Sense configuration: Sense both edges
; 0000 023D // Bit4 inverted: Off
; 0000 023E // Bit4 slew rate limitation: Off
; 0000 023F PORTH.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1780,R30
; 0000 0240 // Bit5 Output/Pull configuration: Totempole/No
; 0000 0241 // Bit5 Input/Sense configuration: Sense both edges
; 0000 0242 // Bit5 inverted: Off
; 0000 0243 // Bit5 slew rate limitation: Off
; 0000 0244 PORTH.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1781,R30
; 0000 0245 // Bit6 Output/Pull configuration: Totempole/No
; 0000 0246 // Bit6 Input/Sense configuration: Sense both edges
; 0000 0247 // Bit6 inverted: Off
; 0000 0248 // Bit6 slew rate limitation: Off
; 0000 0249 PORTH.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1782,R30
; 0000 024A // Bit7 Output/Pull configuration: Totempole/No
; 0000 024B // Bit7 Input/Sense configuration: Sense both edges
; 0000 024C // Bit7 inverted: Off
; 0000 024D // Bit7 slew rate limitation: Off
; 0000 024E PORTH.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1783,R30
; 0000 024F // Interrupt 0 level: Disabled
; 0000 0250 // Interrupt 1 level: Disabled
; 0000 0251 PORTH.INTCTRL=(PORTH.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 0252 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1769
	ANDI R30,LOW(0xF0)
	STS  1769,R30
; 0000 0253 // Bit0 pin change interrupt 0: Off
; 0000 0254 // Bit1 pin change interrupt 0: Off
; 0000 0255 // Bit2 pin change interrupt 0: Off
; 0000 0256 // Bit3 pin change interrupt 0: Off
; 0000 0257 // Bit4 pin change interrupt 0: Off
; 0000 0258 // Bit5 pin change interrupt 0: Off
; 0000 0259 // Bit6 pin change interrupt 0: Off
; 0000 025A // Bit7 pin change interrupt 0: Off
; 0000 025B PORTH.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1770,R30
; 0000 025C // Bit0 pin change interrupt 1: Off
; 0000 025D // Bit1 pin change interrupt 1: Off
; 0000 025E // Bit2 pin change interrupt 1: Off
; 0000 025F // Bit3 pin change interrupt 1: Off
; 0000 0260 // Bit4 pin change interrupt 1: Off
; 0000 0261 // Bit5 pin change interrupt 1: Off
; 0000 0262 // Bit6 pin change interrupt 1: Off
; 0000 0263 // Bit7 pin change interrupt 1: Off
; 0000 0264 PORTH.INT1MASK=0x00;
	STS  1771,R30
; 0000 0265 
; 0000 0266 // PORTJ initialization
; 0000 0267 // OUT register
; 0000 0268 PORTJ.OUT=0x00;
	STS  1796,R30
; 0000 0269 // Bit0: Input
; 0000 026A // Bit1: Input
; 0000 026B // Bit2: Input
; 0000 026C // Bit3: Input
; 0000 026D // Bit4: Input
; 0000 026E // Bit5: Input
; 0000 026F // Bit6: Input
; 0000 0270 // Bit7: Input
; 0000 0271 PORTJ.DIR=0x00;
	STS  1792,R30
; 0000 0272 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0273 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0274 // Bit0 inverted: Off
; 0000 0275 // Bit0 slew rate limitation: Off
; 0000 0276 PORTJ.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1808,R30
; 0000 0277 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0278 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0279 // Bit1 inverted: Off
; 0000 027A // Bit1 slew rate limitation: Off
; 0000 027B PORTJ.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1809,R30
; 0000 027C // Bit2 Output/Pull configuration: Totempole/No
; 0000 027D // Bit2 Input/Sense configuration: Sense both edges
; 0000 027E // Bit2 inverted: Off
; 0000 027F // Bit2 slew rate limitation: Off
; 0000 0280 PORTJ.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1810,R30
; 0000 0281 // Bit3 Output/Pull configuration: Totempole/No
; 0000 0282 // Bit3 Input/Sense configuration: Sense both edges
; 0000 0283 // Bit3 inverted: Off
; 0000 0284 // Bit3 slew rate limitation: Off
; 0000 0285 PORTJ.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1811,R30
; 0000 0286 // Bit4 Output/Pull configuration: Totempole/No
; 0000 0287 // Bit4 Input/Sense configuration: Sense both edges
; 0000 0288 // Bit4 inverted: Off
; 0000 0289 // Bit4 slew rate limitation: Off
; 0000 028A PORTJ.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1812,R30
; 0000 028B // Bit5 Output/Pull configuration: Totempole/No
; 0000 028C // Bit5 Input/Sense configuration: Sense both edges
; 0000 028D // Bit5 inverted: Off
; 0000 028E // Bit5 slew rate limitation: Off
; 0000 028F PORTJ.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1813,R30
; 0000 0290 // Bit6 Output/Pull configuration: Totempole/No
; 0000 0291 // Bit6 Input/Sense configuration: Sense both edges
; 0000 0292 // Bit6 inverted: Off
; 0000 0293 // Bit6 slew rate limitation: Off
; 0000 0294 PORTJ.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1814,R30
; 0000 0295 // Bit7 Output/Pull configuration: Totempole/No
; 0000 0296 // Bit7 Input/Sense configuration: Sense both edges
; 0000 0297 // Bit7 inverted: Off
; 0000 0298 // Bit7 slew rate limitation: Off
; 0000 0299 PORTJ.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1815,R30
; 0000 029A // Interrupt 0 level: Disabled
; 0000 029B // Interrupt 1 level: Disabled
; 0000 029C PORTJ.INTCTRL=(PORTJ.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 029D 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1801
	ANDI R30,LOW(0xF0)
	STS  1801,R30
; 0000 029E // Bit0 pin change interrupt 0: Off
; 0000 029F // Bit1 pin change interrupt 0: Off
; 0000 02A0 // Bit2 pin change interrupt 0: Off
; 0000 02A1 // Bit3 pin change interrupt 0: Off
; 0000 02A2 // Bit4 pin change interrupt 0: Off
; 0000 02A3 // Bit5 pin change interrupt 0: Off
; 0000 02A4 // Bit6 pin change interrupt 0: Off
; 0000 02A5 // Bit7 pin change interrupt 0: Off
; 0000 02A6 PORTJ.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1802,R30
; 0000 02A7 // Bit0 pin change interrupt 1: Off
; 0000 02A8 // Bit1 pin change interrupt 1: Off
; 0000 02A9 // Bit2 pin change interrupt 1: Off
; 0000 02AA // Bit3 pin change interrupt 1: Off
; 0000 02AB // Bit4 pin change interrupt 1: Off
; 0000 02AC // Bit5 pin change interrupt 1: Off
; 0000 02AD // Bit6 pin change interrupt 1: Off
; 0000 02AE // Bit7 pin change interrupt 1: Off
; 0000 02AF PORTJ.INT1MASK=0x00;
	STS  1803,R30
; 0000 02B0 
; 0000 02B1 // PORTK initialization
; 0000 02B2 // OUT register
; 0000 02B3 PORTK.OUT=0x00;
	STS  1828,R30
; 0000 02B4 // Bit0: Input
; 0000 02B5 // Bit1: Input
; 0000 02B6 // Bit2: Input
; 0000 02B7 // Bit3: Input
; 0000 02B8 // Bit4: Input
; 0000 02B9 // Bit5: Input
; 0000 02BA // Bit6: Input
; 0000 02BB // Bit7: Input
; 0000 02BC PORTK.DIR=0x00;
	STS  1824,R30
; 0000 02BD // Bit0 Output/Pull configuration: Totempole/No
; 0000 02BE // Bit0 Input/Sense configuration: Sense both edges
; 0000 02BF // Bit0 inverted: Off
; 0000 02C0 // Bit0 slew rate limitation: Off
; 0000 02C1 PORTK.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1840,R30
; 0000 02C2 // Bit1 Output/Pull configuration: Totempole/No
; 0000 02C3 // Bit1 Input/Sense configuration: Sense both edges
; 0000 02C4 // Bit1 inverted: Off
; 0000 02C5 // Bit1 slew rate limitation: Off
; 0000 02C6 PORTK.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1841,R30
; 0000 02C7 // Bit2 Output/Pull configuration: Totempole/No
; 0000 02C8 // Bit2 Input/Sense configuration: Sense both edges
; 0000 02C9 // Bit2 inverted: Off
; 0000 02CA // Bit2 slew rate limitation: Off
; 0000 02CB PORTK.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1842,R30
; 0000 02CC // Bit3 Output/Pull configuration: Totempole/No
; 0000 02CD // Bit3 Input/Sense configuration: Sense both edges
; 0000 02CE // Bit3 inverted: Off
; 0000 02CF // Bit3 slew rate limitation: Off
; 0000 02D0 PORTK.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1843,R30
; 0000 02D1 // Bit4 Output/Pull configuration: Totempole/No
; 0000 02D2 // Bit4 Input/Sense configuration: Sense both edges
; 0000 02D3 // Bit4 inverted: Off
; 0000 02D4 // Bit4 slew rate limitation: Off
; 0000 02D5 PORTK.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1844,R30
; 0000 02D6 // Bit5 Output/Pull configuration: Totempole/No
; 0000 02D7 // Bit5 Input/Sense configuration: Sense both edges
; 0000 02D8 // Bit5 inverted: Off
; 0000 02D9 // Bit5 slew rate limitation: Off
; 0000 02DA PORTK.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1845,R30
; 0000 02DB // Bit6 Output/Pull configuration: Totempole/No
; 0000 02DC // Bit6 Input/Sense configuration: Sense both edges
; 0000 02DD // Bit6 inverted: Off
; 0000 02DE // Bit6 slew rate limitation: Off
; 0000 02DF PORTK.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1846,R30
; 0000 02E0 // Bit7 Output/Pull configuration: Totempole/No
; 0000 02E1 // Bit7 Input/Sense configuration: Sense both edges
; 0000 02E2 // Bit7 inverted: Off
; 0000 02E3 // Bit7 slew rate limitation: Off
; 0000 02E4 PORTK.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  1847,R30
; 0000 02E5 // Interrupt 0 level: Disabled
; 0000 02E6 // Interrupt 1 level: Disabled
; 0000 02E7 PORTK.INTCTRL=(PORTK.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 02E8 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1833
	ANDI R30,LOW(0xF0)
	STS  1833,R30
; 0000 02E9 // Bit0 pin change interrupt 0: Off
; 0000 02EA // Bit1 pin change interrupt 0: Off
; 0000 02EB // Bit2 pin change interrupt 0: Off
; 0000 02EC // Bit3 pin change interrupt 0: Off
; 0000 02ED // Bit4 pin change interrupt 0: Off
; 0000 02EE // Bit5 pin change interrupt 0: Off
; 0000 02EF // Bit6 pin change interrupt 0: Off
; 0000 02F0 // Bit7 pin change interrupt 0: Off
; 0000 02F1 PORTK.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1834,R30
; 0000 02F2 // Bit0 pin change interrupt 1: Off
; 0000 02F3 // Bit1 pin change interrupt 1: Off
; 0000 02F4 // Bit2 pin change interrupt 1: Off
; 0000 02F5 // Bit3 pin change interrupt 1: Off
; 0000 02F6 // Bit4 pin change interrupt 1: Off
; 0000 02F7 // Bit5 pin change interrupt 1: Off
; 0000 02F8 // Bit6 pin change interrupt 1: Off
; 0000 02F9 // Bit7 pin change interrupt 1: Off
; 0000 02FA PORTK.INT1MASK=0x00;
	STS  1835,R30
; 0000 02FB 
; 0000 02FC // PORTQ initialization
; 0000 02FD // OUT register
; 0000 02FE PORTQ.OUT=0x00;
	STS  1988,R30
; 0000 02FF // Bit0: Input
; 0000 0300 // Bit1: Input
; 0000 0301 // Bit2: Input
; 0000 0302 // Bit3: Input
; 0000 0303 PORTQ.DIR=0x00;
	STS  1984,R30
; 0000 0304 // Bit0 Output/Pull configuration: Totempole/No
; 0000 0305 // Bit0 Input/Sense configuration: Sense both edges
; 0000 0306 // Bit0 inverted: Off
; 0000 0307 // Bit0 slew rate limitation: Off
; 0000 0308 PORTQ.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2000,R30
; 0000 0309 // Bit1 Output/Pull configuration: Totempole/No
; 0000 030A // Bit1 Input/Sense configuration: Sense both edges
; 0000 030B // Bit1 inverted: Off
; 0000 030C // Bit1 slew rate limitation: Off
; 0000 030D PORTQ.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2001,R30
; 0000 030E // Bit2 Output/Pull configuration: Totempole/No
; 0000 030F // Bit2 Input/Sense configuration: Sense both edges
; 0000 0310 // Bit2 inverted: Off
; 0000 0311 // Bit2 slew rate limitation: Off
; 0000 0312 PORTQ.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2002,R30
; 0000 0313 // Bit3 Output/Pull configuration: Totempole/No
; 0000 0314 // Bit3 Input/Sense configuration: Sense both edges
; 0000 0315 // Bit3 inverted: Off
; 0000 0316 // Bit3 slew rate limitation: Off
; 0000 0317 PORTQ.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2003,R30
; 0000 0318 // Interrupt 0 level: Disabled
; 0000 0319 // Interrupt 1 level: Disabled
; 0000 031A PORTQ.INTCTRL=(PORTQ.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 031B 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,1993
	ANDI R30,LOW(0xF0)
	STS  1993,R30
; 0000 031C // Bit0 pin change interrupt 0: Off
; 0000 031D // Bit1 pin change interrupt 0: Off
; 0000 031E // Bit2 pin change interrupt 0: Off
; 0000 031F // Bit3 pin change interrupt 0: Off
; 0000 0320 PORTQ.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  1994,R30
; 0000 0321 // Bit0 pin change interrupt 1: Off
; 0000 0322 // Bit1 pin change interrupt 1: Off
; 0000 0323 // Bit2 pin change interrupt 1: Off
; 0000 0324 // Bit3 pin change interrupt 1: Off
; 0000 0325 PORTQ.INT1MASK=0x00;
	STS  1995,R30
; 0000 0326 
; 0000 0327 // PORTR initialization
; 0000 0328 // OUT register
; 0000 0329 PORTR.OUT=0x00;
	STS  2020,R30
; 0000 032A // Bit0: Input
; 0000 032B // Bit1: Input
; 0000 032C PORTR.DIR=0x00;
	STS  2016,R30
; 0000 032D // Bit0 Output/Pull configuration: Totempole/No
; 0000 032E // Bit0 Input/Sense configuration: Sense both edges
; 0000 032F // Bit0 inverted: Off
; 0000 0330 // Bit0 slew rate limitation: Off
; 0000 0331 PORTR.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2032,R30
; 0000 0332 // Bit1 Output/Pull configuration: Totempole/No
; 0000 0333 // Bit1 Input/Sense configuration: Sense both edges
; 0000 0334 // Bit1 inverted: Off
; 0000 0335 // Bit1 slew rate limitation: Off
; 0000 0336 PORTR.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
	STS  2033,R30
; 0000 0337 // Interrupt 0 level: Disabled
; 0000 0338 // Interrupt 1 level: Disabled
; 0000 0339 PORTR.INTCTRL=(PORTR.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
; 0000 033A 	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
	LDS  R30,2025
	ANDI R30,LOW(0xF0)
	STS  2025,R30
; 0000 033B // Bit0 pin change interrupt 0: Off
; 0000 033C // Bit1 pin change interrupt 0: Off
; 0000 033D PORTR.INT0MASK=0x00;
	LDI  R30,LOW(0)
	STS  2026,R30
; 0000 033E // Bit0 pin change interrupt 1: Off
; 0000 033F // Bit1 pin change interrupt 1: Off
; 0000 0340 PORTR.INT1MASK=0x00;
	STS  2027,R30
; 0000 0341 }
	RET
;
;// Virtual Ports initialization
;void vports_init(void)
; 0000 0345 {
_vports_init:
; 0000 0346 // PORTA mapped to VPORT0
; 0000 0347 // PORTB mapped to VPORT1
; 0000 0348 PORTCFG.VPCTRLA=PORTCFG_VP1MAP_PORTB_gc | PORTCFG_VP0MAP_PORTA_gc;
	LDI  R30,LOW(16)
	STS  178,R30
; 0000 0349 // PORTC mapped to VPORT2
; 0000 034A // PORTF mapped to VPORT3
; 0000 034B PORTCFG.VPCTRLB=PORTCFG_VP3MAP_PORTF_gc | PORTCFG_VP2MAP_PORTC_gc;
	LDI  R30,LOW(82)
	STS  179,R30
; 0000 034C }
	RET
;
;// Disable a Timer/Counter type 0
;void tc0_disable(TC0_t *ptc)
; 0000 0350 {
_tc0_disable:
; 0000 0351 // Timer/Counter off
; 0000 0352 ptc->CTRLA=(ptc->CTRLA & (~TC0_CLKSEL_gm)) | TC_CLKSEL_OFF_gc;
	ST   -Y,R27
	ST   -Y,R26
;	*ptc -> Y+0
	LD   R26,Y
	LDD  R27,Y+1
	LD   R30,X
	ANDI R30,LOW(0xF0)
	ST   X,R30
; 0000 0353 // Issue a reset command
; 0000 0354 ptc->CTRLFSET=TC_CMD_RESET_gc;
	ADIW R26,9
	LDI  R30,LOW(12)
	ST   X,R30
; 0000 0355 }
	RJMP _0x20A000C
;
;// Timer/Counter TCC0 initialization
;void tcc0_init(void)
; 0000 0359 {
_tcc0_init:
; 0000 035A unsigned char s;
; 0000 035B unsigned char n;
; 0000 035C 
; 0000 035D // Note: the correct PORTC direction for the Compare Channels outputs
; 0000 035E // is configured in the ports_init function
; 0000 035F 
; 0000 0360 // Save interrupts enabled/disabled state
; 0000 0361 s=SREG;
	ST   -Y,R17
	ST   -Y,R16
;	s -> R17
;	n -> R16
	IN   R17,63
; 0000 0362 // Disable interrupts
; 0000 0363 #asm("cli")
	cli
; 0000 0364 
; 0000 0365 // Disable and reset the timer/counter just to be sure
; 0000 0366 tc0_disable(&TCC0);
	LDI  R26,LOW(2048)
	LDI  R27,HIGH(2048)
	RCALL _tc0_disable
; 0000 0367 // Clock source: Peripheral Clock/1
; 0000 0368 TCC0.CTRLA=(TCC0.CTRLA & (~TC0_CLKSEL_gm)) | TC_CLKSEL_DIV1_gc;
	LDS  R30,2048
	ANDI R30,LOW(0xF0)
	ORI  R30,1
	STS  2048,R30
; 0000 0369 // Mode: Normal Operation, Overflow Int./Event on TOP
; 0000 036A // Compare/Capture on channel A: Off
; 0000 036B // Compare/Capture on channel B: Off
; 0000 036C // Compare/Capture on channel C: Off
; 0000 036D // Compare/Capture on channel D: Off
; 0000 036E TCC0.CTRLB=(TCC0.CTRLB & (~(TC0_CCAEN_bm | TC0_CCBEN_bm | TC0_CCCEN_bm | TC0_CCDEN_bm | TC0_WGMODE_gm))) |
; 0000 036F 	TC_WGMODE_NORMAL_gc;
	LDS  R30,2049
	ANDI R30,LOW(0x8)
	STS  2049,R30
; 0000 0370 
; 0000 0371 // Capture event source: None
; 0000 0372 // Capture event action: None
; 0000 0373 TCC0.CTRLD=(TCC0.CTRLD & (~(TC0_EVACT_gm | TC0_EVSEL_gm))) |
; 0000 0374 	TC_EVACT_OFF_gc | TC_EVSEL_OFF_gc;
	LDS  R30,2051
	ANDI R30,LOW(0x10)
	STS  2051,R30
; 0000 0375 
; 0000 0376 // Overflow interrupt: Low Level
; 0000 0377 // Error interrupt: Disabled
; 0000 0378 TCC0.INTCTRLA=(TCC0.INTCTRLA & (~(TC0_ERRINTLVL_gm | TC0_OVFINTLVL_gm))) |
; 0000 0379 	TC_ERRINTLVL_OFF_gc | TC_OVFINTLVL_LO_gc;
	LDS  R30,2054
	ANDI R30,LOW(0xF0)
	ORI  R30,1
	STS  2054,R30
; 0000 037A 
; 0000 037B // Compare/Capture channel A interrupt: Disabled
; 0000 037C // Compare/Capture channel B interrupt: Disabled
; 0000 037D // Compare/Capture channel C interrupt: Disabled
; 0000 037E // Compare/Capture channel D interrupt: Disabled
; 0000 037F TCC0.INTCTRLB=(TCC0.INTCTRLB & (~(TC0_CCDINTLVL_gm | TC0_CCCINTLVL_gm | TC0_CCBINTLVL_gm | TC0_CCAINTLVL_gm))) |
; 0000 0380 	TC_CCDINTLVL_OFF_gc | TC_CCCINTLVL_OFF_gc | TC_CCBINTLVL_OFF_gc | TC_CCAINTLVL_OFF_gc;
	LDS  R30,2055
	ANDI R30,LOW(0x0)
	STS  2055,R30
; 0000 0381 
; 0000 0382 // High resolution extension: Off
; 0000 0383 HIRESC.CTRL&= ~HIRES_HREN0_bm;
	LDS  R30,2192
	ANDI R30,0xFE
	STS  2192,R30
; 0000 0384 
; 0000 0385 // Advanced Waveform Extension initialization
; 0000 0386 // Optimize for speed
; 0000 0387 #pragma optsize-
; 0000 0388 // Disable locking the AWEX configuration registers just to be sure
; 0000 0389 n=MCU.AWEXLOCK & (~MCU_AWEXCLOCK_bm);
	LDS  R30,153
	ANDI R30,0xFE
	MOV  R16,R30
; 0000 038A CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0000 038B MCU.AWEXLOCK=n;
	STS  153,R16
; 0000 038C // Restore optimization for size if needed
; 0000 038D #pragma optsize_default
; 0000 038E 
; 0000 038F // Pattern generation: Off
; 0000 0390 // Dead time insertion: Off
; 0000 0391 AWEXC.CTRL&= ~(AWEX_PGM_bm | AWEX_CWCM_bm | AWEX_DTICCDEN_bm | AWEX_DTICCCEN_bm | AWEX_DTICCBEN_bm | AWEX_DTICCAEN_bm);
	LDS  R30,2176
	ANDI R30,LOW(0xC0)
	STS  2176,R30
; 0000 0392 
; 0000 0393 // Fault protection initialization
; 0000 0394 // Fault detection on OCD Break detection: On
; 0000 0395 // Fault detection restart mode: Latched Mode
; 0000 0396 // Fault detection action: None (Fault protection disabled)
; 0000 0397 AWEXC.FDCTRL=(AWEXC.FDCTRL & (~(AWEX_FDDBD_bm | AWEX_FDMODE_bm | AWEX_FDACT_gm))) |
; 0000 0398 	AWEX_FDACT_NONE_gc;
	LDS  R30,2179
	ANDI R30,LOW(0xE8)
	STS  2179,R30
; 0000 0399 // Fault detect events:
; 0000 039A // Event channel 0: Off
; 0000 039B // Event channel 1: Off
; 0000 039C // Event channel 2: Off
; 0000 039D // Event channel 3: Off
; 0000 039E // Event channel 4: Off
; 0000 039F // Event channel 5: Off
; 0000 03A0 // Event channel 6: Off
; 0000 03A1 // Event channel 7: Off
; 0000 03A2 AWEXC.FDEVMASK=0b00000000;
	LDI  R30,LOW(0)
	STS  2178,R30
; 0000 03A3 // Make sure the fault detect flag is cleared
; 0000 03A4 AWEXC.STATUS|=AWEXC.STATUS & AWEX_FDF_bm;
	LDI  R26,LOW(2180)
	LDI  R27,HIGH(2180)
	MOV  R0,R26
	LD   R26,X
	LDS  R30,2180
	ANDI R30,LOW(0x4)
	OR   R30,R26
	MOV  R26,R0
	ST   X,R30
; 0000 03A5 
; 0000 03A6 // Clear the interrupt flags
; 0000 03A7 TCC0.INTFLAGS=TCC0.INTFLAGS;
	LDS  R30,2060
	STS  2060,R30
; 0000 03A8 // Set counter register
; 0000 03A9 TCC0.CNT=0x0000;
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	STS  2080,R30
	STS  2080+1,R31
; 0000 03AA // Set period register
; 0000 03AB TCC0.PER=0x4E1F;
	LDI  R30,LOW(19999)
	LDI  R31,HIGH(19999)
	STS  2086,R30
	STS  2086+1,R31
; 0000 03AC // Set channel A Compare/Capture register
; 0000 03AD TCC0.CCA=0x0000;
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	STS  2088,R30
	STS  2088+1,R31
; 0000 03AE // Set channel B Compare/Capture register
; 0000 03AF TCC0.CCB=0x0000;
	STS  2090,R30
	STS  2090+1,R31
; 0000 03B0 // Set channel C Compare/Capture register
; 0000 03B1 TCC0.CCC=0x0000;
	STS  2092,R30
	STS  2092+1,R31
; 0000 03B2 // Set channel D Compare/Capture register
; 0000 03B3 TCC0.CCD=0x0000;
	STS  2094,R30
	STS  2094+1,R31
; 0000 03B4 
; 0000 03B5 // Restore interrupts enabled/disabled state
; 0000 03B6 SREG=s;
	OUT  0x3F,R17
; 0000 03B7 }
_0x20A000F:
	LD   R16,Y+
	LD   R17,Y+
	RET
;
;unsigned int ten_ms=0;
;// Timer/counter TCC0 Overflow/Underflow interrupt service routine
;interrupt [TCC0_OVF_vect] void tcc0_overflow_isr(void)
; 0000 03BC {
_tcc0_overflow_isr:
	CALL SUBOPT_0x0
; 0000 03BD // write your code here
; 0000 03BE     ten_ms++;
	MOVW R30,R2
	ADIW R30,1
	MOVW R2,R30
; 0000 03BF }
	RJMP _0xA6
;
;// RTC initialization
;void rtcxm_init(void)
; 0000 03C3 {
_rtcxm_init:
; 0000 03C4 unsigned char s;
; 0000 03C5 
; 0000 03C6 // RTC clock source: 1024 Hz from internal 32 kHz RC Oscillator
; 0000 03C7 // Internal 32 kHz RC oscillator initialization
; 0000 03C8 // Enable the internal 32 kHz RC oscillator
; 0000 03C9 OSC.CTRL|=OSC_RC32KEN_bm;
	ST   -Y,R17
;	s -> R17
	LDS  R30,80
	ORI  R30,4
	STS  80,R30
; 0000 03CA // Wait for the internal 32 kHz RC oscillator to stabilize
; 0000 03CB while ((OSC.STATUS & OSC_RC32KRDY_bm)==0);
_0x6:
	LDS  R30,81
	ANDI R30,LOW(0x4)
	BREQ _0x6
; 0000 03CC 
; 0000 03CD // Select the clock source and enable the RTC clock
; 0000 03CE CLK.RTCCTRL=(CLK.RTCCTRL & (~CLK_RTCSRC_gm)) | CLK_RTCSRC_RCOSC_gc | CLK_RTCEN_bm;
	LDS  R30,67
	ANDI R30,LOW(0xF1)
	ORI  R30,LOW(0x5)
	STS  67,R30
; 0000 03CF // Make sure that the RTC is stopped before initializing it
; 0000 03D0 RTC.CTRL=(RTC.CTRL & (~RTC_PRESCALER_gm)) | RTC_PRESCALER_OFF_gc;
	LDS  R30,1024
	ANDI R30,LOW(0xF8)
	STS  1024,R30
; 0000 03D1 
; 0000 03D2 // Optimize for speed
; 0000 03D3 #pragma optsize-
; 0000 03D4 // Save interrupts enabled/disabled state
; 0000 03D5 s=SREG;
	IN   R17,63
; 0000 03D6 // Disable interrupts
; 0000 03D7 #asm("cli")
	cli
; 0000 03D8 
; 0000 03D9 // Wait until the RTC is not busy
; 0000 03DA while (RTC.STATUS & RTC_SYNCBUSY_bm);
_0x9:
	LDS  R30,1025
	ANDI R30,LOW(0x1)
	BRNE _0x9
; 0000 03DB // Set the RTC period register
; 0000 03DC RTC.PER=0x0400;
	LDI  R30,LOW(1024)
	LDI  R31,HIGH(1024)
	STS  1034,R30
	STS  1034+1,R31
; 0000 03DD // Set the RTC count register
; 0000 03DE RTC.CNT=0x0000;
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	STS  1032,R30
	STS  1032+1,R31
; 0000 03DF // Set the RTC compare register
; 0000 03E0 RTC.COMP=0x0000;
	STS  1036,R30
	STS  1036+1,R31
; 0000 03E1 
; 0000 03E2 // Restore interrupts enabled/disabled state
; 0000 03E3 SREG=s;
	OUT  0x3F,R17
; 0000 03E4 // Restore optimization for size if needed
; 0000 03E5 #pragma optsize_default
; 0000 03E6 
; 0000 03E7 // Set the clock prescaler: RTC Clock/1
; 0000 03E8 // and start the RTC
; 0000 03E9 RTC.CTRL=(RTC.CTRL & (~RTC_PRESCALER_gm)) | RTC_PRESCALER_DIV1_gc;
	LDS  R30,1024
	ANDI R30,LOW(0xF8)
	ORI  R30,1
	STS  1024,R30
; 0000 03EA 
; 0000 03EB // RTC overflow interrupt: Low Level
; 0000 03EC // RTC compare interrupt: Disabled
; 0000 03ED RTC.INTCTRL=(RTC.INTCTRL & (~(RTC_OVFINTLVL_gm | RTC_COMPINTLVL_gm))) |
; 0000 03EE 	RTC_OVFINTLVL_LO_gc | RTC_COMPINTLVL_OFF_gc;
	LDS  R30,1026
	ANDI R30,LOW(0xF0)
	ORI  R30,1
	STS  1026,R30
; 0000 03EF }
	LD   R17,Y+
	RET
;
;unsigned int sec=0;
;// RTC overflow interrupt service routine
;interrupt [RTC_OVF_vect] void rtcxm_overflow_isr(void)
; 0000 03F4 {
_rtcxm_overflow_isr:
	CALL SUBOPT_0x0
; 0000 03F5 // write your code here
; 0000 03F6     sec++;
	MOVW R30,R4
	ADIW R30,1
	MOVW R4,R30
; 0000 03F7 }
	RJMP _0xA6
;
;// USARTC0 initialization
;void usartc0_init(void)
; 0000 03FB {
_usartc0_init:
; 0000 03FC // Note: the correct PORTC direction for the RxD, TxD and XCK signals
; 0000 03FD // is configured in the ports_init function
; 0000 03FE 
; 0000 03FF // Transmitter is enabled
; 0000 0400 // Set TxD=1
; 0000 0401 PORTC.OUTSET=0x08;
	LDI  R30,LOW(8)
	STS  1605,R30
; 0000 0402 
; 0000 0403 // Communication mode: Asynchronous USART
; 0000 0404 // Data bits: 8
; 0000 0405 // Stop bits: 1
; 0000 0406 // Parity: Disabled
; 0000 0407 USARTC0.CTRLC=USART_CMODE_ASYNCHRONOUS_gc | USART_PMODE_DISABLED_gc | USART_CHSIZE_8BIT_gc;
	LDI  R30,LOW(3)
	STS  2213,R30
; 0000 0408 
; 0000 0409 // Receive complete interrupt: Low Level
; 0000 040A // Transmit complete interrupt: Disabled
; 0000 040B // Data register empty interrupt: Disabled
; 0000 040C USARTC0.CTRLA=(USARTC0.CTRLA & (~(USART_RXCINTLVL_gm | USART_TXCINTLVL_gm | USART_DREINTLVL_gm))) |
; 0000 040D 	USART_RXCINTLVL_LO_gc | USART_TXCINTLVL_OFF_gc | USART_DREINTLVL_OFF_gc;
	LDS  R30,2211
	ANDI R30,LOW(0xC0)
	ORI  R30,0x10
	STS  2211,R30
; 0000 040E 
; 0000 040F // Required Baud rate: 115200
; 0000 0410 // Real Baud Rate: 115107.9 (x1 Mode), Error: 0.1 %
; 0000 0411 USARTC0.BAUDCTRLA=0x0B;
	LDI  R30,LOW(11)
	STS  2214,R30
; 0000 0412 USARTC0.BAUDCTRLB=((0x09 << USART_BSCALE_bp) & USART_BSCALE_gm) | 0x00;
	LDI  R30,LOW(144)
	STS  2215,R30
; 0000 0413 
; 0000 0414 // Receiver: On
; 0000 0415 // Transmitter: On
; 0000 0416 // Double transmission speed mode: Off
; 0000 0417 // Multi-processor communication mode: Off
; 0000 0418 USARTC0.CTRLB=(USARTC0.CTRLB & (~(USART_RXEN_bm | USART_TXEN_bm | USART_CLK2X_bm | USART_MPCM_bm | USART_TXB8_bm))) |
; 0000 0419 	USART_RXEN_bm | USART_TXEN_bm;
	LDS  R30,2212
	ANDI R30,LOW(0xE0)
	ORI  R30,LOW(0x18)
	STS  2212,R30
; 0000 041A }
	RET
;
;// USARTC0 Receiver buffer
;#define RX_BUFFER_SIZE_USARTC0 8
;char rx_buffer_usartc0[RX_BUFFER_SIZE_USARTC0];
;
;#if RX_BUFFER_SIZE_USARTC0 <= 256
;unsigned char rx_wr_index_usartc0=0,rx_rd_index_usartc0=0,rx_counter_usartc0=0;
;#else
;unsigned int rx_wr_index_usartc0=0,rx_rd_index_usartc0=0,rx_counter_usartc0=0;
;#endif
;
;// This flag is set on USARTC0 Receiver buffer overflow
;bit rx_buffer_overflow_usartc0=0;
;
;// USARTC0 Receiver interrupt service routine
;interrupt [USARTC0_RXC_vect] void usartc0_rx_isr(void)
; 0000 042B {
_usartc0_rx_isr:
	CALL SUBOPT_0x0
; 0000 042C unsigned char status;
; 0000 042D char data;
; 0000 042E 
; 0000 042F status=USARTC0.STATUS;
	ST   -Y,R17
	ST   -Y,R16
;	status -> R17
;	data -> R16
	LDS  R17,2209
; 0000 0430 data=USARTC0.DATA;
	LDS  R16,2208
; 0000 0431 if ((status & (USART_FERR_bm | USART_PERR_bm | USART_BUFOVF_bm)) == 0)
	MOV  R30,R17
	ANDI R30,LOW(0x1C)
	BRNE _0xC
; 0000 0432    {
; 0000 0433    rx_buffer_usartc0[rx_wr_index_usartc0++]=data;
	MOV  R30,R7
	INC  R7
	LDI  R31,0
	SUBI R30,LOW(-_rx_buffer_usartc0)
	SBCI R31,HIGH(-_rx_buffer_usartc0)
	ST   Z,R16
; 0000 0434 #if RX_BUFFER_SIZE_USARTC0 == 256
; 0000 0435    // special case for receiver buffer size=256
; 0000 0436    if (++rx_counter_usartc0 == 0) rx_buffer_overflow_usartc0=1;
; 0000 0437 #else
; 0000 0438    if (rx_wr_index_usartc0 == RX_BUFFER_SIZE_USARTC0) rx_wr_index_usartc0=0;
	LDI  R30,LOW(8)
	CP   R30,R7
	BRNE _0xD
	CLR  R7
; 0000 0439    if (++rx_counter_usartc0 == RX_BUFFER_SIZE_USARTC0)
_0xD:
	INC  R9
	LDI  R30,LOW(8)
	CP   R30,R9
	BRNE _0xE
; 0000 043A       {
; 0000 043B       rx_counter_usartc0=0;
	CLR  R9
; 0000 043C       rx_buffer_overflow_usartc0=1;
	SBI  0x0,0
; 0000 043D       }
; 0000 043E #endif
; 0000 043F    }
_0xE:
; 0000 0440 }
_0xC:
	RJMP _0xA5
;
;// Receive a character from USARTC0
;// USARTC0 is used as the default input device by the 'getchar' function
;#define _ALTERNATE_GETCHAR_
;
;#pragma used+
;char getchar(void)
; 0000 0448 {
; 0000 0449 char data;
; 0000 044A 
; 0000 044B while (rx_counter_usartc0==0);
;	data -> R17
; 0000 044C data=rx_buffer_usartc0[rx_rd_index_usartc0++];
; 0000 044D #if RX_BUFFER_SIZE_USARTC0 != 256
; 0000 044E if (rx_rd_index_usartc0 == RX_BUFFER_SIZE_USARTC0) rx_rd_index_usartc0=0;
; 0000 044F #endif
; 0000 0450 #asm("cli")
; 0000 0451 --rx_counter_usartc0;
; 0000 0452 #asm("sei")
; 0000 0453 return data;
; 0000 0454 }
;#pragma used-
;
;// Write a character to the USARTC0 Transmitter
;// USARTC0 is used as the default output device by the 'putchar' function
;#define _ALTERNATE_PUTCHAR_
;
;#pragma used+
;void putchar(char c)
; 0000 045D {
_putchar:
; 0000 045E while ((USARTC0.STATUS & USART_DREIF_bm) == 0);
	ST   -Y,R26
;	c -> Y+0
_0x15:
	LDS  R30,2209
	ANDI R30,LOW(0x20)
	BREQ _0x15
; 0000 045F USARTC0.DATA=c;
	LD   R30,Y
	STS  2208,R30
; 0000 0460 }
	RJMP _0x20A000E
;#pragma used-
;
;// USARTD0 initialization
;void usartd0_init(void)
; 0000 0465 {
_usartd0_init:
; 0000 0466 // Note: the correct PORTD direction for the RxD, TxD and XCK signals
; 0000 0467 // is configured in the ports_init function
; 0000 0468 
; 0000 0469 // Transmitter is enabled
; 0000 046A // Set TxD=1
; 0000 046B PORTD.OUTSET=0x08;
	LDI  R30,LOW(8)
	STS  1637,R30
; 0000 046C 
; 0000 046D // Communication mode: Asynchronous USART
; 0000 046E // Data bits: 8
; 0000 046F // Stop bits: 1
; 0000 0470 // Parity: Disabled
; 0000 0471 USARTD0.CTRLC=USART_CMODE_ASYNCHRONOUS_gc | USART_PMODE_DISABLED_gc | USART_CHSIZE_8BIT_gc;
	LDI  R30,LOW(3)
	STS  2469,R30
; 0000 0472 
; 0000 0473 // Receive complete interrupt: Low Level
; 0000 0474 // Transmit complete interrupt: Disabled
; 0000 0475 // Data register empty interrupt: Disabled
; 0000 0476 USARTD0.CTRLA=(USARTD0.CTRLA & (~(USART_RXCINTLVL_gm | USART_TXCINTLVL_gm | USART_DREINTLVL_gm))) |
; 0000 0477 	USART_RXCINTLVL_LO_gc | USART_TXCINTLVL_OFF_gc | USART_DREINTLVL_OFF_gc;
	LDS  R30,2467
	ANDI R30,LOW(0xC0)
	ORI  R30,0x10
	STS  2467,R30
; 0000 0478 
; 0000 0479 // Required Baud rate: 115200
; 0000 047A // Real Baud Rate: 115107.9 (x1 Mode), Error: 0.1 %
; 0000 047B USARTD0.BAUDCTRLA=0x0B;
	LDI  R30,LOW(11)
	STS  2470,R30
; 0000 047C USARTD0.BAUDCTRLB=((0x09 << USART_BSCALE_bp) & USART_BSCALE_gm) | 0x00;
	LDI  R30,LOW(144)
	STS  2471,R30
; 0000 047D 
; 0000 047E // Receiver: On
; 0000 047F // Transmitter: On
; 0000 0480 // Double transmission speed mode: Off
; 0000 0481 // Multi-processor communication mode: Off
; 0000 0482 USARTD0.CTRLB=(USARTD0.CTRLB & (~(USART_RXEN_bm | USART_TXEN_bm | USART_CLK2X_bm | USART_MPCM_bm | USART_TXB8_bm))) |
; 0000 0483 	USART_RXEN_bm | USART_TXEN_bm;
	LDS  R30,2468
	ANDI R30,LOW(0xE0)
	ORI  R30,LOW(0x18)
	STS  2468,R30
; 0000 0484 }
	RET
;
;// USARTD0 Receiver buffer
;#define RX_BUFFER_SIZE_USARTD0 8
;char rx_buffer_usartd0[RX_BUFFER_SIZE_USARTD0];
;
;#if RX_BUFFER_SIZE_USARTD0 <= 256
;unsigned char rx_wr_index_usartd0=0,rx_rd_index_usartd0=0,rx_counter_usartd0=0;
;#else
;unsigned int rx_wr_index_usartd0=0,rx_rd_index_usartd0=0,rx_counter_usartd0=0;
;#endif
;
;// This flag is set on USARTD0 Receiver buffer overflow
;bit rx_buffer_overflow_usartd0=0;
;
;// USARTD0 Receiver interrupt service routine
;interrupt [USARTD0_RXC_vect] void usartd0_rx_isr(void)
; 0000 0495 {
_usartd0_rx_isr:
	CALL SUBOPT_0x0
; 0000 0496 unsigned char status;
; 0000 0497 char data;
; 0000 0498 
; 0000 0499 status=USARTD0.STATUS;
	ST   -Y,R17
	ST   -Y,R16
;	status -> R17
;	data -> R16
	LDS  R17,2465
; 0000 049A data=USARTD0.DATA;
	LDS  R16,2464
; 0000 049B if ((status & (USART_FERR_bm | USART_PERR_bm | USART_BUFOVF_bm)) == 0)
	MOV  R30,R17
	ANDI R30,LOW(0x1C)
	BRNE _0x18
; 0000 049C    {
; 0000 049D    rx_buffer_usartd0[rx_wr_index_usartd0++]=data;
	MOV  R30,R8
	INC  R8
	LDI  R31,0
	SUBI R30,LOW(-_rx_buffer_usartd0)
	SBCI R31,HIGH(-_rx_buffer_usartd0)
	ST   Z,R16
; 0000 049E #if RX_BUFFER_SIZE_USARTD0 == 256
; 0000 049F    // special case for receiver buffer size=256
; 0000 04A0    if (++rx_counter_usartd0 == 0) rx_buffer_overflow_usartd0=1;
; 0000 04A1 #else
; 0000 04A2    if (rx_wr_index_usartd0 == RX_BUFFER_SIZE_USARTD0) rx_wr_index_usartd0=0;
	LDI  R30,LOW(8)
	CP   R30,R8
	BRNE _0x19
	CLR  R8
; 0000 04A3    if (++rx_counter_usartd0 == RX_BUFFER_SIZE_USARTD0)
_0x19:
	INC  R10
	LDI  R30,LOW(8)
	CP   R30,R10
	BRNE _0x1A
; 0000 04A4       {
; 0000 04A5       rx_counter_usartd0=0;
	CLR  R10
; 0000 04A6       rx_buffer_overflow_usartd0=1;
	SBI  0x0,1
; 0000 04A7       }
; 0000 04A8 #endif
; 0000 04A9    }
_0x1A:
; 0000 04AA }
_0x18:
_0xA5:
	LD   R16,Y+
	LD   R17,Y+
_0xA6:
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	RETI
;
;// Receive a character from USARTD0
;#pragma used+
;char getchar_usartd0(void)
; 0000 04AF {
; 0000 04B0 char data;
; 0000 04B1 
; 0000 04B2 while (rx_counter_usartd0==0);
;	data -> R17
; 0000 04B3 data=rx_buffer_usartd0[rx_rd_index_usartd0++];
; 0000 04B4 #if RX_BUFFER_SIZE_USARTD0 != 256
; 0000 04B5 if (rx_rd_index_usartd0 == RX_BUFFER_SIZE_USARTD0) rx_rd_index_usartd0=0;
; 0000 04B6 #endif
; 0000 04B7 #asm("cli")
; 0000 04B8 --rx_counter_usartd0;
; 0000 04B9 #asm("sei")
; 0000 04BA return data;
; 0000 04BB }
;#pragma used-
;
;// Write a character to the USARTD0 Transmitter
;#pragma used+
;void putchar_usartd0(char c)
; 0000 04C1 {
_putchar_usartd0:
; 0000 04C2 while ((USARTD0.STATUS & USART_DREIF_bm) == 0);
	ST   -Y,R26
;	c -> Y+0
_0x21:
	LDS  R30,2465
	ANDI R30,LOW(0x20)
	BREQ _0x21
; 0000 04C3 USARTD0.DATA=c;
	LD   R30,Y
	STS  2464,R30
; 0000 04C4 }
_0x20A000E:
	ADIW R28,1
	RET
;#pragma used-
;
;// Function used to read the calibration byte from the
;// signature row, specified by 'index'
;#pragma optsize-
;unsigned char read_calibration_byte(unsigned char index)
; 0000 04CB {
_read_calibration_byte:
; 0000 04CC unsigned char r;
; 0000 04CD NVM.CMD=NVM_CMD_READ_CALIB_ROW_gc;
	ST   -Y,R26
	ST   -Y,R17
;	index -> Y+1
;	r -> R17
	LDI  R30,LOW(2)
	STS  458,R30
; 0000 04CE r=*((flash unsigned char*) index);
	LDD  R30,Y+1
	LDI  R31,0
	LPM  R17,Z
; 0000 04CF // Clean up NVM command register
; 0000 04D0 NVM.CMD=NVM_CMD_NO_OPERATION_gc;
	LDI  R30,LOW(0)
	STS  458,R30
; 0000 04D1 return r;
	MOV  R30,R17
	LDD  R17,Y+0
	RJMP _0x20A000C
; 0000 04D2 }
;#pragma optsize_default
;
;// ADCA initialization
;
;// Variable used to store the ADC offset
;// for 12 Bit Unsigned conversion mode
;unsigned char adca_offset;
;
;void adca_init(void)
; 0000 04DC {
_adca_init:
; 0000 04DD unsigned char i;
; 0000 04DE unsigned int offs;
; 0000 04DF 
; 0000 04E0 // ADCA is enabled
; 0000 04E1 // Resolution: 12 Bits
; 0000 04E2 // Load the calibration value for 12 Bit resolution
; 0000 04E3 // from the signature row
; 0000 04E4 ADCA.CALL=read_calibration_byte(PROD_SIGNATURES_START+ADCACAL0_offset);
	CALL __SAVELOCR4
;	i -> R17
;	offs -> R18,R19
	LDI  R26,LOW(32)
	RCALL _read_calibration_byte
	STS  524,R30
; 0000 04E5 ADCA.CALH=read_calibration_byte(PROD_SIGNATURES_START+ADCACAL1_offset);
	LDI  R26,LOW(33)
	RCALL _read_calibration_byte
	STS  525,R30
; 0000 04E6 
; 0000 04E7 // Free Running mode: Off
; 0000 04E8 // Conversion mode: Unsigned
; 0000 04E9 ADCA.CTRLB=(ADCA.CTRLB & (~(ADC_CONMODE_bm | ADC_FREERUN_bm | ADC_RESOLUTION_gm))) |
; 0000 04EA 	ADC_RESOLUTION_12BIT_gc;
	LDS  R30,513
	ANDI R30,LOW(0xE1)
	STS  513,R30
; 0000 04EB 
; 0000 04EC // Clock frequency: 3.906 kHz
; 0000 04ED ADCA.PRESCALER=(ADCA.PRESCALER & (~ADC_PRESCALER_gm)) | ADC_PRESCALER_DIV512_gc;
	LDS  R30,516
	ORI  R30,LOW(0x7)
	STS  516,R30
; 0000 04EE 
; 0000 04EF // Reference: AREF pin on PORTB
; 0000 04F0 // Temperature reference: On
; 0000 04F1 ADCA.REFCTRL=(ADCA.REFCTRL & ((~(ADC_REFSEL_gm | ADC_TEMPREF_bm)) | ADC_BANDGAP_bm)) |
; 0000 04F2 	ADC_REFSEL_AREFB_gc | ADC_TEMPREF_bm;
	LDS  R30,514
	ORI  R30,LOW(0x31)
	STS  514,R30
; 0000 04F3 
; 0000 04F4 // Read and save the ADC offset using channel 0
; 0000 04F5 // ADC4 pin connected to GND
; 0000 04F6 ADCA.CH0.CTRL=(ADCA.CH0.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
; 0000 04F7 	ADC_CH_INPUTMODE_SINGLEENDED_gc;
	LDS  R30,544
	ANDI R30,LOW(0x60)
	CALL SUBOPT_0x1
; 0000 04F8 ADCA.CH0.MUXCTRL=(ADCA.CH0.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
; 0000 04F9 	ADC_CH_MUXPOS_PIN4_gc;
	ORI  R30,0x20
	STS  545,R30
; 0000 04FA // Enable the ADC in order to read the offset
; 0000 04FB ADCA.CTRLA|=ADC_ENABLE_bm;
	CALL SUBOPT_0x2
; 0000 04FC // Insert a delay to allow the ADC common mode voltage to stabilize
; 0000 04FD delay_us(2);
; 0000 04FE // Perform several offset measurements and store the mean value
; 0000 04FF offs=0;
	__GETWRN 18,19,0
; 0000 0500 for (i=0; i<16; i++)
	LDI  R17,LOW(0)
_0x25:
	CPI  R17,16
	BRSH _0x26
; 0000 0501     {
; 0000 0502     // Start the AD conversion on channel 0
; 0000 0503     ADCA.CH0.CTRL|=ADC_CH_START_bm;
	LDS  R30,544
	ORI  R30,0x80
	STS  544,R30
; 0000 0504     // Wait for the AD conversion to complete
; 0000 0505     while ((ADCA.CH0.INTFLAGS & ADC_CH_CHIF_bm)==0);
_0x27:
	LDS  R30,547
	ANDI R30,LOW(0x1)
	BREQ _0x27
; 0000 0506     // Clear the interrupt flag
; 0000 0507     ADCA.CH0.INTFLAGS=ADC_CH_CHIF_bm;
	LDI  R30,LOW(1)
	STS  547,R30
; 0000 0508     // Read the offset
; 0000 0509     offs+=(unsigned char) ADCA.CH0.RESL;
	LDS  R30,548
	LDI  R31,0
	__ADDWRR 18,19,30,31
; 0000 050A     }
	SUBI R17,-1
	RJMP _0x25
_0x26:
; 0000 050B // Disable the ADC
; 0000 050C ADCA.CTRLA&= ~ADC_ENABLE_bm;
	LDS  R30,512
	ANDI R30,0xFE
	STS  512,R30
; 0000 050D // Store the mean value of the offset
; 0000 050E adca_offset=(unsigned char) (offs/16);
	MOVW R30,R18
	CALL __LSRW4
	MOV  R13,R30
; 0000 050F 
; 0000 0510 // Initialize the ADC Compare register
; 0000 0511 ADCA.CMPL=0x00;
	LDI  R30,LOW(0)
	STS  536,R30
; 0000 0512 ADCA.CMPH=0x00;
	STS  537,R30
; 0000 0513 
; 0000 0514 // ADC channel 0 gain: 1
; 0000 0515 // ADC channel 0 input mode: Single-ended positive input signal
; 0000 0516 ADCA.CH0.CTRL=(ADCA.CH0.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
; 0000 0517 	ADC_CH_GAIN_1X_gc | ADC_CH_INPUTMODE_SINGLEENDED_gc;
	LDS  R30,544
	ANDI R30,LOW(0x60)
	CALL SUBOPT_0x1
; 0000 0518 
; 0000 0519 // ADC channel 0 positive input: ADC2 pin
; 0000 051A // ADC channel 0 negative input: GND
; 0000 051B ADCA.CH0.MUXCTRL=(ADCA.CH0.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
; 0000 051C 	ADC_CH_MUXPOS_PIN2_gc;
	ORI  R30,0x10
	STS  545,R30
; 0000 051D 
; 0000 051E // ADC channel 1 gain: 1
; 0000 051F // ADC channel 1 input mode: Single-ended positive input signal
; 0000 0520 ADCA.CH1.CTRL=(ADCA.CH1.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
; 0000 0521 	ADC_CH_GAIN_1X_gc | ADC_CH_INPUTMODE_SINGLEENDED_gc;
	LDS  R30,552
	ANDI R30,LOW(0x60)
	ORI  R30,1
	STS  552,R30
; 0000 0522 
; 0000 0523 // ADC channel 1 positive input: ADC3 pin
; 0000 0524 // ADC channel 1 negative input: GND
; 0000 0525 ADCA.CH1.MUXCTRL=(ADCA.CH1.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
; 0000 0526 	ADC_CH_MUXPOS_PIN3_gc;
	LDS  R30,553
	ANDI R30,LOW(0x84)
	ORI  R30,LOW(0x18)
	STS  553,R30
; 0000 0527 
; 0000 0528 // ADC channel 2 gain: 1
; 0000 0529 // ADC channel 2 input mode: Internal positive input signal
; 0000 052A ADCA.CH2.CTRL=(ADCA.CH2.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
; 0000 052B 	ADC_CH_GAIN_1X_gc | ADC_CH_INPUTMODE_INTERNAL_gc;
	LDS  R30,560
	ANDI R30,LOW(0x60)
	STS  560,R30
; 0000 052C 
; 0000 052D // ADC channel 2 positive input: Temp. Reference
; 0000 052E // ADC channel 2 negative input: GND
; 0000 052F ADCA.CH2.MUXCTRL=(ADCA.CH2.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
; 0000 0530 	ADC_CH_MUXINT_TEMP_gc;
	LDS  R30,561
	ANDI R30,LOW(0x84)
	STS  561,R30
; 0000 0531 
; 0000 0532 // ADC channel 3 gain: 1
; 0000 0533 // ADC channel 3 input mode: Internal positive input signal
; 0000 0534 ADCA.CH3.CTRL=(ADCA.CH3.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
; 0000 0535 	ADC_CH_GAIN_1X_gc | ADC_CH_INPUTMODE_INTERNAL_gc;
	LDS  R30,568
	ANDI R30,LOW(0x60)
	STS  568,R30
; 0000 0536 
; 0000 0537 // ADC channel 3 positive input: Temp. Reference
; 0000 0538 // ADC channel 3 negative input: GND
; 0000 0539 ADCA.CH3.MUXCTRL=(ADCA.CH3.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
; 0000 053A 	ADC_CH_MUXINT_TEMP_gc;
	LDS  R30,569
	ANDI R30,LOW(0x84)
	STS  569,R30
; 0000 053B 
; 0000 053C // AD conversion is started by software
; 0000 053D ADCA.EVCTRL=ADC_EVACT_NONE_gc;
	LDI  R30,LOW(0)
	STS  515,R30
; 0000 053E 
; 0000 053F // Channel 0 interrupt: Disabled
; 0000 0540 ADCA.CH0.INTCTRL=(ADCA.CH0.INTCTRL & (~(ADC_CH_INTMODE_gm | ADC_CH_INTLVL_gm))) |
; 0000 0541 	ADC_CH_INTMODE_COMPLETE_gc | ADC_CH_INTLVL_OFF_gc;
	LDS  R30,546
	ANDI R30,LOW(0xF0)
	STS  546,R30
; 0000 0542 // Channel 1 interrupt: Disabled
; 0000 0543 ADCA.CH1.INTCTRL=(ADCA.CH1.INTCTRL & (~(ADC_CH_INTMODE_gm | ADC_CH_INTLVL_gm))) |
; 0000 0544 	ADC_CH_INTMODE_COMPLETE_gc | ADC_CH_INTLVL_OFF_gc;
	LDS  R30,554
	ANDI R30,LOW(0xF0)
	STS  554,R30
; 0000 0545 // Channel 2 interrupt: Disabled
; 0000 0546 ADCA.CH2.INTCTRL=(ADCA.CH2.INTCTRL & (~(ADC_CH_INTMODE_gm | ADC_CH_INTLVL_gm))) |
; 0000 0547 	ADC_CH_INTMODE_COMPLETE_gc | ADC_CH_INTLVL_OFF_gc;
	LDS  R30,562
	ANDI R30,LOW(0xF0)
	STS  562,R30
; 0000 0548 // Channel 3 interrupt: Disabled
; 0000 0549 ADCA.CH3.INTCTRL=(ADCA.CH3.INTCTRL & (~(ADC_CH_INTMODE_gm | ADC_CH_INTLVL_gm))) |
; 0000 054A 	ADC_CH_INTMODE_COMPLETE_gc | ADC_CH_INTLVL_OFF_gc;
	LDS  R30,570
	ANDI R30,LOW(0xF0)
	STS  570,R30
; 0000 054B 
; 0000 054C // Enable the ADC
; 0000 054D ADCA.CTRLA|=ADC_ENABLE_bm;
	CALL SUBOPT_0x2
; 0000 054E // Insert a delay to allow the ADC common mode voltage to stabilize
; 0000 054F delay_us(2);
; 0000 0550 }
	CALL __LOADLOCR4
	RJMP _0x20A000D
;
;// ADCA channel data read function using polled mode
;unsigned int adca_read(unsigned char channel)
; 0000 0554 {
_adca_read:
; 0000 0555 ADC_CH_t *pch=&ADCA.CH0+channel;
; 0000 0556 unsigned int data;
; 0000 0557 
; 0000 0558 // Start the AD conversion
; 0000 0559 pch->CTRL|=ADC_CH_START_bm;
	ST   -Y,R26
	CALL __SAVELOCR4
;	channel -> Y+4
;	*pch -> R16,R17
;	data -> R18,R19
	LDD  R30,Y+4
	LDI  R31,0
	LDI  R26,LOW(544)
	LDI  R27,HIGH(544)
	CALL __LSLW3
	ADD  R30,R26
	ADC  R31,R27
	MOVW R16,R30
	MOVW R26,R16
	LD   R30,X
	ORI  R30,0x80
	ST   X,R30
; 0000 055A // Wait for the AD conversion to complete
; 0000 055B while ((pch->INTFLAGS & ADC_CH_CHIF_bm)==0);
_0x2A:
	MOVW R30,R16
	LDD  R26,Z+3
	ANDI R26,LOW(0x1)
	BREQ _0x2A
; 0000 055C // Clear the interrupt flag
; 0000 055D pch->INTFLAGS=ADC_CH_CHIF_bm;
	MOVW R26,R16
	ADIW R26,3
	LDI  R30,LOW(1)
	ST   X,R30
; 0000 055E // Read the AD conversion result
; 0000 055F ((unsigned char *) &data)[0]=pch->RESL;
	MOVW R30,R16
	LDD  R18,Z+4
; 0000 0560 ((unsigned char *) &data)[1]=pch->RESH;
	LDD  R19,Z+5
; 0000 0561 // Compensate the ADC offset
; 0000 0562 data-=adca_offset;
	MOV  R26,R13
	CLR  R27
	__SUBWRR 18,19,26,27
; 0000 0563 return data;
	MOVW R30,R18
	CALL __LOADLOCR4
	RJMP _0x20A000A
; 0000 0564 }
;
;// ADCA sweeped channel(s) data read function
;// for software triggered mode
;void adca_sweep_read(unsigned char nch, unsigned int *pdata)
; 0000 0569 {
; 0000 056A ADC_CH_t *pch=&ADCA.CH0;
; 0000 056B unsigned char i,j,m;
; 0000 056C 
; 0000 056D // Sweep starts with channel 0
; 0000 056E j=ADC_CH0START_bm;
;	nch -> Y+8
;	*pdata -> Y+6
;	*pch -> R16,R17
;	i -> R19
;	j -> R18
;	m -> R21
; 0000 056F // Prepare the AD conversion start mask for the sweeped channel(s)
; 0000 0570 m=0;
; 0000 0571 i=0;
; 0000 0572 do
; 0000 0573   {
; 0000 0574   m|=j;
; 0000 0575   j<<=1;
; 0000 0576   }
; 0000 0577 while (++i<nch);
; 0000 0578 // Ensure the interrupt flags are cleared
; 0000 0579 ADCA.INTFLAGS=ADCA.INTFLAGS;
; 0000 057A // Start the AD conversion for the sweeped channel(s)
; 0000 057B ADCA.CTRLA=(ADCA.CTRLA & (ADC_DMASEL_gm | ADC_FLUSH_bm | ADC_ENABLE_bm)) | m;
; 0000 057C // Read and store the AD conversion results for all the sweeped channels
; 0000 057D for (i=0; i<nch; i++)
; 0000 057E     {
; 0000 057F     // Wait for the AD conversion to complete
; 0000 0580     while ((pch->INTFLAGS & ADC_CH_CHIF_bm)==0);
; 0000 0581     // Clear the interrupt flag
; 0000 0582     pch->INTFLAGS=ADC_CH_CHIF_bm;
; 0000 0583     // Read the AD conversion result
; 0000 0584     ((unsigned char *) pdata)[0]=pch->RESL;
; 0000 0585     ((unsigned char *) pdata)[1]=pch->RESH;
; 0000 0586     // Compensate the ADC offset
; 0000 0587     *pdata-=adca_offset;
; 0000 0588     pdata++;
; 0000 0589     pch++;
; 0000 058A     }
; 0000 058B }
;////////////////////////////////////값 출력/////////////////////////////////////////////////
;void putstring(char *command)
; 0000 058E {
_putstring:
; 0000 058F     int i=0;
; 0000 0590     while(*(command+i) !=0)
	ST   -Y,R27
	ST   -Y,R26
	ST   -Y,R17
	ST   -Y,R16
;	*command -> Y+2
;	i -> R16,R17
	__GETWRN 16,17,0
_0x36:
	CALL SUBOPT_0x3
	LD   R30,X
	CPI  R30,0
	BREQ _0x38
; 0000 0591     {
; 0000 0592         putchar(*(command+i));
	CALL SUBOPT_0x3
	LD   R26,X
	RCALL _putchar
; 0000 0593         putchar_usartd0(*(command+i));
	CALL SUBOPT_0x3
	LD   R26,X
	RCALL _putchar_usartd0
; 0000 0594         i++;
	__ADDWRN 16,17,1
; 0000 0595     }
	RJMP _0x36
_0x38:
; 0000 0596 }
	LDD  R17,Y+1
	LDD  R16,Y+0
_0x20A000D:
	ADIW R28,4
	RET
;
;/***************************************************************온습도 센서************************************************************/
;#define SDA VPORT2_OUT.0
;#define SCL VPORT2_OUT.1
;#define SDA_IN VPORT2_IN.0
;#define SDA_Direction VPORT2_DIR.0
;#define SCL_Direction VPORT2_DIR.1
;#define Delay_1us() delay_us(1)
;
;
;// 온습도 계산을 위한 고정 값
;const unsigned int C1 = 400;             // -4

	.DSEG
;const unsigned int C2 = 405;             // 0.0405  (405 * 10^-4)
;const unsigned short C3 = 28;            // -2.8 * 10^-6  (28 * 10^-7)
;const unsigned int D1 = 4000;            // -40
;const unsigned short D2 = 1;             // 0.01
;// 온습도센서 변수
;unsigned short i, j;
;long int temp, k, SOt, SOrh, Ta_res, Rh_res;
;char Ta[16] = "000.00";//"Ta = 000.00    ";
;char Rh[16] = "000.00";//"Rh = 000.00    ";
;////////////////////////////////////////I2C통신///////////////////////////////////
;void SHT_Reset() {
; 0000 05AD void SHT_Reset() {

	.CSEG
_SHT_Reset:
; 0000 05AE   SCL = 0;                                 // SCL low
	CBI  0x19,1
; 0000 05AF   SDA_Direction = 0;                  // SDA를 input으로 define
	CBI  0x18,0
; 0000 05B0   for (i = 1; i <= 18; i++)              // 18번 반복하여 9번 클럭을 만듬(9번의 클럭동안 SDA가 1을 유지하면 리셋)
	CALL SUBOPT_0x4
_0x45:
	CALL SUBOPT_0x5
	SBIW R26,19
	BRSH _0x46
; 0000 05B1     {
; 0000 05B2     SCL = ~SCL;
	SBIS 0x19,1
	RJMP _0x47
	CBI  0x19,1
	RJMP _0x48
_0x47:
	SBI  0x19,1
_0x48:
; 0000 05B3     //Delay_1us();
; 0000 05B4     }
	CALL SUBOPT_0x6
	RJMP _0x45
_0x46:
; 0000 05B5 }
	RET
;void Transmission_Start() {
; 0000 05B6 void Transmission_Start() {
_Transmission_Start:
; 0000 05B7   SDA_Direction = 0;                     // SDA를 input으로 define
	CBI  0x18,0
; 0000 05B8   SCL = 1;                               // SCL high
	CALL SUBOPT_0x7
; 0000 05B9   Delay_1us();                           // 1us delay
; 0000 05BA   SDA_Direction = 1;                     // SDA를 output으로 define
	SBI  0x18,0
; 0000 05BB   SDA = 0;                               // SDA low
	CBI  0x19,0
; 0000 05BC   Delay_1us();                           // 1us delay
	__DELAY_USB 1
; 0000 05BD   SCL = 0;                               // SCL low
	CALL SUBOPT_0x8
; 0000 05BE   Delay_1us();                           // 1us delay
; 0000 05BF   SCL = 1;                               // SCL high
	CALL SUBOPT_0x7
; 0000 05C0   Delay_1us();                           // 1us delay
; 0000 05C1   SDA_Direction = 0;                     // SDA를 input으로 define
	CBI  0x18,0
; 0000 05C2   Delay_1us();                           // 1us delay
	__DELAY_USB 1
; 0000 05C3   SCL = 0;                               // SCL low
	CBI  0x19,1
; 0000 05C4 }
	RET
;// MCU ACK응답
;void MCU_ACK() {
; 0000 05C6 void MCU_ACK() {
_MCU_ACK:
; 0000 05C7   SDA_Direction = 1;     // SDA를 output으로 define
	SBI  0x18,0
; 0000 05C8   SDA = 0;               // SDA low
	CBI  0x19,0
; 0000 05C9   SCL = 1;               // SCL high
	CALL SUBOPT_0x7
; 0000 05CA   Delay_1us();           // 1us delay
; 0000 05CB   SCL = 0;               // SCL low
	CALL SUBOPT_0x8
; 0000 05CC   Delay_1us();           // 1us delay
; 0000 05CD   SDA_Direction = 0;     // SDA를 input으로 define
	CBI  0x18,0
; 0000 05CE }
	RET
;// command에 따른 온도 or 습도 측정 함수
;long int Measure(short num) {
; 0000 05D0 long int Measure(short num) {
_Measure:
; 0000 05D1   j = num;                           // j = command (0x03 : 온도 or 0x05 : 습도)
	ST   -Y,R27
	ST   -Y,R26
;	num -> Y+0
	LD   R30,Y
	LDD  R31,Y+1
	STS  _j,R30
	STS  _j+1,R31
; 0000 05D2   SHT_Reset();                       // 센서 리셋 절차
	RCALL _SHT_Reset
; 0000 05D3   Transmission_Start();              // 전송 시작 절차
	RCALL _Transmission_Start
; 0000 05D4   k = 0;                             // k = 0
	LDI  R30,LOW(0)
	STS  _k,R30
	STS  _k+1,R30
	STS  _k+2,R30
	STS  _k+3,R30
; 0000 05D5   SDA_Direction = 1;                 // SDA를 output으로 define
	SBI  0x18,0
; 0000 05D6   SCL = 0;                           // SCL low
	CBI  0x19,1
; 0000 05D7   for(i = 1; i <= 8; i++) {          // 8번 반복
	CALL SUBOPT_0x4
_0x68:
	CALL SUBOPT_0x5
	SBIW R26,9
	BRSH _0x69
; 0000 05D8     if(j & 0x80)              //if (j.F7 == 1)                   // if bit 7 = 1
	LDS  R30,_j
	ANDI R30,LOW(0x80)
	BREQ _0x6A
; 0000 05D9     SDA_Direction = 0;              // SDA를 input으로 define
	CBI  0x18,0
; 0000 05DA 
; 0000 05DB     else {                           // else (if bit 7 = 0)
	RJMP _0x6D
_0x6A:
; 0000 05DC      SDA_Direction = 1;              // SDA를 output으로 define
	SBI  0x18,0
; 0000 05DD      SDA = 0;                        // SDA low
	CBI  0x19,0
; 0000 05DE    }
_0x6D:
; 0000 05DF     Delay_1us();                     // 1us delay
	__DELAY_USB 1
; 0000 05E0     SCL = 1;                         // SCL high
	CALL SUBOPT_0x7
; 0000 05E1     Delay_1us();                     // 1us delay
; 0000 05E2     SCL = 0;                         // SCL low
	CBI  0x19,1
; 0000 05E3     j <<= 1;                         // j의 내용을 한칸 왼쪽으로 시프트
	LDS  R30,_j
	LDS  R31,_j+1
	LSL  R30
	ROL  R31
	STS  _j,R30
	STS  _j+1,R31
; 0000 05E4   }
	CALL SUBOPT_0x6
	RJMP _0x68
_0x69:
; 0000 05E5 
; 0000 05E6   SDA_Direction = 0;                 // SDA를 input으로 define
	CBI  0x18,0
; 0000 05E7   SCL = 1;                           // SCL high
	CALL SUBOPT_0x7
; 0000 05E8   Delay_1us();                       // 1us delay
; 0000 05E9   SCL = 0;                           // SCL low
	CALL SUBOPT_0x8
; 0000 05EA   Delay_1us();                       // 1us delay
; 0000 05EB   while (SDA_IN == 1)                // SDA가 high 일때동안 동작X
_0x7C:
	SBIS 0x1A,0
	RJMP _0x7E
; 0000 05EC     Delay_1us();                     // 1us delay
	__DELAY_USB 1
	RJMP _0x7C
_0x7E:
; 0000 05ED for (i = 1; i <=16; i++) {
	CALL SUBOPT_0x4
_0x80:
	CALL SUBOPT_0x5
	SBIW R26,17
	BRSH _0x81
; 0000 05EE     k <<= 1;                         // k의 내용을 한칸 왼쪽으로 시프트
	CALL SUBOPT_0x9
	CALL __LSLD1
	CALL SUBOPT_0xA
; 0000 05EF     SCL = 1;                         // SCL high
	SBI  0x19,1
; 0000 05F0     if (SDA_IN == 1)                 // if SDA is high
	SBIS 0x1A,0
	RJMP _0x84
; 0000 05F1     k = k | 0x0001;
	CALL SUBOPT_0x9
	ORI  R30,1
	CALL SUBOPT_0xA
; 0000 05F2     SCL = 0;
_0x84:
	CBI  0x19,1
; 0000 05F3     if (i == 8)                      // if counter i = 8 일때
	CALL SUBOPT_0x5
	SBIW R26,8
	BRNE _0x87
; 0000 05F4       MCU_ACK();                     // MCU 응답
	RCALL _MCU_ACK
; 0000 05F5   }
_0x87:
	CALL SUBOPT_0x6
	RJMP _0x80
_0x81:
; 0000 05F6 
; 0000 05F7   return k;                          // K을 리턴
	CALL SUBOPT_0x9
_0x20A000C:
	ADIW R28,2
	RET
; 0000 05F8 }
;
;//////////////////////////////////////측정관련함수//////////////////////////////////////////////
;// 측정 및 계산
;void calculation(void){
; 0000 05FC void calculation(void){
_calculation:
; 0000 05FD     // 온도 측정
; 0000 05FE     SOt = Measure(0x03);             // 측정함수 (command 0x03 : 온도)
	LDI  R26,LOW(3)
	LDI  R27,0
	RCALL _Measure
	STS  _SOt,R30
	STS  _SOt+1,R31
	STS  _SOt+2,R22
	STS  _SOt+3,R23
; 0000 05FF      // 습도 측정
; 0000 0600     SOrh = Measure(0x05);            // 측정함수 (command 0x05 : 습도)
	LDI  R26,LOW(5)
	LDI  R27,0
	RCALL _Measure
	STS  _SOrh,R30
	STS  _SOrh+1,R31
	STS  _SOrh+2,R22
	STS  _SOrh+3,R23
; 0000 0601 
; 0000 0602     // 온도 계산
; 0000 0603     // Ta_res = D1 + D2 * SOt
; 0000 0604     if(SOt > D1)                     // 온도가 영상이면
	CALL SUBOPT_0xB
	__CPD2N 0xFA1
	BRLT _0x88
; 0000 0605       Ta_res = SOt * D2 - D1;        // 영상 온도 계산
	LDS  R30,_SOt
	LDS  R31,_SOt+1
	LDS  R22,_SOt+2
	LDS  R23,_SOt+3
	__SUBD1N 4000
	RJMP _0xA4
; 0000 0606     else                             // 온도가 영하이면
_0x88:
; 0000 0607       Ta_res = D1 - SOt * D2;        // 영하 온도 계산
	CALL SUBOPT_0xB
	__GETD1N 0xFA0
	CALL __SUBD12
_0xA4:
	STS  _Ta_res,R30
	STS  _Ta_res+1,R31
	STS  _Ta_res+2,R22
	STS  _Ta_res+3,R23
; 0000 0608 
; 0000 0609     // 습도 계산
; 0000 060A     // Rh_res = C1 + C2 * SOrh + C3 * SOrh^2
; 0000 060B     temp = SOrh * SOrh * C3 / 100000;             // 습도계산과정
	CALL SUBOPT_0xC
	LDS  R26,_SOrh
	LDS  R27,_SOrh+1
	LDS  R24,_SOrh+2
	LDS  R25,_SOrh+3
	CALL __MULD12
	__GETD2N 0x1C
	CALL __MULD12
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0x186A0
	CALL __DIVD21
	STS  _temp,R30
	STS  _temp+1,R31
	STS  _temp+2,R22
	STS  _temp+3,R23
; 0000 060C     Rh_res = SOrh * C2 / 100 - temp - C1;         //
	CALL SUBOPT_0xC
	__GETD2N 0x195
	CALL __MULD12
	CALL SUBOPT_0xD
	MOVW R26,R30
	MOVW R24,R22
	LDS  R30,_temp
	LDS  R31,_temp+1
	LDS  R22,_temp+2
	LDS  R23,_temp+3
	CALL __SUBD21
	__SUBD2N 400
	STS  _Rh_res,R26
	STS  _Rh_res+1,R27
	STS  _Rh_res+2,R24
	STS  _Rh_res+3,R25
; 0000 060D 
; 0000 060E }
	RET
;// 계산값 자리수
;void calculation_res(char value[], long int res){
; 0000 0610 void calculation_res(char value[], long int res){
_calculation_res:
; 0000 0611     value[0] = res / 10000 + 48;                    // example: Ta[5] = 12345 / 10000 = 1, 1 + 48 = '1' - ASCII
	CALL SUBOPT_0xE
;	value -> Y+4
;	res -> Y+0
	CALL SUBOPT_0xF
	CALL __DIVD21
	SUBI R30,-LOW(48)
	LDD  R26,Y+4
	LDD  R27,Y+4+1
	ST   X,R30
; 0000 0612     value[1] = res % 10000 / 1000 + 48;        // example: Ta[6] = 12345 % 10000 = 2345, Ta[6] = 2345 / 1000 = 2, 2 + 48 = '2' - ASCII
	CALL SUBOPT_0x10
	CALL SUBOPT_0xF
	CALL __MODD21
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0x3E8
	CALL __DIVD21
	SUBI R30,-LOW(48)
	__PUTB1SNS 4,1
; 0000 0613     value[2] = res % 1000 / 100 + 48;            // example: Ta[7] = 12345 % 1000 = 345, Ta[7] = 345 / 100 = 3, 3 + 48 = '3' - ASCII
	CALL SUBOPT_0x10
	__GETD1N 0x3E8
	CALL __MODD21
	CALL SUBOPT_0xD
	SUBI R30,-LOW(48)
	__PUTB1SNS 4,2
; 0000 0614     value[4] = res % 100 / 10 + 48;                // example: Ta[9] = 12345 % 100 = 45, Ta[9] = 45 / 10 = 4, 4 + 48 = '4' - ASCII
	CALL SUBOPT_0x10
	__GETD1N 0x64
	CALL __MODD21
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0xA
	CALL __DIVD21
	SUBI R30,-LOW(48)
	__PUTB1SNS 4,4
; 0000 0615     value[5] = res % 10 + 48;                       // example: Ta[10] = 12345 % 10 = 5, 5 + 48 = '5' - ASCII
	CALL SUBOPT_0x10
	__GETD1N 0xA
	CALL __MODD21
	SUBI R30,-LOW(48)
	__PUTB1SNS 4,5
; 0000 0616 // 맨 앞자리수 0일때 빈칸 입력
; 0000 0617     if (value[0] == '0')                                  // Ta[5] = '0' 일 때
	LDD  R26,Y+4
	LDD  R27,Y+4+1
	LD   R26,X
	CPI  R26,LOW(0x30)
	BRNE _0x8A
; 0000 0618       value[0] = ' ';                                           // Ta[5]에 빈칸 입력
	LDD  R26,Y+4
	LDD  R27,Y+4+1
	LDI  R30,LOW(32)
	ST   X,R30
; 0000 0619     if (value[0] == ' ' && value[1] == '0')        // Ta[5]가 빈칸이고 Ta[6]가 '0' 일 때
_0x8A:
	LDD  R26,Y+4
	LDD  R27,Y+4+1
	LD   R26,X
	CPI  R26,LOW(0x20)
	BRNE _0x8C
	LDD  R26,Y+4
	LDD  R27,Y+4+1
	ADIW R26,1
	LD   R26,X
	CPI  R26,LOW(0x30)
	BREQ _0x8D
_0x8C:
	RJMP _0x8B
_0x8D:
; 0000 061A       value[0] = ' ';                                           // Ta[6]에 빈칸 입력
	LDD  R26,Y+4
	LDD  R27,Y+4+1
	LDI  R30,LOW(32)
	ST   X,R30
; 0000 061B }
_0x8B:
	RJMP _0x20A000B
;// 작동
;void SHToperation(){
; 0000 061D void SHToperation(){
_SHToperation:
; 0000 061E     calculation();
	RCALL _calculation
; 0000 061F     calculation_res(Ta, Ta_res);
	LDI  R30,LOW(_Ta)
	LDI  R31,HIGH(_Ta)
	ST   -Y,R31
	ST   -Y,R30
	LDS  R26,_Ta_res
	LDS  R27,_Ta_res+1
	LDS  R24,_Ta_res+2
	LDS  R25,_Ta_res+3
	RCALL _calculation_res
; 0000 0620     calculation_res(Rh, Rh_res);
	LDI  R30,LOW(_Rh)
	LDI  R31,HIGH(_Rh)
	ST   -Y,R31
	ST   -Y,R30
	LDS  R26,_Rh_res
	LDS  R27,_Rh_res+1
	LDS  R24,_Rh_res+2
	LDS  R25,_Rh_res+3
	RCALL _calculation_res
; 0000 0621     // 온습도값 출력
; 0000 0622     putstring(Ta);                            // display temperature on first row, i column
	LDI  R26,LOW(_Ta)
	LDI  R27,HIGH(_Ta)
	RCALL _putstring
; 0000 0623     putchar(',');
	LDI  R26,LOW(44)
	RCALL _putchar
; 0000 0624     putchar_usartd0(',');
	LDI  R26,LOW(44)
	RCALL _putchar_usartd0
; 0000 0625     putstring(Rh);
	LDI  R26,LOW(_Rh)
	LDI  R27,HIGH(_Rh)
	RCALL _putstring
; 0000 0626 }
	RET
;/************************************먼지센서**************************************/
;unsigned int val0;
;int dustDensity;
;void adc_dust(){
; 0000 062A void adc_dust(){
_adc_dust:
; 0000 062B     VPORT3_DIR.0 = 1;   // out
	SBI  0x1C,0
; 0000 062C     VPORT3_OUT.0 = 1;   // 3.3V출력
	SBI  0x1D,0
; 0000 062D     val0 = adca_read(0);
	LDI  R26,LOW(0)
	RCALL _adca_read
	STS  _val0,R30
	STS  _val0+1,R31
; 0000 062E     VPORT3_DIR.0 = 1;   // out
	SBI  0x1C,0
; 0000 062F     VPORT3_OUT.0 = 0;   // 0V출력
	CBI  0x1D,0
; 0000 0630     //calcvolt0 = 170*val0(3.3/4096)-100 = 0.137*val0-100
; 0000 0631     dustDensity=(int)(0.137*val0-100);
	CLR  R22
	CLR  R23
	CALL __CDF1
	__GETD2N 0x3E0C49BA
	CALL SUBOPT_0x11
	__GETD1N 0x42C80000
	CALL SUBOPT_0x12
	CALL __CFD1
	STS  _dustDensity,R30
	STS  _dustDensity+1,R31
; 0000 0632     if(dustDensity <0) dustDensity=0;
	LDS  R26,_dustDensity+1
	TST  R26
	BRPL _0x96
	LDI  R30,LOW(0)
	STS  _dustDensity,R30
	STS  _dustDensity+1,R30
; 0000 0633 }
_0x96:
	RET
;
;/***********************************공기품질****************************************/
;#define MQ135_DEFAULTPPM 392 //default ppm of CO2 for calibration
;#define MQ135_DEFAULTRO 41763 //default Ro for MQ135_DEFAULTPPM ppm of CO2
;#define MQ135_SCALINGFACTOR 116.602//0682 //CO2 gas value
;#define MQ135_EXPONENT -2.769//034857 //CO2 gas value
;#define MQ135_MAXRSRO 2.428 //for CO2
;#define MQ135_MINRSRO 0.358 //for CO2
;//define mq135 pulldown resistor
;#define MQ135_PULLDOWNRES 18460
;char printbuff[100];
;float d = 0;
;int val1;
;long mq135_ro = 0;
;/*
; * get the calibrated ro based upon read resistance, and a know ppm
; */
;long mq135_getro(long resvalue, float ppm) {
; 0000 0645 long mq135_getro(long resvalue, float ppm) {
_mq135_getro:
; 0000 0646 	return (long)(resvalue * exp( log(MQ135_SCALINGFACTOR/ppm) / MQ135_EXPONENT )); // Rs*exp(log(Scalingfactor / defaultppm) / exponent
	CALL __PUTPARD2
;	resvalue -> Y+4
;	ppm -> Y+0
	CALL SUBOPT_0x13
	__GETD2N 0x42E93439
	CALL __DIVF21
	MOVW R26,R30
	MOVW R24,R22
	CALL _log
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0xC031374C
	CALL __DIVF21
	MOVW R26,R30
	MOVW R24,R22
	CALL _exp
	CALL SUBOPT_0x14
	CALL __CDF2
	CALL __MULF12
	CALL __CFD1
	ADIW R28,8
	RET
; 0000 0647 }
;
;/*
; * get the ppm concentration
; */
; float mq135_getppm(long resvalue, long ro) {
; 0000 064C float mq135_getppm(long resvalue, long ro) {
_mq135_getppm:
; 0000 064D 	float ret = 0;
; 0000 064E 	float validinterval = 0;
; 0000 064F 	validinterval = resvalue/(float)ro;
	CALL __PUTPARD2
	SBIW R28,8
	CALL SUBOPT_0x15
	LDI  R30,LOW(0)
	STD  Y+2,R30
	STD  Y+3,R30
	STD  Y+4,R30
	STD  Y+5,R30
	STD  Y+6,R30
	STD  Y+7,R30
;	resvalue -> Y+12
;	ro -> Y+8
;	ret -> Y+4
;	validinterval -> Y+0
	CALL SUBOPT_0x16
	CALL SUBOPT_0x17
	CALL __CDF2
	CALL __DIVF21
	CALL SUBOPT_0x18
; 0000 0650 	if(validinterval<MQ135_MAXRSRO && validinterval>MQ135_MINRSRO) {
	CALL SUBOPT_0x10
	__GETD1N 0x401B645A
	CALL __CMPF12
	BRSH _0x98
	CALL SUBOPT_0x10
	__GETD1N 0x3EB74BC7
	CALL __CMPF12
	BREQ PC+2
	BRCC PC+3
	JMP  _0x98
	RJMP _0x99
_0x98:
	RJMP _0x97
_0x99:
; 0000 0651 		ret = (float)MQ135_SCALINGFACTOR * pow( ((float)resvalue/ro), MQ135_EXPONENT);
	CALL SUBOPT_0x19
	CALL __CDF1
	MOVW R26,R30
	MOVW R24,R22
	CALL SUBOPT_0x16
	CALL __DIVF21
	CALL __PUTPARD1
	__GETD2N 0xC031374C
	CALL _pow
	__GETD2N 0x42E93439
	CALL SUBOPT_0x1A
; 0000 0652 	}
; 0000 0653 	return ret;
_0x97:
	CALL SUBOPT_0x1B
	RJMP _0x20A0009
; 0000 0654 }
;
;long adc_getresistence(int adcread, long adcbalanceresistor)
; 0000 0657 {
_adc_getresistence:
; 0000 0658 	if(adcread == 0)
	CALL __PUTPARD2
;	adcread -> Y+4
;	adcbalanceresistor -> Y+0
	LDD  R30,Y+4
	LDD  R31,Y+4+1
	SBIW R30,0
	BRNE _0x9A
; 0000 0659 		return 0;
	CALL SUBOPT_0x1C
	RJMP _0x20A000B
; 0000 065A 	else
_0x9A:
; 0000 065B 		return (long)((long)(4096*( long)adcbalanceresistor)/adcread-(long)adcbalanceresistor); //(3.3V - 4096을 5V로 환산하면 6206)
	CALL SUBOPT_0x13
	__GETD2N 0x1000
	CALL __MULD12
	MOVW R26,R30
	MOVW R24,R22
	LDD  R30,Y+4
	LDD  R31,Y+4+1
	CALL __CWD1
	CALL __DIVD21
	CALL SUBOPT_0x10
	CALL __SUBD12
; 0000 065C }
_0x20A000B:
	ADIW R28,6
	RET
;void adc_air(){
; 0000 065D void adc_air(){
_adc_air:
; 0000 065E 		//calculated resistence depends on the sensor pulldown resistor
; 0000 065F 		long res;
; 0000 0660         val1 = adca_read(1);
	SBIW R28,4
;	res -> Y+0
	LDI  R26,LOW(1)
	RCALL _adca_read
	STS  _val1,R30
	STS  _val1+1,R31
; 0000 0661         res = adc_getresistence(val1, MQ135_PULLDOWNRES);
	ST   -Y,R31
	ST   -Y,R30
	__GETD2N 0x481C
	RCALL _adc_getresistence
	CALL SUBOPT_0x18
; 0000 0662 
; 0000 0663 		//get ro
; 0000 0664 		mq135_ro = mq135_getro(res, MQ135_DEFAULTPPM);
	CALL SUBOPT_0x13
	CALL __PUTPARD1
	__GETD2N 0x43C40000
	RCALL _mq135_getro
	STS  _mq135_ro,R30
	STS  _mq135_ro+1,R31
	STS  _mq135_ro+2,R22
	STS  _mq135_ro+3,R23
; 0000 0665 		//convert to ppm (using default ro)
; 0000 0666 		d = mq135_getppm(res, MQ135_DEFAULTRO);
	CALL SUBOPT_0x13
	CALL __PUTPARD1
	__GETD2N 0xA323
	RCALL _mq135_getppm
	STS  _d,R30
	STS  _d+1,R31
	STS  _d+2,R22
	STS  _d+3,R23
; 0000 0667        /*
; 0000 0668 		itoa(val1, printbuff);
; 0000 0669 		puts("ADC : ");
; 0000 066A         puts(printbuff);
; 0000 066B         puts(", ");
; 0000 066C 
; 0000 066D         ftoa(val1*0.0012,2,printbuff);
; 0000 066E         puts("V(5) : ");
; 0000 066F         puts(printbuff);
; 0000 0670         puts("V, ");
; 0000 0671 
; 0000 0672         ftoa(val1*0.0008,2,printbuff);
; 0000 0673         puts("V(3.3) : ");
; 0000 0674         puts(printbuff);
; 0000 0675         puts("V, ");
; 0000 0676 
; 0000 0677 		ltoa(res, printbuff);
; 0000 0678 		puts("RES : ");
; 0000 0679         puts(printbuff);
; 0000 067A         puts(", ");
; 0000 067B 
; 0000 067C 		ltoa(mq135_ro, printbuff);
; 0000 067D 		puts("ro : ");
; 0000 067E         puts(printbuff);
; 0000 067F         puts(", ");
; 0000 0680          */
; 0000 0681 }
	JMP  _0x20A0006
;
;
;
;
;
;void main(void)
; 0000 0688 {
_main:
; 0000 0689 // Declare your local variables here
; 0000 068A unsigned char n;
; 0000 068B unsigned char ch[30]="";
; 0000 068C 
; 0000 068D // Interrupt system initialization
; 0000 068E // Optimize for speed
; 0000 068F #pragma optsize-
; 0000 0690 // Make sure the interrupts are disabled
; 0000 0691 #asm("cli")
	SBIW R28,30
	LDI  R24,30
	LDI  R26,LOW(0)
	LDI  R27,HIGH(0)
	LDI  R30,LOW(_0x9C*2)
	LDI  R31,HIGH(_0x9C*2)
	CALL __INITLOCB
;	n -> R17
;	ch -> Y+0
	cli
; 0000 0692 // Low level interrupt: On
; 0000 0693 // Round-robin scheduling for low level interrupt: Off
; 0000 0694 // Medium level interrupt: Off
; 0000 0695 // High level interrupt: Off
; 0000 0696 // The interrupt vectors will be placed at the start of the Application FLASH section
; 0000 0697 n=(PMIC.CTRL & (~(PMIC_RREN_bm | PMIC_IVSEL_bm | PMIC_HILVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_LOLVLEN_bm))) |
; 0000 0698 	PMIC_LOLVLEN_bm;
	LDS  R30,162
	ANDI R30,LOW(0x38)
	ORI  R30,1
	MOV  R17,R30
; 0000 0699 CCP=CCP_IOREG_gc;
	LDI  R30,LOW(216)
	OUT  0x34,R30
; 0000 069A PMIC.CTRL=n;
	STS  162,R17
; 0000 069B // Set the default priority for round-robin scheduling
; 0000 069C PMIC.INTPRI=0x00;
	LDI  R30,LOW(0)
	STS  161,R30
; 0000 069D // Restore optimization for size if needed
; 0000 069E #pragma optsize_default
; 0000 069F 
; 0000 06A0 // System clocks initialization
; 0000 06A1 system_clocks_init();
	CALL _system_clocks_init
; 0000 06A2 
; 0000 06A3 // Ports initialization
; 0000 06A4 ports_init();
	CALL _ports_init
; 0000 06A5 
; 0000 06A6 // Virtual Ports initialization
; 0000 06A7 vports_init();
	RCALL _vports_init
; 0000 06A8 
; 0000 06A9 // Timer/Counter TCC0 initialization
; 0000 06AA tcc0_init();
	RCALL _tcc0_init
; 0000 06AB 
; 0000 06AC // RTC initialization
; 0000 06AD rtcxm_init();
	RCALL _rtcxm_init
; 0000 06AE 
; 0000 06AF // USARTC0 initialization
; 0000 06B0 usartc0_init();
	RCALL _usartc0_init
; 0000 06B1 
; 0000 06B2 // USARTD0 initialization
; 0000 06B3 usartd0_init();
	RCALL _usartd0_init
; 0000 06B4 
; 0000 06B5 // ADCA initialization
; 0000 06B6 adca_init();
	RCALL _adca_init
; 0000 06B7 
; 0000 06B8 SCL_Direction = 1;                 // SCL은 output
	SBI  0x18,1
; 0000 06B9 
; 0000 06BA // Globally enable interrupts
; 0000 06BB #asm("sei")
	sei
; 0000 06BC 
; 0000 06BD 
; 0000 06BE while (1)
_0x9F:
; 0000 06BF       {
; 0000 06C0       // Place your code here
; 0000 06C1         if(sec>1){      // 2초마다
	LDI  R30,LOW(1)
	LDI  R31,HIGH(1)
	CP   R30,R4
	CPC  R31,R5
	BRSH _0xA2
; 0000 06C2             SHToperation();     // 온습도 센서 동작 및 출력
	RCALL _SHToperation
; 0000 06C3             adc_dust(); // 먼지센서
	RCALL _adc_dust
; 0000 06C4             adc_air();   // 공기품질(CO2센서)
	RCALL _adc_air
; 0000 06C5             //sprintf(ch,"%d, %2.3fV, %2.3fug",val0,val0*0.0008, val0*0.106);
; 0000 06C6             sprintf(ch,", %d, %3.2f",dustDensity, d);    // dustDensity = 0.17*val0*(3.3/4096)-0.1 = 170*val0 - 100
	MOVW R30,R28
	ST   -Y,R31
	ST   -Y,R30
	__POINTW1FN _0x0,0
	ST   -Y,R31
	ST   -Y,R30
	LDS  R30,_dustDensity
	LDS  R31,_dustDensity+1
	CALL __CWD1
	CALL __PUTPARD1
	LDS  R30,_d
	LDS  R31,_d+1
	LDS  R22,_d+2
	LDS  R23,_d+3
	CALL __PUTPARD1
	LDI  R24,8
	RCALL _sprintf
	ADIW R28,12
; 0000 06C7             //sprintf(ch,"ppm : %3.2f",d);
; 0000 06C8             putstring(ch);        //  먼지센서값 출력
	MOVW R26,R28
	RCALL _putstring
; 0000 06C9             putchar_usartd0(13);    // Wi-Fi CR
	LDI  R26,LOW(13)
	RCALL _putchar_usartd0
; 0000 06CA             putchar_usartd0(10);    // Wi-Fi LF
	LDI  R26,LOW(10)
	RCALL _putchar_usartd0
; 0000 06CB             putchar('\r');      // 시리얼 CR
	LDI  R26,LOW(13)
	RCALL _putchar
; 0000 06CC             sec=0;
	CLR  R4
	CLR  R5
; 0000 06CD         }
; 0000 06CE 
; 0000 06CF       }
_0xA2:
	RJMP _0x9F
; 0000 06D0 }
_0xA3:
	RJMP _0xA3

	.CSEG
_put_buff_G100:
	ST   -Y,R27
	ST   -Y,R26
	ST   -Y,R17
	ST   -Y,R16
	LDD  R26,Y+2
	LDD  R27,Y+2+1
	ADIW R26,2
	CALL __GETW1P
	SBIW R30,0
	BREQ _0x2000010
	LDD  R26,Y+2
	LDD  R27,Y+2+1
	ADIW R26,4
	CALL __GETW1P
	MOVW R16,R30
	SBIW R30,0
	BREQ _0x2000012
	__CPWRN 16,17,2
	BRLO _0x2000013
	MOVW R30,R16
	SBIW R30,1
	MOVW R16,R30
	__PUTW1SNS 2,4
_0x2000012:
	LDD  R26,Y+2
	LDD  R27,Y+2+1
	ADIW R26,2
	CALL SUBOPT_0x1D
	SBIW R30,1
	LDD  R26,Y+4
	STD  Z+0,R26
	LDD  R26,Y+2
	LDD  R27,Y+2+1
	CALL __GETW1P
	TST  R31
	BRMI _0x2000014
	CALL SUBOPT_0x1D
_0x2000014:
_0x2000013:
	RJMP _0x2000015
_0x2000010:
	LDD  R26,Y+2
	LDD  R27,Y+2+1
	LDI  R30,LOW(65535)
	LDI  R31,HIGH(65535)
	ST   X+,R30
	ST   X,R31
_0x2000015:
	LDD  R17,Y+1
	LDD  R16,Y+0
_0x20A000A:
	ADIW R28,5
	RET
__ftoe_G100:
	ST   -Y,R27
	ST   -Y,R26
	SBIW R28,4
	CALL SUBOPT_0x15
	LDI  R30,LOW(128)
	STD  Y+2,R30
	LDI  R30,LOW(63)
	STD  Y+3,R30
	CALL __SAVELOCR4
	LDD  R30,Y+14
	LDD  R31,Y+14+1
	CPI  R30,LOW(0xFFFF)
	LDI  R26,HIGH(0xFFFF)
	CPC  R31,R26
	BRNE _0x2000019
	LDD  R30,Y+8
	LDD  R31,Y+8+1
	ST   -Y,R31
	ST   -Y,R30
	__POINTW2FN _0x2000000,0
	CALL _strcpyf
	RJMP _0x20A0008
_0x2000019:
	CPI  R30,LOW(0x7FFF)
	LDI  R26,HIGH(0x7FFF)
	CPC  R31,R26
	BRNE _0x2000018
	LDD  R30,Y+8
	LDD  R31,Y+8+1
	ST   -Y,R31
	ST   -Y,R30
	__POINTW2FN _0x2000000,1
	CALL _strcpyf
	RJMP _0x20A0008
_0x2000018:
	LDD  R26,Y+11
	CPI  R26,LOW(0x7)
	BRLO _0x200001B
	LDI  R30,LOW(6)
	STD  Y+11,R30
_0x200001B:
	LDD  R17,Y+11
_0x200001C:
	MOV  R30,R17
	SUBI R17,1
	CPI  R30,0
	BREQ _0x200001E
	CALL SUBOPT_0x1E
	RJMP _0x200001C
_0x200001E:
	CALL SUBOPT_0x19
	CALL __CPD10
	BRNE _0x200001F
	LDI  R19,LOW(0)
	CALL SUBOPT_0x1E
	RJMP _0x2000020
_0x200001F:
	LDD  R19,Y+11
	CALL SUBOPT_0x1F
	BREQ PC+2
	BRCC PC+3
	JMP  _0x2000021
	CALL SUBOPT_0x1E
_0x2000022:
	CALL SUBOPT_0x1F
	BRLO _0x2000024
	CALL SUBOPT_0x20
	RJMP _0x2000022
_0x2000024:
	RJMP _0x2000025
_0x2000021:
_0x2000026:
	CALL SUBOPT_0x1F
	BRSH _0x2000028
	CALL SUBOPT_0x17
	CALL SUBOPT_0x21
	CALL SUBOPT_0x22
	SUBI R19,LOW(1)
	RJMP _0x2000026
_0x2000028:
	CALL SUBOPT_0x1E
_0x2000025:
	CALL SUBOPT_0x19
	CALL SUBOPT_0x23
	CALL SUBOPT_0x22
	CALL SUBOPT_0x1F
	BRLO _0x2000029
	CALL SUBOPT_0x20
_0x2000029:
_0x2000020:
	LDI  R17,LOW(0)
_0x200002A:
	LDD  R30,Y+11
	CP   R30,R17
	BRLO _0x200002C
	CALL SUBOPT_0x14
	CALL SUBOPT_0x24
	CALL SUBOPT_0x23
	MOVW R26,R30
	MOVW R24,R22
	CALL _floor
	__PUTD1S 4
	CALL SUBOPT_0x1B
	CALL SUBOPT_0x17
	CALL __DIVF21
	CALL __CFD1U
	MOV  R16,R30
	CALL SUBOPT_0x25
	CALL SUBOPT_0x26
	CLR  R31
	CLR  R22
	CLR  R23
	CALL __CDF1
	CALL SUBOPT_0x14
	CALL __MULF12
	CALL SUBOPT_0x17
	CALL SUBOPT_0x12
	CALL SUBOPT_0x22
	MOV  R30,R17
	SUBI R17,-1
	CPI  R30,0
	BRNE _0x200002A
	CALL SUBOPT_0x25
	LDI  R30,LOW(46)
	ST   X,R30
	RJMP _0x200002A
_0x200002C:
	CALL SUBOPT_0x27
	SBIW R30,1
	LDD  R26,Y+10
	STD  Z+0,R26
	CPI  R19,0
	BRGE _0x200002E
	NEG  R19
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	LDI  R30,LOW(45)
	RJMP _0x2000111
_0x200002E:
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	LDI  R30,LOW(43)
_0x2000111:
	ST   X,R30
	CALL SUBOPT_0x27
	CALL SUBOPT_0x27
	SBIW R30,1
	MOVW R22,R30
	MOV  R26,R19
	LDI  R30,LOW(10)
	CALL __DIVB21
	SUBI R30,-LOW(48)
	MOVW R26,R22
	ST   X,R30
	CALL SUBOPT_0x27
	SBIW R30,1
	MOVW R22,R30
	MOV  R26,R19
	LDI  R30,LOW(10)
	CALL __MODB21
	SUBI R30,-LOW(48)
	MOVW R26,R22
	ST   X,R30
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	LDI  R30,LOW(0)
	ST   X,R30
_0x20A0008:
	CALL __LOADLOCR4
_0x20A0009:
	ADIW R28,16
	RET
__print_G100:
	ST   -Y,R27
	ST   -Y,R26
	SBIW R28,63
	SBIW R28,17
	CALL __SAVELOCR6
	LDI  R17,0
	__GETW1SX 88
	STD  Y+8,R30
	STD  Y+8+1,R31
	__GETW1SX 86
	STD  Y+6,R30
	STD  Y+6+1,R31
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	LDI  R30,LOW(0)
	LDI  R31,HIGH(0)
	ST   X+,R30
	ST   X,R31
_0x2000030:
	MOVW R26,R28
	SUBI R26,LOW(-(92))
	SBCI R27,HIGH(-(92))
	CALL SUBOPT_0x1D
	SBIW R30,1
	LPM  R30,Z
	MOV  R18,R30
	CPI  R30,0
	BRNE PC+3
	JMP _0x2000032
	MOV  R30,R17
	CPI  R30,0
	BRNE _0x2000036
	CPI  R18,37
	BRNE _0x2000037
	LDI  R17,LOW(1)
	RJMP _0x2000038
_0x2000037:
	CALL SUBOPT_0x28
_0x2000038:
	RJMP _0x2000035
_0x2000036:
	CPI  R30,LOW(0x1)
	BRNE _0x2000039
	CPI  R18,37
	BRNE _0x200003A
	CALL SUBOPT_0x28
	RJMP _0x2000112
_0x200003A:
	LDI  R17,LOW(2)
	LDI  R30,LOW(0)
	STD  Y+21,R30
	LDI  R16,LOW(0)
	CPI  R18,45
	BRNE _0x200003B
	LDI  R16,LOW(1)
	RJMP _0x2000035
_0x200003B:
	CPI  R18,43
	BRNE _0x200003C
	LDI  R30,LOW(43)
	STD  Y+21,R30
	RJMP _0x2000035
_0x200003C:
	CPI  R18,32
	BRNE _0x200003D
	LDI  R30,LOW(32)
	STD  Y+21,R30
	RJMP _0x2000035
_0x200003D:
	RJMP _0x200003E
_0x2000039:
	CPI  R30,LOW(0x2)
	BRNE _0x200003F
_0x200003E:
	LDI  R21,LOW(0)
	LDI  R17,LOW(3)
	CPI  R18,48
	BRNE _0x2000040
	ORI  R16,LOW(128)
	RJMP _0x2000035
_0x2000040:
	RJMP _0x2000041
_0x200003F:
	CPI  R30,LOW(0x3)
	BRNE _0x2000042
_0x2000041:
	CPI  R18,48
	BRLO _0x2000044
	CPI  R18,58
	BRLO _0x2000045
_0x2000044:
	RJMP _0x2000043
_0x2000045:
	LDI  R26,LOW(10)
	MUL  R21,R26
	MOV  R21,R0
	MOV  R30,R18
	SUBI R30,LOW(48)
	ADD  R21,R30
	RJMP _0x2000035
_0x2000043:
	LDI  R20,LOW(0)
	CPI  R18,46
	BRNE _0x2000046
	LDI  R17,LOW(4)
	RJMP _0x2000035
_0x2000046:
	RJMP _0x2000047
_0x2000042:
	CPI  R30,LOW(0x4)
	BRNE _0x2000049
	CPI  R18,48
	BRLO _0x200004B
	CPI  R18,58
	BRLO _0x200004C
_0x200004B:
	RJMP _0x200004A
_0x200004C:
	ORI  R16,LOW(32)
	LDI  R26,LOW(10)
	MUL  R20,R26
	MOV  R20,R0
	MOV  R30,R18
	SUBI R30,LOW(48)
	ADD  R20,R30
	RJMP _0x2000035
_0x200004A:
_0x2000047:
	CPI  R18,108
	BRNE _0x200004D
	ORI  R16,LOW(2)
	LDI  R17,LOW(5)
	RJMP _0x2000035
_0x200004D:
	RJMP _0x200004E
_0x2000049:
	CPI  R30,LOW(0x5)
	BREQ PC+3
	JMP _0x2000035
_0x200004E:
	MOV  R30,R18
	CPI  R30,LOW(0x63)
	BRNE _0x2000053
	CALL SUBOPT_0x29
	CALL SUBOPT_0x2A
	CALL SUBOPT_0x29
	LDD  R26,Z+4
	ST   -Y,R26
	CALL SUBOPT_0x2B
	RJMP _0x2000054
_0x2000053:
	CPI  R30,LOW(0x45)
	BREQ _0x2000057
	CPI  R30,LOW(0x65)
	BRNE _0x2000058
_0x2000057:
	RJMP _0x2000059
_0x2000058:
	CPI  R30,LOW(0x66)
	BREQ PC+3
	JMP _0x200005A
_0x2000059:
	MOVW R30,R28
	ADIW R30,22
	STD  Y+14,R30
	STD  Y+14+1,R31
	CALL SUBOPT_0x2C
	CALL __GETD1P
	CALL SUBOPT_0x2D
	CALL SUBOPT_0x2E
	LDD  R26,Y+13
	TST  R26
	BRMI _0x200005B
	LDD  R26,Y+21
	CPI  R26,LOW(0x2B)
	BREQ _0x200005D
	RJMP _0x200005E
_0x200005B:
	CALL SUBOPT_0x2F
	CALL __ANEGF1
	CALL SUBOPT_0x2D
	LDI  R30,LOW(45)
	STD  Y+21,R30
_0x200005D:
	SBRS R16,7
	RJMP _0x200005F
	LDD  R30,Y+21
	ST   -Y,R30
	CALL SUBOPT_0x2B
	RJMP _0x2000060
_0x200005F:
	LDD  R30,Y+14
	LDD  R31,Y+14+1
	ADIW R30,1
	STD  Y+14,R30
	STD  Y+14+1,R31
	SBIW R30,1
	LDD  R26,Y+21
	STD  Z+0,R26
_0x2000060:
_0x200005E:
	SBRS R16,5
	LDI  R20,LOW(6)
	CPI  R18,102
	BRNE _0x2000062
	CALL SUBOPT_0x2F
	CALL __PUTPARD1
	ST   -Y,R20
	LDD  R26,Y+19
	LDD  R27,Y+19+1
	CALL _ftoa
	RJMP _0x2000063
_0x2000062:
	CALL SUBOPT_0x2F
	CALL __PUTPARD1
	ST   -Y,R20
	ST   -Y,R18
	LDD  R26,Y+20
	LDD  R27,Y+20+1
	RCALL __ftoe_G100
_0x2000063:
	MOVW R30,R28
	ADIW R30,22
	CALL SUBOPT_0x30
	RJMP _0x2000064
_0x200005A:
	CPI  R30,LOW(0x73)
	BRNE _0x2000066
	CALL SUBOPT_0x2E
	CALL SUBOPT_0x31
	CALL SUBOPT_0x30
	RJMP _0x2000067
_0x2000066:
	CPI  R30,LOW(0x70)
	BRNE _0x2000069
	CALL SUBOPT_0x2E
	CALL SUBOPT_0x31
	STD  Y+14,R30
	STD  Y+14+1,R31
	LDD  R26,Y+14
	LDD  R27,Y+14+1
	CALL _strlenf
	MOV  R17,R30
	ORI  R16,LOW(8)
_0x2000067:
	ANDI R16,LOW(127)
	CPI  R20,0
	BREQ _0x200006B
	CP   R20,R17
	BRLO _0x200006C
_0x200006B:
	RJMP _0x200006A
_0x200006C:
	MOV  R17,R20
_0x200006A:
_0x2000064:
	LDI  R20,LOW(0)
	LDI  R30,LOW(0)
	STD  Y+20,R30
	LDI  R19,LOW(0)
	RJMP _0x200006D
_0x2000069:
	CPI  R30,LOW(0x64)
	BREQ _0x2000070
	CPI  R30,LOW(0x69)
	BRNE _0x2000071
_0x2000070:
	ORI  R16,LOW(4)
	RJMP _0x2000072
_0x2000071:
	CPI  R30,LOW(0x75)
	BRNE _0x2000073
_0x2000072:
	LDI  R30,LOW(10)
	STD  Y+20,R30
	SBRS R16,1
	RJMP _0x2000074
	__GETD1N 0x3B9ACA00
	CALL SUBOPT_0x32
	LDI  R17,LOW(10)
	RJMP _0x2000075
_0x2000074:
	CALL SUBOPT_0xF
	CALL SUBOPT_0x32
	LDI  R17,LOW(5)
	RJMP _0x2000075
_0x2000073:
	CPI  R30,LOW(0x58)
	BRNE _0x2000077
	ORI  R16,LOW(8)
	RJMP _0x2000078
_0x2000077:
	CPI  R30,LOW(0x78)
	BREQ PC+3
	JMP _0x20000B6
_0x2000078:
	LDI  R30,LOW(16)
	STD  Y+20,R30
	SBRS R16,1
	RJMP _0x200007A
	__GETD1N 0x10000000
	CALL SUBOPT_0x32
	LDI  R17,LOW(8)
	RJMP _0x2000075
_0x200007A:
	__GETD1N 0x1000
	CALL SUBOPT_0x32
	LDI  R17,LOW(4)
_0x2000075:
	CPI  R20,0
	BREQ _0x200007B
	ANDI R16,LOW(127)
	RJMP _0x200007C
_0x200007B:
	LDI  R20,LOW(1)
_0x200007C:
	SBRS R16,1
	RJMP _0x200007D
	CALL SUBOPT_0x2E
	CALL SUBOPT_0x2C
	ADIW R26,4
	CALL __GETD1P
	RJMP _0x2000113
_0x200007D:
	SBRS R16,2
	RJMP _0x200007F
	CALL SUBOPT_0x2E
	CALL SUBOPT_0x31
	CALL __CWD1
	RJMP _0x2000113
_0x200007F:
	CALL SUBOPT_0x2E
	CALL SUBOPT_0x31
	CLR  R22
	CLR  R23
_0x2000113:
	__PUTD1S 10
	SBRS R16,2
	RJMP _0x2000081
	LDD  R26,Y+13
	TST  R26
	BRPL _0x2000082
	CALL SUBOPT_0x2F
	CALL __ANEGD1
	CALL SUBOPT_0x2D
	LDI  R30,LOW(45)
	STD  Y+21,R30
_0x2000082:
	LDD  R30,Y+21
	CPI  R30,0
	BREQ _0x2000083
	SUBI R17,-LOW(1)
	SUBI R20,-LOW(1)
	RJMP _0x2000084
_0x2000083:
	ANDI R16,LOW(251)
_0x2000084:
_0x2000081:
	MOV  R19,R20
_0x200006D:
	SBRC R16,0
	RJMP _0x2000085
_0x2000086:
	CP   R17,R21
	BRSH _0x2000089
	CP   R19,R21
	BRLO _0x200008A
_0x2000089:
	RJMP _0x2000088
_0x200008A:
	SBRS R16,7
	RJMP _0x200008B
	SBRS R16,2
	RJMP _0x200008C
	ANDI R16,LOW(251)
	LDD  R18,Y+21
	SUBI R17,LOW(1)
	RJMP _0x200008D
_0x200008C:
	LDI  R18,LOW(48)
_0x200008D:
	RJMP _0x200008E
_0x200008B:
	LDI  R18,LOW(32)
_0x200008E:
	CALL SUBOPT_0x28
	SUBI R21,LOW(1)
	RJMP _0x2000086
_0x2000088:
_0x2000085:
_0x200008F:
	CP   R17,R20
	BRSH _0x2000091
	ORI  R16,LOW(16)
	SBRS R16,2
	RJMP _0x2000092
	CALL SUBOPT_0x33
	BREQ _0x2000093
	SUBI R21,LOW(1)
_0x2000093:
	SUBI R17,LOW(1)
	SUBI R20,LOW(1)
_0x2000092:
	LDI  R30,LOW(48)
	ST   -Y,R30
	CALL SUBOPT_0x2B
	CPI  R21,0
	BREQ _0x2000094
	SUBI R21,LOW(1)
_0x2000094:
	SUBI R20,LOW(1)
	RJMP _0x200008F
_0x2000091:
	MOV  R19,R17
	LDD  R30,Y+20
	CPI  R30,0
	BRNE _0x2000095
_0x2000096:
	CPI  R19,0
	BREQ _0x2000098
	SBRS R16,3
	RJMP _0x2000099
	LDD  R30,Y+14
	LDD  R31,Y+14+1
	LPM  R18,Z+
	STD  Y+14,R30
	STD  Y+14+1,R31
	RJMP _0x200009A
_0x2000099:
	LDD  R26,Y+14
	LDD  R27,Y+14+1
	LD   R18,X+
	STD  Y+14,R26
	STD  Y+14+1,R27
_0x200009A:
	CALL SUBOPT_0x28
	CPI  R21,0
	BREQ _0x200009B
	SUBI R21,LOW(1)
_0x200009B:
	SUBI R19,LOW(1)
	RJMP _0x2000096
_0x2000098:
	RJMP _0x200009C
_0x2000095:
_0x200009E:
	CALL SUBOPT_0x34
	CALL __DIVD21U
	MOV  R18,R30
	CPI  R18,10
	BRLO _0x20000A0
	SBRS R16,3
	RJMP _0x20000A1
	SUBI R18,-LOW(55)
	RJMP _0x20000A2
_0x20000A1:
	SUBI R18,-LOW(87)
_0x20000A2:
	RJMP _0x20000A3
_0x20000A0:
	SUBI R18,-LOW(48)
_0x20000A3:
	SBRC R16,4
	RJMP _0x20000A5
	CPI  R18,49
	BRSH _0x20000A7
	__GETD2S 16
	__CPD2N 0x1
	BRNE _0x20000A6
_0x20000A7:
	RJMP _0x20000A9
_0x20000A6:
	CP   R20,R19
	BRSH _0x2000114
	CP   R21,R19
	BRLO _0x20000AC
	SBRS R16,0
	RJMP _0x20000AD
_0x20000AC:
	RJMP _0x20000AB
_0x20000AD:
	LDI  R18,LOW(32)
	SBRS R16,7
	RJMP _0x20000AE
_0x2000114:
	LDI  R18,LOW(48)
_0x20000A9:
	ORI  R16,LOW(16)
	SBRS R16,2
	RJMP _0x20000AF
	CALL SUBOPT_0x33
	BREQ _0x20000B0
	SUBI R21,LOW(1)
_0x20000B0:
_0x20000AF:
_0x20000AE:
_0x20000A5:
	CALL SUBOPT_0x28
	CPI  R21,0
	BREQ _0x20000B1
	SUBI R21,LOW(1)
_0x20000B1:
_0x20000AB:
	SUBI R19,LOW(1)
	CALL SUBOPT_0x34
	CALL __MODD21U
	CALL SUBOPT_0x2D
	LDD  R30,Y+20
	__GETD2S 16
	CLR  R31
	CLR  R22
	CLR  R23
	CALL __DIVD21U
	CALL SUBOPT_0x32
	__GETD1S 16
	CALL __CPD10
	BREQ _0x200009F
	RJMP _0x200009E
_0x200009F:
_0x200009C:
	SBRS R16,0
	RJMP _0x20000B2
_0x20000B3:
	CPI  R21,0
	BREQ _0x20000B5
	SUBI R21,LOW(1)
	LDI  R30,LOW(32)
	ST   -Y,R30
	CALL SUBOPT_0x2B
	RJMP _0x20000B3
_0x20000B5:
_0x20000B2:
_0x20000B6:
_0x2000054:
_0x2000112:
	LDI  R17,LOW(0)
_0x2000035:
	RJMP _0x2000030
_0x2000032:
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	CALL __GETW1P
	CALL __LOADLOCR6
	ADIW R28,63
	ADIW R28,31
	RET
_sprintf:
	PUSH R15
	MOV  R15,R24
	SBIW R28,6
	CALL __SAVELOCR4
	CALL SUBOPT_0x35
	SBIW R30,0
	BRNE _0x20000B7
	LDI  R30,LOW(65535)
	LDI  R31,HIGH(65535)
	RJMP _0x20A0007
_0x20000B7:
	MOVW R26,R28
	ADIW R26,6
	CALL __ADDW2R15
	MOVW R16,R26
	CALL SUBOPT_0x35
	STD  Y+6,R30
	STD  Y+6+1,R31
	LDI  R30,LOW(0)
	STD  Y+8,R30
	STD  Y+8+1,R30
	MOVW R26,R28
	ADIW R26,10
	CALL __ADDW2R15
	CALL __GETW1P
	ST   -Y,R31
	ST   -Y,R30
	ST   -Y,R17
	ST   -Y,R16
	LDI  R30,LOW(_put_buff_G100)
	LDI  R31,HIGH(_put_buff_G100)
	ST   -Y,R31
	ST   -Y,R30
	MOVW R26,R28
	ADIW R26,10
	RCALL __print_G100
	MOVW R18,R30
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	LDI  R30,LOW(0)
	ST   X,R30
	MOVW R30,R18
_0x20A0007:
	CALL __LOADLOCR4
	ADIW R28,10
	POP  R15
	RET

	.CSEG
_ftrunc:
	CALL __PUTPARD2
   ldd  r23,y+3
   ldd  r22,y+2
   ldd  r31,y+1
   ld   r30,y
   bst  r23,7
   lsl  r23
   sbrc r22,7
   sbr  r23,1
   mov  r25,r23
   subi r25,0x7e
   breq __ftrunc0
   brcs __ftrunc0
   cpi  r25,24
   brsh __ftrunc1
   clr  r26
   clr  r27
   clr  r24
__ftrunc2:
   sec
   ror  r24
   ror  r27
   ror  r26
   dec  r25
   brne __ftrunc2
   and  r30,r26
   and  r31,r27
   and  r22,r24
   rjmp __ftrunc1
__ftrunc0:
   clt
   clr  r23
   clr  r30
   clr  r31
   clr  r22
__ftrunc1:
   cbr  r22,0x80
   lsr  r23
   brcc __ftrunc3
   sbr  r22,0x80
__ftrunc3:
   bld  r23,7
   ld   r26,y+
   ld   r27,y+
   ld   r24,y+
   ld   r25,y+
   cp   r30,r26
   cpc  r31,r27
   cpc  r22,r24
   cpc  r23,r25
   bst  r25,7
   ret
_floor:
	CALL SUBOPT_0xE
	CALL _ftrunc
	CALL SUBOPT_0x18
    brne __floor1
__floor0:
	CALL SUBOPT_0x13
	RJMP _0x20A0006
__floor1:
    brtc __floor0
	CALL SUBOPT_0x13
	CALL SUBOPT_0x36
_0x20A0006:
	ADIW R28,4
	RET
_log:
	CALL __PUTPARD2
	SBIW R28,4
	ST   -Y,R17
	ST   -Y,R16
	CALL SUBOPT_0x37
	CALL __CPD02
	BRLT _0x202000C
	__GETD1N 0xFF7FFFFF
	RJMP _0x20A0005
_0x202000C:
	CALL SUBOPT_0x38
	CALL __PUTPARD1
	IN   R26,SPL
	IN   R27,SPH
	SBIW R26,1
	PUSH R17
	PUSH R16
	CALL _frexp
	POP  R16
	POP  R17
	CALL SUBOPT_0x39
	CALL SUBOPT_0x37
	__GETD1N 0x3F3504F3
	CALL __CMPF12
	BRSH _0x202000D
	CALL SUBOPT_0x3A
	CALL __ADDF12
	CALL SUBOPT_0x39
	__SUBWRN 16,17,1
_0x202000D:
	CALL SUBOPT_0x38
	CALL SUBOPT_0x36
	PUSH R23
	PUSH R22
	PUSH R31
	PUSH R30
	CALL SUBOPT_0x38
	__GETD2N 0x3F800000
	CALL __ADDF12
	POP  R26
	POP  R27
	POP  R24
	POP  R25
	CALL __DIVF21
	CALL SUBOPT_0x39
	CALL SUBOPT_0x3A
	CALL SUBOPT_0x3B
	__GETD2N 0x3F654226
	CALL SUBOPT_0x11
	__GETD1N 0x4054114E
	CALL SUBOPT_0x12
	CALL SUBOPT_0x37
	CALL __MULF12
	PUSH R23
	PUSH R22
	PUSH R31
	PUSH R30
	CALL SUBOPT_0x3C
	__GETD2N 0x3FD4114D
	CALL __SUBF12
	POP  R26
	POP  R27
	POP  R24
	POP  R25
	CALL __DIVF21
	PUSH R23
	PUSH R22
	PUSH R31
	PUSH R30
	MOVW R30,R16
	CALL SUBOPT_0x3D
	__GETD2N 0x3F317218
	CALL __MULF12
	POP  R26
	POP  R27
	POP  R24
	POP  R25
	CALL __ADDF12
_0x20A0005:
	LDD  R17,Y+1
	LDD  R16,Y+0
	ADIW R28,10
	RET
_exp:
	CALL __PUTPARD2
	SBIW R28,8
	ST   -Y,R17
	ST   -Y,R16
	CALL SUBOPT_0x3E
	__GETD1N 0xC2AEAC50
	CALL __CMPF12
	BRSH _0x202000F
	CALL SUBOPT_0x1C
	RJMP _0x20A0004
_0x202000F:
	CALL SUBOPT_0x2F
	CALL __CPD10
	BRNE _0x2020010
	CALL SUBOPT_0x3F
	RJMP _0x20A0004
_0x2020010:
	CALL SUBOPT_0x3E
	__GETD1N 0x42B17218
	CALL __CMPF12
	BREQ PC+2
	BRCC PC+3
	JMP  _0x2020011
	__GETD1N 0x7F7FFFFF
	RJMP _0x20A0004
_0x2020011:
	CALL SUBOPT_0x3E
	__GETD1N 0x3FB8AA3B
	CALL __MULF12
	CALL SUBOPT_0x2D
	CALL SUBOPT_0x3E
	RCALL _floor
	CALL __CFD1
	MOVW R16,R30
	MOVW R30,R16
	CALL SUBOPT_0x3E
	CALL SUBOPT_0x3D
	CALL SUBOPT_0x12
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0x3F000000
	CALL SUBOPT_0x12
	CALL SUBOPT_0x39
	CALL SUBOPT_0x3A
	CALL SUBOPT_0x3B
	__GETD2N 0x3D6C4C6D
	CALL __MULF12
	__GETD2N 0x40E6E3A6
	CALL __ADDF12
	CALL SUBOPT_0x37
	CALL __MULF12
	CALL SUBOPT_0x39
	CALL SUBOPT_0x3C
	__GETD2N 0x41A68D28
	CALL __ADDF12
	CALL SUBOPT_0x40
	CALL SUBOPT_0x38
	CALL SUBOPT_0x41
	CALL __ADDF12
	__GETD2N 0x3FB504F3
	CALL __MULF12
	PUSH R23
	PUSH R22
	PUSH R31
	PUSH R30
	CALL SUBOPT_0x37
	CALL SUBOPT_0x3C
	CALL __SUBF12
	POP  R26
	POP  R27
	POP  R24
	POP  R25
	CALL __DIVF21
	CALL __PUTPARD1
	MOVW R26,R16
	CALL _ldexp
_0x20A0004:
	LDD  R17,Y+1
	LDD  R16,Y+0
	ADIW R28,14
	RET
_pow:
	CALL __PUTPARD2
	SBIW R28,4
	CALL SUBOPT_0x42
	CALL __CPD10
	BRNE _0x2020012
	CALL SUBOPT_0x1C
	RJMP _0x20A0003
_0x2020012:
	__GETD2S 8
	CALL __CPD02
	BRGE _0x2020013
	CALL SUBOPT_0x1B
	CALL __CPD10
	BRNE _0x2020014
	CALL SUBOPT_0x3F
	RJMP _0x20A0003
_0x2020014:
	__GETD2S 8
	CALL SUBOPT_0x43
	RCALL _exp
	RJMP _0x20A0003
_0x2020013:
	CALL SUBOPT_0x1B
	MOVW R26,R28
	CALL __CFD1
	CALL __PUTDP1
	CALL SUBOPT_0x13
	CALL __CDF1
	MOVW R26,R30
	MOVW R24,R22
	CALL SUBOPT_0x1B
	CALL __CPD12
	BREQ _0x2020015
	CALL SUBOPT_0x1C
	RJMP _0x20A0003
_0x2020015:
	CALL SUBOPT_0x42
	CALL __ANEGF1
	MOVW R26,R30
	MOVW R24,R22
	CALL SUBOPT_0x43
	RCALL _exp
	__PUTD1S 8
	LD   R30,Y
	ANDI R30,LOW(0x1)
	BRNE _0x2020016
	CALL SUBOPT_0x42
	RJMP _0x20A0003
_0x2020016:
	CALL SUBOPT_0x42
	CALL __ANEGF1
_0x20A0003:
	ADIW R28,12
	RET

	.CSEG
_ftoa:
	ST   -Y,R27
	ST   -Y,R26
	SBIW R28,4
	CALL SUBOPT_0x15
	LDI  R30,LOW(0)
	STD  Y+2,R30
	LDI  R30,LOW(63)
	STD  Y+3,R30
	ST   -Y,R17
	ST   -Y,R16
	LDD  R30,Y+11
	LDD  R31,Y+11+1
	CPI  R30,LOW(0xFFFF)
	LDI  R26,HIGH(0xFFFF)
	CPC  R31,R26
	BRNE _0x204000D
	CALL SUBOPT_0x44
	__POINTW2FN _0x2040000,0
	CALL _strcpyf
	RJMP _0x20A0002
_0x204000D:
	CPI  R30,LOW(0x7FFF)
	LDI  R26,HIGH(0x7FFF)
	CPC  R31,R26
	BRNE _0x204000C
	CALL SUBOPT_0x44
	__POINTW2FN _0x2040000,1
	CALL _strcpyf
	RJMP _0x20A0002
_0x204000C:
	LDD  R26,Y+12
	TST  R26
	BRPL _0x204000F
	__GETD1S 9
	CALL __ANEGF1
	CALL SUBOPT_0x45
	CALL SUBOPT_0x46
	LDI  R30,LOW(45)
	ST   X,R30
_0x204000F:
	LDD  R26,Y+8
	CPI  R26,LOW(0x7)
	BRLO _0x2040010
	LDI  R30,LOW(6)
	STD  Y+8,R30
_0x2040010:
	LDD  R17,Y+8
_0x2040011:
	MOV  R30,R17
	SUBI R17,1
	CPI  R30,0
	BREQ _0x2040013
	CALL SUBOPT_0x41
	CALL SUBOPT_0x24
	CALL SUBOPT_0x40
	RJMP _0x2040011
_0x2040013:
	CALL SUBOPT_0x47
	CALL __ADDF12
	CALL SUBOPT_0x45
	LDI  R17,LOW(0)
	CALL SUBOPT_0x3F
	CALL SUBOPT_0x40
_0x2040014:
	CALL SUBOPT_0x47
	CALL __CMPF12
	BRLO _0x2040016
	CALL SUBOPT_0x41
	CALL SUBOPT_0x21
	CALL SUBOPT_0x40
	SUBI R17,-LOW(1)
	CPI  R17,39
	BRLO _0x2040017
	CALL SUBOPT_0x44
	__POINTW2FN _0x2040000,5
	CALL _strcpyf
	RJMP _0x20A0002
_0x2040017:
	RJMP _0x2040014
_0x2040016:
	CPI  R17,0
	BRNE _0x2040018
	CALL SUBOPT_0x46
	LDI  R30,LOW(48)
	ST   X,R30
	RJMP _0x2040019
_0x2040018:
_0x204001A:
	MOV  R30,R17
	SUBI R17,1
	CPI  R30,0
	BREQ _0x204001C
	CALL SUBOPT_0x41
	CALL SUBOPT_0x24
	CALL SUBOPT_0x23
	MOVW R26,R30
	MOVW R24,R22
	CALL _floor
	CALL SUBOPT_0x40
	CALL SUBOPT_0x47
	CALL __DIVF21
	CALL __CFD1U
	MOV  R16,R30
	CALL SUBOPT_0x46
	CALL SUBOPT_0x26
	LDI  R31,0
	CALL SUBOPT_0x41
	CALL SUBOPT_0x3D
	CALL __MULF12
	CALL SUBOPT_0x48
	CALL SUBOPT_0x12
	CALL SUBOPT_0x45
	RJMP _0x204001A
_0x204001C:
_0x2040019:
	LDD  R30,Y+8
	CPI  R30,0
	BREQ _0x20A0001
	CALL SUBOPT_0x46
	LDI  R30,LOW(46)
	ST   X,R30
_0x204001E:
	LDD  R30,Y+8
	SUBI R30,LOW(1)
	STD  Y+8,R30
	SUBI R30,-LOW(1)
	BREQ _0x2040020
	CALL SUBOPT_0x48
	CALL SUBOPT_0x21
	CALL SUBOPT_0x45
	__GETD1S 9
	CALL __CFD1U
	MOV  R16,R30
	CALL SUBOPT_0x46
	CALL SUBOPT_0x26
	LDI  R31,0
	CALL SUBOPT_0x48
	CALL SUBOPT_0x3D
	CALL SUBOPT_0x12
	CALL SUBOPT_0x45
	RJMP _0x204001E
_0x2040020:
_0x20A0001:
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	LDI  R30,LOW(0)
	ST   X,R30
_0x20A0002:
	LDD  R17,Y+1
	LDD  R16,Y+0
	ADIW R28,13
	RET

	.DSEG

	.CSEG

	.CSEG
_strcpyf:
	ST   -Y,R27
	ST   -Y,R26
    ld   r30,y+
    ld   r31,y+
    ld   r26,y+
    ld   r27,y+
    movw r24,r26
strcpyf0:
	lpm  r0,z+
    st   x+,r0
    tst  r0
    brne strcpyf0
    movw r30,r24
    ret
_strlen:
	ST   -Y,R27
	ST   -Y,R26
    ld   r26,y+
    ld   r27,y+
    clr  r30
    clr  r31
strlen0:
    ld   r22,x+
    tst  r22
    breq strlen1
    adiw r30,1
    rjmp strlen0
strlen1:
    ret
_strlenf:
	ST   -Y,R27
	ST   -Y,R26
    clr  r26
    clr  r27
    ld   r30,y+
    ld   r31,y+
strlenf0:
	lpm  r0,z+
    tst  r0
    breq strlenf1
    adiw r26,1
    rjmp strlenf0
strlenf1:
    movw r30,r26
    ret

	.CSEG

	.DSEG
_rx_buffer_usartc0:
	.BYTE 0x8
_rx_buffer_usartd0:
	.BYTE 0x8
_i:
	.BYTE 0x2
_j:
	.BYTE 0x2
_temp:
	.BYTE 0x4
_k:
	.BYTE 0x4
_SOt:
	.BYTE 0x4
_SOrh:
	.BYTE 0x4
_Ta_res:
	.BYTE 0x4
_Rh_res:
	.BYTE 0x4
_Ta:
	.BYTE 0x10
_Rh:
	.BYTE 0x10
_val0:
	.BYTE 0x2
_dustDensity:
	.BYTE 0x2
_d:
	.BYTE 0x4
_val1:
	.BYTE 0x2
_mq135_ro:
	.BYTE 0x4
__seed_G102:
	.BYTE 0x4

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x0:
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x1:
	ORI  R30,1
	STS  544,R30
	LDS  R30,545
	ANDI R30,LOW(0x84)
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x2:
	LDS  R30,512
	ORI  R30,1
	STS  512,R30
	__DELAY_USB 1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x3:
	MOVW R30,R16
	LDD  R26,Y+2
	LDD  R27,Y+2+1
	ADD  R26,R30
	ADC  R27,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x4:
	LDI  R30,LOW(1)
	LDI  R31,HIGH(1)
	STS  _i,R30
	STS  _i+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x5:
	LDS  R26,_i
	LDS  R27,_i+1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:11 WORDS
SUBOPT_0x6:
	LDS  R30,_i
	LDS  R31,_i+1
	ADIW R30,1
	STS  _i,R30
	STS  _i+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x7:
	SBI  0x19,1
	__DELAY_USB 1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x8:
	CBI  0x19,1
	__DELAY_USB 1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x9:
	LDS  R30,_k
	LDS  R31,_k+1
	LDS  R22,_k+2
	LDS  R23,_k+3
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0xA:
	STS  _k,R30
	STS  _k+1,R31
	STS  _k+2,R22
	STS  _k+3,R23
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0xB:
	LDS  R26,_SOt
	LDS  R27,_SOt+1
	LDS  R24,_SOt+2
	LDS  R25,_SOt+3
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0xC:
	LDS  R30,_SOrh
	LDS  R31,_SOrh+1
	LDS  R22,_SOrh+2
	LDS  R23,_SOrh+3
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0xD:
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0x64
	CALL __DIVD21
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xE:
	CALL __PUTPARD2
	CALL __GETD2S0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xF:
	__GETD1N 0x2710
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x10:
	CALL __GETD2S0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x11:
	CALL __MULF12
	MOVW R26,R30
	MOVW R24,R22
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x12:
	CALL __SWAPD12
	CALL __SUBF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x13:
	CALL __GETD1S0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x14:
	__GETD2S 4
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x15:
	LDI  R30,LOW(0)
	ST   Y,R30
	STD  Y+1,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x16:
	__GETD1S 8
	CALL __CDF1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 10 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0x17:
	__GETD2S 12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x18:
	CALL __PUTD1S0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x19:
	__GETD1S 12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x1A:
	CALL __MULF12
	__PUTD1S 4
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 9 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x1B:
	__GETD1S 4
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x1C:
	__GETD1N 0x0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x1D:
	CALL __GETW1P
	ADIW R30,1
	ST   X+,R30
	ST   X,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0x1E:
	RCALL SUBOPT_0x14
	__GETD1N 0x41200000
	RJMP SUBOPT_0x1A

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x1F:
	RCALL SUBOPT_0x1B
	RCALL SUBOPT_0x17
	CALL __CMPF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:8 WORDS
SUBOPT_0x20:
	RCALL SUBOPT_0x17
	__GETD1N 0x3DCCCCCD
	CALL __MULF12
	__PUTD1S 12
	SUBI R19,-LOW(1)
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x21:
	__GETD1N 0x41200000
	CALL __MULF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x22:
	__PUTD1S 12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x23:
	__GETD2N 0x3F000000
	CALL __ADDF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x24:
	__GETD1N 0x3DCCCCCD
	CALL __MULF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x25:
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	ADIW R26,1
	STD  Y+8,R26
	STD  Y+8+1,R27
	SBIW R26,1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x26:
	MOV  R30,R16
	SUBI R30,-LOW(48)
	ST   X,R30
	MOV  R30,R16
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x27:
	LDD  R30,Y+8
	LDD  R31,Y+8+1
	ADIW R30,1
	STD  Y+8,R30
	STD  Y+8+1,R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x28:
	ST   -Y,R18
	LDD  R26,Y+7
	LDD  R27,Y+7+1
	LDD  R30,Y+9
	LDD  R31,Y+9+1
	ICALL
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:25 WORDS
SUBOPT_0x29:
	__GETW1SX 90
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:21 WORDS
SUBOPT_0x2A:
	SBIW R30,4
	__PUTW1SX 90
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x2B:
	LDD  R26,Y+7
	LDD  R27,Y+7+1
	LDD  R30,Y+9
	LDD  R31,Y+9+1
	ICALL
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:17 WORDS
SUBOPT_0x2C:
	__GETW2SX 90
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x2D:
	__PUTD1S 10
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x2E:
	RCALL SUBOPT_0x29
	RJMP SUBOPT_0x2A

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x2F:
	__GETD1S 10
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x30:
	STD  Y+14,R30
	STD  Y+14+1,R31
	LDD  R26,Y+14
	LDD  R27,Y+14+1
	CALL _strlen
	MOV  R17,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x31:
	RCALL SUBOPT_0x2C
	ADIW R26,4
	CALL __GETW1P
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x32:
	__PUTD1S 16
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:12 WORDS
SUBOPT_0x33:
	ANDI R16,LOW(251)
	LDD  R30,Y+21
	ST   -Y,R30
	__GETW2SX 87
	__GETW1SX 89
	ICALL
	CPI  R21,0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x34:
	__GETD1S 16
	__GETD2S 10
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x35:
	MOVW R26,R28
	ADIW R26,12
	CALL __ADDW2R15
	CALL __GETW1P
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x36:
	__GETD2N 0x3F800000
	CALL __SUBF12
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:11 WORDS
SUBOPT_0x37:
	__GETD2S 6
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:9 WORDS
SUBOPT_0x38:
	__GETD1S 6
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x39:
	__PUTD1S 6
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x3A:
	RCALL SUBOPT_0x38
	RJMP SUBOPT_0x37

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x3B:
	CALL __MULF12
	__PUTD1S 2
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x3C:
	__GETD1S 2
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x3D:
	CALL __CWD1
	CALL __CDF1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x3E:
	__GETD2S 10
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x3F:
	__GETD1N 0x3F800000
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x40:
	__PUTD1S 2
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x41:
	__GETD2S 2
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x42:
	__GETD1S 8
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x43:
	CALL _log
	RCALL SUBOPT_0x14
	RJMP SUBOPT_0x11

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x44:
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	ST   -Y,R31
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x45:
	__PUTD1S 9
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x46:
	LDD  R26,Y+6
	LDD  R27,Y+6+1
	ADIW R26,1
	STD  Y+6,R26
	STD  Y+6+1,R27
	SBIW R26,1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:5 WORDS
SUBOPT_0x47:
	RCALL SUBOPT_0x3C
	__GETD2S 9
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x48:
	__GETD2S 9
	RET


	.CSEG
_frexp:
	LD   R30,Y+
	LD   R31,Y+
	LD   R22,Y+
	LD   R23,Y+
	BST  R23,7
	LSL  R22
	ROL  R23
	CLR  R24
	SUBI R23,0x7E
	SBC  R24,R24
	ST   X+,R23
	ST   X,R24
	LDI  R23,0x7E
	LSR  R23
	ROR  R22
	BRTS __ANEGF1
	RET

_ldexp:
	LD   R30,Y+
	LD   R31,Y+
	LD   R22,Y+
	LD   R23,Y+
	BST  R23,7
	LSL  R22
	ROL  R23
	ADD  R23,R26
	LSR  R23
	ROR  R22
	BRTS __ANEGF1
	RET

__ANEGF1:
	SBIW R30,0
	SBCI R22,0
	SBCI R23,0
	BREQ __ANEGF10
	SUBI R23,0x80
__ANEGF10:
	RET

__ROUND_REPACK:
	TST  R21
	BRPL __REPACK
	CPI  R21,0x80
	BRNE __ROUND_REPACK0
	SBRS R30,0
	RJMP __REPACK
__ROUND_REPACK0:
	ADIW R30,1
	ADC  R22,R25
	ADC  R23,R25
	BRVS __REPACK1

__REPACK:
	LDI  R21,0x80
	EOR  R21,R23
	BRNE __REPACK0
	PUSH R21
	RJMP __ZERORES
__REPACK0:
	CPI  R21,0xFF
	BREQ __REPACK1
	LSL  R22
	LSL  R0
	ROR  R21
	ROR  R22
	MOV  R23,R21
	RET
__REPACK1:
	PUSH R21
	TST  R0
	BRMI __REPACK2
	RJMP __MAXRES
__REPACK2:
	RJMP __MINRES

__UNPACK:
	LDI  R21,0x80
	MOV  R1,R25
	AND  R1,R21
	LSL  R24
	ROL  R25
	EOR  R25,R21
	LSL  R21
	ROR  R24

__UNPACK1:
	LDI  R21,0x80
	MOV  R0,R23
	AND  R0,R21
	LSL  R22
	ROL  R23
	EOR  R23,R21
	LSL  R21
	ROR  R22
	RET

__CFD1U:
	SET
	RJMP __CFD1U0
__CFD1:
	CLT
__CFD1U0:
	PUSH R21
	RCALL __UNPACK1
	CPI  R23,0x80
	BRLO __CFD10
	CPI  R23,0xFF
	BRCC __CFD10
	RJMP __ZERORES
__CFD10:
	LDI  R21,22
	SUB  R21,R23
	BRPL __CFD11
	NEG  R21
	CPI  R21,8
	BRTC __CFD19
	CPI  R21,9
__CFD19:
	BRLO __CFD17
	SER  R30
	SER  R31
	SER  R22
	LDI  R23,0x7F
	BLD  R23,7
	RJMP __CFD15
__CFD17:
	CLR  R23
	TST  R21
	BREQ __CFD15
__CFD18:
	LSL  R30
	ROL  R31
	ROL  R22
	ROL  R23
	DEC  R21
	BRNE __CFD18
	RJMP __CFD15
__CFD11:
	CLR  R23
__CFD12:
	CPI  R21,8
	BRLO __CFD13
	MOV  R30,R31
	MOV  R31,R22
	MOV  R22,R23
	SUBI R21,8
	RJMP __CFD12
__CFD13:
	TST  R21
	BREQ __CFD15
__CFD14:
	LSR  R23
	ROR  R22
	ROR  R31
	ROR  R30
	DEC  R21
	BRNE __CFD14
__CFD15:
	TST  R0
	BRPL __CFD16
	RCALL __ANEGD1
__CFD16:
	POP  R21
	RET

__CDF1U:
	SET
	RJMP __CDF1U0
__CDF1:
	CLT
__CDF1U0:
	SBIW R30,0
	SBCI R22,0
	SBCI R23,0
	BREQ __CDF10
	CLR  R0
	BRTS __CDF11
	TST  R23
	BRPL __CDF11
	COM  R0
	RCALL __ANEGD1
__CDF11:
	MOV  R1,R23
	LDI  R23,30
	TST  R1
__CDF12:
	BRMI __CDF13
	DEC  R23
	LSL  R30
	ROL  R31
	ROL  R22
	ROL  R1
	RJMP __CDF12
__CDF13:
	MOV  R30,R31
	MOV  R31,R22
	MOV  R22,R1
	PUSH R21
	RCALL __REPACK
	POP  R21
__CDF10:
	RET

__SWAPACC:
	PUSH R20
	MOVW R20,R30
	MOVW R30,R26
	MOVW R26,R20
	MOVW R20,R22
	MOVW R22,R24
	MOVW R24,R20
	MOV  R20,R0
	MOV  R0,R1
	MOV  R1,R20
	POP  R20
	RET

__UADD12:
	ADD  R30,R26
	ADC  R31,R27
	ADC  R22,R24
	RET

__NEGMAN1:
	COM  R30
	COM  R31
	COM  R22
	SUBI R30,-1
	SBCI R31,-1
	SBCI R22,-1
	RET

__SUBF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R25,0x80
	BREQ __ADDF129
	LDI  R21,0x80
	EOR  R1,R21

	RJMP __ADDF120

__ADDF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R25,0x80
	BREQ __ADDF129

__ADDF120:
	CPI  R23,0x80
	BREQ __ADDF128
__ADDF121:
	MOV  R21,R23
	SUB  R21,R25
	BRVS __ADDF1211
	BRPL __ADDF122
	RCALL __SWAPACC
	RJMP __ADDF121
__ADDF122:
	CPI  R21,24
	BRLO __ADDF123
	CLR  R26
	CLR  R27
	CLR  R24
__ADDF123:
	CPI  R21,8
	BRLO __ADDF124
	MOV  R26,R27
	MOV  R27,R24
	CLR  R24
	SUBI R21,8
	RJMP __ADDF123
__ADDF124:
	TST  R21
	BREQ __ADDF126
__ADDF125:
	LSR  R24
	ROR  R27
	ROR  R26
	DEC  R21
	BRNE __ADDF125
__ADDF126:
	MOV  R21,R0
	EOR  R21,R1
	BRMI __ADDF127
	RCALL __UADD12
	BRCC __ADDF129
	ROR  R22
	ROR  R31
	ROR  R30
	INC  R23
	BRVC __ADDF129
	RJMP __MAXRES
__ADDF128:
	RCALL __SWAPACC
__ADDF129:
	RCALL __REPACK
	POP  R21
	RET
__ADDF1211:
	BRCC __ADDF128
	RJMP __ADDF129
__ADDF127:
	SUB  R30,R26
	SBC  R31,R27
	SBC  R22,R24
	BREQ __ZERORES
	BRCC __ADDF1210
	COM  R0
	RCALL __NEGMAN1
__ADDF1210:
	TST  R22
	BRMI __ADDF129
	LSL  R30
	ROL  R31
	ROL  R22
	DEC  R23
	BRVC __ADDF1210

__ZERORES:
	CLR  R30
	CLR  R31
	CLR  R22
	CLR  R23
	POP  R21
	RET

__MINRES:
	SER  R30
	SER  R31
	LDI  R22,0x7F
	SER  R23
	POP  R21
	RET

__MAXRES:
	SER  R30
	SER  R31
	LDI  R22,0x7F
	LDI  R23,0x7F
	POP  R21
	RET

__MULF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R23,0x80
	BREQ __ZERORES
	CPI  R25,0x80
	BREQ __ZERORES
	EOR  R0,R1
	SEC
	ADC  R23,R25
	BRVC __MULF124
	BRLT __ZERORES
__MULF125:
	TST  R0
	BRMI __MINRES
	RJMP __MAXRES
__MULF124:
	PUSH R0
	PUSH R17
	PUSH R18
	PUSH R19
	PUSH R20
	CLR  R17
	CLR  R18
	CLR  R25
	MUL  R22,R24
	MOVW R20,R0
	MUL  R24,R31
	MOV  R19,R0
	ADD  R20,R1
	ADC  R21,R25
	MUL  R22,R27
	ADD  R19,R0
	ADC  R20,R1
	ADC  R21,R25
	MUL  R24,R30
	RCALL __MULF126
	MUL  R27,R31
	RCALL __MULF126
	MUL  R22,R26
	RCALL __MULF126
	MUL  R27,R30
	RCALL __MULF127
	MUL  R26,R31
	RCALL __MULF127
	MUL  R26,R30
	ADD  R17,R1
	ADC  R18,R25
	ADC  R19,R25
	ADC  R20,R25
	ADC  R21,R25
	MOV  R30,R19
	MOV  R31,R20
	MOV  R22,R21
	MOV  R21,R18
	POP  R20
	POP  R19
	POP  R18
	POP  R17
	POP  R0
	TST  R22
	BRMI __MULF122
	LSL  R21
	ROL  R30
	ROL  R31
	ROL  R22
	RJMP __MULF123
__MULF122:
	INC  R23
	BRVS __MULF125
__MULF123:
	RCALL __ROUND_REPACK
	POP  R21
	RET

__MULF127:
	ADD  R17,R0
	ADC  R18,R1
	ADC  R19,R25
	RJMP __MULF128
__MULF126:
	ADD  R18,R0
	ADC  R19,R1
__MULF128:
	ADC  R20,R25
	ADC  R21,R25
	RET

__DIVF21:
	PUSH R21
	RCALL __UNPACK
	CPI  R23,0x80
	BRNE __DIVF210
	TST  R1
__DIVF211:
	BRPL __DIVF219
	RJMP __MINRES
__DIVF219:
	RJMP __MAXRES
__DIVF210:
	CPI  R25,0x80
	BRNE __DIVF218
__DIVF217:
	RJMP __ZERORES
__DIVF218:
	EOR  R0,R1
	SEC
	SBC  R25,R23
	BRVC __DIVF216
	BRLT __DIVF217
	TST  R0
	RJMP __DIVF211
__DIVF216:
	MOV  R23,R25
	PUSH R17
	PUSH R18
	PUSH R19
	PUSH R20
	CLR  R1
	CLR  R17
	CLR  R18
	CLR  R19
	CLR  R20
	CLR  R21
	LDI  R25,32
__DIVF212:
	CP   R26,R30
	CPC  R27,R31
	CPC  R24,R22
	CPC  R20,R17
	BRLO __DIVF213
	SUB  R26,R30
	SBC  R27,R31
	SBC  R24,R22
	SBC  R20,R17
	SEC
	RJMP __DIVF214
__DIVF213:
	CLC
__DIVF214:
	ROL  R21
	ROL  R18
	ROL  R19
	ROL  R1
	ROL  R26
	ROL  R27
	ROL  R24
	ROL  R20
	DEC  R25
	BRNE __DIVF212
	MOVW R30,R18
	MOV  R22,R1
	POP  R20
	POP  R19
	POP  R18
	POP  R17
	TST  R22
	BRMI __DIVF215
	LSL  R21
	ROL  R30
	ROL  R31
	ROL  R22
	DEC  R23
	BRVS __DIVF217
__DIVF215:
	RCALL __ROUND_REPACK
	POP  R21
	RET

__CMPF12:
	TST  R25
	BRMI __CMPF120
	TST  R23
	BRMI __CMPF121
	CP   R25,R23
	BRLO __CMPF122
	BRNE __CMPF121
	CP   R26,R30
	CPC  R27,R31
	CPC  R24,R22
	BRLO __CMPF122
	BREQ __CMPF123
__CMPF121:
	CLZ
	CLC
	RET
__CMPF122:
	CLZ
	SEC
	RET
__CMPF123:
	SEZ
	CLC
	RET
__CMPF120:
	TST  R23
	BRPL __CMPF122
	CP   R25,R23
	BRLO __CMPF121
	BRNE __CMPF122
	CP   R30,R26
	CPC  R31,R27
	CPC  R22,R24
	BRLO __CMPF122
	BREQ __CMPF123
	RJMP __CMPF121

__ADDW2R15:
	CLR  R0
	ADD  R26,R15
	ADC  R27,R0
	RET

__SUBD12:
	SUB  R30,R26
	SBC  R31,R27
	SBC  R22,R24
	SBC  R23,R25
	RET

__SUBD21:
	SUB  R26,R30
	SBC  R27,R31
	SBC  R24,R22
	SBC  R25,R23
	RET

__ANEGD1:
	COM  R31
	COM  R22
	COM  R23
	NEG  R30
	SBCI R31,-1
	SBCI R22,-1
	SBCI R23,-1
	RET

__LSLW3:
	LSL  R30
	ROL  R31
__LSLW2:
	LSL  R30
	ROL  R31
	LSL  R30
	ROL  R31
	RET

__LSRW4:
	LSR  R31
	ROR  R30
__LSRW3:
	LSR  R31
	ROR  R30
__LSRW2:
	LSR  R31
	ROR  R30
	LSR  R31
	ROR  R30
	RET

__LSLD1:
	LSL  R30
	ROL  R31
	ROL  R22
	ROL  R23
	RET

__CBD1:
	MOV  R31,R30
	ADD  R31,R31
	SBC  R31,R31
	MOV  R22,R31
	MOV  R23,R31
	RET

__CWD1:
	MOV  R22,R31
	ADD  R22,R22
	SBC  R22,R22
	MOV  R23,R22
	RET

__MULD12U:
	MUL  R23,R26
	MOV  R23,R0
	MUL  R22,R27
	ADD  R23,R0
	MUL  R31,R24
	ADD  R23,R0
	MUL  R30,R25
	ADD  R23,R0
	MUL  R22,R26
	MOV  R22,R0
	ADD  R23,R1
	MUL  R31,R27
	ADD  R22,R0
	ADC  R23,R1
	MUL  R30,R24
	ADD  R22,R0
	ADC  R23,R1
	CLR  R24
	MUL  R31,R26
	MOV  R31,R0
	ADD  R22,R1
	ADC  R23,R24
	MUL  R30,R27
	ADD  R31,R0
	ADC  R22,R1
	ADC  R23,R24
	MUL  R30,R26
	MOV  R30,R0
	ADD  R31,R1
	ADC  R22,R24
	ADC  R23,R24
	RET

__MULD12:
	RCALL __CHKSIGND
	RCALL __MULD12U
	BRTC __MULD121
	RCALL __ANEGD1
__MULD121:
	RET

__DIVB21U:
	CLR  R0
	LDI  R25,8
__DIVB21U1:
	LSL  R26
	ROL  R0
	SUB  R0,R30
	BRCC __DIVB21U2
	ADD  R0,R30
	RJMP __DIVB21U3
__DIVB21U2:
	SBR  R26,1
__DIVB21U3:
	DEC  R25
	BRNE __DIVB21U1
	MOV  R30,R26
	MOV  R26,R0
	RET

__DIVB21:
	RCALL __CHKSIGNB
	RCALL __DIVB21U
	BRTC __DIVB211
	NEG  R30
__DIVB211:
	RET

__DIVD21U:
	PUSH R19
	PUSH R20
	PUSH R21
	CLR  R0
	CLR  R1
	CLR  R20
	CLR  R21
	LDI  R19,32
__DIVD21U1:
	LSL  R26
	ROL  R27
	ROL  R24
	ROL  R25
	ROL  R0
	ROL  R1
	ROL  R20
	ROL  R21
	SUB  R0,R30
	SBC  R1,R31
	SBC  R20,R22
	SBC  R21,R23
	BRCC __DIVD21U2
	ADD  R0,R30
	ADC  R1,R31
	ADC  R20,R22
	ADC  R21,R23
	RJMP __DIVD21U3
__DIVD21U2:
	SBR  R26,1
__DIVD21U3:
	DEC  R19
	BRNE __DIVD21U1
	MOVW R30,R26
	MOVW R22,R24
	MOVW R26,R0
	MOVW R24,R20
	POP  R21
	POP  R20
	POP  R19
	RET

__DIVD21:
	RCALL __CHKSIGND
	RCALL __DIVD21U
	BRTC __DIVD211
	RCALL __ANEGD1
__DIVD211:
	RET

__MODB21:
	CLT
	SBRS R26,7
	RJMP __MODB211
	NEG  R26
	SET
__MODB211:
	SBRC R30,7
	NEG  R30
	RCALL __DIVB21U
	MOV  R30,R26
	BRTC __MODB212
	NEG  R30
__MODB212:
	RET

__MODD21U:
	RCALL __DIVD21U
	MOVW R30,R26
	MOVW R22,R24
	RET

__MODD21:
	CLT
	SBRS R25,7
	RJMP __MODD211
	COM  R26
	COM  R27
	COM  R24
	COM  R25
	SUBI R26,-1
	SBCI R27,-1
	SBCI R24,-1
	SBCI R25,-1
	SET
__MODD211:
	SBRC R23,7
	RCALL __ANEGD1
	RCALL __DIVD21U
	MOVW R30,R26
	MOVW R22,R24
	BRTC __MODD212
	RCALL __ANEGD1
__MODD212:
	RET

__CHKSIGNB:
	CLT
	SBRS R30,7
	RJMP __CHKSB1
	NEG  R30
	SET
__CHKSB1:
	SBRS R26,7
	RJMP __CHKSB2
	NEG  R26
	BLD  R0,0
	INC  R0
	BST  R0,0
__CHKSB2:
	RET

__CHKSIGND:
	CLT
	SBRS R23,7
	RJMP __CHKSD1
	RCALL __ANEGD1
	SET
__CHKSD1:
	SBRS R25,7
	RJMP __CHKSD2
	CLR  R0
	COM  R26
	COM  R27
	COM  R24
	COM  R25
	ADIW R26,1
	ADC  R24,R0
	ADC  R25,R0
	BLD  R0,0
	INC  R0
	BST  R0,0
__CHKSD2:
	RET

__GETW1P:
	LD   R30,X+
	LD   R31,X
	SBIW R26,1
	RET

__GETD1P:
	LD   R30,X+
	LD   R31,X+
	LD   R22,X+
	LD   R23,X
	SBIW R26,3
	RET

__PUTDP1:
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	RET

__GETD1S0:
	LD   R30,Y
	LDD  R31,Y+1
	LDD  R22,Y+2
	LDD  R23,Y+3
	RET

__GETD2S0:
	LD   R26,Y
	LDD  R27,Y+1
	LDD  R24,Y+2
	LDD  R25,Y+3
	RET

__PUTD1S0:
	ST   Y,R30
	STD  Y+1,R31
	STD  Y+2,R22
	STD  Y+3,R23
	RET

__PUTPARD1:
	ST   -Y,R23
	ST   -Y,R22
	ST   -Y,R31
	ST   -Y,R30
	RET

__PUTPARD2:
	ST   -Y,R25
	ST   -Y,R24
	ST   -Y,R27
	ST   -Y,R26
	RET

__CDF2U:
	SET
	RJMP __CDF2U0
__CDF2:
	CLT
__CDF2U0:
	RCALL __SWAPD12
	RCALL __CDF1U0

__SWAPD12:
	MOV  R1,R24
	MOV  R24,R22
	MOV  R22,R1
	MOV  R1,R25
	MOV  R25,R23
	MOV  R23,R1

__SWAPW12:
	MOV  R1,R27
	MOV  R27,R31
	MOV  R31,R1

__SWAPB12:
	MOV  R1,R26
	MOV  R26,R30
	MOV  R30,R1
	RET

__CPD10:
	SBIW R30,0
	SBCI R22,0
	SBCI R23,0
	RET

__CPD02:
	CLR  R0
	CP   R0,R26
	CPC  R0,R27
	CPC  R0,R24
	CPC  R0,R25
	RET

__CPD12:
	CP   R30,R26
	CPC  R31,R27
	CPC  R22,R24
	CPC  R23,R25
	RET

__SAVELOCR6:
	ST   -Y,R21
__SAVELOCR5:
	ST   -Y,R20
__SAVELOCR4:
	ST   -Y,R19
__SAVELOCR3:
	ST   -Y,R18
__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR6:
	LDD  R21,Y+5
__LOADLOCR5:
	LDD  R20,Y+4
__LOADLOCR4:
	LDD  R19,Y+3
__LOADLOCR3:
	LDD  R18,Y+2
__LOADLOCR2:
	LDD  R17,Y+1
	LD   R16,Y
	RET

__INITLOCB:
__INITLOCW:
	ADD  R26,R28
	ADC  R27,R29
__INITLOC0:
	LPM  R0,Z+
	ST   X+,R0
	DEC  R24
	BRNE __INITLOC0
	RET

;END OF CODE MARKER
__END_OF_CODE:
