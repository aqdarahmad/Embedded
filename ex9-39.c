//Write a programm to toggle only the portB 4 bit continoulsy every 50 ms 
//Using timer0 , 16 bit mode , the 1:4 prescaler


#include <xc.h>
#include <stdint.h>
#include <stdbool.h>


// 0 0 0 0 0 0 0 1

int main()
{
    Trisbbits.TRISB4 = 0;
    while(1)
    {
        Portbbits.RB4 ^=1;
        dealay_50ms();
    }
}

void dealay_50ms()
{
T0CON = 0x01H;
TMROL = 0X085H;
TMROH = 0XEEH;
T0conbits.TMR0ON = 1;
While(INTCONbits.TMR0IF == 0);
T0conbits.TMR0N = 0;
INTCONbits.TMR0IF = 0;
}
