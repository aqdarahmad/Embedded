// Programming Timer Interrupt 
// generate a square wave on portb , 5 , move portc to portd ,
// check for interrupt if occured generate a square wave
// 


// if interrup occured timer0 then high priority 

        ORG 0008
        BTFSS INTCON , TMR0IF
        RETFIE
        MOVLW 0XFFH
        MOVWF TMR0H
        MOVLW 0XF2
        MOVLW TMR0L
        BTG PORTB,5
        BCF INTCON , TMR0IF
        RETFIE
//
        ORG 100
        BCF TRISB , 5
        SETF TRISC 
        CLRF TRISD
        MOVLW 00X8H
        MOVWF T0CON
        BCF INTCON , TMR0IF
        MOVLW 0XFFH
        MOVWF TMR0H
        MOVLW 0XF2
        MOVWF TMR0L
        BSF T0CON,TMR0ON
        BSF INTCON,TMR0IE
        BSF INTCON,GIE
AGAIN   MOVFF PORTC , PORTD
        BRA AGAIN






//Use Timer1 as a high-priority interrupt.
//On every interrupt, toggle RB3 (generate a square wave).
//In the main loop, continuously copy PORTA to PORTC.
//Properly initialize the ports and Timer1.
//Enable the interrupt and Timer1.     

 

        BCF TRSISB , 3
        CLRF TRISC
        SETF TRISA
        MOVLW 0X00H
        MOVWF T1CON
        MOVLW 0X3CH
        MOVWF TMR1H
        MOVWL 0XB0H
        MOVWF TMR1L
        BCF PIR1 , TMR1IF
        BSF T1CON , TMR1ON
        BSF INTCON,TMR1IE
        BSF INTCON,GIE
 AGAIN  MOVFF PORTA,PORTC
 BRA    AGAIN

 ORG 00X08
 BTFSS PIE,TMR1IF
 RETFIE
 MOVLW 0X3CH
 MOVWF TMR1H
 MOVLW 0XB0H
 MOVWF TMR1L
 BTG PORTB , 3
 BCF PIR1 , TMR1IF
 RETFIE
        BRA AGAIN
