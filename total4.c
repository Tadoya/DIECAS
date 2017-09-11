/*****************************************************
This program was produced by the
CodeWizardAVR V2.05.3 Standard
Automatic Program Generator
� Copyright 1998-2011 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project :
Version :
Date    : 2014-11-15
Author  : PerTic@n
Company : If You Like This Software,Buy It
Comments:


Chip type               : ATxmega128A1
Program type            : Application
AVR Core Clock frequency: 2.000000 MHz
Memory model            : Small
Data Stack size         : 2048
*****************************************************/

// I/O Registers definitions
#include <io.h>

// Standard Input/Output functions
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
// Delay functions
#include <delay.h>

// Declare your global variables here

// System Clocks initialization
void system_clocks_init(void)
{
unsigned char n,s;

// Optimize for speed
#pragma optsize-
// Save interrupts enabled/disabled state
s=SREG;
// Disable interrupts
#asm("cli")

// Internal 2 MHz RC oscillator initialization
// Enable the internal 2 MHz RC oscillator
OSC.CTRL|=OSC_RC2MEN_bm;

// System Clock prescaler A division factor: 1
// System Clock prescalers B & C division factors: B:1, C:1
// ClkPer4: 2000.000 kHz
// ClkPer2: 2000.000 kHz
// ClkPer:  2000.000 kHz
// ClkCPU:  2000.000 kHz
n=(CLK.PSCTRL & (~(CLK_PSADIV_gm | CLK_PSBCDIV1_bm | CLK_PSBCDIV0_bm))) |
	CLK_PSADIV_1_gc | CLK_PSBCDIV_1_1_gc;
CCP=CCP_IOREG_gc;
CLK.PSCTRL=n;

// Disable the autocalibration of the internal 2 MHz RC oscillator
DFLLRC2M.CTRL&= ~DFLL_ENABLE_bm;

// Wait for the internal 2 MHz RC oscillator to stabilize
while ((OSC.STATUS & OSC_RC2MRDY_bm)==0);

// Select the system clock source: 2 MHz Internal RC Osc.
n=(CLK.CTRL & (~CLK_SCLKSEL_gm)) | CLK_SCLKSEL_RC2M_gc;
CCP=CCP_IOREG_gc;
CLK.CTRL=n;

// Disable the unused oscillators: 32 MHz, 32 kHz, external clock/crystal oscillator, PLL
OSC.CTRL&= ~(OSC_RC32MEN_bm | OSC_RC32KEN_bm | OSC_XOSCEN_bm | OSC_PLLEN_bm);

// Peripheral Clock output: Disabled
PORTCFG.CLKEVOUT=(PORTCFG.CLKEVOUT & (~PORTCFG_CLKOUT_gm)) | PORTCFG_CLKOUT_OFF_gc;

// Restore interrupts enabled/disabled state
SREG=s;
// Restore optimization for size if needed
#pragma optsize_default
}

