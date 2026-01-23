 create a square wave of 50% duty cycle on the portb 5 


       BCF TRISB , 5
       MOVLW 0X08
       MOVWF T0CON
 HERE  MOVLW 0XFF
       MOVWF TMR0H
       MOVLW 0XF2
       MOVWF TMR0L
       BCF INTCON,TMR0IF
       BTG T0CON,TMR0ON
AGAIN  BTFSS INTCON , TMROIF
       BRA AGAIN
       BCF T0CON,TMR0ON