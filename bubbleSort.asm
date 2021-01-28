; #$0000 (inmediato)
; $0000 (extendido)

; Declaración de constantes
dirInicio   EQU $0100; Dirección de inicio del arreglo
contadorInterno    EQU $0103; Contador para controlar el ciclo interno
contadorExterno    EQU $0104; Contador para controlar el ciclo externo
longitudArreglo EQU #$0004; Longitud del arreglo

; Inicio del programa

  CLR contadorExterno; contadorExterno <- 0
cicloExterno:
  LDX #dirInicio; IX <- dirInicio
  CLR contadorInterno; contadorInterno <- 0
revisaFinCicloInterno:
  LDAA contadorInterno; ACCA <- contadorInterno
  CMPAM1 longitudArreglo; (ACCA) - (longitudArreglo) - 1, o bien, (contadorInterno) - (longitudArreglo) - 1 
  BEQ incrementaContadorExterno; Salta si contadorInterno = longitudArreglo
cicloInterno:
  LDAA $00,X; ACCA <- (IX)
  CMPA $01,X; (ACCA) - (IX+1), o bien (IX) - (IX+1)
  BLS incrementaIndice; Salta a incrementaIndice si (IX) <= (IX+1)
  ; Si entró aquí, significa que (IX)>(IX+1), por lo que hay que intercambiar
  SWIX; (IX) <-> (IX+1), es decir, intercambia dos registros de la memoria
incrementaIndice:
  INCLX contadorInterno; IX <- IX + 1, contadorInterno <- (contadorInterno) + 1
  BRA revisaFinCicloInterno
incrementaContadorExterno:
  INC contadorExterno; contadorExterno <- (contadorExterno) + 1
  LDAA contadorExterno; ACCA <- (contadorExterno)
  CMPAM1 longitudArreglo; (ACCA) - (longitudArreglo) - 1, o bien, (contadorExterno) - (longitudArreglo) - 1 
  BLO cicloExterno; Si (contadorExterno) < longitudArreglo - 1, salta a cicloExterno
  ;En caso contrario, se ha terminado el ordenamiento, resta imprimir el arreglo
  LDX #dirInicio; IX <- dirInicio
  LDAB $00,X; ACCB <- (IX)
  LDAB $01,X; ACCB <- (IX+1)
  LDAB $02,X; ACCB <- (IX+2)
  LDAB $03,X; ACCB <- (IX+3)
  END

; Instrucciones propias
; 1. Intercambiar (IX) con (IX + 1) -------> SWIX
; 2. Incrementar IX y el valor de un registro de la memoria -------> INCLX
; 3. Comparar con el valor de un dato menos uno (para comparar con longitudArreglo - 1) -------> CMPAM1