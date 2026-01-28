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