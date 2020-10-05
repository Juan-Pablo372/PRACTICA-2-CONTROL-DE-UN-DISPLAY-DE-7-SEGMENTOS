
PROCESSOR 16F887
#include <xc.inc>
;CONFIG word1
CONFIG FOSC = INTRC_NOCLKOUT
CONFIG WDTE = OFF
CONFIG PWRTE = ON
CONFIG MCLRE = OFF
CONFIG CP = OFF
CONFIG CPD = OFF
CONFIG BOREN = OFF
CONFIG IESO = OFF
CONFIG FCMEN = ON
CONFIG DEBUG = ON
;CONFIG word2
CONFIG BOR4V=BOR40V
CONFIG WRT = OFF
    
PSECT udata
 var_1:
    DS 1
 var_2:
    DS 1
 var_3:
    DS 1
PSECT resetVec,class=CODE,delta=2
resetVec:
PAGESEL main
goto main
PSECT code
 main:
    bcf STATUS,6        ;ACCEDEMOS AL BANCO DONDE ESTA PORTA
    bcf STATUS,5
    clrf PORTA          ;PONEMOS A "0" PORTA 
 
   
    bsf STATUS,6        ;ACCEDEMOS AL BANCO DONDE ESTA ANSEL
    bsf STATUS,5
    clrf ANSEL          ;DESACTIVAMOS EL CONV. A/D 

    
    bcf STATUS,6        ;ACCEDEMOS AL BANCO DONDE ESTA EL REGISTRO TRISA
    bsf STATUS,5
    clrf TRISA          ;PONEMOS A 0 EL REGISTRO TRISA    0=SALIDAS,1=ENTRADAS
 
    PSECT code
 
     bcf STATUS,6        ;ACCEDEMOS AL BANCO DONDE ESTA PORTA
    bcf STATUS,5
    bcf STATUS,0
bucle:
call numero0
call delay520ms
call numero1
call delay520ms
call numero2
call delay520ms   
call numero3
call delay520ms
call numero4
call delay520ms
call numero5
call delay520ms
call numero6
call delay520ms
call numero7
call delay520ms
call numero8
call delay520ms
call numero9
call delay520ms
goto bucle
PSECT code
numero0:
movlw 0b01111110
movwf PORTA
return
PSECT code
numero1:
movlw 0b00110000
movwf PORTA
return
PSECT code
numero2:
movlw 0b01101101
movwf PORTA
return 
PSECT code
numero3:
movlw 0b01111001
movwf PORTA
return    
PSECT code
numero4:
movlw 0b00110011
movwf PORTA
return
PSECT code
numero5:
movlw 0b01011011
movwf PORTA
return
PSECT code
numero6:
movlw 0b01011111
movwf PORTA
return
PSECT code
numero7:
movlw 0b01110000
movwf PORTA
return
PSECT code
numero8:
movlw 0b01111111
movwf PORTA
return
PSECT code
numero9:
movlw 0b01111011
movwf PORTA
return  
PSECT code
delay1:
movlw 0b11111111
movwf   var_3
decfsz var_3
goto $-1
return
PSECT code
delay2:
movlw 0b11111111
movwf var_2
call delay1
decfsz var_2
goto $-2
return
PSECT code
delay520ms:
movlw   0b00001000
movwf var_1
call delay2
decfsz  var_1
goto $-2
return
 END
