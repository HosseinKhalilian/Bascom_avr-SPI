'======================================================================='

' Title: SPI Communication Between Two MCU
' Last Updated :  01.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : Atmega16 + Atmega16

'======================================================================='

$regfile = "m16def.dat"
$crystal = 1000000

Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , _
Db7 = Portc.7 , E = Portc.3 , Rs = Portc.2
Config Lcd = 16 * 2
Config Kbd = Portd

Config Spi = Hard , Interrupt = Off , Data Order = Lsb , Master = Yes , _
Polarity = High , Phase = 1 , Clockrate = 128

Dim K As Byte
Dim S1 As Byte
Dim S2 As Byte

Spiinit

'-----------------------------------------------------------

Main:

K = Getkbd()
If K = 16 Then S2 = 100
S2 = Lookup(k , Dta)
If S2 >= 10 Then S2 = 100
S1 = Spimove(s2)
If S1 = 100 Then Goto Main
Cls
Home
Lcd S1

Goto Main

'-----------------------------------------------------------

Dta:

Data 7 , 8 , 9 , 10 , 4 , 5 , 6 , 20 , 1 , 2 , 3 , 30 , 40 , 0 , 50 , 60

'-----------------------------------------------------------

