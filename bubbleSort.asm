; #$0000 (inmediato)
; $0000 (extendido)

; Declaración de constantes
dirInicio   EQU $0100; Dirección de inicio del arreglo
contadorInterno    EQU $0103; Contador para controlar el ciclo interno
contadorExterno    EQU $0104; Contador para controlar el ciclo externo
nMenosUno EQU #$0003; nMenosUno contiene la longitudArreglo - 1

; Inicio del programa

  CLR contadorExterno; contadorExterno <- 0
cicloExterno:
  LDX #dirInicio; IX <- dirInicio
  CLR contadorInterno; contadorInterno <- 0
revisaFinCicloInterno:
  LDAA contadorInterno; ACCA <- contadorInterno
  CMPA nMenosUno; (ACCA) - nMenosUno, o bien, (contadorInterno) - nMenosUno
  BEQ incrementaContadorExterno; Salta si contadorInterno = nMenosUno
cicloInterno:
  LDAA $00,X; ACCA <- (IX)
  CMPA $01,X; (ACCA) - (IX+1), o bien (IX) - (IX+1)
  BLE incrementaIndice; Salta a incrementaIndice si (IX) <= (IX+1)
  ; Si entró aquí, significa que (IX)>(IX+1), por lo que hay que intercambiar
  LDAB $00,X; ACCB <- (IX); o bien, aux <- (IX)
  LDAA $01,X; ACCA <- (IX+1)
  STAA $00,X; (IX) <- ACCA, o bien, (IX) <- (IX+1)
  STAB $01,X; (IX+1) <- ACCB, o bien, (IX+1) <- aux
incrementaIndice:
  INX; IX <- IX + 1
  INC contadorInterno; contadorInterno <- (contadorInterno) + 1
  BRA revisaFinCicloInterno
incrementaContadorExterno:
  INC contadorExterno; contadorExterno <- (contadorExterno) + 1
  LDAA contadorExterno; ACCA <- (contadorExterno)
  CMPA nMenosUno; (ACCA) - (nMenosUno), o bien, (contadorExterno) - (nMenosUno)
  BLO cicloExterno; Si (contadorExterno) < longitudArreglo - 1, salta a cicloExterno
  ;En caso contrario, se ha terminado el ordenamiento, resta imprimir el arreglo
  LDX #dirInicio; IX <- dirInicio
  LDAB $00,X; ACCB <- (IX)
  LDAB $01,X; ACCB <- (IX+1)
  LDAB $02,X; ACCB <- (IX+2)
  LDAB $03,X; ACCB <- (IX+3)
  END

; Propuesta de instrucciones a crear
; 1. Intercambiar (IX) con (IX + 1) <Líneas 25 a 28>
; 2. Comparar el valor un registro de memoria con un dato <Líneas 17-18 y 35-36>
; 3. Comparar con el valor de un dato menos uno (para comparar con longitudArreglo - 1) <Líneas 18 y 36>