// Ports initialization
void ports_init(void)
{
// PORTA initialization
// OUT register
PORTA.OUT=0x00;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Input
// Bit4: Input
// Bit5: Input
// Bit6: Input
// Bit7: Input
PORTA.DIR=0x00;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTA.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTA.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTA.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTA.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit4 Output/Pull configuration: Totempole/No
// Bit4 Input/Sense configuration: Sense both edges
// Bit4 inverted: Off
// Bit4 slew rate limitation: Off
PORTA.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit5 Output/Pull configuration: Totempole/No
// Bit5 Input/Sense configuration: Sense both edges
// Bit5 inverted: Off
// Bit5 slew rate limitation: Off
PORTA.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit6 Output/Pull configuration: Totempole/No
// Bit6 Input/Sense configuration: Sense both edges
// Bit6 inverted: Off
// Bit6 slew rate limitation: Off
PORTA.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit7 Output/Pull configuration: Totempole/No
// Bit7 Input/Sense configuration: Sense both edges
// Bit7 inverted: Off
// Bit7 slew rate limitation: Off
PORTA.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTA.INTCTRL=(PORTA.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
// Bit4 pin change interrupt 0: Off
// Bit5 pin change interrupt 0: Off
// Bit6 pin change interrupt 0: Off
// Bit7 pin change interrupt 0: Off
PORTA.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
// Bit4 pin change interrupt 1: Off
// Bit5 pin change interrupt 1: Off
// Bit6 pin change interrupt 1: Off
// Bit7 pin change interrupt 1: Off
PORTA.INT1MASK=0x00;

// PORTB initialization
// OUT register
PORTB.OUT=0x00;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Input
// Bit4: Input
// Bit5: Input
// Bit6: Input
// Bit7: Input
PORTB.DIR=0x00;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTB.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTB.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTB.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTB.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit4 Output/Pull configuration: Totempole/No
// Bit4 Input/Sense configuration: Sense both edges
// Bit4 inverted: Off
// Bit4 slew rate limitation: Off
PORTB.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit5 Output/Pull configuration: Totempole/No
// Bit5 Input/Sense configuration: Sense both edges
// Bit5 inverted: Off
// Bit5 slew rate limitation: Off
PORTB.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit6 Output/Pull configuration: Totempole/No
// Bit6 Input/Sense configuration: Sense both edges
// Bit6 inverted: Off
// Bit6 slew rate limitation: Off
PORTB.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit7 Output/Pull configuration: Totempole/No
// Bit7 Input/Sense configuration: Sense both edges
// Bit7 inverted: Off
// Bit7 slew rate limitation: Off
PORTB.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTB.INTCTRL=(PORTB.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
// Bit4 pin change interrupt 0: Off
// Bit5 pin change interrupt 0: Off
// Bit6 pin change interrupt 0: Off
// Bit7 pin change interrupt 0: Off
PORTB.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
// Bit4 pin change interrupt 1: Off
// Bit5 pin change interrupt 1: Off
// Bit6 pin change interrupt 1: Off
// Bit7 pin change interrupt 1: Off
PORTB.INT1MASK=0x00;

// PORTC initialization
// OUT register
PORTC.OUT=0x08;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Output
// Bit4: Input
// Bit5: Input
// Bit6: Input
// Bit7: Input
PORTC.DIR=0x08;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTC.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTC.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTC.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTC.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit4 Output/Pull configuration: Totempole/No
// Bit4 Input/Sense configuration: Sense both edges
// Bit4 inverted: Off
// Bit4 slew rate limitation: Off
PORTC.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit5 Output/Pull configuration: Totempole/No
// Bit5 Input/Sense configuration: Sense both edges
// Bit5 inverted: Off
// Bit5 slew rate limitation: Off
PORTC.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit6 Output/Pull configuration: Totempole/No
// Bit6 Input/Sense configuration: Sense both edges
// Bit6 inverted: Off
// Bit6 slew rate limitation: Off
PORTC.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit7 Output/Pull configuration: Totempole/No
// Bit7 Input/Sense configuration: Sense both edges
// Bit7 inverted: Off
// Bit7 slew rate limitation: Off
PORTC.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTC.INTCTRL=(PORTC.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
// Bit4 pin change interrupt 0: Off
// Bit5 pin change interrupt 0: Off
// Bit6 pin change interrupt 0: Off
// Bit7 pin change interrupt 0: Off
PORTC.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
// Bit4 pin change interrupt 1: Off
// Bit5 pin change interrupt 1: Off
// Bit6 pin change interrupt 1: Off
// Bit7 pin change interrupt 1: Off
PORTC.INT1MASK=0x00;

// PORTD initialization
// OUT register
PORTD.OUT=0x08;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Output
// Bit4: Input
// Bit5: Input
// Bit6: Input
// Bit7: Input
PORTD.DIR=0x08;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTD.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTD.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTD.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTD.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit4 Output/Pull configuration: Totempole/No
// Bit4 Input/Sense configuration: Sense both edges
// Bit4 inverted: Off
// Bit4 slew rate limitation: Off
PORTD.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit5 Output/Pull configuration: Totempole/No
// Bit5 Input/Sense configuration: Sense both edges
// Bit5 inverted: Off
// Bit5 slew rate limitation: Off
PORTD.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit6 Output/Pull configuration: Totempole/No
// Bit6 Input/Sense configuration: Sense both edges
// Bit6 inverted: Off
// Bit6 slew rate limitation: Off
PORTD.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit7 Output/Pull configuration: Totempole/No
// Bit7 Input/Sense configuration: Sense both edges
// Bit7 inverted: Off
// Bit7 slew rate limitation: Off
PORTD.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTD.INTCTRL=(PORTD.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
// Bit4 pin change interrupt 0: Off
// Bit5 pin change interrupt 0: Off
// Bit6 pin change interrupt 0: Off
// Bit7 pin change interrupt 0: Off
PORTD.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
// Bit4 pin change interrupt 1: Off
// Bit5 pin change interrupt 1: Off
// Bit6 pin change interrupt 1: Off
// Bit7 pin change interrupt 1: Off
PORTD.INT1MASK=0x00;

// PORTE initialization
// OUT register
PORTE.OUT=0x00;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Input
// Bit4: Input
// Bit5: Input
// Bit6: Input
// Bit7: Input
PORTE.DIR=0x00;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTE.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTE.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTE.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTE.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit4 Output/Pull configuration: Totempole/No
// Bit4 Input/Sense configuration: Sense both edges
// Bit4 inverted: Off
// Bit4 slew rate limitation: Off
PORTE.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit5 Output/Pull configuration: Totempole/No
// Bit5 Input/Sense configuration: Sense both edges
// Bit5 inverted: Off
// Bit5 slew rate limitation: Off
PORTE.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit6 Output/Pull configuration: Totempole/No
// Bit6 Input/Sense configuration: Sense both edges
// Bit6 inverted: Off
// Bit6 slew rate limitation: Off
PORTE.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit7 Output/Pull configuration: Totempole/No
// Bit7 Input/Sense configuration: Sense both edges
// Bit7 inverted: Off
// Bit7 slew rate limitation: Off
PORTE.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTE.INTCTRL=(PORTE.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
// Bit4 pin change interrupt 0: Off
// Bit5 pin change interrupt 0: Off
// Bit6 pin change interrupt 0: Off
// Bit7 pin change interrupt 0: Off
PORTE.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
// Bit4 pin change interrupt 1: Off
// Bit5 pin change interrupt 1: Off
// Bit6 pin change interrupt 1: Off
// Bit7 pin change interrupt 1: Off
PORTE.INT1MASK=0x00;

// PORTF initialization
// OUT register
PORTF.OUT=0x00;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Input
// Bit4: Input
// Bit5: Input
// Bit6: Input
// Bit7: Input
PORTF.DIR=0x00;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTF.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTF.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTF.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTF.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit4 Output/Pull configuration: Totempole/No
// Bit4 Input/Sense configuration: Sense both edges
// Bit4 inverted: Off
// Bit4 slew rate limitation: Off
PORTF.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit5 Output/Pull configuration: Totempole/No
// Bit5 Input/Sense configuration: Sense both edges
// Bit5 inverted: Off
// Bit5 slew rate limitation: Off
PORTF.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit6 Output/Pull configuration: Totempole/No
// Bit6 Input/Sense configuration: Sense both edges
// Bit6 inverted: Off
// Bit6 slew rate limitation: Off
PORTF.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit7 Output/Pull configuration: Totempole/No
// Bit7 Input/Sense configuration: Sense both edges
// Bit7 inverted: Off
// Bit7 slew rate limitation: Off
PORTF.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTF.INTCTRL=(PORTF.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
// Bit4 pin change interrupt 0: Off
// Bit5 pin change interrupt 0: Off
// Bit6 pin change interrupt 0: Off
// Bit7 pin change interrupt 0: Off
PORTF.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
// Bit4 pin change interrupt 1: Off
// Bit5 pin change interrupt 1: Off
// Bit6 pin change interrupt 1: Off
// Bit7 pin change interrupt 1: Off
PORTF.INT1MASK=0x00;

// PORTH initialization
// OUT register
PORTH.OUT=0x00;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Input
// Bit4: Input
// Bit5: Input
// Bit6: Input
// Bit7: Input
PORTH.DIR=0x00;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTH.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTH.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTH.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTH.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit4 Output/Pull configuration: Totempole/No
// Bit4 Input/Sense configuration: Sense both edges
// Bit4 inverted: Off
// Bit4 slew rate limitation: Off
PORTH.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit5 Output/Pull configuration: Totempole/No
// Bit5 Input/Sense configuration: Sense both edges
// Bit5 inverted: Off
// Bit5 slew rate limitation: Off
PORTH.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit6 Output/Pull configuration: Totempole/No
// Bit6 Input/Sense configuration: Sense both edges
// Bit6 inverted: Off
// Bit6 slew rate limitation: Off
PORTH.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit7 Output/Pull configuration: Totempole/No
// Bit7 Input/Sense configuration: Sense both edges
// Bit7 inverted: Off
// Bit7 slew rate limitation: Off
PORTH.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTH.INTCTRL=(PORTH.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
// Bit4 pin change interrupt 0: Off
// Bit5 pin change interrupt 0: Off
// Bit6 pin change interrupt 0: Off
// Bit7 pin change interrupt 0: Off
PORTH.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
// Bit4 pin change interrupt 1: Off
// Bit5 pin change interrupt 1: Off
// Bit6 pin change interrupt 1: Off
// Bit7 pin change interrupt 1: Off
PORTH.INT1MASK=0x00;

// PORTJ initialization
// OUT register
PORTJ.OUT=0x00;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Input
// Bit4: Input
// Bit5: Input
// Bit6: Input
// Bit7: Input
PORTJ.DIR=0x00;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTJ.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTJ.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTJ.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTJ.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit4 Output/Pull configuration: Totempole/No
// Bit4 Input/Sense configuration: Sense both edges
// Bit4 inverted: Off
// Bit4 slew rate limitation: Off
PORTJ.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit5 Output/Pull configuration: Totempole/No
// Bit5 Input/Sense configuration: Sense both edges
// Bit5 inverted: Off
// Bit5 slew rate limitation: Off
PORTJ.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit6 Output/Pull configuration: Totempole/No
// Bit6 Input/Sense configuration: Sense both edges
// Bit6 inverted: Off
// Bit6 slew rate limitation: Off
PORTJ.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit7 Output/Pull configuration: Totempole/No
// Bit7 Input/Sense configuration: Sense both edges
// Bit7 inverted: Off
// Bit7 slew rate limitation: Off
PORTJ.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTJ.INTCTRL=(PORTJ.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
// Bit4 pin change interrupt 0: Off
// Bit5 pin change interrupt 0: Off
// Bit6 pin change interrupt 0: Off
// Bit7 pin change interrupt 0: Off
PORTJ.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
// Bit4 pin change interrupt 1: Off
// Bit5 pin change interrupt 1: Off
// Bit6 pin change interrupt 1: Off
// Bit7 pin change interrupt 1: Off
PORTJ.INT1MASK=0x00;

// PORTK initialization
// OUT register
PORTK.OUT=0x00;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Input
// Bit4: Input
// Bit5: Input
// Bit6: Input
// Bit7: Input
PORTK.DIR=0x00;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTK.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTK.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTK.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTK.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit4 Output/Pull configuration: Totempole/No
// Bit4 Input/Sense configuration: Sense both edges
// Bit4 inverted: Off
// Bit4 slew rate limitation: Off
PORTK.PIN4CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit5 Output/Pull configuration: Totempole/No
// Bit5 Input/Sense configuration: Sense both edges
// Bit5 inverted: Off
// Bit5 slew rate limitation: Off
PORTK.PIN5CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit6 Output/Pull configuration: Totempole/No
// Bit6 Input/Sense configuration: Sense both edges
// Bit6 inverted: Off
// Bit6 slew rate limitation: Off
PORTK.PIN6CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit7 Output/Pull configuration: Totempole/No
// Bit7 Input/Sense configuration: Sense both edges
// Bit7 inverted: Off
// Bit7 slew rate limitation: Off
PORTK.PIN7CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTK.INTCTRL=(PORTK.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
// Bit4 pin change interrupt 0: Off
// Bit5 pin change interrupt 0: Off
// Bit6 pin change interrupt 0: Off
// Bit7 pin change interrupt 0: Off
PORTK.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
// Bit4 pin change interrupt 1: Off
// Bit5 pin change interrupt 1: Off
// Bit6 pin change interrupt 1: Off
// Bit7 pin change interrupt 1: Off
PORTK.INT1MASK=0x00;

// PORTQ initialization
// OUT register
PORTQ.OUT=0x00;
// Bit0: Input
// Bit1: Input
// Bit2: Input
// Bit3: Input
PORTQ.DIR=0x00;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTQ.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTQ.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit2 Output/Pull configuration: Totempole/No
// Bit2 Input/Sense configuration: Sense both edges
// Bit2 inverted: Off
// Bit2 slew rate limitation: Off
PORTQ.PIN2CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit3 Output/Pull configuration: Totempole/No
// Bit3 Input/Sense configuration: Sense both edges
// Bit3 inverted: Off
// Bit3 slew rate limitation: Off
PORTQ.PIN3CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTQ.INTCTRL=(PORTQ.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
// Bit2 pin change interrupt 0: Off
// Bit3 pin change interrupt 0: Off
PORTQ.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
// Bit2 pin change interrupt 1: Off
// Bit3 pin change interrupt 1: Off
PORTQ.INT1MASK=0x00;

// PORTR initialization
// OUT register
PORTR.OUT=0x00;
// Bit0: Input
// Bit1: Input
PORTR.DIR=0x00;
// Bit0 Output/Pull configuration: Totempole/No
// Bit0 Input/Sense configuration: Sense both edges
// Bit0 inverted: Off
// Bit0 slew rate limitation: Off
PORTR.PIN0CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Bit1 Output/Pull configuration: Totempole/No
// Bit1 Input/Sense configuration: Sense both edges
// Bit1 inverted: Off
// Bit1 slew rate limitation: Off
PORTR.PIN1CTRL=PORT_OPC_TOTEM_gc | PORT_ISC_BOTHEDGES_gc;
// Interrupt 0 level: Disabled
// Interrupt 1 level: Disabled
PORTR.INTCTRL=(PORTR.INTCTRL & (~(PORT_INT1LVL_gm | PORT_INT0LVL_gm))) |
	PORT_INT1LVL_OFF_gc | PORT_INT0LVL_OFF_gc;
// Bit0 pin change interrupt 0: Off
// Bit1 pin change interrupt 0: Off
PORTR.INT0MASK=0x00;
// Bit0 pin change interrupt 1: Off
// Bit1 pin change interrupt 1: Off
PORTR.INT1MASK=0x00;
}

// Virtual Ports initialization
void vports_init(void)
{
// PORTA mapped to VPORT0
// PORTB mapped to VPORT1
PORTCFG.VPCTRLA=PORTCFG_VP1MAP_PORTB_gc | PORTCFG_VP0MAP_PORTA_gc;
// PORTC mapped to VPORT2
// PORTF mapped to VPORT3
PORTCFG.VPCTRLB=PORTCFG_VP3MAP_PORTF_gc | PORTCFG_VP2MAP_PORTC_gc;
}

// Disable a Timer/Counter type 0
void tc0_disable(TC0_t *ptc)
{
// Timer/Counter off
ptc->CTRLA=(ptc->CTRLA & (~TC0_CLKSEL_gm)) | TC_CLKSEL_OFF_gc;
// Issue a reset command
ptc->CTRLFSET=TC_CMD_RESET_gc;
}

// Timer/Counter TCC0 initialization
void tcc0_init(void)
{
unsigned char s;
unsigned char n;

// Note: the correct PORTC direction for the Compare Channels outputs
// is configured in the ports_init function

// Save interrupts enabled/disabled state
s=SREG;
// Disable interrupts
#asm("cli")

// Disable and reset the timer/counter just to be sure
tc0_disable(&TCC0);
// Clock source: Peripheral Clock/1
TCC0.CTRLA=(TCC0.CTRLA & (~TC0_CLKSEL_gm)) | TC_CLKSEL_DIV1_gc;
// Mode: Normal Operation, Overflow Int./Event on TOP
// Compare/Capture on channel A: Off
// Compare/Capture on channel B: Off
// Compare/Capture on channel C: Off
// Compare/Capture on channel D: Off
TCC0.CTRLB=(TCC0.CTRLB & (~(TC0_CCAEN_bm | TC0_CCBEN_bm | TC0_CCCEN_bm | TC0_CCDEN_bm | TC0_WGMODE_gm))) |
	TC_WGMODE_NORMAL_gc;

// Capture event source: None
// Capture event action: None
TCC0.CTRLD=(TCC0.CTRLD & (~(TC0_EVACT_gm | TC0_EVSEL_gm))) |
	TC_EVACT_OFF_gc | TC_EVSEL_OFF_gc;

// Overflow interrupt: Low Level
// Error interrupt: Disabled
TCC0.INTCTRLA=(TCC0.INTCTRLA & (~(TC0_ERRINTLVL_gm | TC0_OVFINTLVL_gm))) |
	TC_ERRINTLVL_OFF_gc | TC_OVFINTLVL_LO_gc;

// Compare/Capture channel A interrupt: Disabled
// Compare/Capture channel B interrupt: Disabled
// Compare/Capture channel C interrupt: Disabled
// Compare/Capture channel D interrupt: Disabled
TCC0.INTCTRLB=(TCC0.INTCTRLB & (~(TC0_CCDINTLVL_gm | TC0_CCCINTLVL_gm | TC0_CCBINTLVL_gm | TC0_CCAINTLVL_gm))) |
	TC_CCDINTLVL_OFF_gc | TC_CCCINTLVL_OFF_gc | TC_CCBINTLVL_OFF_gc | TC_CCAINTLVL_OFF_gc;

// High resolution extension: Off
HIRESC.CTRL&= ~HIRES_HREN0_bm;

// Advanced Waveform Extension initialization
// Optimize for speed
#pragma optsize-
// Disable locking the AWEX configuration registers just to be sure
n=MCU.AWEXLOCK & (~MCU_AWEXCLOCK_bm);
CCP=CCP_IOREG_gc;
MCU.AWEXLOCK=n;
// Restore optimization for size if needed
#pragma optsize_default

// Pattern generation: Off
// Dead time insertion: Off
AWEXC.CTRL&= ~(AWEX_PGM_bm | AWEX_CWCM_bm | AWEX_DTICCDEN_bm | AWEX_DTICCCEN_bm | AWEX_DTICCBEN_bm | AWEX_DTICCAEN_bm);

// Fault protection initialization
// Fault detection on OCD Break detection: On
// Fault detection restart mode: Latched Mode
// Fault detection action: None (Fault protection disabled)
AWEXC.FDCTRL=(AWEXC.FDCTRL & (~(AWEX_FDDBD_bm | AWEX_FDMODE_bm | AWEX_FDACT_gm))) |
	AWEX_FDACT_NONE_gc;
// Fault detect events:
// Event channel 0: Off
// Event channel 1: Off
// Event channel 2: Off
// Event channel 3: Off
// Event channel 4: Off
// Event channel 5: Off
// Event channel 6: Off
// Event channel 7: Off
AWEXC.FDEVMASK=0b00000000;
// Make sure the fault detect flag is cleared
AWEXC.STATUS|=AWEXC.STATUS & AWEX_FDF_bm;

// Clear the interrupt flags
TCC0.INTFLAGS=TCC0.INTFLAGS;
// Set counter register
TCC0.CNT=0x0000;
// Set period register
TCC0.PER=0x4E1F;
// Set channel A Compare/Capture register
TCC0.CCA=0x0000;
// Set channel B Compare/Capture register
TCC0.CCB=0x0000;
// Set channel C Compare/Capture register
TCC0.CCC=0x0000;
// Set channel D Compare/Capture register
TCC0.CCD=0x0000;

// Restore interrupts enabled/disabled state
SREG=s;
}

unsigned int ten_ms=0;
// Timer/counter TCC0 Overflow/Underflow interrupt service routine
interrupt [TCC0_OVF_vect] void tcc0_overflow_isr(void)
{
// write your code here
    ten_ms++;
}

// RTC initialization
void rtcxm_init(void)
{
unsigned char s;

// RTC clock source: 1024 Hz from internal 32 kHz RC Oscillator
// Internal 32 kHz RC oscillator initialization
// Enable the internal 32 kHz RC oscillator
OSC.CTRL|=OSC_RC32KEN_bm;
// Wait for the internal 32 kHz RC oscillator to stabilize
while ((OSC.STATUS & OSC_RC32KRDY_bm)==0);

// Select the clock source and enable the RTC clock
CLK.RTCCTRL=(CLK.RTCCTRL & (~CLK_RTCSRC_gm)) | CLK_RTCSRC_RCOSC_gc | CLK_RTCEN_bm;
// Make sure that the RTC is stopped before initializing it
RTC.CTRL=(RTC.CTRL & (~RTC_PRESCALER_gm)) | RTC_PRESCALER_OFF_gc;

// Optimize for speed
#pragma optsize-
// Save interrupts enabled/disabled state
s=SREG;
// Disable interrupts
#asm("cli")

// Wait until the RTC is not busy
while (RTC.STATUS & RTC_SYNCBUSY_bm);
// Set the RTC period register
RTC.PER=0x0400;
// Set the RTC count register
RTC.CNT=0x0000;
// Set the RTC compare register
RTC.COMP=0x0000;

// Restore interrupts enabled/disabled state
SREG=s;
// Restore optimization for size if needed
#pragma optsize_default

// Set the clock prescaler: RTC Clock/1
// and start the RTC
RTC.CTRL=(RTC.CTRL & (~RTC_PRESCALER_gm)) | RTC_PRESCALER_DIV1_gc;

// RTC overflow interrupt: Low Level
// RTC compare interrupt: Disabled
RTC.INTCTRL=(RTC.INTCTRL & (~(RTC_OVFINTLVL_gm | RTC_COMPINTLVL_gm))) |
	RTC_OVFINTLVL_LO_gc | RTC_COMPINTLVL_OFF_gc;
}

unsigned int sec=0;
// RTC overflow interrupt service routine
interrupt [RTC_OVF_vect] void rtcxm_overflow_isr(void)
{
// write your code here
    sec++;
}

// USARTC0 initialization
void usartc0_init(void)
{
// Note: the correct PORTC direction for the RxD, TxD and XCK signals
// is configured in the ports_init function

// Transmitter is enabled
// Set TxD=1
PORTC.OUTSET=0x08;

// Communication mode: Asynchronous USART
// Data bits: 8
// Stop bits: 1
// Parity: Disabled
USARTC0.CTRLC=USART_CMODE_ASYNCHRONOUS_gc | USART_PMODE_DISABLED_gc | USART_CHSIZE_8BIT_gc;

// Receive complete interrupt: Low Level
// Transmit complete interrupt: Disabled
// Data register empty interrupt: Disabled
USARTC0.CTRLA=(USARTC0.CTRLA & (~(USART_RXCINTLVL_gm | USART_TXCINTLVL_gm | USART_DREINTLVL_gm))) |
	USART_RXCINTLVL_LO_gc | USART_TXCINTLVL_OFF_gc | USART_DREINTLVL_OFF_gc;

// Required Baud rate: 115200
// Real Baud Rate: 115107.9 (x1 Mode), Error: 0.1 %
USARTC0.BAUDCTRLA=0x0B;
USARTC0.BAUDCTRLB=((0x09 << USART_BSCALE_bp) & USART_BSCALE_gm) | 0x00;

// Receiver: On
// Transmitter: On
// Double transmission speed mode: Off
// Multi-processor communication mode: Off
USARTC0.CTRLB=(USARTC0.CTRLB & (~(USART_RXEN_bm | USART_TXEN_bm | USART_CLK2X_bm | USART_MPCM_bm | USART_TXB8_bm))) |
	USART_RXEN_bm | USART_TXEN_bm;
}

// USARTC0 Receiver buffer
#define RX_BUFFER_SIZE_USARTC0 8
char rx_buffer_usartc0[RX_BUFFER_SIZE_USARTC0];

#if RX_BUFFER_SIZE_USARTC0 <= 256
unsigned char rx_wr_index_usartc0=0,rx_rd_index_usartc0=0,rx_counter_usartc0=0;
#else
unsigned int rx_wr_index_usartc0=0,rx_rd_index_usartc0=0,rx_counter_usartc0=0;
#endif

// This flag is set on USARTC0 Receiver buffer overflow
bit rx_buffer_overflow_usartc0=0;

// USARTC0 Receiver interrupt service routine
interrupt [USARTC0_RXC_vect] void usartc0_rx_isr(void)
{
unsigned char status;
char data;

status=USARTC0.STATUS;
data=USARTC0.DATA;
if ((status & (USART_FERR_bm | USART_PERR_bm | USART_BUFOVF_bm)) == 0)
   {
   rx_buffer_usartc0[rx_wr_index_usartc0++]=data;
#if RX_BUFFER_SIZE_USARTC0 == 256
   // special case for receiver buffer size=256
   if (++rx_counter_usartc0 == 0) rx_buffer_overflow_usartc0=1;
#else
   if (rx_wr_index_usartc0 == RX_BUFFER_SIZE_USARTC0) rx_wr_index_usartc0=0;
   if (++rx_counter_usartc0 == RX_BUFFER_SIZE_USARTC0)
      {
      rx_counter_usartc0=0;
      rx_buffer_overflow_usartc0=1;
      }
#endif
   }
}

// Receive a character from USARTC0
// USARTC0 is used as the default input device by the 'getchar' function
#define _ALTERNATE_GETCHAR_

#pragma used+
char getchar(void)
{
char data;

while (rx_counter_usartc0==0);
data=rx_buffer_usartc0[rx_rd_index_usartc0++];
#if RX_BUFFER_SIZE_USARTC0 != 256
if (rx_rd_index_usartc0 == RX_BUFFER_SIZE_USARTC0) rx_rd_index_usartc0=0;
#endif
#asm("cli")
--rx_counter_usartc0;
#asm("sei")
return data;
}
#pragma used-

// Write a character to the USARTC0 Transmitter
// USARTC0 is used as the default output device by the 'putchar' function
#define _ALTERNATE_PUTCHAR_

#pragma used+
void putchar(char c)
{
while ((USARTC0.STATUS & USART_DREIF_bm) == 0);
USARTC0.DATA=c;
}
#pragma used-

// USARTD0 initialization
void usartd0_init(void)
{
// Note: the correct PORTD direction for the RxD, TxD and XCK signals
// is configured in the ports_init function

// Transmitter is enabled
// Set TxD=1
PORTD.OUTSET=0x08;

// Communication mode: Asynchronous USART
// Data bits: 8
// Stop bits: 1
// Parity: Disabled
USARTD0.CTRLC=USART_CMODE_ASYNCHRONOUS_gc | USART_PMODE_DISABLED_gc | USART_CHSIZE_8BIT_gc;

// Receive complete interrupt: Low Level
// Transmit complete interrupt: Disabled
// Data register empty interrupt: Disabled
USARTD0.CTRLA=(USARTD0.CTRLA & (~(USART_RXCINTLVL_gm | USART_TXCINTLVL_gm | USART_DREINTLVL_gm))) |
	USART_RXCINTLVL_LO_gc | USART_TXCINTLVL_OFF_gc | USART_DREINTLVL_OFF_gc;

// Required Baud rate: 115200
// Real Baud Rate: 115107.9 (x1 Mode), Error: 0.1 %
USARTD0.BAUDCTRLA=0x0B;
USARTD0.BAUDCTRLB=((0x09 << USART_BSCALE_bp) & USART_BSCALE_gm) | 0x00;

// Receiver: On
// Transmitter: On
// Double transmission speed mode: Off
// Multi-processor communication mode: Off
USARTD0.CTRLB=(USARTD0.CTRLB & (~(USART_RXEN_bm | USART_TXEN_bm | USART_CLK2X_bm | USART_MPCM_bm | USART_TXB8_bm))) |
	USART_RXEN_bm | USART_TXEN_bm;
}

// USARTD0 Receiver buffer
#define RX_BUFFER_SIZE_USARTD0 8
char rx_buffer_usartd0[RX_BUFFER_SIZE_USARTD0];

#if RX_BUFFER_SIZE_USARTD0 <= 256
unsigned char rx_wr_index_usartd0=0,rx_rd_index_usartd0=0,rx_counter_usartd0=0;
#else
unsigned int rx_wr_index_usartd0=0,rx_rd_index_usartd0=0,rx_counter_usartd0=0;
#endif

// This flag is set on USARTD0 Receiver buffer overflow
bit rx_buffer_overflow_usartd0=0;

// USARTD0 Receiver interrupt service routine
interrupt [USARTD0_RXC_vect] void usartd0_rx_isr(void)
{
unsigned char status;
char data;

status=USARTD0.STATUS;
data=USARTD0.DATA;
if ((status & (USART_FERR_bm | USART_PERR_bm | USART_BUFOVF_bm)) == 0)
   {
   rx_buffer_usartd0[rx_wr_index_usartd0++]=data;
#if RX_BUFFER_SIZE_USARTD0 == 256
   // special case for receiver buffer size=256
   if (++rx_counter_usartd0 == 0) rx_buffer_overflow_usartd0=1;
#else
   if (rx_wr_index_usartd0 == RX_BUFFER_SIZE_USARTD0) rx_wr_index_usartd0=0;
   if (++rx_counter_usartd0 == RX_BUFFER_SIZE_USARTD0)
      {
      rx_counter_usartd0=0;
      rx_buffer_overflow_usartd0=1;
      }
#endif
   }
}

// Receive a character from USARTD0
#pragma used+
char getchar_usartd0(void)
{
char data;

while (rx_counter_usartd0==0);
data=rx_buffer_usartd0[rx_rd_index_usartd0++];
#if RX_BUFFER_SIZE_USARTD0 != 256
if (rx_rd_index_usartd0 == RX_BUFFER_SIZE_USARTD0) rx_rd_index_usartd0=0;
#endif
#asm("cli")
--rx_counter_usartd0;
#asm("sei")
return data;
}
#pragma used-

// Write a character to the USARTD0 Transmitter
#pragma used+
void putchar_usartd0(char c)
{
while ((USARTD0.STATUS & USART_DREIF_bm) == 0);
USARTD0.DATA=c;
}
#pragma used-

// Function used to read the calibration byte from the
// signature row, specified by 'index'
#pragma optsize-
unsigned char read_calibration_byte(unsigned char index)
{
unsigned char r;
NVM.CMD=NVM_CMD_READ_CALIB_ROW_gc;
r=*((flash unsigned char*) index);
// Clean up NVM command register
NVM.CMD=NVM_CMD_NO_OPERATION_gc;
return r;
}
#pragma optsize_default

// ADCA initialization

// Variable used to store the ADC offset
// for 12 Bit Unsigned conversion mode
unsigned char adca_offset;

void adca_init(void)
{
unsigned char i;
unsigned int offs;

// ADCA is enabled
// Resolution: 12 Bits
// Load the calibration value for 12 Bit resolution
// from the signature row
ADCA.CALL=read_calibration_byte(PROD_SIGNATURES_START+ADCACAL0_offset);
ADCA.CALH=read_calibration_byte(PROD_SIGNATURES_START+ADCACAL1_offset);

// Free Running mode: Off
// Conversion mode: Unsigned
ADCA.CTRLB=(ADCA.CTRLB & (~(ADC_CONMODE_bm | ADC_FREERUN_bm | ADC_RESOLUTION_gm))) |
	ADC_RESOLUTION_12BIT_gc;

// Clock frequency: 3.906 kHz
ADCA.PRESCALER=(ADCA.PRESCALER & (~ADC_PRESCALER_gm)) | ADC_PRESCALER_DIV512_gc;

// Reference: AREF pin on PORTB
// Temperature reference: On
ADCA.REFCTRL=(ADCA.REFCTRL & ((~(ADC_REFSEL_gm | ADC_TEMPREF_bm)) | ADC_BANDGAP_bm)) |
	ADC_REFSEL_AREFB_gc | ADC_TEMPREF_bm;

// Read and save the ADC offset using channel 0
// ADC4 pin connected to GND
ADCA.CH0.CTRL=(ADCA.CH0.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
	ADC_CH_INPUTMODE_SINGLEENDED_gc;
ADCA.CH0.MUXCTRL=(ADCA.CH0.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
	ADC_CH_MUXPOS_PIN4_gc;
// Enable the ADC in order to read the offset
ADCA.CTRLA|=ADC_ENABLE_bm;
// Insert a delay to allow the ADC common mode voltage to stabilize
delay_us(2);
// Perform several offset measurements and store the mean value
offs=0;
for (i=0; i<16; i++)
    {
    // Start the AD conversion on channel 0
    ADCA.CH0.CTRL|=ADC_CH_START_bm;
    // Wait for the AD conversion to complete
    while ((ADCA.CH0.INTFLAGS & ADC_CH_CHIF_bm)==0);
    // Clear the interrupt flag
    ADCA.CH0.INTFLAGS=ADC_CH_CHIF_bm;
    // Read the offset
    offs+=(unsigned char) ADCA.CH0.RESL;
    }
// Disable the ADC
ADCA.CTRLA&= ~ADC_ENABLE_bm;
// Store the mean value of the offset
adca_offset=(unsigned char) (offs/16);

// Initialize the ADC Compare register
ADCA.CMPL=0x00;
ADCA.CMPH=0x00;

// ADC channel 0 gain: 1
// ADC channel 0 input mode: Single-ended positive input signal
ADCA.CH0.CTRL=(ADCA.CH0.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
	ADC_CH_GAIN_1X_gc | ADC_CH_INPUTMODE_SINGLEENDED_gc;

// ADC channel 0 positive input: ADC2 pin
// ADC channel 0 negative input: GND
ADCA.CH0.MUXCTRL=(ADCA.CH0.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
	ADC_CH_MUXPOS_PIN2_gc;

// ADC channel 1 gain: 1
// ADC channel 1 input mode: Single-ended positive input signal
ADCA.CH1.CTRL=(ADCA.CH1.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
	ADC_CH_GAIN_1X_gc | ADC_CH_INPUTMODE_SINGLEENDED_gc;

// ADC channel 1 positive input: ADC3 pin
// ADC channel 1 negative input: GND
ADCA.CH1.MUXCTRL=(ADCA.CH1.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
	ADC_CH_MUXPOS_PIN3_gc;

// ADC channel 2 gain: 1
// ADC channel 2 input mode: Internal positive input signal
ADCA.CH2.CTRL=(ADCA.CH2.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
	ADC_CH_GAIN_1X_gc | ADC_CH_INPUTMODE_INTERNAL_gc;

// ADC channel 2 positive input: Temp. Reference
// ADC channel 2 negative input: GND
ADCA.CH2.MUXCTRL=(ADCA.CH2.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
	ADC_CH_MUXINT_TEMP_gc;

// ADC channel 3 gain: 1
// ADC channel 3 input mode: Internal positive input signal
ADCA.CH3.CTRL=(ADCA.CH3.CTRL & (~(ADC_CH_START_bm | ADC_CH_GAINFAC_gm | ADC_CH_INPUTMODE_gm))) |
	ADC_CH_GAIN_1X_gc | ADC_CH_INPUTMODE_INTERNAL_gc;

// ADC channel 3 positive input: Temp. Reference
// ADC channel 3 negative input: GND
ADCA.CH3.MUXCTRL=(ADCA.CH3.MUXCTRL & (~(ADC_CH_MUXPOS_gm | ADC_CH_MUXNEG_gm))) |
	ADC_CH_MUXINT_TEMP_gc;

// AD conversion is started by software
ADCA.EVCTRL=ADC_EVACT_NONE_gc;

// Channel 0 interrupt: Disabled
ADCA.CH0.INTCTRL=(ADCA.CH0.INTCTRL & (~(ADC_CH_INTMODE_gm | ADC_CH_INTLVL_gm))) |
	ADC_CH_INTMODE_COMPLETE_gc | ADC_CH_INTLVL_OFF_gc;
// Channel 1 interrupt: Disabled
ADCA.CH1.INTCTRL=(ADCA.CH1.INTCTRL & (~(ADC_CH_INTMODE_gm | ADC_CH_INTLVL_gm))) |
	ADC_CH_INTMODE_COMPLETE_gc | ADC_CH_INTLVL_OFF_gc;
// Channel 2 interrupt: Disabled
ADCA.CH2.INTCTRL=(ADCA.CH2.INTCTRL & (~(ADC_CH_INTMODE_gm | ADC_CH_INTLVL_gm))) |
	ADC_CH_INTMODE_COMPLETE_gc | ADC_CH_INTLVL_OFF_gc;
// Channel 3 interrupt: Disabled
ADCA.CH3.INTCTRL=(ADCA.CH3.INTCTRL & (~(ADC_CH_INTMODE_gm | ADC_CH_INTLVL_gm))) |
	ADC_CH_INTMODE_COMPLETE_gc | ADC_CH_INTLVL_OFF_gc;

// Enable the ADC
ADCA.CTRLA|=ADC_ENABLE_bm;
// Insert a delay to allow the ADC common mode voltage to stabilize
delay_us(2);
}

// ADCA channel data read function using polled mode
unsigned int adca_read(unsigned char channel)
{
ADC_CH_t *pch=&ADCA.CH0+channel;
unsigned int data;

// Start the AD conversion
pch->CTRL|=ADC_CH_START_bm;
// Wait for the AD conversion to complete
while ((pch->INTFLAGS & ADC_CH_CHIF_bm)==0);
// Clear the interrupt flag
pch->INTFLAGS=ADC_CH_CHIF_bm;
// Read the AD conversion result
((unsigned char *) &data)[0]=pch->RESL;
((unsigned char *) &data)[1]=pch->RESH;
// Compensate the ADC offset
data-=adca_offset;
return data;
}

// ADCA sweeped channel(s) data read function
// for software triggered mode
void adca_sweep_read(unsigned char nch, unsigned int *pdata)
{
ADC_CH_t *pch=&ADCA.CH0;
unsigned char i,j,m;

// Sweep starts with channel 0
j=ADC_CH0START_bm;
// Prepare the AD conversion start mask for the sweeped channel(s)
m=0;
i=0;
do
  {
  m|=j;
  j<<=1;
  }
while (++i<nch);
// Ensure the interrupt flags are cleared
ADCA.INTFLAGS=ADCA.INTFLAGS;
// Start the AD conversion for the sweeped channel(s)
ADCA.CTRLA=(ADCA.CTRLA & (ADC_DMASEL_gm | ADC_FLUSH_bm | ADC_ENABLE_bm)) | m;
// Read and store the AD conversion results for all the sweeped channels
for (i=0; i<nch; i++)
    {
    // Wait for the AD conversion to complete
    while ((pch->INTFLAGS & ADC_CH_CHIF_bm)==0);
    // Clear the interrupt flag
    pch->INTFLAGS=ADC_CH_CHIF_bm;
    // Read the AD conversion result
    ((unsigned char *) pdata)[0]=pch->RESL;
    ((unsigned char *) pdata)[1]=pch->RESH;
    // Compensate the ADC offset
    *pdata-=adca_offset;
    pdata++;
    pch++;
    }
}
////////////////////////////////////값 출력/////////////////////////////////////////////////
void putstring(char *command)
{
    int i=0;
    while(*(command+i) !=0)
    {
        putchar(*(command+i));
        putchar_usartd0(*(command+i));
        i++;
    }
}

/***************************************************************온습도 센서************************************************************/
#define SDA VPORT2_OUT.0
#define SCL VPORT2_OUT.1
#define SDA_IN VPORT2_IN.0
#define SDA_Direction VPORT2_DIR.0
#define SCL_Direction VPORT2_DIR.1
#define Delay_1us() delay_us(1)


// 온습도 계산을 위한 고정 값
const unsigned int C1 = 400;             // -4
const unsigned int C2 = 405;             // 0.0405  (405 * 10^-4)
const unsigned short C3 = 28;            // -2.8 * 10^-6  (28 * 10^-7)
const unsigned int D1 = 4000;            // -40
const unsigned short D2 = 1;             // 0.01
// 온습도센서 변수
unsigned short i, j;
long int temp, k, SOt, SOrh, Ta_res, Rh_res;
char Ta[16] = "000.00";//"Ta = 000.00    ";
char Rh[16] = "000.00";//"Rh = 000.00    ";
////////////////////////////////////////I2C통신///////////////////////////////////
void SHT_Reset() {
  SCL = 0;                                 // SCL low
  SDA_Direction = 0;                  // SDA를 input으로 define
  for (i = 1; i <= 18; i++)              // 18번 반복하여 9번 클럭을 만듬(9번의 클럭동안 SDA가 1을 유지하면 리셋)
    {
    SCL = ~SCL;
    }
}
void Transmission_Start() {
  SDA_Direction = 0;                // SDA를 input으로 define(SDA=1)
  SCL = 1;                               // SCL high
  Delay_1us();                          // 1us delay
  SDA_Direction = 1;                 // SDA를 output으로 define
  SDA = 0;                              // SDA low
  Delay_1us();                         // 1us delay
  SCL = 0;                             // SCL low
  Delay_1us();                        // 1us delay
  SCL = 1;                             // SCL high
  Delay_1us();                        // 1us delay
  SDA_Direction = 0;              // SDA를 input으로 define
  Delay_1us();                       // 1us delay
  SCL = 0;                            // SCL low
}
// MCU ACK응답
void MCU_ACK() {
  SDA_Direction = 1;              // SDA를 output으로 define
  SDA = 0;                           // SDA low
  SCL = 1;                            // SCL high
  Delay_1us();                      // 1us delay
  SCL = 0;                          // SCL low
  Delay_1us();                     // 1us delay
  SDA_Direction = 0;           // SDA를 input으로 define
}
// command에 따른 온도 or 습도 측정 함수
long int Measure(short num) {
  j = num;                           // j = command (0x03 : 온도 or 0x05 : 습도)
  SHT_Reset();                    // 센서 리셋 절차
  Transmission_Start();        // 전송 시작 절차
  k = 0;                             // k = 0
  SDA_Direction = 1;            // SDA를 output으로 define
  SCL = 0;                         // SCL low
  for(i = 1; i <= 8; i++) {       // 8번 반복
    if(j & 0x80)                    //if (j.F7 == 1)                   // if bit 7 = 1
    SDA_Direction = 0;         // SDA를 input으로 define

    else {                           // else (if bit 7 = 0)
     SDA_Direction = 1;         // SDA를 output으로 define
     SDA = 0;                       // SDA low
   }
    Delay_1us();                   // 1us delay
    SCL = 1;                        // SCL high
    Delay_1us();                   // 1us delay
    SCL = 0;                       // SCL low
    j <<= 1;                          // j의 내용을 한칸 왼쪽으로 시프트
  }

  SDA_Direction = 0;            // SDA를 input으로 define
  SCL = 1;                           // SCL high
  Delay_1us();                      // 1us delay
  SCL = 0;                          // SCL low
  Delay_1us();                      // 1us delay
  while (SDA_IN == 1)           // SDA가 high 일때동안 동작X
    Delay_1us();                    // 1us delay
  for (i = 1; i <=16; i++) {       // repeat 16 times
    k <<= 1;                          // k의 내용을 한칸 왼쪽으로 시프트
    SCL = 1;                         // SCL high
    if (SDA_IN == 1)               // if SDA is high
    k = k | 0x0001;
    SCL = 0;
    if (i == 8)                        // if counter i = 8 일때
      MCU_ACK();                  // MCU 응답
  }

  return k;                          // K를 리턴
}

//////////////////////////////////////측정관련함수//////////////////////////////////////////////
// 측정 및 계산
void calculation(void){
    // 온도 측정
    SOt = Measure(0x03);             // 측정함수 (command 0x03 : 온도)
     // 습도 측정
    SOrh = Measure(0x05);            // 측정함수 (command 0x05 : 습도)

    // 온도 계산
    // Ta_res = D1 + D2 * SOt
    if(SOt > D1)                     // 온도가 영상이면
      Ta_res = SOt * D2 - D1;        // 영상 온도 계산
    else                             // 온도가 영하이면
      Ta_res = D1 - SOt * D2;        // 영하 온도 계산

    // 습도 계산
    // Rh_res = C1 + C2 * SOrh + C3 * SOrh^2
    temp = SOrh * SOrh * C3 / 100000;             // 습도계산과정
    Rh_res = SOrh * C2 / 100 - temp - C1;         //

}
// 계산값 자릿수
void calculation_res(char value[], long int res){
    value[0] = res / 10000 + 48;                    // example: Ta[5] = 12345 / 10000 = 1, 1 + 48 = '1' - ASCII
    value[1] = res % 10000 / 1000 + 48;         // example: Ta[6] = 12345 % 10000 = 2345, Ta[6] = 2345 / 1000 = 2, 2 + 48 = '2' - ASCII
    value[2] = res % 1000 / 100 + 48;            // example: Ta[7] = 12345 % 1000 = 345, Ta[7] = 345 / 100 = 3, 3 + 48 = '3' - ASCII
    value[4] = res % 100 / 10 + 48;                // example: Ta[9] = 12345 % 100 = 45, Ta[9] = 45 / 10 = 4, 4 + 48 = '4' - ASCII
    value[5] = res % 10 + 48;                        // example: Ta[10] = 12345 % 10 = 5, 5 + 48 = '5' - ASCII
// 맨 앞자리수 0일때 빈칸 입력
    if (value[0] == '0')                                  // Ta[5] = '0' 일 때
      value[0] = ' ';                                       // Ta[5]에 빈칸 입력
    if (value[0] == ' ' && value[1] == '0')        // Ta[5]가 빈칸이고 Ta[6]가 '0' 일 때
      value[0] = ' ';                                      // Ta[6]에 빈칸 입력
}
// 작동
void SHToperation(){
    calculation();
    calculation_res(Ta, Ta_res);
    calculation_res(Rh, Rh_res);
    // 온습도값 출력
    putstring(Ta);                            // 온도값 출력
    putchar_usartd0(',');
    putchar(',');
    putstring(Rh);                            // 습도값 출력
}

/************************************먼지센서**************************************/
unsigned int val0;  // ADC값을 저장할 변수
int dustDensity;        // 먼지농도 수치
void adc_dust(){
    VPORT3_DIR.0 = 1;   // out
    VPORT3_OUT.0 = 1;   // 3.3V출력 (IRED On)
    val0 = adca_read(0);
    VPORT3_OUT.0 = 0;   // 0V출력 (IRED Off)
    dustDensity=(int)(0.137*val0-100);  //170*val0(3.3/4096)-100 = 0.137*val0-100
    if(dustDensity <0) dustDensity=0;
}

 //calcvolt0 = 170*val0(3.3/4096)-100 = 0.137*val0-100

/***********************************공기품질****************************************/
#define MQ135_DEFAULTPPM 392 //default ppm of CO2 for calibration
#define MQ135_DEFAULTRO 41763 //default Ro for MQ135_DEFAULTPPM ppm of CO2
#define MQ135_SCALINGFACTOR 116.602//0682 //CO2 gas value
#define MQ135_EXPONENT -2.769//034857 //CO2 gas value
#define MQ135_MAXRSRO 2.428 //for CO2
#define MQ135_MINRSRO 0.358 //for CO2
//define mq135 pulldown resistor
#define MQ135_PULLDOWNRES 18460 // RL저항값 수치
//char printbuff[100];
float d = 0;
int val1;
long mq135_ro = 0;
/*
 * get the calibrated ro based upon read resistance, and a know ppm
 */
long mq135_getro(long resvalue, float ppm) {
    // Rs*exp(log(Scalingfactor / defaultppm) / exponent
	return (long)(resvalue * exp( log(MQ135_SCALINGFACTOR/ppm) / MQ135_EXPONENT ));
}

/*
 * get the ppm concentration
 */
 float mq135_getppm(long resvalue, long ro) {
	float ret = 0;
	float validinterval = 0;
	validinterval = resvalue/(float)ro;
	if(validinterval<MQ135_MAXRSRO && validinterval>MQ135_MINRSRO) {
		ret = (float)MQ135_SCALINGFACTOR * pow( ((float)resvalue/ro), MQ135_EXPONENT);
	}
	return ret;
}

long adc_getresistence(int adcread, long adcbalanceresistor)
{
	if(adcread == 0)
		return 0;
	else
		return (long)((long)(4096*( long)adcbalanceresistor)/adcread-(long)adcbalanceresistor); //(3.3V - 4096)
}
void adc_air(){
		//calculated resistence depends on the sensor pulldown resistor
		long res;
        val1 = adca_read(1);
        res = adc_getresistence(val1, MQ135_PULLDOWNRES);

		//get ro
		mq135_ro = mq135_getro(res, MQ135_DEFAULTPPM);
		//convert to ppm (using default ro)
		d = mq135_getppm(res, MQ135_DEFAULTRO); // ppm수치
}
/*
		itoa(val1, printbuff);
		puts("ADC : ");
        puts(printbuff);
        puts(", ");

        ftoa(val1*0.0012,2,printbuff);
        puts("V(5) : ");
        puts(printbuff);
        puts("V, ");

        ftoa(val1*0.0008,2,printbuff);
        puts("V(3.3) : ");
        puts(printbuff);
        puts("V, ");

		ltoa(res, printbuff);
		puts("RES : ");
        puts(printbuff);
        puts(", ");

		ltoa(mq135_ro, printbuff);
		puts("ro : ");
        puts(printbuff);
        puts(", ");
         */




void main(void)
{
// Declare your local variables here
unsigned char n;
unsigned char ch[30]="";

// Interrupt system initialization
// Optimize for speed
#pragma optsize-
// Make sure the interrupts are disabled
#asm("cli")
// Low level interrupt: On
// Round-robin scheduling for low level interrupt: Off
// Medium level interrupt: Off
// High level interrupt: Off
// The interrupt vectors will be placed at the start of the Application FLASH section
n=(PMIC.CTRL & (~(PMIC_RREN_bm | PMIC_IVSEL_bm | PMIC_HILVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_LOLVLEN_bm))) |
	PMIC_LOLVLEN_bm;
CCP=CCP_IOREG_gc;
PMIC.CTRL=n;
// Set the default priority for round-robin scheduling
PMIC.INTPRI=0x00;
// Restore optimization for size if needed
#pragma optsize_default

// System clocks initialization
system_clocks_init();

// Ports initialization
ports_init();

// Virtual Ports initialization
vports_init();

// Timer/Counter TCC0 initialization
tcc0_init();

// RTC initialization
rtcxm_init();

// USARTC0 initialization
usartc0_init();

// USARTD0 initialization
usartd0_init();

// ADCA initialization
adca_init();

SCL_Direction = 1;                 // SCL은 output

// Globally enable interrupts
#asm("sei")


while (1)
      {
      // Place your code here
        if(sec>1){      // 2초마다
            SHToperation();     // 온습도 센서 동작 및 출력
            adc_dust();           // 먼지센서
            adc_air();             // 공기품질(CO2센서)
            sprintf(ch,", %d, %d",dustDensity, d);    // dustDensity = 0.17*val0*(3.3/4096)-0.1 = 137*val0 - 100
            putstring(ch);        //  먼지센서값 출력
            putchar_usartd0(13);    // Wi-Fi CR
            putchar_usartd0(10);    // Wi-Fi LF
            putchar('\r');        // 시리얼 CR
            sec=0;
        }
      }
}
            //sprintf(ch,"ppm : %3.2f",d);
            //sprintf(ch,"%d, %2.3fV, %2.3fug",val0,val0*0.0008, val0*0.106);