;**********************************************************
;*  memory.hex
;**********************************************************
;*  This file had been disassembled using unPIC.pl
;*  
;*  unPIC.pl is written by Tamas Rudnai
;*   -> based on Timo Rossi's work on pic14dis.c
;**********************************************************
;*  Please advised that unPIC.pl is not foolproof.
;*  It could happen that the code was not correctly
;*  reversed as the chip is not defined corretly
;*  or because of a bug in the tool's code.
;**********************************************************


        list p=16lf1939

        include "p16lf1939.inc"


Rst_Vector  org 0x0000
        movlp           0x02        ; 0000: 3182
        goto            Start_02d4  ; 0001: 2AD4


Int_Vector  org 0x0004
        movlp           0x00        ; 0004: 3180
        movlb           0x00        ; 0005: 0020
        btfss           PIR1, RCIF  ; 0006: 1E91
        goto            loop_00f5   ; 0007: 28F5

        bcf             PIR1, RCIF  ; 0008: 1291
        movf            mem_3b, W   ; 0009: 083B
        xorlw           0x22        ; 000A: 3A22
        btfss           STATUS, Z   ; 000B: 1D03
        goto            loop_00f5   ; 000C: 28F5

        movlb           0x02        ; 000D: 0022
        movf            serial_count, W  ; 000E: 086E
        addlw           0xba        ; 000F: 3EBA
        movwf           FSR1L       ; 0010: 0086
        movlw           0x01        ; 0011: 3001
        movwf           FSR1H       ; 0012: 0087
        movlb           0x03        ; 0013: 0023
        movf            RCREG, W    ; 0014: 0819
        movwf           INDF1       ; 0015: 0081
        movlb           0x02        ; 0016: 0022
        incf            serial_count, f  ; 0017: 0AEE
        clrf            mem_16d     ; 0018: 01ED
        goto            label_00e7  ; 0019: 28E7

loop_001a
; jump here from: 00EA
        movlb           0x03        ; 001A: 0023
        movf            serial_buffer0, W  ; 001B: 083A
        xorlw           0x45        ; 001C: 3A45

label_001d
; jump here from: 0025
        btfsc           STATUS, Z   ; 001D: 1903
        goto            loop_00f5   ; 001E: 28F5

label_001f
; jump here from: 00F4
        movlb           0x02        ; 001F: 0022
        clrf            serial_count     ; 0020: 01EE
        goto            loop_00f5   ; 0021: 28F5

loop_0022
; jump here from: 00ED
        movlb           0x03        ; 0022: 0023
        movf            serial_buffer1, W  ; 0023: 083B
        xorlw           0x4c        ; 0024: 3A4C
        goto            label_001d  ; 0025: 281D

loop_0026
; jump here from: 00CA
        movlb           0x02        ; 0026: 0022
        movlw           0x45        ; 0027: 3045
        clrf            serial_count     ; 0028: 01EE
        movlb           0x03        ; 0029: 0023
        movwf           serial_output6     ; 002A: 00A6
        movlw           0x4c        ; 002B: 304C
        movwf           serial_output7     ; 002C: 00A7
        movlw           0x62        ; 002D: 3062
        clrf            serial_output8     ; 002E: 01A8

label_002f
; jump here from: 0041
        movwf           serial_output9     ; 002F: 00A9
        movlw           0x06        ; 0030: 3006
        movlb           0x02        ; 0031: 0022
        movwf           mem_16f     ; 0032: 00EF

label_0033
; jump here from: 00C5
        movlp           0x20        ; 0033: 31A0
        call            enable_tx_serial    ; 0034: 200E

        movlp           0x00        ; 0035: 3180
        goto            loop_00f5   ; 0036: 28F5

loop_0037
; jump here from: 00CD
        movlb           0x02        ; 0037: 0022
        movlw           0x45        ; 0038: 3045
        clrf            serial_count     ; 0039: 01EE
        movlb           0x03        ; 003A: 0023
        movwf           serial_output6     ; 003B: 00A6
        movlw           0x4c        ; 003C: 304C
        movwf           serial_output7     ; 003D: 00A7
        movlw           0xa6        ; 003E: 30A6
        clrf            serial_output8     ; 003F: 01A8
        incf            serial_output8, f  ; 0040: 0AA8
        goto            label_002f  ; 0041: 282F

loop_0042
; jump here from: 00E2
; jump here from: 00E5
        movlb           0x02        ; 0042: 0022
        clrf            serial_count     ; 0043: 01EE
        movlb           0x01        ; 0044: 0021
        movf            mem_d3, f   ; 0045: 08D3
        btfss           STATUS, Z   ; 0046: 1D03
        goto            loop_00f5   ; 0047: 28F5

        movlw           0x45        ; 0048: 3045
        movlb           0x03        ; 0049: 0023
        movwf           serial_output0     ; 004A: 00A0
        movlw           0x4c        ; 004B: 304C
        movwf           serial_output1     ; 004C: 00A1
        movf            serial_buffer2, W  ; 004D: 083C
        movwf           serial_output2     ; 004E: 00A2
        movf            serial_buffer2, W  ; 004F: 083C
        movlb           0x01        ; 0050: 0021
        movwf           mem_d3      ; 0051: 00D3
        movlb           0x03        ; 0052: 0023
        movf            serial_buffer3, W  ; 0053: 083D
        movwf           serial_output3     ; 0054: 00A3

label_0055
; jump here from: 00A3
        movf            serial_buffer3, W  ; 0055: 083D
        movlb           0x01        ; 0056: 0021
        movwf           mem_d2      ; 0057: 00D2
        movlb           0x02        ; 0058: 0022
        clrf            mem_148     ; 0059: 01C8
        incf            mem_148, f  ; 005A: 0AC8
        goto            loop_00f5   ; 005B: 28F5

loop_005c
; jump here from: 00D0
        movlb           0x02        ; 005C: 0022
        clrf            serial_count     ; 005D: 01EE
        movlb           0x01        ; 005E: 0021
        movf            mem_d3, f   ; 005F: 08D3
        btfss           STATUS, Z   ; 0060: 1D03
        goto            loop_00f5   ; 0061: 28F5

        movlb           0x02        ; 0062: 0022
        movlw           0x03        ; 0063: 3003
        clrf            mem_132     ; 0064: 01B2
        movlb           0x01        ; 0065: 0021
        movwf           mem_d3      ; 0066: 00D3
        movf            mem_c0, W   ; 0067: 0840
        movlb           0x03        ; 0068: 0023
        movwf           mem_1c0     ; 0069: 00C0
        clrf            mem_1c1     ; 006A: 01C1
        movf            serial_buffer3, W  ; 006B: 083D
        addwf           mem_1c0, f  ; 006C: 07C0
        btfsc           STATUS, C   ; 006D: 1803
        incf            mem_1c1, f  ; 006E: 0AC1
        movlw           0x00        ; 006F: 3000
        subwf           mem_1c1, W  ; 0070: 0241
        movlw           0xf2        ; 0071: 30F2
        btfsc           STATUS, Z   ; 0072: 1903
        subwf           mem_1c0, W  ; 0073: 0240
        movf            mem_1c0, W  ; 0074: 0840
        btfsc           STATUS, C   ; 0075: 1803
        addlw           0x0e        ; 0076: 3E0E
        movlb           0x02        ; 0077: 0022
        movwf           mem_16b     ; 0078: 00EB
        clrf            mem_16a     ; 0079: 01EA
        btfss           mem_16b, 0  ; 007A: 1C6B
        goto            loop_007f   ; 007B: 287F

        clrf            mem_132     ; 007C: 01B2
        incf            mem_132, f  ; 007D: 0AB2
        bsf             mem_16a, 7  ; 007E: 17EA

loop_007f
; jump here from: 007B
        lsrf            mem_16b, f  ; 007F: 36EB

loop_0080
; jump here from: 008B
        movlp           0x20        ; 0080: 31A0
        call            sub_2000    ; 0081: 2000

        movlp           0x00        ; 0082: 3180
        goto            loop_00f5   ; 0083: 28F5

loop_0084
; jump here from: 00D3
        movlb           0x02        ; 0084: 0022
        clrf            serial_count     ; 0085: 01EE
        clrf            mem_148     ; 0086: 01C8
        movlb           0x01        ; 0087: 0021
        clrf            mem_d3      ; 0088: 01D3
        movlb           0x03        ; 0089: 0023
        decfsz          serial_buffer3, W  ; 008A: 0B3D
        goto            loop_0080   ; 008B: 2880

        movlb           0x02        ; 008C: 0022
        clrf            mem_135     ; 008D: 01B5
        incf            mem_135, f  ; 008E: 0AB5
        goto            loop_00f5   ; 008F: 28F5

loop_0090
; jump here from: 00D6
; jump here from: 00D9
; jump here from: 00DC
        movlb           0x02        ; 0090: 0022
        clrf            serial_count     ; 0091: 01EE
        movlb           0x01        ; 0092: 0021
        movf            mem_d3, f   ; 0093: 08D3
        btfss           STATUS, Z   ; 0094: 1D03
        goto            loop_00f5   ; 0095: 28F5

        movlw           0x45        ; 0096: 3045
        movlb           0x03        ; 0097: 0023
        movwf           serial_output3     ; 0098: 00A3
        movlw           0x4c        ; 0099: 304C
        movwf           serial_output4     ; 009A: 00A4
        movf            serial_buffer2, W  ; 009B: 083C
        movwf           serial_output5     ; 009C: 00A5
        movf            serial_buffer2, W  ; 009D: 083C
        movlb           0x01        ; 009E: 0021
        movwf           mem_d3      ; 009F: 00D3
        movlb           0x03        ; 00A0: 0023
        movf            serial_buffer3, W  ; 00A1: 083D
        movwf           serial_output6     ; 00A2: 00A6
        goto            label_0055  ; 00A3: 2855

loop_00a4
; jump here from: 00DF
        movlb           0x02        ; 00A4: 0022
        movlw           0x45        ; 00A5: 3045
        clrf            serial_count     ; 00A6: 01EE
        movlb           0x03        ; 00A7: 0023
        movwf           serial_output1     ; 00A8: 00A1
        movlw           0x4c        ; 00A9: 304C
        movwf           serial_output2     ; 00AA: 00A2
        movlw           0x08        ; 00AB: 3008
        movwf           serial_output3     ; 00AC: 00A3
        clrf            serial_output4     ; 00AD: 01A4
        movlb           0x00        ; 00AE: 0020
        movf            mem_39, W   ; 00AF: 0839
        movlb           0x03        ; 00B0: 0023
        movwf           serial_output5     ; 00B1: 00A5
        movlb           0x00        ; 00B2: 0020
        movf            mem_38, W   ; 00B3: 0838
        movlb           0x03        ; 00B4: 0023
        movwf           serial_output6     ; 00B5: 00A6
        movlb           0x00        ; 00B6: 0020
        movf            mem_35, W   ; 00B7: 0835
        movlb           0x03        ; 00B8: 0023
        movwf           serial_output7     ; 00B9: 00A7
        movlb           0x00        ; 00BA: 0020
        movf            mem_36, W   ; 00BB: 0836
        movlb           0x03        ; 00BC: 0023
        movwf           serial_output8     ; 00BD: 00A8
        movlb           0x00        ; 00BE: 0020
        movf            mem_37, W   ; 00BF: 0837
        movlb           0x03        ; 00C0: 0023
        movwf           serial_output9     ; 00C1: 00A9
        movlb           0x02        ; 00C2: 0022
        clrf            mem_16f     ; 00C3: 01EF
        incf            mem_16f, f  ; 00C4: 0AEF
        goto            label_0033  ; 00C5: 2833

loop_00c6
; jump here from: 00F3
        movlb           0x03        ; 00C6: 0023
        movf            serial_buffer2, W  ; 00C7: 083C
        xorlw           0x00        ; 00C8: 3A00
        btfsc           STATUS, Z   ; 00C9: 1903
        goto            loop_0026   ; 00CA: 2826

        xorlw           0x01        ; 00CB: 3A01
        btfsc           STATUS, Z   ; 00CC: 1903
        goto            loop_0037   ; 00CD: 2837

        xorlw           0x02        ; 00CE: 3A02
        btfsc           STATUS, Z   ; 00CF: 1903
        goto            loop_005c   ; 00D0: 285C

        xorlw           0x07        ; 00D1: 3A07
        btfsc           STATUS, Z   ; 00D2: 1903
        goto            loop_0084   ; 00D3: 2884

        xorlw           0x01        ; 00D4: 3A01
        btfsc           STATUS, Z   ; 00D5: 1903
        goto            loop_0090   ; 00D6: 2890

        xorlw           0x03        ; 00D7: 3A03
        btfsc           STATUS, Z   ; 00D8: 1903
        goto            loop_0090   ; 00D9: 2890

        xorlw           0x01        ; 00DA: 3A01
        btfsc           STATUS, Z   ; 00DB: 1903
        goto            loop_0090   ; 00DC: 2890

        xorlw           0x0f        ; 00DD: 3A0F
        btfsc           STATUS, Z   ; 00DE: 1903
        goto            loop_00a4   ; 00DF: 28A4

        xorlw           0xf8        ; 00E0: 3AF8
        btfsc           STATUS, Z   ; 00E1: 1903
        goto            loop_0042   ; 00E2: 2842

        xorlw           0x01        ; 00E3: 3A01
        btfsc           STATUS, Z   ; 00E4: 1903
        goto            loop_0042   ; 00E5: 2842
        goto            loop_00f5   ; 00E6: 28F5
;
; end of loop_00c6
;------------------------------------------------------------


label_00e7
; jump here from: 0019
        movf            serial_count, W  ; 00E7: 086E
        xorlw           0x01        ; 00E8: 3A01
        btfsc           STATUS, Z   ; 00E9: 1903
        goto            loop_001a   ; 00EA: 281A

        xorlw           0x03        ; 00EB: 3A03
        btfsc           STATUS, Z   ; 00EC: 1903
        goto            loop_0022   ; 00ED: 2822

        xorlw           0x01        ; 00EE: 3A01
        btfsc           STATUS, Z   ; 00EF: 1903
        goto            loop_00f5   ; 00F0: 28F5

        xorlw           0x07        ; 00F1: 3A07
        btfsc           STATUS, Z   ; 00F2: 1903
        goto            loop_00c6   ; 00F3: 28C6
        goto            label_001f  ; 00F4: 281F
;
; end of label_00e7
;------------------------------------------------------------


loop_00f5
; jump here from: 0007
; jump here from: 000C
; jump here from: 001E
; jump here from: 0021
; jump here from: 0036
; jump here from: 0047
; jump here from: 005B
; jump here from: 0061
; jump here from: 0083
; jump here from: 008F
; jump here from: 0095
; jump here from: 00E6
; jump here from: 00F0
        movlb           0x00        ; 00F5: 0020
        btfss           PIR1, TXIF  ; 00F6: 1E11
        goto            loop_0128   ; 00F7: 2928

        movlb           0x01        ; 00F8: 0021
        btfss           PIE1, TXIE  ; 00F9: 1E11
        goto            loop_0128   ; 00FA: 2928

        movlw           0x0a        ; 00FB: 300A
        movlb           0x02        ; 00FC: 0022
        subwf           mem_16f, W  ; 00FD: 026F
        btfss           STATUS, C   ; 00FE: 1C03
        goto            loop_011f   ; 00FF: 291F

        movlw           0x0b        ; 0100: 300B
        subwf           mem_16f, W  ; 0101: 026F
        btfss           STATUS, C   ; 0102: 1C03
        goto            loop_011c   ; 0103: 291C

        movlb           0x01        ; 0104: 0021
        movf            mem_d3, W   ; 0105: 0853
        xorlw           0x03        ; 0106: 3A03
        btfss           STATUS, Z   ; 0107: 1D03
        goto            loop_0118   ; 0108: 2918

        movlb           0x02        ; 0109: 0022
        movf            mem_132, f  ; 010A: 08B2
        btfss           STATUS, Z   ; 010B: 1D03
        goto            loop_0114   ; 010C: 2914

        movlw           0x47        ; 010D: 3047

label_010e
; jump here from: 0115
        subwf           mem_ea, W   ; 010E: 026A
        btfss           STATUS, C   ; 010F: 1C03
        goto            loop_0116   ; 0110: 2916

        movlb           0x01        ; 0111: 0021
        clrf            mem_d3      ; 0112: 01D3
        goto            loop_0118   ; 0113: 2918

loop_0114
; jump here from: 010C
        movlw           0xc7        ; 0114: 30C7
        goto            label_010e  ; 0115: 290E

loop_0116
; jump here from: 0110
        clrf            mem_148     ; 0116: 01C8
        incf            mem_148, f  ; 0117: 0AC8

loop_0118
; jump here from: 0108
; jump here from: 0113
        movlp           0x02        ; 0118: 3182
        call            enable_rx_serial    ; 0119: 22FB

        movlp           0x00        ; 011A: 3180
        goto            loop_012c   ; 011B: 292C

loop_011c
; jump here from: 0103
; jump here from: 0127
        movlb           0x02        ; 011C: 0022
        incf            mem_16f, f  ; 011D: 0AEF
        goto            loop_012c   ; 011E: 292C

loop_011f
; jump here from: 00FF
        movf            mem_16f, W  ; 011F: 086F
        addlw           0xa0        ; 0120: 3EA0
        movwf           FSR1L       ; 0121: 0086
        movlw           0x01        ; 0122: 3001
        movwf           FSR1H       ; 0123: 0087
        movf            INDF1, W    ; 0124: 0801
        movlb           0x03        ; 0125: 0023
        movwf           TXREG       ; 0126: 009A
        goto            loop_011c   ; 0127: 291C

loop_0128
; jump here from: 00F7
; jump here from: 00FA
        movlb           0x00        ; 0128: 0020
        btfss           PIR1, TXIF  ; 0129: 1E11
        goto            loop_012c   ; 012A: 292C

        bcf             PIR1, TXIF  ; 012B: 1211

loop_012c
; jump here from: 011B
; jump here from: 011E
; jump here from: 012A
        btfsc           INTCON, T0IF; 012C: 190B
        btfss           INTCON, T0IE; 012D: 1E8B
        goto            loop_0137   ; 012E: 2937

        bcf             INTCON, T0IF; 012F: 110B
        movlw           0x06        ; 0130: 3006
        movlb           0x00        ; 0131: 0020
        movwf           TMR0        ; 0132: 0095
        movlp           0x28        ; 0133: 31A8
        call            sub_28a2    ; 0134: 20A2

        movlp           0x00        ; 0135: 3180
        goto            loop_013a   ; 0136: 293A

loop_0137
; jump here from: 012E
        btfss           INTCON, T0IF; 0137: 1D0B
        goto            loop_013a   ; 0138: 293A

        bcf             INTCON, T0IF; 0139: 110B

loop_013a
; jump here from: 0136
; jump here from: 0138
        movlb           0x00        ; 013A: 0020
        btfss           PIR1, TMR1IF; 013B: 1C11
        goto            loop_017f   ; 013C: 297F

        bcf             PIR1, TMR1IF; 013D: 1011
        movlw           0xc0        ; 013E: 30C0
        addwf           TMR1H, f    ; 013F: 0797
        movlb           0x03        ; 0140: 0023
        clrf            mem_1c7     ; 0141: 01C7
        incf            mem_1c7, f  ; 0142: 0AC7
        movlb           0x01        ; 0143: 0021
        decfsz          mem_bc, W   ; 0144: 0B3C
        goto            loop_0148   ; 0145: 2948

        clrf            mem_bc      ; 0146: 01BC
        goto            enable_usb  ; 0147: 2960

loop_0148
; jump here from: 0145
        clrf            mem_bc      ; 0148: 01BC
        incf            mem_bc, f   ; 0149: 0ABC
        movlb           0x03        ; 014A: 0023
        clrf            mem_1c8     ; 014B: 01C8
        incf            mem_1c8, f  ; 014C: 0AC8
        incf            mem_1cc, f  ; 014D: 0ACC
        movlb           0x01        ; 014E: 0021
        movf            mem_bd, W   ; 014F: 083D
        xorlw           0x00        ; 0150: 3A00
        movlw           0x00        ; 0151: 3000
        btfsc           STATUS, Z   ; 0152: 1903
        movlw           0x01        ; 0153: 3001
        movwf           mem_bd      ; 0154: 00BD
        movlb           0x02        ; 0155: 0022
        movf            mem_128, W  ; 0156: 0828
        btfsc           STATUS, Z   ; 0157: 1903
        goto            loop_015e   ; 0158: 295E

        decfsz          mem_128, f  ; 0159: 0BA8
        goto            loop_015e   ; 015A: 295E

        movlp           0x3f        ; 015B: 31BF
        call            sub_3f3b    ; 015C: 273B

        movlp           0x00        ; 015D: 3180

loop_015e
; jump here from: 0158
; jump here from: 015A
        movlb           0x02        ; 015E: 0022
        incf            mem_165, f  ; 015F: 0AE5

enable_usb
; jump here from: 0147
        movlb           0x02        ; 0160: 0022
        movf            usb_count, W  ; 0161: 0833
        btfsc           STATUS, Z   ; 0162: 1903
        goto            loop_0168   ; 0163: 2968

        decfsz          usb_count, f  ; 0164: 0BB3
        goto            loop_0168   ; 0165: 2968

        movlb           0x00        ; 0166: 0020
        bcf             PORTC, RC3  ; 0167: 118E

loop_0168
; jump here from: 0163
; jump here from: 0165
        movlb           0x01        ; 0168: 0021
        movf            mem_c8, W   ; 0169: 0848
        btfsc           STATUS, Z   ; 016A: 1903
        goto            loop_017f   ; 016B: 297F

        movlb           0x02        ; 016C: 0022
        incf            mem_140, f  ; 016D: 0AC0
        movf            mem_140, W  ; 016E: 0840
        xorwf           mem_142, W  ; 016F: 0642
        btfss           STATUS, Z   ; 0170: 1D03
        goto            loop_017f   ; 0171: 297F

        clrf            mem_140     ; 0172: 01C0
        clrf            mem_radio_status     ; 0173: 01C5
        incf            mem_radio_status, f  ; 0174: 0AC5
        clrf            mem_141     ; 0175: 01C1
        movlp           0x10        ; 0176: 3190
        call            sub_1000    ; 0177: 2000

        movlp           0x00        ; 0178: 3180
        movf            mem_143, f  ; 0179: 08C3
        btfss           STATUS, Z   ; 017A: 1D03
        goto            loop_017f   ; 017B: 297F

        movlp           0x28        ; 017C: 31A8
        call            radio_enable    ; 017D: 20D0

        movlp           0x00        ; 017E: 3180

loop_017f
; jump here from: 013C
; jump here from: 016B
; jump here from: 0171
; jump here from: 017B
        btfsc           INTCON, INTF; 017F: 188B
        btfss           INTCON, INTE; 0180: 1E0B
        goto            loop_02d1   ; 0181: 2AD1

        bcf             INTCON, INTF; 0182: 108B
        movlb           0x00        ; 0183: 0020
        btfsc           PORTB, RB0  ; 0184: 180D
        retfie                      ; 0185: 0009
        clrf            mem_34      ; 0186: 01B4
        movlp           0x20        ; 0187: 31A0
        call            radio_read    ; 0188: 2045

        movlp           0x00        ; 0189: 3180
        movlw           0x23        ; 018A: 3023
        subwf           mem_34, W   ; 018B: 0234
        btfss           STATUS, C   ; 018C: 1C03
        goto            loop_02cf   ; 018D: 2ACF

        clrf            mem_34      ; 018E: 01B4
        movlp           0x20        ; 018F: 31A0
        call            radio_read    ; 0190: 2045

        movlp           0x00        ; 0191: 3180
        movlp           0x20        ; 0192: 31A0
        call            radio_read    ; 0193: 2045

        movlp           0x00        ; 0194: 3180
        movlw           0x46        ; 0195: 3046
        subwf           mem_34, W   ; 0196: 0234
        btfss           STATUS, C   ; 0197: 1C03
        goto            loop_02cf   ; 0198: 2ACF

        clrf            mem_34      ; 0199: 01B4
        movlp           0x20        ; 019A: 31A0
        call            radio_read    ; 019B: 2045

        movlp           0x00        ; 019C: 3180
        movlp           0x20        ; 019D: 31A0
        call            radio_read    ; 019E: 2045

        movlp           0x00        ; 019F: 3180
        movlp           0x20        ; 01A0: 31A0
        call            radio_read    ; 01A1: 2045

        movlp           0x00        ; 01A2: 3180
        movlw           0x69        ; 01A3: 3069
        subwf           mem_34, W   ; 01A4: 0234
        btfss           STATUS, C   ; 01A5: 1C03
        goto            loop_02cf   ; 01A6: 2ACF

        movlw           0xdf        ; 01A7: 30DF
        subwf           mem_34, W   ; 01A8: 0234
        btfsc           STATUS, C   ; 01A9: 1803
        goto            loop_02cf   ; 01AA: 2ACF

        clrf            mem_34      ; 01AB: 01B4
        movlp           0x20        ; 01AC: 31A0
        call            radio_read    ; 01AD: 2045

        movlp           0x00        ; 01AE: 3180
        movlp           0x20        ; 01AF: 31A0
        call            radio_read    ; 01B0: 2045

        movlp           0x00        ; 01B1: 3180
        movlp           0x20        ; 01B2: 31A0
        call            radio_read    ; 01B3: 2045

        movlp           0x00        ; 01B4: 3180
        movlw           0x69        ; 01B5: 3069
        subwf           mem_34, W   ; 01B6: 0234
        btfss           STATUS, C   ; 01B7: 1C03
        goto            loop_02cf   ; 01B8: 2ACF

        movlw           0xdf        ; 01B9: 30DF
        subwf           mem_34, W   ; 01BA: 0234
        btfsc           STATUS, C   ; 01BB: 1803
        goto            loop_02cf   ; 01BC: 2ACF

        movlb           0x03        ; 01BD: 0023
        clrf            mem_1cf     ; 01BE: 01CF

label_01bf
; jump here from: 01D7
        movlw           0x19        ; 01BF: 3019
        subwf           mem_1cf, W  ; 01C0: 024F
        btfsc           STATUS, C   ; 01C1: 1803
        goto            loop_02cf   ; 01C2: 2ACF

        movlb           0x00        ; 01C3: 0020
        clrf            mem_34      ; 01C4: 01B4
        movlp           0x20        ; 01C5: 31A0
        call            radio_read    ; 01C6: 2045

        movlp           0x00        ; 01C7: 3180
        movlp           0x20        ; 01C8: 31A0
        call            radio_read    ; 01C9: 2045

        movlp           0x00        ; 01CA: 3180
        movlw           0x46        ; 01CB: 3046
        subwf           mem_34, W   ; 01CC: 0234
        btfsc           STATUS, C   ; 01CD: 1803
        goto            loop_01d5   ; 01CE: 29D5

        movlw           0x06        ; 01CF: 3006
        subwf           mem_34, W   ; 01D0: 0234
        btfss           STATUS, C   ; 01D1: 1C03
        goto            loop_01d5   ; 01D2: 29D5

        btfsc           PORTB, RB0  ; 01D3: 180D
        goto            loop_01d8   ; 01D4: 29D8

loop_01d5
; jump here from: 01CE
; jump here from: 01D2
        movlb           0x03        ; 01D5: 0023
        incf            mem_1cf, f  ; 01D6: 0ACF
        goto            label_01bf  ; 01D7: 29BF

loop_01d8
; jump here from: 01D4
        clrf            mem_34      ; 01D8: 01B4
        movlp           0x20        ; 01D9: 31A0
        call            radio_read    ; 01DA: 2045

        movlp           0x00        ; 01DB: 3180
        movlw           0x24        ; 01DC: 3024
        subwf           mem_34, W   ; 01DD: 0234
        btfss           STATUS, C   ; 01DE: 1C03
        goto            loop_01f0   ; 01DF: 29F0

        clrf            mem_34      ; 01E0: 01B4
        movlp           0x20        ; 01E1: 31A0
        call            radio_read    ; 01E2: 2045

        movlp           0x00        ; 01E3: 3180
        movlw           0x24        ; 01E4: 3024
        subwf           mem_34, W   ; 01E5: 0234
        btfss           STATUS, C   ; 01E6: 1C03
        goto            loop_01f0   ; 01E7: 29F0

        clrf            mem_34      ; 01E8: 01B4
        movlp           0x20        ; 01E9: 31A0
        call            radio_read    ; 01EA: 2045

        movlp           0x00        ; 01EB: 3180
        movlw           0x24        ; 01EC: 3024
        subwf           mem_34, W   ; 01ED: 0234
        btfsc           STATUS, C   ; 01EE: 1803
        goto            loop_02cf   ; 01EF: 2ACF

loop_01f0
; jump here from: 01DF
; jump here from: 01E7
        movlw           0xff        ; 01F0: 30FF
        movwf           mem_1b4     ; 01F1: 00B4

loop_01f2
; jump here from: 01F7
        movf            mem_1b4, f  ; 01F2: 08B4
        btfss           STATUS, Z   ; 01F3: 1D03
        btfss           PORTB, RB0; 01F4: 1C0D
        goto            loop_01f9   ; 01F5: 29F9

        decfsz          mem_1b4, f  ; 01F6: 0BB4
        goto            loop_01f2   ; 01F7: 29F2
        goto            loop_02cf   ; 01F8: 2ACF
;
; end of loop_01f2
;------------------------------------------------------------


loop_01f9
; jump here from: 01F5
        movlp           0x20        ; 01F9: 31A0
        call            radio_get_data    ; 01FA: 2014

        movlp           0x00        ; 01FB: 3180
        movlb           0x03        ; 01FC: 0023
        movwf           serial_outputa     ; 01FD: 00AA
        movlb           0x01        ; 01FE: 0021
        movf            mem_b9, f   ; 01FF: 08B9
        btfss           STATUS, Z   ; 0200: 1D03
        goto            loop_0208   ; 0201: 2A08

        movlb           0x03        ; 0202: 0023
        movf            serial_outputa, W  ; 0203: 082A
        movlb           0x02        ; 0204: 0022
        xorwf           mem_168, W  ; 0205: 0668
        btfss           STATUS, Z   ; 0206: 1D03
        goto            loop_02cf   ; 0207: 2ACF

loop_0208
; jump here from: 0201
        movlp           0x20        ; 0208: 31A0
        call            radio_get_data    ; 0209: 2014

        movlp           0x00        ; 020A: 3180
        movlb           0x03        ; 020B: 0023
        movwf           serial_outputb     ; 020C: 00AB
        movlb           0x01        ; 020D: 0021
        movf            mem_b9, f   ; 020E: 08B9
        btfss           STATUS, Z   ; 020F: 1D03
        goto            loop_0217   ; 0210: 2A17

        movlb           0x03        ; 0211: 0023
        movf            serial_outputb, W  ; 0212: 082B
        movlb           0x01        ; 0213: 0021
        xorwf           mem_e1, W   ; 0214: 0661
        btfss           STATUS, Z   ; 0215: 1D03
        goto            loop_02cf   ; 0216: 2ACF

loop_0217
; jump here from: 0210
        movlp           0x20        ; 0217: 31A0
        call            radio_get_data    ; 0218: 2014

        movlp           0x00        ; 0219: 3180
        movlb           0x03        ; 021A: 0023
        movwf           serial_outputc     ; 021B: 00AC
        movlb           0x01        ; 021C: 0021
        movf            mem_b9, f   ; 021D: 08B9
        btfss           STATUS, Z   ; 021E: 1D03
        goto            loop_0226   ; 021F: 2A26

        movlb           0x03        ; 0220: 0023
        movf            serial_outputc, W  ; 0221: 082C
        movlb           0x01        ; 0222: 0021
        xorwf           mem_e2, W   ; 0223: 0662
        btfss           STATUS, Z   ; 0224: 1D03
        goto            loop_02cf   ; 0225: 2ACF

loop_0226
; jump here from: 021F
        movlp           0x20        ; 0226: 31A0
        call            radio_get_data    ; 0227: 2014

        movlp           0x00        ; 0228: 3180
        movlb           0x03        ; 0229: 0023
        movwf           serial_outputd     ; 022A: 00AD
        movlp           0x20        ; 022B: 31A0
        call            radio_get_data    ; 022C: 2014

        movlp           0x00        ; 022D: 3180
        movlb           0x03        ; 022E: 0023
        movwf           serial_outpute     ; 022F: 00AE
        movlp           0x20        ; 0230: 31A0
        call            radio_get_data    ; 0231: 2014

        movlp           0x00        ; 0232: 3180
        movlb           0x03        ; 0233: 0023
        movwf           serial_outputf     ; 0234: 00AF
        movlp           0x20        ; 0235: 31A0
        call            radio_get_data    ; 0236: 2014

        movlp           0x00        ; 0237: 3180
        movlb           0x03        ; 0238: 0023
        movwf           serial_output10     ; 0239: 00B0
        movlp           0x20        ; 023A: 31A0
        call            radio_get_data    ; 023B: 2014

        movlp           0x00        ; 023C: 3180
        movlb           0x03        ; 023D: 0023
        movwf           serial_output11     ; 023E: 00B1
        movf            serial_outputa, W  ; 023F: 082A
        movlb           0x00        ; 0240: 0020
        movwf           mem_34      ; 0241: 00B4
        movlb           0x03        ; 0242: 0023
        movf            serial_outputb, W  ; 0243: 082B
        movlb           0x00        ; 0244: 0020
        addwf           mem_34, f   ; 0245: 07B4
        movlb           0x03        ; 0246: 0023
        movf            serial_outputc, W  ; 0247: 082C
        movlb           0x00        ; 0248: 0020
        addwf           mem_34, f   ; 0249: 07B4
        movlb           0x03        ; 024A: 0023
        movf            serial_outputd, W  ; 024B: 082D
        movlb           0x00        ; 024C: 0020
        addwf           mem_34, f   ; 024D: 07B4
        movlb           0x03        ; 024E: 0023
        movf            serial_outpute, W  ; 024F: 082E
        movlb           0x00        ; 0250: 0020
        addwf           mem_34, f   ; 0251: 07B4
        movlb           0x03        ; 0252: 0023
        movf            serial_outputf, W  ; 0253: 082F
        movlb           0x00        ; 0254: 0020
        addwf           mem_34, f   ; 0255: 07B4
        movlb           0x03        ; 0256: 0023
        movf            serial_output10, W  ; 0257: 0830
        movlb           0x00        ; 0258: 0020
        addwf           mem_34, f   ; 0259: 07B4
        movlb           0x03        ; 025A: 0023
        movf            serial_output11, W  ; 025B: 0831
        movlb           0x00        ; 025C: 0020
        xorwf           mem_34, W   ; 025D: 0634
        btfss           STATUS, Z   ; 025E: 1D03
        goto            loop_02cf   ; 025F: 2ACF

        movlb           0x03        ; 0260: 0023
        movf            serial_outputa, W  ; 0261: 082A
        movlb           0x02        ; 0262: 0022
        xorwf           mem_168, W  ; 0263: 0668
        btfss           STATUS, Z   ; 0264: 1D03
        goto            loop_0272   ; 0265: 2A72

        movlb           0x03        ; 0266: 0023
        movf            serial_outputb, W  ; 0267: 082B
        movlb           0x01        ; 0268: 0021
        xorwf           mem_e1, W   ; 0269: 0661
        btfss           STATUS, Z   ; 026A: 1D03
        goto            loop_0272   ; 026B: 2A72

        movlb           0x03        ; 026C: 0023
        movf            serial_outputc, W  ; 026D: 082C
        movlb           0x01        ; 026E: 0021
        xorwf           mem_e2, W   ; 026F: 0662
        btfsc           STATUS, Z   ; 0270: 1903
        goto            loop_0275   ; 0271: 2A75

loop_0272
; jump here from: 0265
; jump here from: 026B
        movlb           0x03        ; 0272: 0023
        btfss           serial_outputd, 7  ; 0273: 1FAD
        goto            loop_02cf   ; 0274: 2ACF

loop_0275
; jump here from: 0271
        movlb           0x03        ; 0275: 0023
        movf            serial_outpute, W  ; 0276: 082E
        movlb           0x02        ; 0277: 0022
        movwf           mem_139     ; 0278: 00B9
        movlb           0x03        ; 0279: 0023
        movf            serial_outputf, W  ; 027A: 082F
        movlb           0x02        ; 027B: 0022
        movwf           mem_138     ; 027C: 00B8
        movlb           0x03        ; 027D: 0023
        movf            serial_output10, W  ; 027E: 0830
        movlb           0x02        ; 027F: 0022
        movwf           mem_137     ; 0280: 00B7
		
        movlp           0x28        ; 0281: 31A8
        call            radio_disable    ; 0282: 20CA
        movlp           0x00        ; 0283: 3180
		
        movlw           0x3c        ; 0284: 303C
        movwf           mem_144     ; 0285: 00C4
        movlb           0x01        ; 0286: 0021
        clrf            mem_c8      ; 0287: 01C8
        incf            mem_c8, f   ; 0288: 0AC8
        clrf            mem_c7      ; 0289: 01C7
        movlb           0x02        ; 028A: 0022
        clrf            mem_13f     ; 028B: 01BF
        movlb           0x03        ; 028C: 0023
        clrf            mem_1d0     ; 028D: 01D0
        incf            mem_1d0, f  ; 028E: 0AD0
        movlb           0x00        ; 028F: 0020
        movf            TMR1L, W    ; 0290: 0816
        movlb           0x02        ; 0291: 0022
        movwf           mem_124     ; 0292: 00A4
        movlb           0x00        ; 0293: 0020
        movf            TMR1H, W    ; 0294: 0817
        movlb           0x02        ; 0295: 0022
        movwf           mem_125     ; 0296: 00A5
        movlw           0xc0        ; 0297: 30C0
        subwf           mem_125, W  ; 0298: 0225
        movlw           0x00        ; 0299: 3000
        btfsc           STATUS, Z   ; 029A: 1903
        subwf           mem_124, W  ; 029B: 0224
        btfsc           STATUS, C   ; 029C: 1803
        goto            loop_02a2   ; 029D: 2AA2

        movlw           0x3c        ; 029E: 303C
        clrf            mem_140     ; 029F: 01C0
        addwf           mem_125, f  ; 02A0: 07A5
        goto            label_02bd  ; 02A1: 2ABD

loop_02a2
; jump here from: 029D
        movlw           0xc3        ; 02A2: 30C3
        subwf           mem_125, W  ; 02A3: 0225
        movlw           0xd7        ; 02A4: 30D7
        btfsc           STATUS, Z   ; 02A5: 1903
        subwf           mem_124, W  ; 02A6: 0224
        clrf            mem_140     ; 02A7: 01C0
        btfsc           STATUS, C   ; 02A8: 1803
        goto            loop_02b0   ; 02A9: 2AB0

        movlw           0x14        ; 02AA: 3014
        incf            mem_140, f  ; 02AB: 0AC0
        movwf           mem_124     ; 02AC: 00A4
        movlw           0x3e        ; 02AD: 303E
        movwf           mem_125     ; 02AE: 00A5
        goto            label_02bd  ; 02AF: 2ABD

loop_02b0
; jump here from: 02A9
        movlw           0x29        ; 02B0: 3029
        addwf           mem_124, f  ; 02B1: 07A4
        movlw           0x3c        ; 02B2: 303C
        addwfc          mem_125, f  ; 02B3: 3DA5
        goto            label_02bd  ; 02B4: 2ABD

loop_02b5
; jump here from: 02CA
        movlw           0x18        ; 02B5: 3018
        goto            label_02ba  ; 02B6: 2ABA

loop_02b7
; jump here from: 02CD
        movlw           0x24        ; 02B7: 3024
        goto            label_02ba  ; 02B8: 2ABA

label_02b9
; jump here from: 02C6
; jump here from: 02CE
        movlw           0x0c        ; 02B9: 300C

label_02ba
; jump here from: 02B6
; jump here from: 02B8
        movlb           0x02        ; 02BA: 0022
        movwf           mem_142     ; 02BB: 00C2
        goto            loop_02cf   ; 02BC: 2ACF

label_02bd
; jump here from: 02A1
; jump here from: 02AF
; jump here from: 02B4
        movlb           0x03        ; 02BD: 0023
        movf            serial_outputd, W  ; 02BE: 082D
        andlw           0x30        ; 02BF: 3930
        movwf           mem_1fc     ; 02C0: 00FC
        clrf            mem_1fd     ; 02C1: 01FD
        movf            mem_1fd, W  ; 02C2: 087D
        xorlw           0x00        ; 02C3: 3A00
        btfsc           STATUS, Z   ; 02C4: 1903
        goto            loop_02c7   ; 02C5: 2AC7
        goto            label_02b9  ; 02C6: 2AB9
;
; end of label_02bd
;------------------------------------------------------------


loop_02c7
; jump here from: 02C5
        movf            mem_1fc, W  ; 02C7: 087C
        xorlw           0x10        ; 02C8: 3A10
        btfsc           STATUS, Z   ; 02C9: 1903
        goto            loop_02b5   ; 02CA: 2AB5

        xorlw           0x30        ; 02CB: 3A30
        btfsc           STATUS, Z   ; 02CC: 1903
        goto            loop_02b7   ; 02CD: 2AB7
        goto            label_02b9  ; 02CE: 2AB9
;
; end of loop_02c7
;------------------------------------------------------------


loop_02cf
; jump here from: 018D
; jump here from: 0198
; jump here from: 01A6
; jump here from: 01AA
; jump here from: 01B8
; jump here from: 01BC
; jump here from: 01C2
; jump here from: 01EF
; jump here from: 01F8
; jump here from: 0207
; jump here from: 0216
; jump here from: 0225
; jump here from: 025F
; jump here from: 0274
; jump here from: 02BC
; jump here from: 02D3
        bcf             INTCON, INTF; 02CF: 108B
        retfie                      ; 02D0: 0009

loop_02d1
; jump here from: 0181
        btfss           INTCON, INTF; 02D1: 1C8B
        retfie                      ; 02D2: 0009
        goto            loop_02cf   ; 02D3: 2ACF

Start_02d4
; jump here from: 0001
        clrf            BSR         ; 02D4: 0188
        movlp           0x30        ; 02D5: 31B0
        goto            label_30c4  ; 02D6: 28C4

        retlw           0x00        ; 02D7: 3400
        retlw           0xfa        ; 02D8: 34FA
        retlw           0x60        ; 02D9: 3460
        retlw           0xd6        ; 02DA: 34D6
        retlw           0xf4        ; 02DB: 34F4
        retlw           0x6c        ; 02DC: 346C
        retlw           0xbc        ; 02DD: 34BC
        retlw           0xbe        ; 02DE: 34BE
        retlw           0xe8        ; 02DF: 34E8
        retlw           0xfe        ; 02E0: 34FE
        retlw           0xfc        ; 02E1: 34FC
        retlw           0xee        ; 02E2: 34EE
        retlw           0x3e        ; 02E3: 343E
        retlw           0x9a        ; 02E4: 349A
        retlw           0x76        ; 02E5: 3476
        retlw           0x9e        ; 02E6: 349E
        retlw           0x8e        ; 02E7: 348E
        retlw           0x00        ; 02E8: 3400
        retlw           0x04        ; 02E9: 3404
        retlw           0x1a        ; 02EA: 341A
        retlw           0x06        ; 02EB: 3406
        retlw           0x7a        ; 02EC: 347A
        retlw           0x26        ; 02ED: 3426
        retlw           0x1e        ; 02EE: 341E
        retlw           0x7f        ; 02EF: 347F
        retlw           0xdd        ; 02F0: 34DD
        retlw           0x1f        ; 02F1: 341F
        retlw           0x7e        ; 02F2: 347E
        retlw           0xbf        ; 02F3: 34BF
        retlw           0x3e        ; 02F4: 343E
        retlw           0x7f        ; 02F5: 347F
        retlw           0xdf        ; 02F6: 34DF
        retlw           0x5e        ; 02F7: 345E
        retlw           0x9f        ; 02F8: 349F
        retlw           0x1e        ; 02F9: 341E
        retlw           0x5f        ; 02FA: 345F

;------------------------------------------------------------
; Subroutine: enable_rx_serial
;
; called from: 0119

enable_rx_serial
        movlb           0x01        ; 02FB: 0021
        bcf             PIE1, TXIE  ; 02FC: 1211
        movlb           0x03        ; 02FD: 0023
        bsf             RCSTA, CREN ; 02FE: 161D
        return                      ; 02FF: 0008
		
        movlp           0x2f        ; 0300: 31AF
        goto            label_2f25  ; 0301: 2F25

        movlp           0x2f        ; 0302: 31AF
        goto            label_2f2a  ; 0303: 2F2A

        movlp           0x2f        ; 0304: 31AF
        goto            label_2f2f  ; 0305: 2F2F

        movlp           0x2f        ; 0306: 31AF
        goto            label_2f34  ; 0307: 2F34

        movlp           0x2f        ; 0308: 31AF
        goto            label_2f39  ; 0309: 2F39

        movlp           0x2f        ; 030A: 31AF
        goto            label_2f3e  ; 030B: 2F3E

        movlp           0x2f        ; 030C: 31AF
        goto            label_2f43  ; 030D: 2F43

        movlp           0x2f        ; 030E: 31AF
        goto            label_2f48  ; 030F: 2F48

        movlp           0x2f        ; 0310: 31AF
        goto            label_2f4d  ; 0311: 2F4D

        movlp           0x2f        ; 0312: 31AF
        goto            label_2f52  ; 0313: 2F52

        movlp           0x2f        ; 0314: 31AF
        goto            label_2f57  ; 0315: 2F57

        movlp           0x2f        ; 0316: 31AF
        goto            label_2f5c  ; 0317: 2F5C

        movlp           0x2f        ; 0318: 31AF
        goto            label_2f61  ; 0319: 2F61

        movlp           0x2f        ; 031A: 31AF
        goto            label_2f66  ; 031B: 2F66

        movlp           0x2f        ; 031C: 31AF
        goto            label_2f6b  ; 031D: 2F6B

        movlp           0x2f        ; 031E: 31AF
        goto            label_2f70  ; 031F: 2F70

        movlp           0x2f        ; 0320: 31AF
        goto            label_2f75  ; 0321: 2F75

        movlp           0x2f        ; 0322: 31AF
        goto            label_2f7a  ; 0323: 2F7A

        movlp           0x2f        ; 0324: 31AF
        goto            label_2f7f  ; 0325: 2F7F

        movlp           0x2f        ; 0326: 31AF
        goto            label_2f84  ; 0327: 2F84

        movlp           0x2f        ; 0328: 31AF
        goto            label_2f89  ; 0329: 2F89

        movlp           0x2f        ; 032A: 31AF
        goto            label_2f8e  ; 032B: 2F8E

        movlp           0x2f        ; 032C: 31AF
        goto            label_2f93  ; 032D: 2F93

        movlp           0x2f        ; 032E: 31AF
        goto            label_2f98  ; 032F: 2F98

        movlp           0x2f        ; 0330: 31AF
        goto            label_2f9d  ; 0331: 2F9D

        movlp           0x2f        ; 0332: 31AF
        goto            label_2fa2  ; 0333: 2FA2

        movlp           0x2f        ; 0334: 31AF
        goto            label_2fa7  ; 0335: 2FA7

        movlp           0x2f        ; 0336: 31AF
        goto            label_2fac  ; 0337: 2FAC

        movlp           0x2f        ; 0338: 31AF
        goto            label_2fb1  ; 0339: 2FB1

        movlp           0x2f        ; 033A: 31AF
        goto            label_2fb6  ; 033B: 2FB6

        movlp           0x2f        ; 033C: 31AF
        goto            label_2fbb  ; 033D: 2FBB

        movlp           0x2f        ; 033E: 31AF
        goto            label_2fc0  ; 033F: 2FC0

        movlp           0x2f        ; 0340: 31AF
        goto            label_2fc5  ; 0341: 2FC5

        movlp           0x2f        ; 0342: 31AF
        goto            label_2fca  ; 0343: 2FCA

        movlp           0x23        ; 0344: 31A3
        goto            label_2321  ; 0345: 2B21

        movlp           0x22        ; 0346: 31A2
        goto            label_2281  ; 0347: 2A81

        movlp           0x2f        ; 0348: 31AF
        goto            label_2fcf  ; 0349: 2FCF

        movlp           0x2c        ; 034A: 31AC
        goto            label_2cd8  ; 034B: 2CD8

        movlp           0x2c        ; 034C: 31AC
        goto            label_2cda  ; 034D: 2CDA

        movlp           0x2c        ; 034E: 31AC
        goto            label_2cd8  ; 034F: 2CD8

        movlp           0x2c        ; 0350: 31AC
        goto            label_2ce6  ; 0351: 2CE6

        movlp           0x2c        ; 0352: 31AC
        goto            label_2cd8  ; 0353: 2CD8

        movlp           0x2c        ; 0354: 31AC
        goto            label_2ce6  ; 0355: 2CE6

        movlp           0x2c        ; 0356: 31AC
        goto            label_2cd8  ; 0357: 2CD8

        movlp           0x2c        ; 0358: 31AC
        goto            label_2cd8  ; 0359: 2CD8

        movlp           0x2c        ; 035A: 31AC
        goto            label_2ce6  ; 035B: 2CE6

        movlp           0x2c        ; 035C: 31AC
        goto            label_2cd8  ; 035D: 2CD8

        movlp           0x2c        ; 035E: 31AC
        goto            label_2ce6  ; 035F: 2CE6

        movlp           0x2c        ; 0360: 31AC
        goto            label_2cd8  ; 0361: 2CD8

        movlp           0x2a        ; 0362: 31AA
        goto            label_2ae0  ; 0363: 2AE0

        movlp           0x2a        ; 0364: 31AA
        goto            label_2ae3  ; 0365: 2AE3

        movlp           0x2a        ; 0366: 31AA
        goto            label_2ae7  ; 0367: 2AE7

        movlp           0x2a        ; 0368: 31AA
        goto            label_2aee  ; 0369: 2AEE

        movlp           0x2a        ; 036A: 31AA
        goto            label_2af0  ; 036B: 2AF0

        movlp           0x2a        ; 036C: 31AA
        goto            label_2af2  ; 036D: 2AF2

        movlp           0x2a        ; 036E: 31AA
        goto            label_2af4  ; 036F: 2AF4

        movlp           0x2a        ; 0370: 31AA
        goto            label_2af6  ; 0371: 2AF6

        movlp           0x2a        ; 0372: 31AA
        goto            label_2af8  ; 0373: 2AF8

        movlp           0x2a        ; 0374: 31AA
        goto            label_2afa  ; 0375: 2AFA

        movlp           0x2a        ; 0376: 31AA
        goto            label_2afc  ; 0377: 2AFC

        movlp           0x1d        ; 0378: 319D
        goto            loop_1d8e   ; 0379: 2D8E

        movlp           0x1d        ; 037A: 319D
        goto            label_1d96  ; 037B: 2D96

        movlp           0x1d        ; 037C: 319D
        goto            label_1dac  ; 037D: 2DAC

        movlp           0x1d        ; 037E: 319D
        goto            label_1dbd  ; 037F: 2DBD

        movlp           0x1d        ; 0380: 319D
        goto            label_1dc9  ; 0381: 2DC9

        movlp           0x1d        ; 0382: 319D
        goto            label_1dcc  ; 0383: 2DCC

        movlp           0x1d        ; 0384: 319D
        goto            label_1ddc  ; 0385: 2DDC

        movlp           0x1d        ; 0386: 319D
        goto            label_1de6  ; 0387: 2DE6

        movlp           0x1d        ; 0388: 319D
        goto            label_1d26  ; 0389: 2D26

        movlp           0x1d        ; 038A: 319D
        goto            label_1d29  ; 038B: 2D29

        movlp           0x1d        ; 038C: 319D
        goto            label_1d2c  ; 038D: 2D2C

        movlp           0x1d        ; 038E: 319D
        goto            label_1d2f  ; 038F: 2D2F

        movlp           0x1d        ; 0390: 319D
        goto            label_1d32  ; 0391: 2D32

        movlp           0x1d        ; 0392: 319D
        goto            label_1d35  ; 0393: 2D35

;------------------------------------------------------------
; Subroutine: sub_0394
;
; called from: 0A66

sub_0394
        movlb           0x02        ; 0394: 0022
        movf            mem_12e, W  ; 0395: 082E
        btfsc           STATUS, Z   ; 0396: 1903
        goto            loop_039b   ; 0397: 2B9B

        decfsz          mem_12e, f  ; 0398: 0BAE
        goto            loop_039b   ; 0399: 2B9B

        clrf            mem_12d     ; 039A: 01AD

loop_039b
; jump here from: 0397
; jump here from: 0399
        movlb           0x01        ; 039B: 0021
        movf            mem_b2, W   ; 039C: 0832
        btfsc           STATUS, Z   ; 039D: 1903
        goto            loop_0418   ; 039E: 2C18

        movlb           0x02        ; 039F: 0022
        movf            mem_12e, f  ; 03A0: 08AE
        btfss           STATUS, Z   ; 03A1: 1D03
        goto            loop_0418   ; 03A2: 2C18

        movlb           0x01        ; 03A3: 0021
        movf            mem_d0, W   ; 03A4: 0850
        movlb           0x00        ; 03A5: 0020
        movwf           mem_23      ; 03A6: 00A3
        movlb           0x01        ; 03A7: 0021
        movf            mem_d1, W   ; 03A8: 0851
        movlb           0x00        ; 03A9: 0020
        movwf           mem_22      ; 03AA: 00A2
        movlb           0x01        ; 03AB: 0021
        movf            mem_cf, W   ; 03AC: 084F
        movlb           0x00        ; 03AD: 0020
        movwf           mem_33      ; 03AE: 00B3
        movlw           0x64        ; 03AF: 3064
        clrf            mem_20      ; 03B0: 01A0
        movwf           mem_21      ; 03B1: 00A1
        movlw           0x07        ; 03B2: 3007
        movlb           0x01        ; 03B3: 0021
        movwf           mem_ba      ; 03B4: 00BA
        movlp           0x1c        ; 03B5: 319C
        call            sub_1c28    ; 03B6: 2428

        movlp           0x03        ; 03B7: 3183
        movlp           0x2d        ; 03B8: 31AD
        call            sub_2deb    ; 03B9: 25EB

        movlp           0x03        ; 03BA: 3183
        movlb           0x00        ; 03BB: 0020
        movlw           0xc8        ; 03BC: 30C8
        clrf            mem_5a      ; 03BD: 01DA
        movwf           mem_5b      ; 03BE: 00DB
        movlw           0x42        ; 03BF: 3042
        movwf           mem_5c      ; 03C0: 00DC
        movf            mem_23, W   ; 03C1: 0823
        movwf           mem_58      ; 03C2: 00D8
        movf            mem_22, W   ; 03C3: 0822
        movwf           mem_57      ; 03C4: 00D7
        call            sub_0423    ; 03C5: 2423

        movlp           0x03        ; 03C6: 3183
        movf            mem_57, W   ; 03C7: 0857
        movwf           mem_5d      ; 03C8: 00DD
        movf            mem_58, W   ; 03C9: 0858
        movwf           mem_5e      ; 03CA: 00DE
        movf            mem_59, W   ; 03CB: 0859
        movwf           mem_5f      ; 03CC: 00DF
        call            sub_045f    ; 03CD: 245F

        movlp           0x03        ; 03CE: 3183
        movf            mem_5a, W   ; 03CF: 085A
        movlb           0x03        ; 03D0: 0023
        movwf           mem_1d5     ; 03D1: 00D5
        movlb           0x00        ; 03D2: 0020
        movf            mem_5b, W   ; 03D3: 085B
        movlb           0x03        ; 03D4: 0023
        movwf           mem_1d6     ; 03D5: 00D6
        movlb           0x00        ; 03D6: 0020
        movf            mem_5c, W   ; 03D7: 085C
        movlb           0x03        ; 03D8: 0023
        movwf           mem_1d7     ; 03D9: 00D7
        movlb           0x00        ; 03DA: 0020
        movlw           0x80        ; 03DB: 3080
        clrf            mem_5a      ; 03DC: 01DA
        movwf           mem_5b      ; 03DD: 00DB
        movlw           0x3e        ; 03DE: 303E
        movwf           mem_5c      ; 03DF: 00DC
        movlb           0x01        ; 03E0: 0021
        movf            mem_a1, W   ; 03E1: 0821
        movlb           0x00        ; 03E2: 0020
        movwf           mem_58      ; 03E3: 00D8
        movlb           0x01        ; 03E4: 0021
        movf            mem_a0, W   ; 03E5: 0820
        movlb           0x00        ; 03E6: 0020
        movwf           mem_57      ; 03E7: 00D7
        call            sub_0423    ; 03E8: 2423

        movlp           0x03        ; 03E9: 3183
        movf            mem_57, W   ; 03EA: 0857
        movwf           mem_5d      ; 03EB: 00DD
        movf            mem_58, W   ; 03EC: 0858
        movwf           mem_5e      ; 03ED: 00DE
        movf            mem_59, W   ; 03EE: 0859
        movwf           mem_5f      ; 03EF: 00DF
        call            sub_04fb    ; 03F0: 24FB

        movlp           0x03        ; 03F1: 3183
        movf            mem_5a, W   ; 03F2: 085A
        movlb           0x03        ; 03F3: 0023
        movwf           mem_1d2     ; 03F4: 00D2
        movlb           0x00        ; 03F5: 0020
        movf            mem_5b, W   ; 03F6: 085B
        movlb           0x03        ; 03F7: 0023
        movwf           mem_1d3     ; 03F8: 00D3
        movlb           0x00        ; 03F9: 0020
        movf            mem_5c, W   ; 03FA: 085C
        movlb           0x03        ; 03FB: 0023
        movwf           mem_1d4     ; 03FC: 00D4
        movf            mem_1d5, W  ; 03FD: 0855
        movlb           0x00        ; 03FE: 0020
        movwf           mem_4f      ; 03FF: 00CF
        movlb           0x03        ; 0400: 0023
        movf            mem_1d6, W  ; 0401: 0856

loop_0402
; jump here from: 0805
        movlb           0x00        ; 0402: 0020
        movwf           mem_50      ; 0403: 00D0
        movlb           0x03        ; 0404: 0023
        movf            mem_1d7, W  ; 0405: 0857
        movlb           0x00        ; 0406: 0020
        movwf           mem_51      ; 0407: 00D1
        movlb           0x03        ; 0408: 0023
        movf            mem_1d2, W  ; 0409: 0852
        movlb           0x00        ; 040A: 0020
        movwf           mem_52      ; 040B: 00D2
        movlb           0x03        ; 040C: 0023
        movf            mem_1d3, W  ; 040D: 0853
        movlb           0x00        ; 040E: 0020
        movwf           mem_53      ; 040F: 00D3
        movlb           0x03        ; 0410: 0023
        movf            mem_1d4, W  ; 0411: 0854
        movlb           0x00        ; 0412: 0020
        movwf           mem_54      ; 0413: 00D4
        call            sub_0433    ; 0414: 2433

        movlp           0x03        ; 0415: 3183
        btfsc           STATUS, C   ; 0416: 1803
        goto            loop_0419   ; 0417: 2C19

loop_0418
; jump here from: 039E
; jump here from: 03A2
        goto            label_072b  ; 0418: 2F2B
;
; end of loop_0418
;------------------------------------------------------------


loop_0419
; jump here from: 0417
        movlb           0x02        ; 0419: 0022
        movlw           0x06        ; 041A: 3006
        incf            mem_12d, f  ; 041B: 0AAD
        subwf           mem_12d, W  ; 041C: 022D
        btfsc           STATUS, C   ; 041D: 1803
        goto            loop_0420   ; 041E: 2C20
        goto            label_055f  ; 041F: 2D5F
;
; end of loop_0419
;------------------------------------------------------------


loop_0420
; jump here from: 041E
        movlw           0x32        ; 0420: 3032
        movwf           mem_12e     ; 0421: 00AE
        return                      ; 0422: 0008

;------------------------------------------------------------
; Subroutine: sub_0423
;
; called from: 03C5
; called from: 03E8

sub_0423
        movf            mem_57, W   ; 0423: 0857
        movwf           mem_4f      ; 0424: 00CF
        movf            mem_58, W   ; 0425: 0858
        movwf           mem_50      ; 0426: 00D0
        movlw           0x8e        ; 0427: 308E
        clrf            mem_51      ; 0428: 01D1
        movwf           mem_52      ; 0429: 00D2
        clrf            mem_53      ; 042A: 01D3
        call            sub_04c1    ; 042B: 24C1

        movf            mem_4f, W   ; 042C: 084F
        movwf           mem_57      ; 042D: 00D7
        movf            mem_50, W   ; 042E: 0850
        movwf           mem_58      ; 042F: 00D8
        movf            mem_51, W   ; 0430: 0851
        movwf           mem_59      ; 0431: 00D9
        return                      ; 0432: 0008

;------------------------------------------------------------
; Subroutine: sub_0433
;
; called from: 0414

sub_0433
        btfss           mem_51, 7   ; 0433: 1FD1
        goto            loop_0442   ; 0434: 2C42

        movf            mem_4f, W   ; 0435: 084F
        sublw           0x00        ; 0436: 3C00
        movwf           mem_4f      ; 0437: 00CF
        movf            mem_50, W   ; 0438: 0850
        btfss           STATUS, C   ; 0439: 1C03
        incfsz          mem_50, W   ; 043A: 0F50
        sublw           0x00        ; 043B: 3C00
        movwf           mem_50      ; 043C: 00D0
        movf            mem_51, W   ; 043D: 0851
        btfss           STATUS, C   ; 043E: 1C03
        incfsz          mem_51, W   ; 043F: 0F51
        sublw           0x80        ; 0440: 3C80
        movwf           mem_51      ; 0441: 00D1

loop_0442
; jump here from: 0434
        btfss           mem_54, 7   ; 0442: 1FD4
        goto            loop_0451   ; 0443: 2C51

        movf            mem_52, W   ; 0444: 0852
        sublw           0x00        ; 0445: 3C00
        movwf           mem_52      ; 0446: 00D2
        movf            mem_53, W   ; 0447: 0853
        btfss           STATUS, C   ; 0448: 1C03
        incfsz          mem_53, W   ; 0449: 0F53
        sublw           0x00        ; 044A: 3C00
        movwf           mem_53      ; 044B: 00D3
        movf            mem_54, W   ; 044C: 0854
        btfss           STATUS, C   ; 044D: 1C03
        incfsz          mem_54, W   ; 044E: 0F54
        sublw           0x80        ; 044F: 3C80
        movwf           mem_54      ; 0450: 00D4

loop_0451
; jump here from: 0443
        movlw           0x80        ; 0451: 3080
        xorwf           mem_51, f   ; 0452: 06D1
        xorwf           mem_54, f   ; 0453: 06D4
        movf            mem_54, W   ; 0454: 0854
        subwf           mem_51, W   ; 0455: 0251
        btfss           STATUS, Z   ; 0456: 1D03
        return                      ; 0457: 0008
        movf            mem_53, W   ; 0458: 0853
        subwf           mem_50, W   ; 0459: 0250
        btfss           STATUS, Z   ; 045A: 1D03
        return                      ; 045B: 0008
        movf            mem_52, W   ; 045C: 0852
        subwf           mem_4f, W   ; 045D: 024F
        return                      ; 045E: 0008

;------------------------------------------------------------
; Subroutine: sub_045f
;
; called from: 03CD

sub_045f
        movf            mem_5d, W   ; 045F: 085D
        movwf           mem_60      ; 0460: 00E0
        movf            mem_5e, W   ; 0461: 085E
        movwf           mem_61      ; 0462: 00E1
        movf            mem_5f, W   ; 0463: 085F
        movwf           mem_62      ; 0464: 00E2
        bcf             STATUS, C   ; 0465: 1003
        rlf             mem_61, W   ; 0466: 0D61
        rlf             mem_62, W   ; 0467: 0D62
        movwf           mem_67      ; 0468: 00E7
        movf            mem_67, f   ; 0469: 08E7
        btfss           STATUS, Z   ; 046A: 1D03
        goto            loop_0470   ; 046B: 2C70

        clrf            mem_5a      ; 046C: 01DA
        clrf            mem_5b      ; 046D: 01DB
        clrf            mem_5c      ; 046E: 01DC
        return                      ; 046F: 0008

loop_0470
; jump here from: 046B
        movf            mem_5a, W   ; 0470: 085A
        movwf           mem_60      ; 0471: 00E0
        movf            mem_5b, W   ; 0472: 085B
        movwf           mem_61      ; 0473: 00E1
        movf            mem_5c, W   ; 0474: 085C
        movwf           mem_62      ; 0475: 00E2
        bcf             STATUS, C   ; 0476: 1003
        rlf             mem_61, W   ; 0477: 0D61
        rlf             mem_62, W   ; 0478: 0D62
        movwf           mem_68      ; 0479: 00E8
        movf            mem_68, f   ; 047A: 08E8
        btfss           STATUS, Z   ; 047B: 1D03
        goto            loop_0481   ; 047C: 2C81

        clrf            mem_5a      ; 047D: 01DA
        clrf            mem_5b      ; 047E: 01DB
        clrf            mem_5c      ; 047F: 01DC
        return                      ; 0480: 0008

loop_0481
; jump here from: 047C
        movlw           0x89        ; 0481: 3089
        clrf            mem_64      ; 0482: 01E4
        clrf            mem_65      ; 0483: 01E5
        clrf            mem_66      ; 0484: 01E6
        addwf           mem_68, W   ; 0485: 0768
        movwf           mem_60      ; 0486: 00E0
        subwf           mem_67, f   ; 0487: 02E7
        movf            mem_5f, W   ; 0488: 085F
        movwf           mem_68      ; 0489: 00E8
        movf            mem_5c, W   ; 048A: 085C
        xorwf           mem_68, f   ; 048B: 06E8
        movlw           0x80        ; 048C: 3080
        andwf           mem_68, f   ; 048D: 05E8
        movlw           0x18        ; 048E: 3018
        bsf             mem_5e, 7   ; 048F: 17DE
        clrf            mem_5f      ; 0490: 01DF
        bsf             mem_5b, 7   ; 0491: 17DB
        clrf            mem_5c      ; 0492: 01DC
        movwf           mem_63      ; 0493: 00E3

loop_0494
; jump here from: 04AE
        lslf            mem_64, f   ; 0494: 35E4
        rlf             mem_65, f   ; 0495: 0DE5
        rlf             mem_66, f   ; 0496: 0DE6
        movf            mem_5c, W   ; 0497: 085C
        subwf           mem_5f, W   ; 0498: 025F
        btfss           STATUS, Z   ; 0499: 1D03
        goto            loop_04a1   ; 049A: 2CA1

        movf            mem_5b, W   ; 049B: 085B
        subwf           mem_5e, W   ; 049C: 025E
        btfss           STATUS, Z   ; 049D: 1D03
        goto            loop_04a1   ; 049E: 2CA1

        movf            mem_5a, W   ; 049F: 085A
        subwf           mem_5d, W   ; 04A0: 025D

loop_04a1
; jump here from: 049A
; jump here from: 049E
        btfss           STATUS, C   ; 04A1: 1C03
        goto            loop_04aa   ; 04A2: 2CAA

        movf            mem_5a, W   ; 04A3: 085A
        subwf           mem_5d, f   ; 04A4: 02DD
        movf            mem_5b, W   ; 04A5: 085B
        subwfb          mem_5e, f   ; 04A6: 3BDE
        movf            mem_5c, W   ; 04A7: 085C
        subwfb          mem_5f, f   ; 04A8: 3BDF
        bsf             mem_64, 0   ; 04A9: 1464

loop_04aa
; jump here from: 04A2
        lslf            mem_5d, f   ; 04AA: 35DD
        rlf             mem_5e, f   ; 04AB: 0DDE
        rlf             mem_5f, f   ; 04AC: 0DDF
        decfsz          mem_63, f   ; 04AD: 0BE3
        goto            loop_0494   ; 04AE: 2C94

        movf            mem_64, W   ; 04AF: 0864
        movwf           mem_4f      ; 04B0: 00CF
        movf            mem_65, W   ; 04B1: 0865
        movwf           mem_50      ; 04B2: 00D0
        movf            mem_66, W   ; 04B3: 0866
        movwf           mem_51      ; 04B4: 00D1
        movf            mem_67, W   ; 04B5: 0867
        movwf           mem_52      ; 04B6: 00D2
        movf            mem_68, W   ; 04B7: 0868
        movwf           mem_53      ; 04B8: 00D3
        call            sub_04c1    ; 04B9: 24C1

        movf            mem_4f, W   ; 04BA: 084F
        movwf           mem_5a      ; 04BB: 00DA
        movf            mem_50, W   ; 04BC: 0850
        movwf           mem_5b      ; 04BD: 00DB
        movf            mem_51, W   ; 04BE: 0851
        movwf           mem_5c      ; 04BF: 00DC
        return                      ; 04C0: 0008

;------------------------------------------------------------
; Subroutine: sub_04c1
;
; called from: 042B
; called from: 04B9
; called from: 0557

sub_04c1
        movf            mem_52, W   ; 04C1: 0852
        btfsc           STATUS, Z   ; 04C2: 1903
        goto            loop_04c9   ; 04C3: 2CC9

        movf            mem_51, W   ; 04C4: 0851
        iorwf           mem_50, W   ; 04C5: 0450
        iorwf           mem_4f, W   ; 04C6: 044F
        btfss           STATUS, Z   ; 04C7: 1D03
        goto            loop_04d1   ; 04C8: 2CD1

loop_04c9
; jump here from: 04C3
        clrf            mem_4f      ; 04C9: 01CF
        clrf            mem_50      ; 04CA: 01D0
        clrf            mem_51      ; 04CB: 01D1
        return                      ; 04CC: 0008

label_04cd
; jump here from: 04D5
        incf            mem_52, f   ; 04CD: 0AD2
        lsrf            mem_51, f   ; 04CE: 36D1
        rrf             mem_50, f   ; 04CF: 0CD0
        rrf             mem_4f, f   ; 04D0: 0CCF

loop_04d1
; jump here from: 04C8
        movlw           0xfe        ; 04D1: 30FE
        andwf           mem_51, W   ; 04D2: 0551
        btfsc           STATUS, Z   ; 04D3: 1903
        goto            loop_04df   ; 04D4: 2CDF
        goto            label_04cd  ; 04D5: 2CCD
;
; end of loop_04d1
;------------------------------------------------------------


label_04d6
; jump here from: 04E3
        incf            mem_52, f   ; 04D6: 0AD2
        incf            mem_4f, f   ; 04D7: 0ACF
        btfsc           STATUS, Z   ; 04D8: 1903
        incf            mem_50, f   ; 04D9: 0AD0
        btfsc           STATUS, Z   ; 04DA: 1903
        incf            mem_51, f   ; 04DB: 0AD1
        lsrf            mem_51, f   ; 04DC: 36D1
        rrf             mem_50, f   ; 04DD: 0CD0
        rrf             mem_4f, f   ; 04DE: 0CCF

loop_04df
; jump here from: 04D4
        movlw           0xff        ; 04DF: 30FF
        andwf           mem_51, W   ; 04E0: 0551
        btfsc           STATUS, Z   ; 04E1: 1903
        goto            loop_04e8   ; 04E2: 2CE8
        goto            label_04d6  ; 04E3: 2CD6
;
; end of loop_04df
;------------------------------------------------------------


loop_04e4
; jump here from: 04E9
        decf            mem_52, f   ; 04E4: 03D2
        lslf            mem_4f, f   ; 04E5: 35CF
        rlf             mem_50, f   ; 04E6: 0DD0
        rlf             mem_51, f   ; 04E7: 0DD1

loop_04e8
; jump here from: 04E2
        btfss           mem_50, 7   ; 04E8: 1FD0
        goto            loop_04e4   ; 04E9: 2CE4

        btfss           mem_52, 0   ; 04EA: 1C52
        bcf             mem_50, 7   ; 04EB: 13D0
        lsrf            mem_52, f   ; 04EC: 36D2
        movf            mem_52, W   ; 04ED: 0852
        movwf           mem_56      ; 04EE: 00D6
        clrf            mem_55      ; 04EF: 01D5
        clrf            mem_54      ; 04F0: 01D4
        movf            mem_54, W   ; 04F1: 0854
        iorwf           mem_4f, f   ; 04F2: 04CF
        movf            mem_55, W   ; 04F3: 0855
        iorwf           mem_50, f   ; 04F4: 04D0
        movf            mem_56, W   ; 04F5: 0856
        iorwf           mem_51, f   ; 04F6: 04D1
        movf            mem_53, W   ; 04F7: 0853
        btfss           STATUS, Z   ; 04F8: 1D03
        bsf             mem_51, 7   ; 04F9: 17D1
        return                      ; 04FA: 0008

;------------------------------------------------------------
; Subroutine: sub_04fb
;
; called from: 03F0

sub_04fb
        movf            mem_5a, W   ; 04FB: 085A
        movwf           mem_60      ; 04FC: 00E0
        movf            mem_5b, W   ; 04FD: 085B
        movwf           mem_61      ; 04FE: 00E1
        movf            mem_5c, W   ; 04FF: 085C
        movwf           mem_62      ; 0500: 00E2
        bcf             STATUS, C   ; 0501: 1003
        rlf             mem_61, W   ; 0502: 0D61
        rlf             mem_62, W   ; 0503: 0D62
        movwf           mem_63      ; 0504: 00E3
        movf            mem_63, f   ; 0505: 08E3
        btfss           STATUS, Z   ; 0506: 1D03
        goto            loop_050c   ; 0507: 2D0C

        clrf            mem_5a      ; 0508: 01DA
        clrf            mem_5b      ; 0509: 01DB
        clrf            mem_5c      ; 050A: 01DC
        return                      ; 050B: 0008

loop_050c
; jump here from: 0507
        movf            mem_5d, W   ; 050C: 085D
        movwf           mem_60      ; 050D: 00E0
        movf            mem_5e, W   ; 050E: 085E
        movwf           mem_61      ; 050F: 00E1
        movf            mem_5f, W   ; 0510: 085F
        movwf           mem_62      ; 0511: 00E2
        bcf             STATUS, C   ; 0512: 1003
        rlf             mem_61, W   ; 0513: 0D61
        rlf             mem_62, W   ; 0514: 0D62
        movwf           mem_68      ; 0515: 00E8
        movf            mem_68, f   ; 0516: 08E8
        btfss           STATUS, Z   ; 0517: 1D03
        goto            loop_051d   ; 0518: 2D1D

        clrf            mem_5a      ; 0519: 01DA
        clrf            mem_5b      ; 051A: 01DB
        clrf            mem_5c      ; 051B: 01DC
        return                      ; 051C: 0008

loop_051d
; jump here from: 0518
        movf            mem_68, W   ; 051D: 0868
        addlw           0x7b        ; 051E: 3E7B
        addwf           mem_63, f   ; 051F: 07E3
        movf            mem_5c, W   ; 0520: 085C
        movwf           mem_68      ; 0521: 00E8
        movf            mem_5f, W   ; 0522: 085F
        xorwf           mem_68, f   ; 0523: 06E8
        movlw           0x80        ; 0524: 3080
        andwf           mem_68, f   ; 0525: 05E8
        movlw           0xff        ; 0526: 30FF
        bsf             mem_5b, 7   ; 0527: 17DB
        bsf             mem_5e, 7   ; 0528: 17DE
        andwf           mem_5d, f   ; 0529: 05DD
        andwf           mem_5e, f   ; 052A: 05DE
        movlw           0x07        ; 052B: 3007
        clrf            mem_5f      ; 052C: 01DF
        clrf            mem_64      ; 052D: 01E4
        clrf            mem_65      ; 052E: 01E5
        clrf            mem_66      ; 052F: 01E6
        movwf           mem_67      ; 0530: 00E7

loop_0531
; jump here from: 053D
        btfss           mem_5a, 0   ; 0531: 1C5A
        goto            loop_0536   ; 0532: 2D36

        movf            mem_5d, W   ; 0533: 085D
        call            sub_0750    ; 0534: 2750

        movlp           0x03        ; 0535: 3183

loop_0536
; jump here from: 0532
        lsrf            mem_5c, f   ; 0536: 36DC
        rrf             mem_5b, f   ; 0537: 0CDB
        rrf             mem_5a, f   ; 0538: 0CDA
        lslf            mem_5d, f   ; 0539: 35DD
        rlf             mem_5e, f   ; 053A: 0DDE
        rlf             mem_5f, f   ; 053B: 0DDF
        decfsz          mem_67, f   ; 053C: 0BE7
        goto            loop_0531   ; 053D: 2D31

        movlw           0x09        ; 053E: 3009
        movwf           mem_67      ; 053F: 00E7

loop_0540
; jump here from: 054C
        btfss           mem_5a, 0   ; 0540: 1C5A
        goto            loop_0545   ; 0541: 2D45

        movf            mem_5d, W   ; 0542: 085D
        call            sub_0750    ; 0543: 2750

        movlp           0x03        ; 0544: 3183

loop_0545
; jump here from: 0541
        lsrf            mem_5c, f   ; 0545: 36DC
        rrf             mem_5b, f   ; 0546: 0CDB
        rrf             mem_5a, f   ; 0547: 0CDA
        lsrf            mem_66, f   ; 0548: 36E6
        rrf             mem_65, f   ; 0549: 0CE5
        rrf             mem_64, f   ; 054A: 0CE4
        decfsz          mem_67, f   ; 054B: 0BE7
        goto            loop_0540   ; 054C: 2D40

        movf            mem_64, W   ; 054D: 0864
        movwf           mem_4f      ; 054E: 00CF
        movf            mem_65, W   ; 054F: 0865
        movwf           mem_50      ; 0550: 00D0
        movf            mem_66, W   ; 0551: 0866
        movwf           mem_51      ; 0552: 00D1
        movf            mem_63, W   ; 0553: 0863
        movwf           mem_52      ; 0554: 00D2
        movf            mem_68, W   ; 0555: 0868
        movwf           mem_53      ; 0556: 00D3
        call            sub_04c1    ; 0557: 24C1

        movf            mem_4f, W   ; 0558: 084F
        movwf           mem_5a      ; 0559: 00DA
        movf            mem_50, W   ; 055A: 0850
        movwf           mem_5b      ; 055B: 00DB
        movf            mem_51, W   ; 055C: 0851
        movwf           mem_5c      ; 055D: 00DC
        return                      ; 055E: 0008

label_055f
; jump here from: 041F
        clrf            mem_147     ; 055F: 01C7
        incf            mem_147, f  ; 0560: 0AC7
        clrf            usb_count     ; 0561: 01B3
        return                      ; 0562: 0008

label_0563
; jump here from: 2FBF
        goto            label_0583  ; 0563: 2D83

loop_0564
; jump here from: 0587
        movlp           0x1f        ; 0564: 319F
        call            sub_1f25    ; 0565: 2725

        btfsc           STATUS, C   ; 0566: 1803
        clrf            mem_65      ; 0567: 01E5

label_0568
; jump here from: 0582
; jump here from: 058E
        movlb           0x00        ; 0568: 0020
        clrf            mem_3a      ; 0569: 01BA
        return                      ; 056A: 0008

loop_056b
; jump here from: 058A
        movlw           0x00        ; 056B: 3000
        movlp           0x16        ; 056C: 3196
        call            sub_1682    ; 056D: 2682

        movlp           0x03        ; 056E: 3183
        call            sub_0604    ; 056F: 2604

        movlp           0x03        ; 0570: 3183
        movlw           0x1c        ; 0571: 301C
        goto            label_0580  ; 0572: 2D80

loop_0573
; jump here from: 058D
        movlw           0x00        ; 0573: 3000
        movlp           0x16        ; 0574: 3196
        call            sub_1682    ; 0575: 2682

        movlp           0x03        ; 0576: 3183
        movlp           0x1f        ; 0577: 319F
        call            sub_1f0e    ; 0578: 270E

        movlp           0x03        ; 0579: 3183
        movlp           0x19        ; 057A: 3199
        call            sub_19d5    ; 057B: 21D5

        movlp           0x03        ; 057C: 3183
        movlp           0x1e        ; 057D: 319E
        call            sub_1ecf    ; 057E: 26CF

        movlp           0x03        ; 057F: 3183

label_0580
; jump here from: 0572
        movlb           0x00        ; 0580: 0020
        movwf           mem_3b      ; 0581: 00BB
        goto            label_0568  ; 0582: 2D68

label_0583
; jump here from: 0563
        movlb           0x00        ; 0583: 0020
        movf            mem_3a, W   ; 0584: 083A
        xorlw           0x01        ; 0585: 3A01
        btfsc           STATUS, Z   ; 0586: 1903
        goto            loop_0564   ; 0587: 2D64

        xorlw           0x05        ; 0588: 3A05
        btfsc           STATUS, Z   ; 0589: 1903
        goto            loop_056b   ; 058A: 2D6B

        xorlw           0x03        ; 058B: 3A03
        btfsc           STATUS, Z   ; 058C: 1903
        goto            loop_0573   ; 058D: 2D73
        goto            label_0568  ; 058E: 2D68
;
; end of label_0583
;------------------------------------------------------------

        return                      ; 058F: 0008

label_0590
; jump here from: 2F29
        goto            label_05f4  ; 0590: 2DF4

loop_0591
; jump here from: 05F8
        movlb           0x01        ; 0591: 0021
        movlw           0x04        ; 0592: 3004
        movf            mem_c3, f   ; 0593: 08C3
        btfss           STATUS, Z   ; 0594: 1D03
        goto            loop_05bb   ; 0595: 2DBB

        subwf           mem_c6, W   ; 0596: 0246
        btfsc           STATUS, C   ; 0597: 1803
        goto            loop_05ba   ; 0598: 2DBA

        movlw           0x03        ; 0599: 3003
        incf            mem_e5, f   ; 059A: 0AE5
        subwf           mem_e5, W   ; 059B: 0265
        btfss           STATUS, C   ; 059C: 1C03
        goto            loop_05b7   ; 059D: 2DB7

        clrf            mem_e5      ; 059E: 01E5
        goto            loop_05b7   ; 059F: 2DB7

loop_05a0
; jump here from: 05C3
        subwf           mem_c6, W   ; 05A0: 0246
        btfsc           STATUS, C   ; 05A1: 1803
        return                      ; 05A2: 0008
        movf            mem_32, f   ; 05A3: 08B2
        btfss           STATUS, Z   ; 05A4: 1D03
        goto            loop_05ac   ; 05A5: 2DAC

        movlw           0xff        ; 05A6: 30FF
        movwf           mem_32      ; 05A7: 00B2
        movlb           0x02        ; 05A8: 0022
        clrf            mem_12e     ; 05A9: 01AE
        clrf            mem_12d     ; 05AA: 01AD
        goto            label_05ad  ; 05AB: 2DAD

loop_05ac
; jump here from: 05A5
        clrf            mem_32      ; 05AC: 01B2

label_05ad
; jump here from: 05AB
        movlw           0x09        ; 05AD: 3009
        movlb           0x00        ; 05AE: 0020
        movwf           mem_55      ; 05AF: 00D5
        movlb           0x01        ; 05B0: 0021
        movf            mem_b2, W   ; 05B1: 0832
        movlb           0x00        ; 05B2: 0020
        movwf           mem_56      ; 05B3: 00D6
        movlw           0x88        ; 05B4: 3088
        movlp           0x0c        ; 05B5: 318C
        call            I2CWrite    ; 05B6: 24B3

loop_05b7
; jump here from: 059D
; jump here from: 059F
; jump here from: 05D2
; jump here from: 05F3
; jump here from: 0602
        movlb           0x00        ; 05B7: 0020
        clrf            mem_3a      ; 05B8: 01BA
        return                      ; 05B9: 0008

loop_05ba
; jump here from: 0598
; jump here from: 05BE
        goto            label_0635  ; 05BA: 2E35

loop_05bb
; jump here from: 0595
        subwf           mem_c6, W   ; 05BB: 0246
        btfss           STATUS, C   ; 05BC: 1C03
        return                      ; 05BD: 0008
        goto            loop_05ba   ; 05BE: 2DBA

loop_05bf
; jump here from: 05FB
        movlb           0x01        ; 05BF: 0021
        movlw           0x04        ; 05C0: 3004
        movf            mem_c3, f   ; 05C1: 08C3
        btfsc           STATUS, Z   ; 05C2: 1903
        goto            loop_05a0   ; 05C3: 2DA0

        subwf           mem_c6, W   ; 05C4: 0246
        btfss           STATUS, C   ; 05C5: 1C03
        return                      ; 05C6: 0008
        movlw           0x00        ; 05C7: 3000
        movlp           0x16        ; 05C8: 3196
        call            sub_1682    ; 05C9: 2682

        movlp           0x03        ; 05CA: 3183
        movlw           0x17        ; 05CB: 3017
        movlb           0x00        ; 05CC: 0020
        movwf           mem_3b      ; 05CD: 00BB
        movf            mem_36, W   ; 05CE: 0836
        movwf           mem_46      ; 05CF: 00C6
        movf            mem_37, W   ; 05D0: 0837
        movwf           mem_45      ; 05D1: 00C5
        goto            loop_05b7   ; 05D2: 2DB7

loop_05d3
; jump here from: 05FE
        movlb           0x01        ; 05D3: 0021
        movlw           0x04        ; 05D4: 3004
        movf            mem_c3, f   ; 05D5: 08C3
        btfss           STATUS, Z   ; 05D6: 1D03
        goto            loop_05de   ; 05D7: 2DDE

        subwf           mem_c6, W   ; 05D8: 0246
        btfsc           STATUS, C   ; 05D9: 1803
        goto            loop_05e5   ; 05DA: 2DE5

        movlw           0x04        ; 05DB: 3004
        clrf            mem_b9      ; 05DC: 01B9
        goto            label_05e3  ; 05DD: 2DE3

loop_05de
; jump here from: 05D7
        subwf           mem_c6, W   ; 05DE: 0246
        btfss           STATUS, C   ; 05DF: 1C03
        goto            loop_05e5   ; 05E0: 2DE5

        clrf            mem_b9      ; 05E1: 01B9
        incf            mem_b9, f   ; 05E2: 0AB9

label_05e3
; jump here from: 05DD
        movlb           0x00        ; 05E3: 0020
        clrf            mem_3a      ; 05E4: 01BA

loop_05e5
; jump here from: 05DA
; jump here from: 05E0
        movlw           0x3c        ; 05E5: 303C
        call            sub_0644    ; 05E6: 2644

        movlb           0x03        ; 05E7: 0023
        clrf            mem_1ce     ; 05E8: 01CE
        return                      ; 05E9: 0008

loop_05ea
; jump here from: 0601
        movlw           0x00        ; 05EA: 3000
        movlp           0x16        ; 05EB: 3196
        call            sub_1682    ; 05EC: 2682

        movlp           0x03        ; 05ED: 3183
        call            sub_0604    ; 05EE: 2604

        movlp           0x03        ; 05EF: 3183
        movlw           0x1c        ; 05F0: 301C
        movlb           0x00        ; 05F1: 0020
        movwf           mem_3b      ; 05F2: 00BB
        goto            loop_05b7   ; 05F3: 2DB7

label_05f4
; jump here from: 0590
        movlb           0x00        ; 05F4: 0020
        movf            mem_3a, W   ; 05F5: 083A
        xorlw           0x01        ; 05F6: 3A01
        btfsc           STATUS, Z   ; 05F7: 1903
        goto            loop_0591   ; 05F8: 2D91

        xorlw           0x04        ; 05F9: 3A04
        btfsc           STATUS, Z   ; 05FA: 1903
        goto            loop_05bf   ; 05FB: 2DBF

        xorlw           0x03        ; 05FC: 3A03
        btfsc           STATUS, Z   ; 05FD: 1903
        goto            loop_05d3   ; 05FE: 2DD3

        xorlw           0x01        ; 05FF: 3A01
        btfsc           STATUS, Z   ; 0600: 1903
        goto            loop_05ea   ; 0601: 2DEA
        goto            loop_05b7   ; 0602: 2DB7
;
; end of label_05f4
;------------------------------------------------------------

        return                      ; 0603: 0008

;------------------------------------------------------------
; Subroutine: sub_0604
;
; called from: 056F
; called from: 05EE

sub_0604
        movlb           0x01        ; 0604: 0021
        call            sub_0748    ; 0605: 2748

        incf            mem_a2, f   ; 0606: 0AA2
        btfsc           STATUS, Z   ; 0607: 1903
        incf            mem_a3, f   ; 0608: 0AA3
        movlp           0x1b        ; 0609: 319B
        call            sub_1b5a    ; 060A: 235A

        movlp           0x03        ; 060B: 3183
        movlp           0x1f        ; 060C: 319F
        call            sub_1fdb    ; 060D: 27DB

        movlp           0x03        ; 060E: 3183
        call            sub_0748    ; 060F: 2748

        movlp           0x1b        ; 0610: 319B
        call            sub_1b5a    ; 0611: 235A

        movlp           0x03        ; 0612: 3183
        call            sub_073c    ; 0613: 273C

        movlp           0x1c        ; 0614: 319C
        call            sub_1c28    ; 0615: 2428

        movlp           0x03        ; 0616: 3183
        movlp           0x1e        ; 0617: 319E
        call            sub_1e9b    ; 0618: 269B

        movlp           0x03        ; 0619: 3183
        movlp           0x2e        ; 061A: 31AE
        call            sub_2e22    ; 061B: 2622

        movlp           0x03        ; 061C: 3183
        movf            mem_a3, W   ; 061D: 0823
        movlb           0x01        ; 061E: 0021
        movwf           mem_e7      ; 061F: 00E7
        movlb           0x00        ; 0620: 0020
        movf            mem_22, W   ; 0621: 0822
        movlb           0x01        ; 0622: 0021
        movwf           mem_e8      ; 0623: 00E8
        movlb           0x00        ; 0624: 0020
        movf            mem_33, W   ; 0625: 0833
        movlb           0x01        ; 0626: 0021
        movwf           mem_e6      ; 0627: 00E6
        movlp           0x1e        ; 0628: 319E
        call            sub_1ea7    ; 0629: 26A7

        movlp           0x03        ; 062A: 3183
        movlp           0x2e        ; 062B: 31AE
        call            sub_2e22    ; 062C: 2622

        movlp           0x03        ; 062D: 3183
        movlp           0x1e        ; 062E: 319E
        call            sub_1ec3    ; 062F: 26C3

        movlp           0x03        ; 0630: 3183
        movlp           0x1b        ; 0631: 319B
        call            sub_1b70    ; 0632: 2370

        movlp           0x03        ; 0633: 3183
        goto            label_0730  ; 0634: 2F30

label_0635
; jump here from: 05BA
        movlw           0x00        ; 0635: 3000
        movlp           0x16        ; 0636: 3196
        call            sub_1682    ; 0637: 2682

        movlb           0x01        ; 0638: 0021
        movf            mem_b1, W   ; 0639: 0831
        movlb           0x00        ; 063A: 0020
        movwf           mem_29      ; 063B: 00A9
        movlb           0x01        ; 063C: 0021
        movf            mem_b0, W   ; 063D: 0830
        movlb           0x00        ; 063E: 0020
        movwf           mem_28      ; 063F: 00A8
        clrf            mem_3b      ; 0640: 01BB
        incf            mem_3b, f   ; 0641: 0ABB
        clrf            mem_3a      ; 0642: 01BA
        return                      ; 0643: 0008

;------------------------------------------------------------
; Subroutine: sub_0644
;
; called from: 05E6
; called from: 094B
; called from: 0963
; called from: 0994
; called from: 09F6
; called from: 0B57
; called from: 231B

sub_0644
        movlb           0x00        ; 0644: 0020
        movwf           mem_4f      ; 0645: 00CF
        movf            mem_3b, W   ; 0646: 083B
        xorlw           0x22        ; 0647: 3A22
        btfsc           STATUS, Z   ; 0648: 1903
        return                      ; 0649: 0008
		
        movf            mem_4f, W   ; 064A: 084F
        movlb           0x02        ; 064B: 0022
        movwf           mem_13f     ; 064C: 00BF
        call            radio_enable2    ; 064D: 2659

        movlp           0x03        ; 064E: 3183
        movlb           0x01        ; 064F: 0021
        clrf            mem_c8      ; 0650: 01C8
        clrf            mem_c7      ; 0651: 01C7
        incf            mem_c7, f   ; 0652: 0AC7
        movlb           0x02        ; 0653: 0022
        decfsz          mem_147, W  ; 0654: 0B47
        return                      ; 0655: 0008
		
        clrf            mem_2e      ; 0656: 01AE
        clrf            mem_2d      ; 0657: 01AD
        goto            label_072b  ; 0658: 2F2B

;------------------------------------------------------------
; Subroutine: radio_enable2
;
; called from: 064D

radio_enable2
        movlb           0x00        ; 0659: 0020
        movf            mem_3b, W   ; 065A: 083B
        xorlw           0x22        ; 065B: 3A22
        btfsc           STATUS, Z   ; 065C: 1903
        return                      ; 065D: 0008
        movlb           0x02        ; 065E: 0022
        clrf            mem_radio_status     ; 065F: 01C5
        incf            mem_radio_status, f  ; 0660: 0AC5
        movlb           0x00        ; 0661: 0020
        bsf             PORTB, RB1  ; 0662: 148D
        bsf             INTCON, INTE; 0663: 160B
        return                      ; 0664: 0008

;------------------------------------------------------------
; Subroutine: sub_0665
;
; called from: 0A22

sub_0665
        clrf            mem_53      ; 0665: 01D3
        movf            PORTD, W    ; 0666: 080F
        movwf           mem_54      ; 0667: 00D4
        bcf             mem_54, 7   ; 0668: 13D4
        clrf            mem_55      ; 0669: 01D5

loop_066a
; jump here from: 0674
        movlw           0x7f        ; 066A: 307F
        andwf           PORTD, W    ; 066B: 050F
        movwf           mem_52      ; 066C: 00D2
        xorwf           mem_54, W   ; 066D: 0654
        btfsc           STATUS, Z   ; 066E: 1903
        incf            mem_53, f   ; 066F: 0AD3
        movlw           0x96        ; 0670: 3096
        incf            mem_55, f   ; 0671: 0AD5
        subwf           mem_55, W   ; 0672: 0255
        btfss           STATUS, C   ; 0673: 1C03
        goto            loop_066a   ; 0674: 2E6A

        movlw           0x79        ; 0675: 3079
        subwf           mem_53, W   ; 0676: 0253
        btfsc           STATUS, C   ; 0677: 1803
        goto            loop_06bd   ; 0678: 2EBD
        goto            label_06ba  ; 0679: 2EBA
;
; end of loop_066a
;------------------------------------------------------------


loop_067a
; jump here from: 06C9
        movlb           0x01        ; 067A: 0021
        clrf            mem_c5      ; 067B: 01C5
        incf            mem_c5, f   ; 067C: 0AC5
        goto            loop_06e0   ; 067D: 2EE0

loop_067e
; jump here from: 06CF
        movlw           0x02        ; 067E: 3002
        goto            label_0689  ; 067F: 2E89

loop_0680
; jump here from: 06D2
        movlw           0x03        ; 0680: 3003
        goto            label_0689  ; 0681: 2E89

loop_0682
; jump here from: 06D5
        movlw           0x04        ; 0682: 3004
        goto            label_0689  ; 0683: 2E89

loop_0684
; jump here from: 06DE
        movlw           0x05        ; 0684: 3005
        goto            label_0689  ; 0685: 2E89

loop_0686
; jump here from: 06D8
        movlw           0x06        ; 0686: 3006
        goto            label_0689  ; 0687: 2E89

loop_0688
; jump here from: 06DB
        movlw           0x07        ; 0688: 3007

label_0689
; jump here from: 067F
; jump here from: 0681
; jump here from: 0683
; jump here from: 0685
; jump here from: 0687
        movlb           0x01        ; 0689: 0021
        movwf           mem_c5      ; 068A: 00C5
        goto            loop_06e0   ; 068B: 2EE0

loop_068c
; jump here from: 06C6
        movf            mem_bb, f   ; 068C: 08BB
        btfss           STATUS, Z   ; 068D: 1D03
        goto            loop_06e0   ; 068E: 2EE0

        movlw           0x00        ; 068F: 3000
        clrf            mem_ba      ; 0690: 01BA
        movlp           0x16        ; 0691: 3196
        call            sub_1682    ; 0692: 2682

        movlp           0x03        ; 0693: 3183
        movlw           0xe4        ; 0694: 30E4
        movlp           0x02        ; 0695: 3182
        callw                       ; 0696: 000A

        movlb           0x02        ; 0697: 0022
        movwf           mem_154     ; 0698: 00D4
        movlw           0xea        ; 0699: 30EA
        movlp           0x02        ; 069A: 3182
        callw                       ; 069B: 000A

        movwf           mem_155     ; 069C: 00D5
        movlw           0xeb        ; 069D: 30EB
        movlp           0x02        ; 069E: 3182
        callw                       ; 069F: 000A

        movwf           mem_156     ; 06A0: 00D6
        movlp           0x0e        ; 06A1: 318E
        call            sub_0e47    ; 06A2: 2647

        movlp           0x03        ; 06A3: 3183
        movlw           0x23        ; 06A4: 3023
        goto            label_06b8  ; 06A5: 2EB8

loop_06a6
; jump here from: 06CC
        movlw           0x09        ; 06A6: 3009
        movlb           0x01        ; 06A7: 0021
        movwf           mem_c5      ; 06A8: 00C5
        movlw           0x06        ; 06A9: 3006
        subwf           mem_c6, W   ; 06AA: 0246
        btfss           STATUS, C   ; 06AB: 1C03
        goto            loop_06e0   ; 06AC: 2EE0

        movlb           0x00        ; 06AD: 0020
        movf            mem_3b, f   ; 06AE: 08BB
        btfss           STATUS, Z   ; 06AF: 1D03
        goto            loop_06e0   ; 06B0: 2EE0

        movlw           0x00        ; 06B1: 3000
        clrf            mem_3a      ; 06B2: 01BA
        movlp           0x16        ; 06B3: 3196
        call            sub_1682    ; 06B4: 2682

        movlp           0x03        ; 06B5: 3183
        movlw           0x24        ; 06B6: 3024
        movlb           0x00        ; 06B7: 0020

label_06b8
; jump here from: 06A5
        movwf           mem_13b     ; 06B8: 00BB
        goto            loop_06e0   ; 06B9: 2EE0

label_06ba
; jump here from: 0679
; jump here from: 06DF
        movlb           0x01        ; 06BA: 0021
        clrf            mem_c5      ; 06BB: 01C5
        goto            loop_06e0   ; 06BC: 2EE0

loop_06bd
; jump here from: 0678
        movf            mem_54, W   ; 06BD: 0854
        xorlw           0x13        ; 06BE: 3A13
        btfsc           STATUS, Z   ; 06BF: 1903
        goto            loop_06e0   ; 06C0: 2EE0

        xorlw           0x09        ; 06C1: 3A09
        btfsc           STATUS, Z   ; 06C2: 1903
        goto            loop_06e0   ; 06C3: 2EE0

        xorlw           0x2d        ; 06C4: 3A2D
        btfsc           STATUS, Z   ; 06C5: 1903
        goto            loop_068c   ; 06C6: 2E8C

        xorlw           0x08        ; 06C7: 3A08
        btfsc           STATUS, Z   ; 06C8: 1903
        goto            loop_067a   ; 06C9: 2E7A

        xorlw           0x70        ; 06CA: 3A70
        btfsc           STATUS, Z   ; 06CB: 1903
        goto            loop_06a6   ; 06CC: 2EA6

        xorlw           0x10        ; 06CD: 3A10
        btfsc           STATUS, Z   ; 06CE: 1903
        goto            loop_067e   ; 06CF: 2E7E

        xorlw           0x30        ; 06D0: 3A30
        btfsc           STATUS, Z   ; 06D1: 1903
        goto            loop_0680   ; 06D2: 2E80

        xorlw           0x18        ; 06D3: 3A18
        btfsc           STATUS, Z   ; 06D4: 1903
        goto            loop_0682   ; 06D5: 2E82

        xorlw           0x0c        ; 06D6: 3A0C
        btfsc           STATUS, Z   ; 06D7: 1903
        goto            loop_0686   ; 06D8: 2E86

        xorlw           0x06        ; 06D9: 3A06
        btfsc           STATUS, Z   ; 06DA: 1903
        goto            loop_0688   ; 06DB: 2E88

        xorlw           0x03        ; 06DC: 3A03
        btfsc           STATUS, Z   ; 06DD: 1903
        goto            loop_0684   ; 06DE: 2E84
        goto            label_06ba  ; 06DF: 2EBA
;
; end of loop_06bd
;------------------------------------------------------------


loop_06e0
; jump here from: 067D
; jump here from: 068B
; jump here from: 068E
; jump here from: 06AC
; jump here from: 06B0
; jump here from: 06B9
; jump here from: 06BC
; jump here from: 06C0
; jump here from: 06C3
        movlb           0x01        ; 06E0: 0021
        movf            mem_c5, f   ; 06E1: 08C5
        btfss           STATUS, Z   ; 06E2: 1D03
        goto            loop_06e8   ; 06E3: 2EE8

        clrf            mem_c3      ; 06E4: 01C3
        clrf            mem_c6      ; 06E5: 01C6
        clrf            mem_c4      ; 06E6: 01C4
        goto            loop_0718   ; 06E7: 2F18

loop_06e8
; jump here from: 06E3
        movf            mem_c3, f   ; 06E8: 08C3
        btfss           STATUS, Z   ; 06E9: 1D03
        goto            loop_06fe   ; 06EA: 2EFE

        movf            mem_c5, W   ; 06EB: 0845
        movlb           0x00        ; 06EC: 0020
        movwf           mem_3a      ; 06ED: 00BA
        movlb           0x01        ; 06EE: 0021
        clrf            mem_c3      ; 06EF: 01C3
        incf            mem_c3, f   ; 06F0: 0AC3
        movlb           0x03        ; 06F1: 0023
        movf            mem_1c4, W  ; 06F2: 0844
        btfsc           STATUS, Z   ; 06F3: 1903
        goto            loop_06fa   ; 06F4: 2EFA

        movlw           0x14        ; 06F5: 3014
        movlb           0x02        ; 06F6: 0022
        movwf           mem_12a     ; 06F7: 00AA
        movlb           0x00        ; 06F8: 0020
        bsf             PORTA, RA3  ; 06F9: 158C

loop_06fa
; jump here from: 06F4
        movlw           0x0f        ; 06FA: 300F
        movlb           0x02        ; 06FB: 0022
        movwf           mem_128     ; 06FC: 00A8
        goto            loop_0718   ; 06FD: 2F18

loop_06fe
; jump here from: 06EA
        movf            mem_c4, f   ; 06FE: 08C4
        btfss           STATUS, Z   ; 06FF: 1D03
        goto            loop_0718   ; 0700: 2F18

        movlw           0x04        ; 0701: 3004
        subwf           mem_c6, W   ; 0702: 0246
        btfss           STATUS, C   ; 0703: 1C03
        goto            loop_0718   ; 0704: 2F18

        movlb           0x00        ; 0705: 0020
        movf            mem_3b, W   ; 0706: 083B
        btfsc           STATUS, Z   ; 0707: 1903
        goto            loop_0718   ; 0708: 2F18

        movlb           0x01        ; 0709: 0021
        movf            mem_c5, W   ; 070A: 0845
        xorlw           0x02        ; 070B: 3A02
        btfsc           STATUS, Z   ; 070C: 1903
        goto            loop_0712   ; 070D: 2F12

        movf            mem_c5, W   ; 070E: 0845
        xorlw           0x03        ; 070F: 3A03
        btfss           STATUS, Z   ; 0710: 1D03
        goto            loop_0718   ; 0711: 2F18

loop_0712
; jump here from: 070D
        clrf            mem_c6      ; 0712: 01C6
        movlb           0x03        ; 0713: 0023
        clrf            mem_1ca     ; 0714: 01CA
        movlb           0x01        ; 0715: 0021
        clrf            mem_c4      ; 0716: 01C4
        incf            mem_c4, f   ; 0717: 0AC4

loop_0718
; jump here from: 06E7
; jump here from: 06FD
; jump here from: 0700
; jump here from: 0704
; jump here from: 0708
; jump here from: 0711
        movlb           0x01        ; 0718: 0021
        decfsz          mem_c3, W   ; 0719: 0B43
        goto            loop_071e   ; 071A: 2F1E

        movlw           0x0a        ; 071B: 300A
        movlb           0x02        ; 071C: 0022
        movwf           mem_12c     ; 071D: 00AC

loop_071e
; jump here from: 071A
        movlb           0x00        ; 071E: 0020
        movf            mem_3a, W   ; 071F: 083A
        btfsc           STATUS, Z   ; 0720: 1903
        return                      ; 0721: 0008
        movlb           0x02        ; 0722: 0022
        decfsz          mem_147, W  ; 0723: 0B47
        return                      ; 0724: 0008
        movlb           0x00        ; 0725: 0020
        clrf            mem_3a      ; 0726: 01BA
        movlb           0x02        ; 0727: 0022
        clrf            mem_12e     ; 0728: 01AE
        clrf            mem_12d     ; 0729: 01AD
        goto            label_072b  ; 072A: 2F2B

label_072b
; jump here from: 0418
; jump here from: 0658
; jump here from: 072A
        movlb           0x00        ; 072B: 0020
        bcf             PORTC, RC3  ; 072C: 118E
        movlb           0x02        ; 072D: 0022
        clrf            mem_147     ; 072E: 01C7
        return                      ; 072F: 0008

label_0730
; jump here from: 0634
; jump here from: 194D
; jump here from: 19D4
        movf            mem_a3, W   ; 0730: 0823
        movlb           0x01        ; 0731: 0021
        movwf           mem_e7      ; 0732: 00E7
        movlb           0x00        ; 0733: 0020
        movf            mem_22, W   ; 0734: 0822
        movlb           0x01        ; 0735: 0021
        movwf           mem_e8      ; 0736: 00E8
        movlb           0x00        ; 0737: 0020
        movf            mem_33, W   ; 0738: 0833
        movlb           0x01        ; 0739: 0021
        movwf           mem_e6      ; 073A: 00E6
        return                      ; 073B: 0008

;------------------------------------------------------------
; Subroutine: sub_073c
;
; called from: 0613
; called from: 1ADC
; called from: 1AEA

sub_073c
        movlb           0x01        ; 073C: 0021
        movf            mem_b6, W   ; 073D: 0836
        movlb           0x00        ; 073E: 0020
        movwf           mem_21      ; 073F: 00A1
        movlb           0x01        ; 0740: 0021
        movf            mem_b7, W   ; 0741: 0837
        movlb           0x00        ; 0742: 0020
        movwf           mem_20      ; 0743: 00A0
        movlb           0x01        ; 0744: 0021
        movf            mem_b5, W   ; 0745: 0835
        movwf           mem_ba      ; 0746: 00BA
        return                      ; 0747: 0008

;------------------------------------------------------------
; Subroutine: sub_0748
;
; called from: 0605
; called from: 060F
; called from: 1ACA
; called from: 1AD3

sub_0748
        movf            mem_a3, W   ; 0748: 0823
        movlb           0x00        ; 0749: 0020
        movwf           mem_23      ; 074A: 00A3
        movlb           0x01        ; 074B: 0021
        movf            mem_a2, W   ; 074C: 0822
        movlb           0x00        ; 074D: 0020
        movwf           mem_22      ; 074E: 00A2
        return                      ; 074F: 0008

;------------------------------------------------------------
; Subroutine: sub_0750
;
; called from: 0534
; called from: 0543

sub_0750
        addwf           mem_64, f   ; 0750: 07E4
        movf            mem_5e, W   ; 0751: 085E
        addwfc          mem_65, f   ; 0752: 3DE5
        movf            mem_5f, W   ; 0753: 085F
        addwfc          mem_66, f   ; 0754: 3DE6
        return                      ; 0755: 0008

label_0756
; jump here from: 255C
        movlw           0xc0        ; 0756: 30C0
        movwf           mem_14b     ; 0757: 00CB
        movlb           0x01        ; 0758: 0021
        movf            mem_b4, W   ; 0759: 0834
        movlp           0x1d        ; 075A: 319D
        call            sub_1d1e    ; 075B: 251E

        movlp           0x07        ; 075C: 3187
        movlb           0x02        ; 075D: 0022
        bsf             mem_14e, 0  ; 075E: 144E
        bsf             mem_14e, 2  ; 075F: 154E
        movlb           0x01        ; 0760: 0021
        movlw           0x0c        ; 0761: 300C
        bsf             mem_bb, 0   ; 0762: 143B
        movlb           0x02        ; 0763: 0022
        iorwf           mem_149, f  ; 0764: 04C9
        movlb           0x00        ; 0765: 0020
        movf            mem_29, W   ; 0766: 0829
        movwf           mem_57      ; 0767: 00D7
        movf            mem_28, W   ; 0768: 0828
        movwf           mem_56      ; 0769: 00D6
        movlp           0x25        ; 076A: 31A5
        call            sub_2560    ; 076B: 2560

        movlp           0x07        ; 076C: 3187
        goto            label_07e5  ; 076D: 2FE5

loop_076e
; jump here from: 07F1
        decf            mem_bc, W   ; 076E: 033C
        btfsc           STATUS, Z   ; 076F: 1903
        goto            loop_0774   ; 0770: 2F74

        movf            mem_c4, W   ; 0771: 0844
        btfsc           STATUS, Z   ; 0772: 1903
        goto            loop_077d   ; 0773: 2F7D

loop_0774
; jump here from: 0770
        movlb           0x00        ; 0774: 0020
        movf            mem_31, W   ; 0775: 0831
        addlw           0xd8        ; 0776: 3ED8
        movlp           0x02        ; 0777: 3182
        callw                       ; 0778: 000A

        movlp           0x07        ; 0779: 3187
        movlb           0x02        ; 077A: 0022
        movwf           mem_153     ; 077B: 00D3
        goto            loop_077f   ; 077C: 2F7F

loop_077d
; jump here from: 0773
        movlb           0x02        ; 077D: 0022
        clrf            mem_153     ; 077E: 01D3

loop_077f
; jump here from: 077C
; jump here from: 07A3
; jump here from: 07A7
        movlb           0x00        ; 077F: 0020
        movf            mem_30, W   ; 0780: 0830
        addlw           0xd8        ; 0781: 3ED8
        movlp           0x02        ; 0782: 3182
        callw                       ; 0783: 000A

        movlb           0x02        ; 0784: 0022
        movwf           mem_154     ; 0785: 00D4

loop_0786
; jump here from: 07AC
; jump here from: 07BD
; jump here from: 07C0
        movlb           0x00        ; 0786: 0020
        movf            mem_2f, W   ; 0787: 082F
        addlw           0xd8        ; 0788: 3ED8
        movlp           0x02        ; 0789: 3182
        callw                       ; 078A: 000A

        movlb           0x02        ; 078B: 0022
        movwf           mem_155     ; 078C: 00D5

loop_078d
; jump here from: 07C3
; jump here from: 07DB
; jump here from: 07DF
        movlb           0x00        ; 078D: 0020
        movf            mem_2e, W   ; 078E: 082E
        addlw           0xd8        ; 078F: 3ED8
        movlp           0x02        ; 0790: 3182
        callw                       ; 0791: 000A

        movlp           0x07        ; 0792: 3187
        movlb           0x02        ; 0793: 0022
        movwf           mem_156     ; 0794: 00D6
        movlp           0x07        ; 0795: 3187
        goto            label_07f5  ; 0796: 2FF5

loop_0797
; jump here from: 07ED
        movlb           0x00        ; 0797: 0020
        movf            mem_31, W   ; 0798: 0831
        addlw           0xd8        ; 0799: 3ED8
        movlp           0x02        ; 079A: 3182
        callw                       ; 079B: 000A

        movlp           0x07        ; 079C: 3187
        movlb           0x02        ; 079D: 0022
        movwf           mem_153     ; 079E: 00D3
        movlb           0x01        ; 079F: 0021
        decf            mem_bc, W   ; 07A0: 033C
        movlp           0x07        ; 07A1: 3187
        btfsc           STATUS, Z   ; 07A2: 1903
        goto            loop_077f   ; 07A3: 2F7F

        movlp           0x07        ; 07A4: 3187
        movf            mem_c4, W   ; 07A5: 0844
        btfss           STATUS, Z   ; 07A6: 1D03
        goto            loop_077f   ; 07A7: 2F7F

        movlp           0x07        ; 07A8: 3187
        movlb           0x02        ; 07A9: 0022
        clrf            mem_154     ; 07AA: 01D4
        movlp           0x07        ; 07AB: 3187
        goto            loop_0786   ; 07AC: 2F86

loop_07ad
; jump here from: 07E9
        movlb           0x00        ; 07AD: 0020
        movf            mem_31, W   ; 07AE: 0831
        addlw           0xd8        ; 07AF: 3ED8
        movlp           0x02        ; 07B0: 3182
        callw                       ; 07B1: 000A

        movlp           0x07        ; 07B2: 3187
        movlp           0x07        ; 07B3: 3187
        call            sub_07f8    ; 07B4: 27F8

        movlp           0x02        ; 07B5: 3182
        callw                       ; 07B6: 000A

        movlp           0x07        ; 07B7: 3187
        movlb           0x02        ; 07B8: 0022
        movwf           mem_154     ; 07B9: 00D4
        movlb           0x01        ; 07BA: 0021
        decf            mem_bc, W   ; 07BB: 033C
        btfsc           STATUS, Z   ; 07BC: 1903
        goto            loop_0786   ; 07BD: 2F86

        movf            mem_c4, W   ; 07BE: 0844
        btfss           STATUS, Z   ; 07BF: 1D03
        goto            loop_0786   ; 07C0: 2F86

        movlb           0x02        ; 07C1: 0022
        clrf            mem_155     ; 07C2: 01D5
        goto            loop_078d   ; 07C3: 2F8D

label_07c4
; jump here from: 07F4
        movlb           0x00        ; 07C4: 0020
        movf            mem_31, W   ; 07C5: 0831
        addlw           0xd8        ; 07C6: 3ED8
        movlp           0x02        ; 07C7: 3182
        callw                       ; 07C8: 000A

        movlp           0x07        ; 07C9: 3187
        call            sub_07f8    ; 07CA: 27F8

        movlp           0x02        ; 07CB: 3182
        callw                       ; 07CC: 000A

        movlb           0x02        ; 07CD: 0022
        movwf           mem_154     ; 07CE: 00D4
        movlb           0x00        ; 07CF: 0020
        movf            mem_2f, W   ; 07D0: 082F
        addlw           0xd8        ; 07D1: 3ED8
        movlp           0x02        ; 07D2: 3182
        callw                       ; 07D3: 000A

        movlp           0x07        ; 07D4: 3187
        movlb           0x02        ; 07D5: 0022
        movwf           mem_155     ; 07D6: 00D5
        movlb           0x01        ; 07D7: 0021
        decf            mem_bc, W   ; 07D8: 033C
        movlp           0x07        ; 07D9: 3187
        btfsc           STATUS, Z   ; 07DA: 1903
        goto            loop_078d   ; 07DB: 2F8D

        movlp           0x07        ; 07DC: 3187
        movf            mem_c4, W   ; 07DD: 0844
        btfss           STATUS, Z   ; 07DE: 1D03
        goto            loop_078d   ; 07DF: 2F8D

        movlp           0x07        ; 07E0: 3187
        movlb           0x02        ; 07E1: 0022
        clrf            mem_156     ; 07E2: 01D6
        movlp           0x07        ; 07E3: 3187
        goto            label_07f5  ; 07E4: 2FF5

label_07e5
; jump here from: 076D
        movlb           0x01        ; 07E5: 0021
        movf            mem_be, W   ; 07E6: 083E
        xorlw           0x01        ; 07E7: 3A01
        btfsc           STATUS, Z   ; 07E8: 1903
        goto            loop_07ad   ; 07E9: 2FAD

        movlp           0x07        ; 07EA: 3187
        xorlw           0x03        ; 07EB: 3A03
        btfsc           STATUS, Z   ; 07EC: 1903
        goto            loop_0797   ; 07ED: 2F97

        movlp           0x07        ; 07EE: 3187
        xorlw           0x01        ; 07EF: 3A01
        btfsc           STATUS, Z   ; 07F0: 1903
        goto            loop_076e   ; 07F1: 2F6E

        movlp           0x07        ; 07F2: 3187
        movlp           0x07        ; 07F3: 3187
        goto            label_07c4  ; 07F4: 2FC4

label_07f5
; jump here from: 0796
; jump here from: 07E4
        movlb           0x01        ; 07F5: 0021
        bsf             mem_bb, 1   ; 07F6: 14BB
        return                      ; 07F7: 0008

;------------------------------------------------------------
; Subroutine: sub_07f8
;
; called from: 07B4
; called from: 07CA
; called from: 1DFD

sub_07f8
        movlb           0x02        ; 07F8: 0022
        movwf           mem_153     ; 07F9: 00D3
        movlb           0x00        ; 07FA: 0020
        movf            mem_30, W   ; 07FB: 0830
        addlw           0xd8        ; 07FC: 3ED8
        return                      ; 07FD: 0008
        return                      ; 07FE: 0008
Bank0800_Vector org 0x0800

;------------------------------------------------------------
; Subroutine: sub_0801
;
; called from: 30CA
; called from: 30D2
; called from: 30DA
; called from: 30E2

sub_0801
        clrwdt                      ; 0801: 0064
        clrf            0           ; 0802: 0180
        addfsr          0, 1        ; 0803: 3101
        decfsz          WREG, f     ; 0804: 0B89
        goto            loop_0402   ; 0805: 2802

        retlw           0x00        ; 0806: 3400

label_0807
; jump here from: 30E5
        bsf             T1CON, T1OSCEN; 0807: 1598
        call            sub_0f1c    ; 0808: 271C

        bsf             T1CON, T1OSCEN; 0809: 1598
        movlp           0x32        ; 080A: 31B2
        call            sub_3225    ; 080B: 2225

        movlp           0x08        ; 080C: 3188
        call            sub_0f1c    ; 080D: 271C

        movlp           0x08        ; 080E: 3188
        call            sub_0f96    ; 080F: 2796

        movlw           0x00        ; 0810: 3000
        movlp           0x16        ; 0811: 3196
        call            sub_1682    ; 0812: 2682

        movlp           0x08        ; 0813: 3188
        call            sub_0e47    ; 0814: 2647

        movlp           0x08        ; 0815: 3188
        bsf             PORTA, RA2  ; 0816: 150C
        movlb           0x01        ; 0817: 0021
        clrf            mem_ee      ; 0818: 01EE

label_0819
; jump here from: 0821
        movlw           0x06        ; 0819: 3006
        subwf           mem_ee, W   ; 081A: 026E
        btfsc           STATUS, C   ; 081B: 1803
        goto            loop_0822   ; 081C: 2822

        call            sub_0fe7    ; 081D: 27E7

        movlp           0x08        ; 081E: 3188
        movlb           0x01        ; 081F: 0021
        incf            mem_ee, f   ; 0820: 0AEE
        goto            label_0819  ; 0821: 2819

loop_0822
; jump here from: 081C
        movlb           0x00        ; 0822: 0020
        bcf             PORTA, RA2  ; 0823: 110C
        bcf             PORTC, RC3  ; 0824: 118E
        bsf             PORTA, RA1  ; 0825: 148C
        movlb           0x01        ; 0826: 0021
        clrf            mem_ee      ; 0827: 01EE

label_0828
; jump here from: 0830
        movlw           0x08        ; 0828: 3008
        subwf           mem_ee, W   ; 0829: 026E
        btfsc           STATUS, C   ; 082A: 1803
        goto            loop_0831   ; 082B: 2831

        call            sub_0fe7    ; 082C: 27E7

        movlp           0x08        ; 082D: 3188
        movlb           0x01        ; 082E: 0021
        incf            mem_ee, f   ; 082F: 0AEE
        goto            label_0828  ; 0830: 2828

loop_0831
; jump here from: 082B
        movlb           0x00        ; 0831: 0020
        movlw           0xff        ; 0832: 30FF
        bcf             PORTA, RA1  ; 0833: 108C
        bsf             PORTA, RA3  ; 0834: 158C
        movlp           0x16        ; 0835: 3196
        call            sub_1682    ; 0836: 2682

        movlp           0x08        ; 0837: 3188
        call            sub_0e47    ; 0838: 2647

        movlp           0x08        ; 0839: 3188
        movlb           0x01        ; 083A: 0021
        clrf            mem_ee      ; 083B: 01EE

label_083c
; jump here from: 0844
        movlw           0x0a        ; 083C: 300A
        subwf           mem_ee, W   ; 083D: 026E
        btfsc           STATUS, C   ; 083E: 1803
        goto            loop_0845   ; 083F: 2845

        call            sub_0fe7    ; 0840: 27E7

        movlp           0x08        ; 0841: 3188
        movlb           0x01        ; 0842: 0021
        incf            mem_ee, f   ; 0843: 0AEE
        goto            label_083c  ; 0844: 283C

loop_0845
; jump here from: 083F
        movlb           0x00        ; 0845: 0020
        bcf             PORTA, RA3  ; 0846: 118C
        movlp           0x21        ; 0847: 31A1
        call            sub_2161    ; 0848: 2161

        movlp           0x08        ; 0849: 3188
        movlp           0x30        ; 084A: 31B0
        call            sub_3013    ; 084B: 2013

        movlp           0x08        ; 084C: 3188
        movlp           0x3f        ; 084D: 31BF
        call            sub_3f59    ; 084E: 2759

        movlp           0x08        ; 084F: 3188
        movlp           0x3f        ; 0850: 31BF
        call            sub_3f6e    ; 0851: 276E

        movlp           0x08        ; 0852: 3188
        movlp           0x18        ; 0853: 3198
        call            sub_1801    ; 0854: 2001

        movlp           0x08        ; 0855: 3188
        movlp           0x31        ; 0856: 31B1
        call            sub_310b    ; 0857: 210B

        movlp           0x08        ; 0858: 3188
        movlp           0x3f        ; 0859: 31BF
        call            sub_3fb3    ; 085A: 27B3

        movlp           0x08        ; 085B: 3188
        movlp           0x21        ; 085C: 31A1
        call            sub_2140    ; 085D: 2140

        movlp           0x08        ; 085E: 3188
        movlp           0x21        ; 085F: 31A1
        call            sub_211f    ; 0860: 211F

        movlp           0x08        ; 0861: 3188
        movlp           0x20        ; 0862: 31A0
        call            sub_20f7    ; 0863: 20F7

        movlp           0x08        ; 0864: 3188
        call            sub_0d66    ; 0865: 2566

        movlp           0x21        ; 0866: 31A1
        call            sub_2105    ; 0867: 2105

        movlp           0x08        ; 0868: 3188
        movlp           0x3f        ; 0869: 31BF
        call            sub_3f47    ; 086A: 2747

        movlp           0x08        ; 086B: 3188
        movlp           0x3f        ; 086C: 31BF
        call            sub_3f50    ; 086D: 2750

        movlp           0x08        ; 086E: 3188
        movlp           0x24        ; 086F: 31A4
        call            sub_242e    ; 0870: 242E

        movlp           0x08        ; 0871: 3188
        movlp           0x31        ; 0872: 31B1
        call            sub_3133    ; 0873: 2133

        movlp           0x08        ; 0874: 3188
        movlp           0x30        ; 0875: 31B0
        call            sub_3084    ; 0876: 2084

        movlp           0x08        ; 0877: 3188
        movlp           0x28        ; 0878: 31A8
        call            sub_2800    ; 0879: 2000

        movlp           0x08        ; 087A: 3188
        movlp           0x30        ; 087B: 31B0
        call            sub_30a4    ; 087C: 20A4

        movlp           0x08        ; 087D: 3188
        movlp           0x32        ; 087E: 31B2
        call            sub_32ec    ; 087F: 22EC

        movlp           0x08        ; 0880: 3188
        movlp           0x27        ; 0881: 31A7
        call            sub_2717    ; 0882: 2717

        movlp           0x08        ; 0883: 3188
        movlp           0x27        ; 0884: 31A7
        call            sub_27ad    ; 0885: 27AD

        movlp           0x08        ; 0886: 3188
        movlp           0x27        ; 0887: 31A7
        call            sub_27b6    ; 0888: 27B6

        movlp           0x08        ; 0889: 3188
        movlp           0x27        ; 088A: 31A7
        call            sub_27bf    ; 088B: 27BF

        movlp           0x08        ; 088C: 3188
        movlp           0x27        ; 088D: 31A7
        call            sub_27da    ; 088E: 27DA

        movlp           0x08        ; 088F: 3188
        movlp           0x30        ; 0890: 31B0
        call            sub_302e    ; 0891: 202E

        movlp           0x08        ; 0892: 3188
        movlb           0x03        ; 0893: 0023
        clrf            mem_1cd     ; 0894: 01CD
        incf            mem_1cd, f  ; 0895: 0ACD
        movlb           0x02        ; 0896: 0022
        movlw           0x00        ; 0897: 3000
        clrf            mem_12b     ; 0898: 01AB
        movlp           0x16        ; 0899: 3196
        call            sub_1682    ; 089A: 2682

        movlp           0x08        ; 089B: 3188
        movlb           0x00        ; 089C: 0020
        movf            PORTD, W    ; 089D: 080F
        movlb           0x01        ; 089E: 0021
        movwf           mem_ee      ; 089F: 00EE
        bcf             mem_ee, 7   ; 08A0: 13EE
        movf            mem_ee, W   ; 08A1: 086E
        xorlw           0x3f        ; 08A2: 3A3F
        btfss           STATUS, Z   ; 08A3: 1D03
        goto            loop_08db   ; 08A4: 28DB

        swapf           mem_e1, W   ; 08A5: 0E61
        andlw           0x0f        ; 08A6: 390F
        addlw           0xd8        ; 08A7: 3ED8
        movlp           0x02        ; 08A8: 3182
        callw                       ; 08A9: 000A

        movlb           0x02        ; 08AA: 0022
        movwf           mem_14f     ; 08AB: 00CF
        movlb           0x01        ; 08AC: 0021
        movf            mem_e1, W   ; 08AD: 0861
        andlw           0x0f        ; 08AE: 390F
        addlw           0xd8        ; 08AF: 3ED8
        movlp           0x02        ; 08B0: 3182
        callw                       ; 08B1: 000A

        movlb           0x02        ; 08B2: 0022
        movwf           mem_150     ; 08B3: 00D0
        movlb           0x01        ; 08B4: 0021
        swapf           mem_e2, W   ; 08B5: 0E62
        andlw           0x0f        ; 08B6: 390F
        addlw           0xd8        ; 08B7: 3ED8
        movlp           0x02        ; 08B8: 3182
        callw                       ; 08B9: 000A

        movlb           0x02        ; 08BA: 0022
        movwf           mem_151     ; 08BB: 00D1
        movlb           0x01        ; 08BC: 0021
        movf            mem_e2, W   ; 08BD: 0862
        andlw           0x0f        ; 08BE: 390F
        addlw           0xd8        ; 08BF: 3ED8
        movlp           0x02        ; 08C0: 3182
        callw                       ; 08C1: 000A

        movlb           0x02        ; 08C2: 0022
        movwf           mem_152     ; 08C3: 00D2
        movlw           0xec        ; 08C4: 30EC
        movlp           0x02        ; 08C5: 3182
        callw                       ; 08C6: 000A

        movwf           mem_154     ; 08C7: 00D4
        movlw           0xde        ; 08C8: 30DE
        movlp           0x02        ; 08C9: 3182
        callw                       ; 08CA: 000A

        movwf           mem_155     ; 08CB: 00D5
        movlw           0xda        ; 08CC: 30DA
        movlp           0x02        ; 08CD: 3182
        callw                       ; 08CE: 000A

        movlp           0x08        ; 08CF: 3188
        movwf           mem_156     ; 08D0: 00D6
        movlp           0x0e        ; 08D1: 318E
        call            sub_0e47    ; 08D2: 2647

        movlp           0x08        ; 08D3: 3188

label_08d4
; jump here from: 08DA
        call            sub_0f86    ; 08D4: 2786

        movlp           0x08        ; 08D5: 3188
        xorlw           0x3f        ; 08D6: 3A3F
        btfss           STATUS, Z   ; 08D7: 1D03
        goto            loop_092c   ; 08D8: 292C

        clrwdt                      ; 08D9: 0064
        goto            label_08d4  ; 08DA: 28D4

loop_08db
; jump here from: 08A4
        movf            mem_ee, W   ; 08DB: 086E
        xorlw           0x77        ; 08DC: 3A77
        btfss           STATUS, Z   ; 08DD: 1D03
        goto            loop_092c   ; 08DE: 292C

        movlw           0x10        ; 08DF: 3010
        movlb           0x00        ; 08E0: 0020
        movwf           mem_55      ; 08E1: 00D5
        movlw           0x13        ; 08E2: 3013
        movwf           mem_56      ; 08E3: 00D6
        movlw           0x88        ; 08E4: 3088
        call            I2CWrite    ; 08E5: 24B3

        movlp           0x08        ; 08E6: 3188
        movlw           0x11        ; 08E7: 3011
        call            sub_0f81    ; 08E8: 2781

        movlp           0x08        ; 08E9: 3188
        call            I2CWrite    ; 08EA: 24B3

        movlp           0x08        ; 08EB: 3188
        movlw           0x12        ; 08EC: 3012
        call            sub_0f81    ; 08ED: 2781

        movlp           0x08        ; 08EE: 3188
        call            I2CWrite    ; 08EF: 24B3

        movlp           0x08        ; 08F0: 3188
        movlw           0x13        ; 08F1: 3013
        movwf           mem_55      ; 08F2: 00D5
        movlw           0x88        ; 08F3: 3088
        clrf            mem_56      ; 08F4: 01D6
        call            I2CWrite    ; 08F5: 24B3

        movlp           0x08        ; 08F6: 3188
        movlw           0x14        ; 08F7: 3014
        movwf           mem_55      ; 08F8: 00D5
        movlw           0x88        ; 08F9: 3088
        clrf            mem_56      ; 08FA: 01D6
        call            I2CWrite    ; 08FB: 24B3

        movlw           0xda        ; 08FC: 30DA
        movlp           0x02        ; 08FD: 3182
        callw                       ; 08FE: 000A

        movlb           0x02        ; 08FF: 0022
        movwf           mem_14f     ; 0900: 00CF
        movlw           0xd8        ; 0901: 30D8
        movlp           0x02        ; 0902: 3182
        callw                       ; 0903: 000A

        movwf           mem_150     ; 0904: 00D0
        movlw           0xd9        ; 0905: 30D9
        movlp           0x02        ; 0906: 3182
        callw                       ; 0907: 000A

        movwf           mem_151     ; 0908: 00D1
        movlw           0xdb        ; 0909: 30DB
        movlp           0x02        ; 090A: 3182
        callw                       ; 090B: 000A

        movwf           mem_152     ; 090C: 00D2
        movlw           0xd8        ; 090D: 30D8
        movlp           0x02        ; 090E: 3182
        callw                       ; 090F: 000A

        movwf           mem_153     ; 0910: 00D3
        movlw           0xd9        ; 0911: 30D9
        movlp           0x02        ; 0912: 3182
        callw                       ; 0913: 000A

        movwf           mem_154     ; 0914: 00D4
        movlw           0xd8        ; 0915: 30D8
        movlp           0x02        ; 0916: 3182
        callw                       ; 0917: 000A

        movwf           mem_155     ; 0918: 00D5
        movlw           0xd9        ; 0919: 30D9
        movlp           0x02        ; 091A: 3182
        callw                       ; 091B: 000A

        movwf           mem_156     ; 091C: 00D6
        movlw           0xde        ; 091D: 30DE
        movlp           0x02        ; 091E: 3182
        callw                       ; 091F: 000A

        movlp           0x09        ; 0920: 3189
        movwf           mem_157     ; 0921: 00D7
        movlp           0x0e        ; 0922: 318E
        call            sub_0e47    ; 0923: 2647

        movlp           0x08        ; 0924: 3188

label_0925
; jump here from: 092B
        call            sub_0f86    ; 0925: 2786

        movlp           0x08        ; 0926: 3188
        xorlw           0x77        ; 0927: 3A77
        btfss           STATUS, Z   ; 0928: 1D03
        goto            loop_092c   ; 0929: 292C

        clrwdt                      ; 092A: 0064
        goto            label_0925  ; 092B: 2925

loop_092c
; jump here from: 08D8
; jump here from: 08DE
; jump here from: 0929
        movlp           0x34        ; 092C: 31B4
        call            sub_3423    ; 092D: 2423

        movlp           0x08        ; 092E: 3188
        movlp           0x3f        ; 092F: 31BF
        call            sub_3f83    ; 0930: 2783

        movlp           0x08        ; 0931: 3188
        movlp           0x30        ; 0932: 31B0
        call            set_baud_rate    ; 0933: 2064

        movlp           0x08        ; 0934: 3188

label_0935
; jump here from: 093C
        movlb           0x01        ; 0935: 0021
        btfsc           OSCSTAT, T1OSCR; 0936: 1B9A
        goto            loop_093d   ; 0937: 293D

        movlb           0x00        ; 0938: 0020
        bsf             PORTC, RC3  ; 0939: 158E
        call            sub_0f1c    ; 093A: 271C

        movlp           0x08        ; 093B: 3188
        goto            label_0935  ; 093C: 2935

loop_093d
; jump here from: 0937
        call            sub_0f31    ; 093D: 2731

        movlp           0x08        ; 093E: 3188

label_093f
; jump here from: 0946
        movlb           0x01        ; 093F: 0021
        btfsc           OSCSTAT, T1OSCR; 0940: 1B9A
        goto            loop_0947   ; 0941: 2947

        movlb           0x00        ; 0942: 0020
        bsf             PORTC, RC3  ; 0943: 158E
        call            sub_0f1c    ; 0944: 271C

        movlp           0x08        ; 0945: 3188
        goto            label_093f  ; 0946: 293F

loop_0947
; jump here from: 0941
        call            sub_0f31    ; 0947: 2731

        movlw           0x3c        ; 0948: 303C
        bcf             TRISC, TRISC3; 0949: 118E
        movlp           0x06        ; 094A: 3186
        call            sub_0644    ; 094B: 2644

        movlp           0x08        ; 094C: 3188
        movlw           0x00        ; 094D: 3000
        movlp           0x16        ; 094E: 3196
        call            sub_1682    ; 094F: 2682

        movlp           0x08        ; 0950: 3188
        call            sub_0e47    ; 0951: 2647

        movlp           0x08        ; 0952: 3188
        movlb           0x01        ; 0953: 0021
        clrf            mem_ee      ; 0954: 01EE

loop_0955
; jump here from: 0BF0
; jump here from: 0BF4
; jump here from: 0BF8
; jump here from: 0BFC
; jump here from: 0C00
        clrwdt                      ; 0955: 0064
        movlb           0x00        ; 0956: 0020
        btfss           PORTC, RC2  ; 0957: 1D0E
        goto            loop_0988   ; 0958: 2988

        movlb           0x02        ; 0959: 0022
        decfsz          mem_135, W  ; 095A: 0B35
        goto            loop_0969   ; 095B: 2969

        clrf            mem_135     ; 095C: 01B5
        clrf            mem_146     ; 095D: 01C6
        incf            mem_146, f  ; 095E: 0AC6
        movlb           0x00        ; 095F: 0020
        movlw           0x3c        ; 0960: 303C
        clrf            mem_3b      ; 0961: 01BB
        movlp           0x06        ; 0962: 3186
        call            sub_0644    ; 0963: 2644

        movlp           0x08        ; 0964: 3188
        movlb           0x03        ; 0965: 0023
        clrf            mem_1ce     ; 0966: 01CE
        call            disable_serial    ; 0967: 27F4

        movlp           0x08        ; 0968: 3188

loop_0969
; jump here from: 095B
        movlb           0x00        ; 0969: 0020
        movf            mem_3b, W   ; 096A: 083B
        xorlw           0x22        ; 096B: 3A22
        btfsc           STATUS, Z   ; 096C: 1903
        goto            loop_0998   ; 096D: 2998

        movlb           0x02        ; 096E: 0022
        movf            mem_146, f  ; 096F: 08C6
        btfss           STATUS, Z   ; 0970: 1D03
        goto            loop_0998   ; 0971: 2998

        movlw           0x22        ; 0972: 3022
        clrf            mem_146     ; 0973: 01C6
        incf            mem_146, f  ; 0974: 0AC6
        movlb           0x00        ; 0975: 0020
        movwf           mem_3b      ; 0976: 00BB
        movlb           0x02        ; 0977: 0022
        clrf            mem_16c     ; 0978: 01EC
        movlb           0x01        ; 0979: 0021
        clrf            mem_c8      ; 097A: 01C8
        movlb           0x02        ; 097B: 0022
        clrf            mem_13f     ; 097C: 01BF
        movlb           0x01        ; 097D: 0021
        clrf            mem_c7      ; 097E: 01C7
        call            radio_disable2    ; 097F: 272B

        movlw           0x00        ; 0980: 3000
        movlp           0x16        ; 0981: 3196
        call            sub_1682    ; 0982: 2682

        movlp           0x08        ; 0983: 3188
        clrf            mem_c5      ; 0984: 01C5
        call            init_serial    ; 0985: 27FA

        movlp           0x08        ; 0986: 3188
        goto            loop_0998   ; 0987: 2998

loop_0988
; jump here from: 0958
        call            disable_serial    ; 0988: 27F4

        movlp           0x08        ; 0989: 3188
        movlb           0x02        ; 098A: 0022
        clrf            mem_146     ; 098B: 01C6
        movlb           0x00        ; 098C: 0020
        movf            mem_3b, W   ; 098D: 083B
        xorlw           0x22        ; 098E: 3A22
        btfss           STATUS, Z   ; 098F: 1D03
        goto            loop_0998   ; 0990: 2998

        movlw           0x3c        ; 0991: 303C
        clrf            mem_3b      ; 0992: 01BB
        movlp           0x06        ; 0993: 3186
        call            sub_0644    ; 0994: 2644

        movlp           0x08        ; 0995: 3188
        movlb           0x03        ; 0996: 0023
        clrf            mem_1ce     ; 0997: 01CE

loop_0998
; jump here from: 096D
; jump here from: 0971
; jump here from: 0987
; jump here from: 0990
        movlb           0x00        ; 0998: 0020
        movf            mem_3b, W   ; 0999: 083B
        xorlw           0x22        ; 099A: 3A22
        btfss           STATUS, Z   ; 099B: 1D03
        goto            loop_09a0   ; 099C: 29A0

        movlb           0x02        ; 099D: 0022
        bsf             mem_14d, 3  ; 099E: 15CD
        goto            label_09a2  ; 099F: 29A2

loop_09a0
; jump here from: 099C
        movlb           0x02        ; 09A0: 0022
        bcf             mem_14d, 3  ; 09A1: 11CD

label_09a2
; jump here from: 099F
        movlb           0x03        ; 09A2: 0023
        movf            mem_1c7, W  ; 09A3: 0847
        btfsc           STATUS, Z   ; 09A4: 1903
        goto            loop_09bf   ; 09A5: 29BF

        clrf            mem_1c7     ; 09A6: 01C7
        movlb           0x02        ; 09A7: 0022
        movlw           0x03        ; 09A8: 3003
        incf            mem_16d, f  ; 09A9: 0AED
        subwf           mem_16d, W  ; 09AA: 026D
        btfss           STATUS, C   ; 09AB: 1C03
        goto            loop_09af   ; 09AC: 29AF

        clrf            mem_16d     ; 09AD: 01ED
        clrf            serial_count     ; 09AE: 01EE

loop_09af
; jump here from: 09AC
        movlb           0x01        ; 09AF: 0021
        decfsz          mem_c3, W   ; 09B0: 0B43
        goto            loop_09b7   ; 09B1: 29B7

        movlw           0x0a        ; 09B2: 300A
        subwf           mem_c6, W   ; 09B3: 0246
        btfsc           STATUS, C   ; 09B4: 1803
        goto            loop_09b7   ; 09B5: 29B7

        incf            mem_c6, f   ; 09B6: 0AC6

loop_09b7
; jump here from: 09B1
; jump here from: 09B5
        movlb           0x02        ; 09B7: 0022
        movf            mem_12a, W  ; 09B8: 082A
        btfsc           STATUS, Z   ; 09B9: 1903
        goto            loop_09bf   ; 09BA: 29BF

        decfsz          mem_12a, f  ; 09BB: 0BAA
        goto            loop_09bf   ; 09BC: 29BF

        movlb           0x00        ; 09BD: 0020
        bcf             PORTA, RA3  ; 09BE: 118C

loop_09bf
; jump here from: 09A5
; jump here from: 09BA
; jump here from: 09BC
        movlb           0x03        ; 09BF: 0023
        movf            mem_1c8, W  ; 09C0: 0848
        btfsc           STATUS, Z   ; 09C1: 1903
        goto            loop_0a19   ; 09C2: 2A19

        clrf            mem_1c8     ; 09C3: 01C8
        movlb           0x00        ; 09C4: 0020
        btfsc           PORTA, RA3  ; 09C5: 198C
        goto            loop_09e6   ; 09C6: 29E6

        movlb           0x01        ; 09C7: 0021
        movf            mem_c7, f   ; 09C8: 08C7
        btfss           STATUS, Z   ; 09C9: 1D03
        goto            loop_09e6   ; 09CA: 29E6

        movlp           0x33        ; 09CB: 31B3
        call            sub_3335    ; 09CC: 2335

        movlp           0x08        ; 09CD: 3188
        movlb           0x02        ; 09CE: 0022
        movlw           0x07        ; 09CF: 3007
        incf            mem_12b, f  ; 09D0: 0AAB
        subwf           mem_12b, W  ; 09D1: 022B
        btfss           STATUS, C   ; 09D2: 1C03
        goto            loop_09e6   ; 09D3: 29E6

        movlp           0x31        ; 09D4: 31B1
        call            sub_315d    ; 09D5: 215D

        movlp           0x08        ; 09D6: 3188
        movlb           0x03        ; 09D7: 0023
        movf            mem_1b6, W  ; 09D8: 0836
        movlb           0x02        ; 09D9: 0022
        movwf           mem_126     ; 09DA: 00A6
        movlw           0x5a        ; 09DB: 305A
        clrf            mem_12b     ; 09DC: 01AB
        subwf           mem_126, W  ; 09DD: 0226
        btfss           STATUS, C   ; 09DE: 1C03
        goto            loop_09e4   ; 09DF: 29E4

        movlb           0x03        ; 09E0: 0023
        clrf            mem_1cd     ; 09E1: 01CD
        incf            mem_1cd, f  ; 09E2: 0ACD
        goto            loop_09e6   ; 09E3: 29E6

loop_09e4
; jump here from: 09DF
        movlb           0x03        ; 09E4: 0023
        clrf            mem_1cd     ; 09E5: 01CD

loop_09e6
; jump here from: 09C6
; jump here from: 09CA
; jump here from: 09D3
; jump here from: 09E3
        movlb           0x02        ; 09E6: 0022
        movf            mem_12c, W  ; 09E7: 082C
        btfss           STATUS, Z   ; 09E8: 1D03
        decf            mem_12c, f  ; 09E9: 03AC
        movlb           0x01        ; 09EA: 0021
        movf            mem_c8, W   ; 09EB: 0848
        btfsc           STATUS, Z   ; 09EC: 1903
        goto            loop_09fa   ; 09ED: 29FA

        movlb           0x02        ; 09EE: 0022
        movf            mem_144, W  ; 09EF: 0844
        btfsc           STATUS, Z   ; 09F0: 1903
        goto            loop_09fa   ; 09F1: 29FA

        decfsz          mem_144, f  ; 09F2: 0BC4
        goto            loop_09fa   ; 09F3: 29FA

        movlw           0x3c        ; 09F4: 303C
        movlp           0x06        ; 09F5: 3186
        call            sub_0644    ; 09F6: 2644

        movlp           0x08        ; 09F7: 3188
        movlb           0x03        ; 09F8: 0023
        clrf            mem_1ce     ; 09F9: 01CE

loop_09fa
; jump here from: 09ED
; jump here from: 09F1
; jump here from: 09F3
        movlb           0x01        ; 09FA: 0021
        decfsz          mem_c7, W   ; 09FB: 0B47
        goto            loop_0a0d   ; 09FC: 2A0D

        movlb           0x02        ; 09FD: 0022
        movlw           0x05        ; 09FE: 3005
        incf            mem_127, f  ; 09FF: 0AA7
        subwf           mem_127, W  ; 0A00: 0227
        btfsc           STATUS, C   ; 0A01: 1803
        clrf            mem_127     ; 0A02: 01A7
        movf            mem_13f, f  ; 0A03: 08BF
        btfss           STATUS, Z   ; 0A04: 1D03
        goto            loop_0a0c   ; 0A05: 2A0C

        call            radio_disable2    ; 0A06: 272B

        movlp           0x08        ; 0A07: 3188
        movlb           0x01        ; 0A08: 0021
        clrf            mem_c7      ; 0A09: 01C7
        clrf            mem_b9      ; 0A0A: 01B9
        goto            loop_0a0d   ; 0A0B: 2A0D

loop_0a0c
; jump here from: 0A05
        decf            mem_13f, f  ; 0A0C: 03BF

loop_0a0d
; jump here from: 09FC
; jump here from: 0A0B
        movlb           0x02        ; 0A0D: 0022
        decfsz          mem_147, W  ; 0A0E: 0B47
        goto            loop_0a19   ; 0A0F: 2A19

        movlb           0x00        ; 0A10: 0020
        btfss           PORTC, RC3  ; 0A11: 1D8E
        goto            loop_0a15   ; 0A12: 2A15

        bcf             PORTC, RC3  ; 0A13: 118E
        goto            loop_0a19   ; 0A14: 2A19

loop_0a15
; jump here from: 0A12
        movf            mem_3b, W   ; 0A15: 083B
        xorlw           0x22        ; 0A16: 3A22
        btfss           STATUS, Z   ; 0A17: 1D03
        bsf             PORTC, RC3  ; 0A18: 158E

loop_0a19
; jump here from: 09C2
; jump here from: 0A0F
; jump here from: 0A14
        movlp           0x29        ; 0A19: 31A9
        call            sub_29b9    ; 0A1A: 21B9

        movlp           0x08        ; 0A1B: 3188
        movlb           0x00        ; 0A1C: 0020
        movf            mem_3b, W   ; 0A1D: 083B
        xorlw           0x22        ; 0A1E: 3A22
        btfsc           STATUS, Z   ; 0A1F: 1903
        goto            loop_0a25   ; 0A20: 2A25

        movlp           0x06        ; 0A21: 3186
        call            sub_0665    ; 0A22: 2665

        movlp           0x08        ; 0A23: 3188
        goto            label_0a26  ; 0A24: 2A26

loop_0a25
; jump here from: 0A20
        clrf            mem_3a      ; 0A25: 01BA

label_0a26
; jump here from: 0A24
        movlb           0x01        ; 0A26: 0021
        decfsz          mem_c4, W   ; 0A27: 0B44
        goto            loop_0a42   ; 0A28: 2A42

        movlb           0x03        ; 0A29: 0023
        movlw           0x0d        ; 0A2A: 300D
        incf            mem_1ca, f  ; 0A2B: 0ACA
        subwf           mem_1ca, W  ; 0A2C: 024A
        btfss           STATUS, C   ; 0A2D: 1C03
        goto            loop_0a42   ; 0A2E: 2A42

        clrf            mem_1ca     ; 0A2F: 01CA
        movlb           0x00        ; 0A30: 0020
        movf            mem_3b, W   ; 0A31: 083B
        xorlw           0x03        ; 0A32: 3A03
        btfsc           STATUS, Z   ; 0A33: 1903
        goto            loop_0a3d   ; 0A34: 2A3D

        movf            mem_3b, W   ; 0A35: 083B
        xorlw           0x04        ; 0A36: 3A04
        btfsc           STATUS, Z   ; 0A37: 1903
        goto            loop_0a3d   ; 0A38: 2A3D

        movlb           0x01        ; 0A39: 0021
        movf            mem_c5, W   ; 0A3A: 0845
        movlb           0x00        ; 0A3B: 0020
        movwf           mem_3a      ; 0A3C: 00BA

loop_0a3d
; jump here from: 0A34
; jump here from: 0A38
        movlw           0x0f        ; 0A3D: 300F
        movlb           0x02        ; 0A3E: 0022
        movwf           mem_128     ; 0A3F: 00A8
        movlw           0x14        ; 0A40: 3014
        movwf           mem_12a     ; 0A41: 00AA

loop_0a42
; jump here from: 0A28
; jump here from: 0A2E
        movlp           0x2f        ; 0A42: 31AF
        call            sub_2f23    ; 0A43: 2723

        movlp           0x08        ; 0A44: 3188
        movlb           0x03        ; 0A45: 0023
        movf            mem_1c5, f  ; 0A46: 08C5
        btfss           STATUS, Z   ; 0A47: 1D03
        goto            loop_0a4b   ; 0A48: 2A4B

        call            sub_0e47    ; 0A49: 2647

        movlp           0x08        ; 0A4A: 3188

loop_0a4b
; jump here from: 0A48
        movlb           0x03        ; 0A4B: 0023
        clrf            mem_1c5     ; 0A4C: 01C5
        movlb           0x00        ; 0A4D: 0020
        bcf             PORTA, RA1  ; 0A4E: 108C
        bcf             PORTA, RA2  ; 0A4F: 110C
        movlb           0x03        ; 0A50: 0023
        decfsz          mem_1d0, W  ; 0A51: 0B50
        goto            loop_0a6a   ; 0A52: 2A6A

        movlb           0x02        ; 0A53: 0022
        movf            mem_136, W  ; 0A54: 0836
        btfsc           STATUS, Z   ; 0A55: 1903
        goto            loop_0a5a   ; 0A56: 2A5A

        movlb           0x00        ; 0A57: 0020
        bsf             PORTA, RA1  ; 0A58: 148C
        goto            label_0a5c  ; 0A59: 2A5C

loop_0a5a
; jump here from: 0A56
        movlb           0x00        ; 0A5A: 0020
        bsf             PORTA, RA2  ; 0A5B: 150C

label_0a5c
; jump here from: 0A59
        movlp           0x33        ; 0A5C: 31B3
        call            sub_337f    ; 0A5D: 237F

        movlp           0x08        ; 0A5E: 3188
        movlp           0x28        ; 0A5F: 31A8
        call            sub_281f    ; 0A60: 201F

        movlp           0x08        ; 0A61: 3188
        movlp           0x2d        ; 0A62: 31AD
        call            sub_2d36    ; 0A63: 2536

        movlp           0x08        ; 0A64: 3188
        movlp           0x03        ; 0A65: 3183
        call            sub_0394    ; 0A66: 2394

        movlp           0x08        ; 0A67: 3188
        movlb           0x03        ; 0A68: 0023
        clrf            mem_1d0     ; 0A69: 01D0

loop_0a6a
; jump here from: 0A52
        movlw           0x06        ; 0A6A: 3006
        movlb           0x02        ; 0A6B: 0022
        subwf           mem_165, W  ; 0A6C: 0265
        btfss           STATUS, C   ; 0A6D: 1C03
        goto            loop_0a88   ; 0A6E: 2A88

        movlw           0xfa        ; 0A6F: 30FA
        addwf           mem_165, f  ; 0A70: 07E5
        movlb           0x01        ; 0A71: 0021
        decfsz          mem_c8, W   ; 0A72: 0B48
        goto            loop_0a88   ; 0A73: 2A88

        movlp           0x30        ; 0A74: 31B0
        call            sub_3000    ; 0A75: 2000

        movlp           0x08        ; 0A76: 3188
        movlp           0x3f        ; 0A77: 31BF
        call            sub_3fcb    ; 0A78: 27CB

        movlp           0x08        ; 0A79: 3188
        movlw           0x14        ; 0A7A: 3014
        incf            mem_bb, f   ; 0A7B: 0ABB
        subwf           mem_bb, W   ; 0A7C: 023B
        btfss           STATUS, C   ; 0A7D: 1C03
        goto            loop_0a88   ; 0A7E: 2A88

        movlp           0x34        ; 0A7F: 31B4
        call            sub_347b    ; 0A80: 247B

        movlp           0x08        ; 0A81: 3188
        movlp           0x18        ; 0A82: 3198
        call            sub_1816    ; 0A83: 2016

        movlp           0x08        ; 0A84: 3188
        movlp           0x24        ; 0A85: 31A4
        call            sub_242e    ; 0A86: 242E

        movlp           0x08        ; 0A87: 3188

loop_0a88
; jump here from: 0A6E
; jump here from: 0A73
; jump here from: 0A7E
        movlw           0x12        ; 0A88: 3012
        movlb           0x00        ; 0A89: 0020
        subwf           mem_36, W   ; 0A8A: 0236
        btfsc           STATUS, C   ; 0A8B: 1803
        goto            loop_0a91   ; 0A8C: 2A91

        movlw           0x06        ; 0A8D: 3006
        subwf           mem_36, W   ; 0A8E: 0236
        btfsc           STATUS, C   ; 0A8F: 1803
        goto            loop_0a95   ; 0A90: 2A95

loop_0a91
; jump here from: 0A8C
        movlb           0x03        ; 0A91: 0023
        clrf            mem_1c4     ; 0A92: 01C4
        incf            mem_1c4, f  ; 0A93: 0AC4
        goto            label_0a97  ; 0A94: 2A97

loop_0a95
; jump here from: 0A90
        movlb           0x03        ; 0A95: 0023
        clrf            mem_1c4     ; 0A96: 01C4

label_0a97
; jump here from: 0A94
        movlw           0x3d        ; 0A97: 303D
        subwf           mem_1cc, W  ; 0A98: 024C
        btfss           STATUS, C   ; 0A99: 1C03
        goto            loop_0b59   ; 0A9A: 2B59

        movlb           0x00        ; 0A9B: 0020
        movf            mem_3b, W   ; 0A9C: 083B
        xorlw           0x22        ; 0A9D: 3A22
        btfss           STATUS, Z   ; 0A9E: 1D03
        goto            loop_0aa8   ; 0A9F: 2AA8

        movlb           0x02        ; 0AA0: 0022
        movlw           0x05        ; 0AA1: 3005
        incf            mem_16c, f  ; 0AA2: 0AEC
        subwf           mem_16c, W  ; 0AA3: 026C
        btfss           STATUS, C   ; 0AA4: 1C03
        goto            loop_0aa8   ; 0AA5: 2AA8

        clrf            mem_135     ; 0AA6: 01B5
        incf            mem_135, f  ; 0AA7: 0AB5

loop_0aa8
; jump here from: 0A9F
; jump here from: 0AA5
        movlw           0xc4        ; 0AA8: 30C4
        movlb           0x03        ; 0AA9: 0023
        addwf           mem_1cc, f  ; 0AAA: 07CC
        movlb           0x00        ; 0AAB: 0020
        incf            mem_37, f   ; 0AAC: 0AB7
        movf            mem_37, W   ; 0AAD: 0837
        xorlw           0x3c        ; 0AAE: 3A3C
        btfss           STATUS, Z   ; 0AAF: 1D03
        goto            loop_0b34   ; 0AB0: 2B34

        clrf            mem_37      ; 0AB1: 01B7
        incf            mem_36, f   ; 0AB2: 0AB6
        movlp           0x24        ; 0AB3: 31A4
        call            sub_2434    ; 0AB4: 2434

        movlp           0x08        ; 0AB5: 3188
        movlb           0x00        ; 0AB6: 0020
        movf            mem_36, W   ; 0AB7: 0836
        xorlw           0x18        ; 0AB8: 3A18
        btfss           STATUS, Z   ; 0AB9: 1D03
        goto            loop_0b29   ; 0ABA: 2B29

        movlb           0x01        ; 0ABB: 0021
        movlw           0xf2        ; 0ABC: 30F2
        decf            mem_c0, f   ; 0ABD: 03C0
        subwf           mem_c0, W   ; 0ABE: 0240
        btfss           STATUS, C   ; 0ABF: 1C03
        goto            loop_0ac3   ; 0AC0: 2AC3

        movlw           0xf1        ; 0AC1: 30F1
        movwf           mem_c0      ; 0AC2: 00C0

loop_0ac3
; jump here from: 0AC0
        movlw           0x08        ; 0AC3: 3008
        movlb           0x00        ; 0AC4: 0020
        movwf           mem_55      ; 0AC5: 00D5
        movlb           0x01        ; 0AC6: 0021
        movf            mem_c0, W   ; 0AC7: 0840
        movlb           0x00        ; 0AC8: 0020
        movwf           mem_56      ; 0AC9: 00D6
        movlw           0x88        ; 0ACA: 3088
        call            I2CWrite    ; 0ACB: 24B3

        movlp           0x08        ; 0ACC: 3188
        movlb           0x01        ; 0ACD: 0021
        btfss           mem_c0, 0   ; 0ACE: 1C40
        goto            loop_0ad2   ; 0ACF: 2AD2

        lsrf            mem_c0, W   ; 0AD0: 3640
        call            InitMem    ; 0AD1: 24EB

loop_0ad2
; jump here from: 0ACF
        movlp           0x1a        ; 0AD2: 319A
        call            sub_1ac8    ; 0AD3: 22C8

        movlp           0x08        ; 0AD4: 3188
        movlp           0x34        ; 0AD5: 31B4
        call            sub_34da    ; 0AD6: 24DA

        movlp           0x08        ; 0AD7: 3188
        clrf            mem_b6      ; 0AD8: 01B6
        incf            mem_b5, f   ; 0AD9: 0AB5
        call            sub_0f7b    ; 0ADA: 277B

        movlp           0x2b        ; 0ADB: 31AB
        call            sub_2b5b    ; 0ADC: 235B

        movlp           0x08        ; 0ADD: 3188
        movlb           0x00        ; 0ADE: 0020
        movf            mem_35, W   ; 0ADF: 0835
        movlb           0x01        ; 0AE0: 0021
        subwf           mem_cb, W   ; 0AE1: 024B
        btfsc           STATUS, C   ; 0AE2: 1803
        goto            loop_0b12   ; 0AE3: 2B12

        movlp           0x1f        ; 0AE4: 319F
        call            sub_1f4f    ; 0AE5: 274F

        movlp           0x08        ; 0AE6: 3188
        movlw           0x0d        ; 0AE7: 300D
        clrf            mem_b5      ; 0AE8: 01B5
        incf            mem_b5, f   ; 0AE9: 0AB5
        incf            mem_b8, f   ; 0AEA: 0AB8
        subwf           mem_b8, W   ; 0AEB: 0238
        btfss           STATUS, C   ; 0AEC: 1C03
        goto            loop_0b07   ; 0AED: 2B07

        movlw           0x64        ; 0AEE: 3064
        clrf            mem_b8      ; 0AEF: 01B8
        incf            mem_b8, f   ; 0AF0: 0AB8
        incf            mem_b9, f   ; 0AF1: 0AB9
        subwf           mem_b9, W   ; 0AF2: 0239
        btfsc           STATUS, C   ; 0AF3: 1803
        clrf            mem_b9      ; 0AF4: 01B9
        movf            mem_b9, W   ; 0AF5: 0839
        movlp           0x26        ; 0AF6: 31A6
        call            sub_2627    ; 0AF7: 2627

        movlp           0x08        ; 0AF8: 3188
        movlb           0x01        ; 0AF9: 0021
        movwf           mem_d8      ; 0AFA: 00D8
        movlw           0x10        ; 0AFB: 3010
        movlb           0x00        ; 0AFC: 0020
        movwf           mem_55      ; 0AFD: 00D5
        movlb           0x01        ; 0AFE: 0021
        movf            mem_d8, W   ; 0AFF: 0858
        movlb           0x00        ; 0B00: 0020
        movwf           mem_56      ; 0B01: 00D6
        movlw           0x88        ; 0B02: 3088
        call            I2CWrite    ; 0B03: 24B3

        movlb           0x03        ; 0B04: 0023
        clrf            mem_1cb     ; 0B05: 01CB
        incf            mem_1cb, f  ; 0B06: 0ACB

loop_0b07
; jump here from: 0AED
        movlb           0x00        ; 0B07: 0020
        movf            mem_38, W   ; 0B08: 0838
        movlp           0x26        ; 0B09: 31A6
        call            sub_2627    ; 0B0A: 2627

        movlp           0x08        ; 0B0B: 3188
        movlb           0x01        ; 0B0C: 0021
        movwf           mem_d7      ; 0B0D: 00D7
        movlp           0x32        ; 0B0E: 31B2
        call            sub_329c    ; 0B0F: 229C

        movlp           0x08        ; 0B10: 3188
        call            I2CWrite    ; 0B11: 24B3

loop_0b12
; jump here from: 0AE3
        movlb           0x00        ; 0B12: 0020
        movf            mem_35, W   ; 0B13: 0835
        movlp           0x26        ; 0B14: 31A6
        call            sub_2627    ; 0B15: 2627

        movlp           0x08        ; 0B16: 3188
        movlb           0x01        ; 0B17: 0021
        movwf           mem_d4      ; 0B18: 00D4
        movlp           0x2d        ; 0B19: 31AD
        call            sub_2d29    ; 0B1A: 2529

        movlp           0x08        ; 0B1B: 3188
        call            I2CWrite    ; 0B1C: 24B3

        movlp           0x08        ; 0B1D: 3188
        call            sub_0f7b    ; 0B1E: 277B

        movlp           0x2b        ; 0B1F: 31AB
        call            sub_2b5b    ; 0B20: 235B

        movlp           0x08        ; 0B21: 3188
        movlb           0x02        ; 0B22: 0022
        movf            mem_131, f  ; 0B23: 08B1
        btfss           STATUS, Z   ; 0B24: 1D03
        goto            loop_0b29   ; 0B25: 2B29

        movlb           0x03        ; 0B26: 0023
        clrf            mem_1cb     ; 0B27: 01CB
        incf            mem_1cb, f  ; 0B28: 0ACB

loop_0b29
; jump here from: 0ABA
; jump here from: 0B25
        movlb           0x00        ; 0B29: 0020
        movf            mem_36, W   ; 0B2A: 0836
        movlp           0x26        ; 0B2B: 31A6
        call            sub_2627    ; 0B2C: 2627

        movlp           0x08        ; 0B2D: 3188
        movlb           0x01        ; 0B2E: 0021
        movwf           mem_d5      ; 0B2F: 00D5
        movlp           0x37        ; 0B30: 31B7
        call            sub_377f    ; 0B31: 277F

        movlp           0x08        ; 0B32: 3188
        call            I2CWrite    ; 0B33: 24B3

loop_0b34
; jump here from: 0AB0
        movf            mem_37, W   ; 0B34: 0837
        movlp           0x26        ; 0B35: 31A6
        call            sub_2627    ; 0B36: 2627

        movlp           0x08        ; 0B37: 3188
        movlb           0x01        ; 0B38: 0021
        movwf           mem_d6      ; 0B39: 00D6
        movlp           0x10        ; 0B3A: 3190
        call            sub_10b5    ; 0B3B: 20B5

        movlp           0x08        ; 0B3C: 3188
        call            I2CWrite    ; 0B3D: 24B3

        movlp           0x08        ; 0B3E: 3188
        movlb           0x03        ; 0B3F: 0023
        clrf            mem_1c9     ; 0B40: 01C9
        incf            mem_1c9, f  ; 0B41: 0AC9
        movlb           0x01        ; 0B42: 0021
        movf            mem_c8, f   ; 0B43: 08C8
        btfss           STATUS, Z   ; 0B44: 1D03
        goto            loop_0b59   ; 0B45: 2B59

        movf            mem_c7, f   ; 0B46: 08C7
        btfss           STATUS, Z   ; 0B47: 1D03
        goto            loop_0b59   ; 0B48: 2B59

        movlw           0x19        ; 0B49: 3019
        movlb           0x03        ; 0B4A: 0023
        subwf           mem_1ce, W  ; 0B4B: 024E
        btfsc           STATUS, C   ; 0B4C: 1803
        goto            loop_0b51   ; 0B4D: 2B51

        movlw           0x14        ; 0B4E: 3014
        incf            mem_1ce, f  ; 0B4F: 0ACE
        goto            label_0b56  ; 0B50: 2B56

loop_0b51
; jump here from: 0B4D
        movlb           0x00        ; 0B51: 0020
        movf            mem_37, f   ; 0B52: 08B7
        btfss           STATUS, Z   ; 0B53: 1D03
        goto            loop_0b59   ; 0B54: 2B59

        movlw           0x3c        ; 0B55: 303C

label_0b56
; jump here from: 0B50
        movlp           0x06        ; 0B56: 3186
        call            sub_0644    ; 0B57: 2644

        movlp           0x08        ; 0B58: 3188

loop_0b59
; jump here from: 0A9A
; jump here from: 0B45
; jump here from: 0B48
; jump here from: 0B54
        movlb           0x03        ; 0B59: 0023
        decfsz          mem_1c9, W  ; 0B5A: 0B49
        goto            loop_0be6   ; 0B5B: 2BE6

        clrf            mem_1c9     ; 0B5C: 01C9
        movlb           0x02        ; 0B5D: 0022
        clrf            mem_136     ; 0B5E: 01B6
        goto            label_0bda  ; 0B5F: 2BDA

loop_0b60
; jump here from: 0BE1
        movlb           0x00        ; 0B60: 0020
        movf            mem_2d, W   ; 0B61: 082D
        subwf           mem_2b, W   ; 0B62: 022B
        btfss           STATUS, Z   ; 0B63: 1D03
        goto            loop_0b67   ; 0B64: 2B67

        movf            mem_2c, W   ; 0B65: 082C
        subwf           mem_2a, W   ; 0B66: 022A

loop_0b67
; jump here from: 0B64
        btfsc           STATUS, C   ; 0B67: 1803
        goto            loop_0b6f   ; 0B68: 2B6F

        movlb           0x02        ; 0B69: 0022
        decfsz          mem_169, W  ; 0B6A: 0B69
        goto            loop_0be6   ; 0B6B: 2BE6

loop_0b6c
; jump here from: 0BD8
        clrf            mem_136     ; 0B6C: 01B6
        incf            mem_136, f  ; 0B6D: 0AB6
        goto            loop_0be6   ; 0B6E: 2BE6

loop_0b6f
; jump here from: 0B68
        movf            mem_2b, W   ; 0B6F: 082B
        subwf           mem_2d, W   ; 0B70: 022D
        btfss           STATUS, Z   ; 0B71: 1D03
        goto            loop_0b75   ; 0B72: 2B75

        movf            mem_2a, W   ; 0B73: 082A
        subwf           mem_2c, W   ; 0B74: 022C

loop_0b75
; jump here from: 0B72
        btfsc           STATUS, C   ; 0B75: 1803
        goto            loop_0be6   ; 0B76: 2BE6

        movlb           0x02        ; 0B77: 0022
        movf            mem_169, f  ; 0B78: 08E9
        goto            loop_0bd7   ; 0B79: 2BD7

loop_0b7a
; jump here from: 0BE4
        movlb           0x00        ; 0B7A: 0020
        movf            mem_2d, W   ; 0B7B: 082D
        xorwf           mem_2b, W   ; 0B7C: 062B
        btfss           STATUS, Z   ; 0B7D: 1D03
        goto            loop_0b81   ; 0B7E: 2B81

        movf            mem_2c, W   ; 0B7F: 082C
        xorwf           mem_2a, W   ; 0B80: 062A

loop_0b81
; jump here from: 0B7E
        btfss           STATUS, Z   ; 0B81: 1D03
        goto            loop_0b8f   ; 0B82: 2B8F

        movlb           0x01        ; 0B83: 0021
        movf            mem_ab, W   ; 0B84: 082B
        movlb           0x00        ; 0B85: 0020
        xorwf           mem_2b, W   ; 0B86: 062B
        btfss           STATUS, Z   ; 0B87: 1D03
        goto            loop_0b8d   ; 0B88: 2B8D

        movlb           0x01        ; 0B89: 0021
        movf            mem_aa, W   ; 0B8A: 082A
        movlb           0x00        ; 0B8B: 0020
        xorwf           mem_2a, W   ; 0B8C: 062A

loop_0b8d
; jump here from: 0B88
        btfsc           STATUS, Z   ; 0B8D: 1903
        goto            loop_0be6   ; 0B8E: 2BE6

loop_0b8f
; jump here from: 0B82
        movf            mem_2b, W   ; 0B8F: 082B
        call            sub_0f37    ; 0B90: 2737

        movlp           0x08        ; 0B91: 3188
        btfsc           STATUS, C   ; 0B92: 1803
        goto            loop_0bce   ; 0B93: 2BCE

        movf            mem_2b, W   ; 0B94: 082B
        movwf           mem_29      ; 0B95: 00A9
        movf            mem_2a, W   ; 0B96: 082A
        goto            label_0bcd  ; 0B97: 2BCD

label_0b98
; jump here from: 0BE5
        movlb           0x00        ; 0B98: 0020
        movf            mem_2d, W   ; 0B99: 082D
        xorwf           mem_2b, W   ; 0B9A: 062B
        btfss           STATUS, Z   ; 0B9B: 1D03
        goto            loop_0b9f   ; 0B9C: 2B9F

        movf            mem_2c, W   ; 0B9D: 082C
        xorwf           mem_2a, W   ; 0B9E: 062A

loop_0b9f
; jump here from: 0B9C
        btfss           STATUS, Z   ; 0B9F: 1D03
        goto            loop_0bb9   ; 0BA0: 2BB9

        movlb           0x01        ; 0BA1: 0021
        movf            mem_ab, W   ; 0BA2: 082B
        movlb           0x00        ; 0BA3: 0020
        xorwf           mem_2b, W   ; 0BA4: 062B
        btfss           STATUS, Z   ; 0BA5: 1D03
        goto            loop_0bab   ; 0BA6: 2BAB

        movlb           0x01        ; 0BA7: 0021
        movf            mem_aa, W   ; 0BA8: 082A
        movlb           0x00        ; 0BA9: 0020
        xorwf           mem_2a, W   ; 0BAA: 062A

loop_0bab
; jump here from: 0BA6
        btfss           STATUS, Z   ; 0BAB: 1D03
        goto            loop_0bb9   ; 0BAC: 2BB9

        movlb           0x01        ; 0BAD: 0021
        movf            mem_ad, W   ; 0BAE: 082D
        movlb           0x00        ; 0BAF: 0020
        xorwf           mem_2b, W   ; 0BB0: 062B
        btfss           STATUS, Z   ; 0BB1: 1D03
        goto            loop_0bb7   ; 0BB2: 2BB7

        movlb           0x01        ; 0BB3: 0021
        movf            mem_ac, W   ; 0BB4: 082C
        movlb           0x00        ; 0BB5: 0020
        xorwf           mem_2a, W   ; 0BB6: 062A

loop_0bb7
; jump here from: 0BB2
        btfsc           STATUS, Z   ; 0BB7: 1903
        goto            loop_0be6   ; 0BB8: 2BE6

loop_0bb9
; jump here from: 0BA0
; jump here from: 0BAC
        movf            mem_2b, W   ; 0BB9: 082B
        call            sub_0f37    ; 0BBA: 2737

        movlp           0x08        ; 0BBB: 3188
        btfsc           STATUS, C   ; 0BBC: 1803
        goto            loop_0bc2   ; 0BBD: 2BC2

        movf            mem_2b, W   ; 0BBE: 082B
        movwf           mem_29      ; 0BBF: 00A9
        movf            mem_2a, W   ; 0BC0: 082A
        movwf           mem_28      ; 0BC1: 00A8

loop_0bc2
; jump here from: 0BBD
        movf            mem_2d, W   ; 0BC2: 082D
        subwf           mem_29, W   ; 0BC3: 0229
        btfss           STATUS, Z   ; 0BC4: 1D03
        goto            loop_0bc8   ; 0BC5: 2BC8

        movf            mem_2c, W   ; 0BC6: 082C
        subwf           mem_28, W   ; 0BC7: 0228

loop_0bc8
; jump here from: 0BC5
        btfsc           STATUS, C   ; 0BC8: 1803
        goto            loop_0bce   ; 0BC9: 2BCE

        movf            mem_2d, W   ; 0BCA: 082D
        movwf           mem_29      ; 0BCB: 00A9
        movf            mem_2c, W   ; 0BCC: 082C

label_0bcd
; jump here from: 0B97
        movwf           mem_28      ; 0BCD: 00A8

loop_0bce
; jump here from: 0B93
; jump here from: 0BC9
        movf            mem_29, W   ; 0BCE: 0829
        movlb           0x02        ; 0BCF: 0022
        xorwf           mem_121, W  ; 0BD0: 0621
        btfss           STATUS, Z   ; 0BD1: 1D03
        goto            loop_0bd7   ; 0BD2: 2BD7

        movlb           0x01        ; 0BD3: 0021
        movf            mem_a8, W   ; 0BD4: 0828
        movlb           0x02        ; 0BD5: 0022
        xorwf           mem_120, W  ; 0BD6: 0620

loop_0bd7
; jump here from: 0B79
; jump here from: 0BD2
        btfsc           STATUS, Z   ; 0BD7: 1903
        goto            loop_0b6c   ; 0BD8: 2B6C
        goto            loop_0be6   ; 0BD9: 2BE6
;
; end of loop_0bd7
;------------------------------------------------------------


label_0bda
; jump here from: 0B5F
        movlb           0x01        ; 0BDA: 0021
        movf            mem_e3, W   ; 0BDB: 0863
        xorlw           0x00        ; 0BDC: 3A00
        btfsc           STATUS, Z   ; 0BDD: 1903
        goto            loop_0be6   ; 0BDE: 2BE6

        xorlw           0x01        ; 0BDF: 3A01
        btfsc           STATUS, Z   ; 0BE0: 1903
        goto            loop_0b60   ; 0BE1: 2B60

        xorlw           0x03        ; 0BE2: 3A03
        btfsc           STATUS, Z   ; 0BE3: 1903
        goto            loop_0b7a   ; 0BE4: 2B7A
        goto            label_0b98  ; 0BE5: 2B98
;
; end of label_0bda
;------------------------------------------------------------


loop_0be6
; jump here from: 0B5B
; jump here from: 0B6B
; jump here from: 0B6E
; jump here from: 0B76
; jump here from: 0B8E
; jump here from: 0BB8
; jump here from: 0BD9
; jump here from: 0BDE
        movlb           0x03        ; 0BE6: 0023
        decfsz          mem_1cb, W  ; 0BE7: 0B4B
        goto            loop_0bed   ; 0BE8: 2BED

        clrf            mem_1cb     ; 0BE9: 01CB
        movlp           0x1a        ; 0BEA: 319A
        call            sub_1a3e    ; 0BEB: 223E

        movlp           0x08        ; 0BEC: 3188

loop_0bed
; jump here from: 0BE8
        movlb           0x02        ; 0BED: 0022
        movf            mem_128, f  ; 0BEE: 08A8
        btfss           STATUS, Z   ; 0BEF: 1D03
        goto            loop_0955   ; 0BF0: 2955

        movlb           0x00        ; 0BF1: 0020
        movf            mem_3b, f   ; 0BF2: 08BB
        btfss           STATUS, Z   ; 0BF3: 1D03
        goto            loop_0955   ; 0BF4: 2955

        movlb           0x02        ; 0BF5: 0022
        movf            mem_radio_status, f  ; 0BF6: 08C5
        btfss           STATUS, Z   ; 0BF7: 1D03
        goto            loop_0955   ; 0BF8: 2955

        movlb           0x01        ; 0BF9: 0021
        movf            mem_c3, f   ; 0BFA: 08C3
        btfss           STATUS, Z   ; 0BFB: 1D03
        goto            loop_0955   ; 0BFC: 2955

        movlb           0x02        ; 0BFD: 0022
        movf            mem_12c, f  ; 0BFE: 08AC
        btfss           STATUS, Z   ; 0BFF: 1D03
        goto            loop_0955   ; 0C00: 2955

        movlb           0x00        ; 0C01: 0020
        btfss           PORTA, RA2  ; 0C02: 1D0C
        btfsc           PORTA, RA1  ; 0C03: 188C
        goto            loop_0d55   ; 0C04: 2955

        sleep                       ; 0C05: 0063

        nop                         ; 0C06: 0000
        goto            loop_0d55   ; 0C07: 2955

;------------------------------------------------------------
; Subroutine: sub_0c08
;
; called from: 10BF
; called from: 10F0

sub_0c08
        movlb           0x01        ; 0C08: 0021
        movf            mem_e3, W   ; 0C09: 0863
        movlb           0x00        ; 0C0A: 0020
        xorwf           mem_45, W   ; 0C0B: 0645
        btfsc           STATUS, Z   ; 0C0C: 1903
        return                      ; 0C0D: 0008
        movf            mem_45, W   ; 0C0E: 0845
        movlb           0x01        ; 0C0F: 0021
        movwf           mem_e3      ; 0C10: 00E3
        movlb           0x03        ; 0C11: 0023
        movlw           0x0e        ; 0C12: 300E
        clrf            mem_1c9     ; 0C13: 01C9
        incf            mem_1c9, f  ; 0C14: 0AC9
        movlb           0x00        ; 0C15: 0020
        movwf           mem_55      ; 0C16: 00D5
        movlb           0x01        ; 0C17: 0021
        movf            mem_e3, W   ; 0C18: 0863
        movlb           0x00        ; 0C19: 0020
        movwf           mem_56      ; 0C1A: 00D6
        movlw           0x88        ; 0C1B: 3088
        call            I2CWrite    ; 0C1C: 24B3

        movlp           0x08        ; 0C1D: 3188
        movf            mem_45, W   ; 0C1E: 0845
        xorlw           0x00        ; 0C1F: 3A00
        btfsc           STATUS, Z   ; 0C20: 1903
        goto            loop_0c2a   ; 0C21: 2C2A

        xorlw           0x01        ; 0C22: 3A01
        btfsc           STATUS, Z   ; 0C23: 1903
        goto            loop_0c2c   ; 0C24: 2C2C

        xorlw           0x03        ; 0C25: 3A03
        btfsc           STATUS, Z   ; 0C26: 1903
        goto            loop_0c44   ; 0C27: 2C44
        goto            label_0c6d  ; 0C28: 2C6D
;
; end of sub_0c08
;------------------------------------------------------------

        return                      ; 0C29: 0008

loop_0c2a
; jump here from: 0C21
        movlp           0x22        ; 0C2A: 31A2
        goto            sub_222b    ; 0C2B: 2A2B

loop_0c2c
; jump here from: 0C24
        movlw           0x96        ; 0C2C: 3096
        call            sub_0f5f    ; 0C2D: 275F

        movlp           0x08        ; 0C2E: 3188
        call            I2CWrite    ; 0C2F: 24B3

        movlp           0x17        ; 0C30: 3197
        call            sub_175f    ; 0C31: 275F

        movlp           0x08        ; 0C32: 3188
        call            I2CWrite    ; 0C33: 24B3

        movlw           0x0c        ; 0C34: 300C
        movwf           mem_3e      ; 0C35: 00BE
        movlw           0x16        ; 0C36: 3016
        clrf            mem_3f      ; 0C37: 01BF
        movwf           mem_3c      ; 0C38: 00BC
        clrf            mem_3d      ; 0C39: 01BD
        movlp           0x30        ; 0C3A: 31B0
        call            sub_3049    ; 0C3B: 2049

        movlp           0x08        ; 0C3C: 3188
        call            sub_0f6d    ; 0C3D: 276D

        movlp           0x08        ; 0C3E: 3188
        call            I2CWrite    ; 0C3F: 24B3

        movlp           0x17        ; 0C40: 3197
        call            sub_1775    ; 0C41: 2775

        movlp           0x08        ; 0C42: 3188
        goto            I2CWrite    ; 0C43: 2CB3

loop_0c44
; jump here from: 0C27
        movlw           0x96        ; 0C44: 3096
        call            sub_0f5f    ; 0C45: 275F

        movlp           0x08        ; 0C46: 3188
        call            I2CWrite    ; 0C47: 24B3

        movlp           0x17        ; 0C48: 3197
        call            sub_175f    ; 0C49: 275F

        movlp           0x08        ; 0C4A: 3188
        call            I2CWrite    ; 0C4B: 24B3

        movlw           0x08        ; 0C4C: 3008
        movwf           mem_3e      ; 0C4D: 00BE
        movlw           0x10        ; 0C4E: 3010
        clrf            mem_3f      ; 0C4F: 01BF
        movwf           mem_3c      ; 0C50: 00BC
        clrf            mem_3d      ; 0C51: 01BD
        movlp           0x30        ; 0C52: 31B0
        call            sub_3049    ; 0C53: 2049

        movlp           0x08        ; 0C54: 3188
        call            sub_0f6d    ; 0C55: 276D

        movlp           0x08        ; 0C56: 3188
        call            I2CWrite    ; 0C57: 24B3

        movlp           0x17        ; 0C58: 3197
        call            sub_1775    ; 0C59: 2775

        movlp           0x08        ; 0C5A: 3188
        call            I2CWrite    ; 0C5B: 24B3

        movlp           0x08        ; 0C5C: 3188
        movlw           0x10        ; 0C5D: 3010
        movwf           mem_41      ; 0C5E: 00C1
        movlw           0x16        ; 0C5F: 3016
        call            sub_0f8c    ; 0C60: 278C

        movlp           0x37        ; 0C61: 31B7
        call            sub_37c4    ; 0C62: 27C4

        movlp           0x08        ; 0C63: 3188
        call            sub_0f75    ; 0C64: 2775

        movlp           0x08        ; 0C65: 3188
        call            sub_0f58    ; 0C66: 2758

        movlp           0x08        ; 0C67: 3188
        call            I2CWrite    ; 0C68: 24B3

        movlp           0x08        ; 0C69: 3188
        call            sub_0f66    ; 0C6A: 2766

        movlp           0x08        ; 0C6B: 3188
        goto            I2CWrite    ; 0C6C: 2CB3

label_0c6d
; jump here from: 0C28
        movlw           0x96        ; 0C6D: 3096
        call            sub_0f5f    ; 0C6E: 275F

        movlp           0x08        ; 0C6F: 3188
        call            I2CWrite    ; 0C70: 24B3

        movlp           0x17        ; 0C71: 3197
        call            sub_175f    ; 0C72: 275F

        movlp           0x08        ; 0C73: 3188
        call            I2CWrite    ; 0C74: 24B3

        movlw           0x08        ; 0C75: 3008
        movwf           mem_3e      ; 0C76: 00BE
        movlw           0x0c        ; 0C77: 300C
        clrf            mem_3f      ; 0C78: 01BF
        movwf           mem_3c      ; 0C79: 00BC
        clrf            mem_3d      ; 0C7A: 01BD
        movlp           0x30        ; 0C7B: 31B0
        call            sub_3049    ; 0C7C: 2049

        movlp           0x08        ; 0C7D: 3188
        call            sub_0f6d    ; 0C7E: 276D

        movlp           0x08        ; 0C7F: 3188
        call            I2CWrite    ; 0C80: 24B3

        movlp           0x17        ; 0C81: 3197
        call            sub_1775    ; 0C82: 2775

        movlp           0x08        ; 0C83: 3188
        call            I2CWrite    ; 0C84: 24B3

        movlp           0x08        ; 0C85: 3188
        movlw           0x0c        ; 0C86: 300C
        movwf           mem_41      ; 0C87: 00C1
        movlw           0x12        ; 0C88: 3012
        call            sub_0f8c    ; 0C89: 278C

        movlp           0x37        ; 0C8A: 31B7
        call            sub_37c4    ; 0C8B: 27C4

        movlp           0x08        ; 0C8C: 3188
        call            sub_0f75    ; 0C8D: 2775

        movlp           0x08        ; 0C8E: 3188
        call            sub_0f58    ; 0C8F: 2758

        movlp           0x08        ; 0C90: 3188
        call            I2CWrite    ; 0C91: 24B3

        movlp           0x08        ; 0C92: 3188
        call            sub_0f66    ; 0C93: 2766

        movlp           0x08        ; 0C94: 3188
        call            I2CWrite    ; 0C95: 24B3

        movlw           0x12        ; 0C96: 3012
        movwf           mem_44      ; 0C97: 00C4
        movlb           0x01        ; 0C98: 0021
        movlw           0x16        ; 0C99: 3016
        clrf            mem_db      ; 0C9A: 01DB
        movlb           0x00        ; 0C9B: 0020
        movwf           mem_43      ; 0C9C: 00C3
        movlb           0x01        ; 0C9D: 0021
        clrf            mem_da      ; 0C9E: 01DA
        movlp           0x37        ; 0C9F: 31B7
        call            sub_37e2    ; 0CA0: 27E2

        movlp           0x08        ; 0CA1: 3188
        movlw           0x32        ; 0CA2: 3032
        movlb           0x01        ; 0CA3: 0021
        movwf           mem_ac      ; 0CA4: 00AC
        movlw           0x66        ; 0CA5: 3066
        clrf            mem_ad      ; 0CA6: 01AD
        movlb           0x00        ; 0CA7: 0020
        movwf           mem_55      ; 0CA8: 00D5
        movlb           0x01        ; 0CA9: 0021
        movf            mem_ad, W   ; 0CAA: 082D
        movlb           0x00        ; 0CAB: 0020
        movwf           mem_56      ; 0CAC: 00D6
        movlw           0x88        ; 0CAD: 3088
        call            I2CWrite    ; 0CAE: 24B3

        movlp           0x17        ; 0CAF: 3197
        call            sub_1764    ; 0CB0: 2764

        movlp           0x08        ; 0CB1: 3188
        goto            I2CWrite    ; 0CB2: 2CB3

;------------------------------------------------------------
; Subroutine: I2CWrite
;
; called from: 05B6
; called from: 08E5
; called from: 08EA
; called from: 08EF
; called from: 08F5
; called from: 08FB
; called from: 0ACB
; called from: 0B03
; called from: 0B11
; called from: 0B1C
; called from: 0B33
; called from: 0B3D
; called from: 0C1C
; called from: 0C2F
; called from: 0C33
; called from: 0C3F
; called from: 0C47
; called from: 0C4B
; called from: 0C57
; called from: 0C5B
; called from: 0C68
; called from: 0C70
; called from: 0C74
; called from: 0C80
; called from: 0C84
; called from: 0C91
; called from: 0C95
; called from: 0CAE
; called from: 1013
; called from: 1020
; called from: 103E
; called from: 105C
; called from: 1085
; called from: 109D
; called from: 1165
; called from: 118A
; called from: 11A4
; called from: 11AA
; called from: 11D1
; called from: 11D7
; called from: 11EE
; called from: 11F4
; called from: 1221
; called from: 1227
; called from: 1245
; called from: 1249
; called from: 1260
; called from: 1264
; called from: 1282
; called from: 1286
; called from: 1290
; called from: 1294
; called from: 12B2
; called from: 12B6
; called from: 12D0
; called from: 12D4
; called from: 12F2
; called from: 12F8
; called from: 1312
; called from: 1318
; called from: 13F9
; called from: 1425
; called from: 1459
; called from: 1485
; called from: 14D1
; called from: 1523
; called from: 1593
; called from: 15F9
; called from: 1843
; called from: 184B
; called from: 1A79
; called from: 1A83
; called from: 1A8D
; called from: 1A9A
; called from: 1AAD
; called from: 1AB8
; called from: 1ABF
; called from: 1AF8
; called from: 1B02
; called from: 1B0C
; called from: 1B1B
; called from: 1B25
; called from: 1B38
; called from: 1B44
; called from: 1B4B
; called from: 1B53
; called from: 1CB8
; called from: 1CC0
; called from: 1CF0
; called from: 1CF8
; called from: 1F89
; called from: 1F93
; called from: 1F9D
; called from: 1FAA
; called from: 1FBD
; called from: 1FCC
; called from: 1FD3
; called from: 2188
; called from: 218F
; called from: 21A6
; called from: 21AD
; called from: 21B4
; called from: 21BB
; called from: 21C2
; called from: 21D4
; called from: 21E7
; called from: 220B
; called from: 2230
; called from: 224A
; called from: 2265
; called from: 229C
; called from: 22A3
; called from: 22AD
; called from: 22B7
; called from: 22C1
; called from: 22CB
; called from: 22D5
; called from: 2889
; called from: 2893
; called from: 2B1B
; called from: 2B47
; called from: 2C1D
; called from: 2D86
; called from: 2D8C
; called from: 2D92
; called from: 2D98
; called from: 2D9E
; called from: 2DBB
; called from: 2DC1
; called from: 2DC7
; called from: 2DCD
; called from: 2DD3
; called from: 304C
; called from: 3051
; called from: 3056
; called from: 312C
; called from: 3211
; called from: 326B
; called from: 3288
; called from: 3405
; called from: 340F
; called from: 34C9
; called from: 34D1
; called from: 34F2
; called from: 34FC
; called from: 3534
; called from: 353B
; called from: 3543
; called from: 354C
; called from: 3554
; called from: 355F
; called from: 3568
; called from: 357F
; called from: 3588
; called from: 35A6
; called from: 35BA
; called from: 35DE
; called from: 35F4
; called from: 3621
; called from: 3640
; called from: 3677
; called from: 36A0
; called from: 36F2
; called from: 3736
; called from: 37C8
; called from: 37CD
; called from: 37D1
; called from: 37E6
; called from: 37EB
; called from: 37EF

I2CWrite
; jump here from: 0C43
; jump here from: 0C6C
; jump here from: 0CB2
; jump here from: 1815
; jump here from: 1854
; jump here from: 1AC7
; jump here from: 1CC9
; jump here from: 1D01
; jump here from: 1FDA
; jump here from: 21D8
; jump here from: 21EB
; jump here from: 21F7
; jump here from: 21FD
; jump here from: 2215
; jump here from: 221E
; jump here from: 222A
; jump here from: 2235
; jump here from: 289C
; jump here from: 2DA4
; jump here from: 305B
; jump here from: 3132
; jump here from: 34D9
; jump here from: 355B
; jump here from: 37D8
; jump here from: 37F6
; jump here from: 3F6D
; jump here from: 3F82
; jump here from: 3FCA
        movwf           mem_57      ; 0CB3: 00D7
        bcf             INTCON, GIE ; 0CB4: 138B
        call            I2CStart    ; 0CB5: 2710

        movlp           0x08        ; 0CB6: 3188
        movlw           0xa0        ; 0CB7: 30A0
        call            I2CSend    ; 0CB8: 262C

        movlp           0x08        ; 0CB9: 3188
        call            I2CAck    ; 0CBA: 2623

        movlp           0x08        ; 0CBB: 3188
        movf            mem_57, W   ; 0CBC: 0857
        call            I2CSend    ; 0CBD: 262C

        movlp           0x08        ; 0CBE: 3188
        call            I2CAck    ; 0CBF: 2623

        movlp           0x08        ; 0CC0: 3188
        movf            mem_55, W   ; 0CC1: 0855
        call            I2CSend    ; 0CC2: 262C

        movlp           0x08        ; 0CC3: 3188
        call            I2CAck    ; 0CC4: 2623

        movlp           0x08        ; 0CC5: 3188
        movf            mem_56, W   ; 0CC6: 0856
        call            I2CSend    ; 0CC7: 262C

        movlp           0x08        ; 0CC8: 3188
        call            I2CAck    ; 0CC9: 2623

        movlp           0x08        ; 0CCA: 3188
        call            I2CStop    ; 0CCB: 27DC

        movlp           0x08        ; 0CCC: 3188
        bsf             INTCON, GIE ; 0CCD: 178B
        movf            mem_55, W   ; 0CCE: 0855
        movwf           mem_52      ; 0CCF: 00D2
        movf            mem_57, W   ; 0CD0: 0857
        call            I2CRead    ; 0CD1: 25FD

        movlp           0x08        ; 0CD2: 3188
        movf            mem_55, W   ; 0CD3: 0855
        movwf           mem_52      ; 0CD4: 00D2
        movf            mem_57, W   ; 0CD5: 0857
        call            I2CRead    ; 0CD6: 25FD

        movlp           0x08        ; 0CD7: 3188
        movf            mem_55, W   ; 0CD8: 0855
        movwf           mem_52      ; 0CD9: 00D2
        movf            mem_57, W   ; 0CDA: 0857
        call            I2CRead    ; 0CDB: 25FD

        movlp           0x08        ; 0CDC: 3188
        movf            mem_55, W   ; 0CDD: 0855
        movwf           mem_52      ; 0CDE: 00D2
        movf            mem_57, W   ; 0CDF: 0857
        call            I2CRead    ; 0CE0: 25FD

        movlp           0x08        ; 0CE1: 3188
        movf            mem_55, W   ; 0CE2: 0855
        movwf           mem_52      ; 0CE3: 00D2
        movf            mem_57, W   ; 0CE4: 0857
        call            I2CRead    ; 0CE5: 25FD

        movlp           0x08        ; 0CE6: 3188
        movf            mem_55, W   ; 0CE7: 0855
        movwf           mem_52      ; 0CE8: 00D2
        movf            mem_57, W   ; 0CE9: 0857
        goto            I2CRead    ; 0CEA: 2DFD

;------------------------------------------------------------
; Subroutine: InitMem
;
; called from: 0AD1
; called from: 217B
; called from: 2290

InitMem
        movlb           0x00        ; 0CEB: 0020
        movwf           mem_56      ; 0CEC: 00D6
        bcf             INTCON, GIE ; 0CED: 138B
        call            I2CStart    ; 0CEE: 2710

        movlp           0x08        ; 0CEF: 3188
        movlw           0xa0        ; 0CF0: 30A0
        call            I2CSend    ; 0CF1: 262C

        movlp           0x08        ; 0CF2: 3188
        call            I2CAck    ; 0CF3: 2623

        movlp           0x08        ; 0CF4: 3188
        movf            mem_56, W   ; 0CF5: 0856
        call            I2CSend    ; 0CF6: 262C

        movlp           0x08        ; 0CF7: 3188
        call            I2CAck    ; 0CF8: 2623

        movlp           0x08        ; 0CF9: 3188
        movlw           0x00        ; 0CFA: 3000
        call            I2CSend    ; 0CFB: 262C

        movlp           0x08        ; 0CFC: 3188
        call            I2CAck    ; 0CFD: 2623

        movlp           0x08        ; 0CFE: 3188
        clrf            mem_55      ; 0CFF: 01D5

loop_0d00
; jump here from: 0D0A
        clrwdt                      ; 0D00: 0064
        movlw           0x00        ; 0D01: 3000
        call            I2CSend    ; 0D02: 262C

        movlp           0x08        ; 0D03: 3188
        call            I2CAck    ; 0D04: 2623

        movlp           0x08        ; 0D05: 3188
        movlw           0x80        ; 0D06: 3080
        incf            mem_55, f   ; 0D07: 0AD5
        subwf           mem_55, W   ; 0D08: 0255
        btfss           STATUS, C   ; 0D09: 1C03
        goto            loop_0d00   ; 0D0A: 2D00

        call            I2CStop    ; 0D0B: 27DC

        movlp           0x08        ; 0D0C: 3188
        call            sub_0f91    ; 0D0D: 2791

        movlp           0x08        ; 0D0E: 3188
        call            I2CRead    ; 0D0F: 25FD

        movlp           0x08        ; 0D10: 3188
        movlw           0x7f        ; 0D11: 307F
        movwf           mem_52      ; 0D12: 00D2
        movf            mem_56, W   ; 0D13: 0856
        call            I2CRead    ; 0D14: 25FD

        movlp           0x08        ; 0D15: 3188
        movlw           0x7f        ; 0D16: 307F
        movwf           mem_52      ; 0D17: 00D2
        movf            mem_56, W   ; 0D18: 0856
        call            I2CRead    ; 0D19: 25FD

        movlp           0x08        ; 0D1A: 3188
        movlw           0x7f        ; 0D1B: 307F
        movwf           mem_52      ; 0D1C: 00D2
        movf            mem_56, W   ; 0D1D: 0856
        call            I2CRead    ; 0D1E: 25FD

        movlp           0x08        ; 0D1F: 3188
        movlw           0x7f        ; 0D20: 307F
        movwf           mem_52      ; 0D21: 00D2
        movf            mem_56, W   ; 0D22: 0856
        call            I2CRead    ; 0D23: 25FD

        movlp           0x08        ; 0D24: 3188
        movlw           0x7f        ; 0D25: 307F
        movwf           mem_52      ; 0D26: 00D2
        movf            mem_56, W   ; 0D27: 0856
        call            I2CRead    ; 0D28: 25FD

        movlp           0x08        ; 0D29: 3188
        bcf             INTCON, GIE ; 0D2A: 138B
        call            I2CStart    ; 0D2B: 2710

        movlp           0x08        ; 0D2C: 3188
        movlw           0xa0        ; 0D2D: 30A0
        call            I2CSend    ; 0D2E: 262C

        movlp           0x08        ; 0D2F: 3188
        call            I2CAck    ; 0D30: 2623

        movlp           0x08        ; 0D31: 3188
        movf            mem_56, W   ; 0D32: 0856
        call            I2CSend    ; 0D33: 262C

        movlp           0x08        ; 0D34: 3188
        call            I2CAck    ; 0D35: 2623

        movlp           0x08        ; 0D36: 3188
        movlw           0x80        ; 0D37: 3080
        call            I2CSend    ; 0D38: 262C

        movlp           0x08        ; 0D39: 3188
        call            I2CAck    ; 0D3A: 2623

        movlp           0x08        ; 0D3B: 3188
        clrf            mem_55      ; 0D3C: 01D5

loop_0d3d
; jump here from: 0D47
        clrwdt                      ; 0D3D: 0064
        movlw           0x00        ; 0D3E: 3000
        call            I2CSend    ; 0D3F: 262C

        movlp           0x08        ; 0D40: 3188
        call            I2CAck    ; 0D41: 2623

        movlp           0x08        ; 0D42: 3188
        movlw           0x80        ; 0D43: 3080
        incf            mem_55, f   ; 0D44: 0AD5
        subwf           mem_55, W   ; 0D45: 0255
        btfss           STATUS, C   ; 0D46: 1C03
        goto            loop_0d3d   ; 0D47: 2D3D

        call            I2CStop    ; 0D48: 27DC

        movlp           0x08        ; 0D49: 3188
        call            sub_0f91    ; 0D4A: 2791

        movlp           0x08        ; 0D4B: 3188
        call            I2CRead    ; 0D4C: 25FD

        movlp           0x08        ; 0D4D: 3188
        movlw           0x7f        ; 0D4E: 307F
        movwf           mem_52      ; 0D4F: 00D2
        movf            mem_56, W   ; 0D50: 0856
        call            I2CRead    ; 0D51: 25FD

        movlp           0x08        ; 0D52: 3188
        movlw           0x7f        ; 0D53: 307F
        movwf           mem_52      ; 0D54: 00D2

loop_0d55
; jump here from: 0C04
; jump here from: 0C07
        movf            mem_56, W   ; 0D55: 0856
        call            I2CRead    ; 0D56: 25FD

        movlp           0x08        ; 0D57: 3188
        movlw           0x7f        ; 0D58: 307F
        movwf           mem_52      ; 0D59: 00D2
        movf            mem_56, W   ; 0D5A: 0856
        call            I2CRead    ; 0D5B: 25FD

        movlp           0x08        ; 0D5C: 3188
        movlw           0x7f        ; 0D5D: 307F
        movwf           mem_52      ; 0D5E: 00D2
        movf            mem_56, W   ; 0D5F: 0856
        call            I2CRead    ; 0D60: 25FD

        movlp           0x08        ; 0D61: 3188
        movlw           0x7f        ; 0D62: 307F
        movwf           mem_52      ; 0D63: 00D2
        movf            mem_56, W   ; 0D64: 0856
        goto            I2CRead    ; 0D65: 2DFD

;------------------------------------------------------------
; Subroutine: sub_0d66
;
; called from: 0865

sub_0d66
        movlw           0x0e        ; 0D66: 300E
        movlb           0x00        ; 0D67: 0020
        movwf           mem_52      ; 0D68: 00D2
        movlw           0x88        ; 0D69: 3088
        call            I2CRead    ; 0D6A: 25FD

        movlp           0x08        ; 0D6B: 3188
        movlb           0x01        ; 0D6C: 0021
        movwf           mem_e3      ; 0D6D: 00E3
        movlw           0x04        ; 0D6E: 3004
        subwf           mem_e3, W   ; 0D6F: 0263
        btfss           STATUS, C   ; 0D70: 1C03
        goto            loop_0d77   ; 0D71: 2D77

        movlp           0x22        ; 0D72: 31A2
        call            sub_221f    ; 0D73: 221F

        movlp           0x08        ; 0D74: 3188
        movlp           0x22        ; 0D75: 31A2
        goto            sub_222b    ; 0D76: 2A2B

loop_0d77
; jump here from: 0D71
        movlw           0x60        ; 0D77: 3060
        movlb           0x00        ; 0D78: 0020
        movwf           mem_52      ; 0D79: 00D2
        movlw           0x88        ; 0D7A: 3088
        call            I2CRead    ; 0D7B: 25FD

        movlp           0x08        ; 0D7C: 3188
        movwf           mem_2b      ; 0D7D: 00AB
        movlw           0x61        ; 0D7E: 3061
        movwf           mem_52      ; 0D7F: 00D2
        movlw           0x88        ; 0D80: 3088
        call            I2CRead    ; 0D81: 25FD

        movlp           0x08        ; 0D82: 3188
        movwf           mem_2a      ; 0D83: 00AA
        movlw           0x62        ; 0D84: 3062
        movwf           mem_52      ; 0D85: 00D2
        movlw           0x88        ; 0D86: 3088
        call            I2CRead    ; 0D87: 25FD

        movlp           0x08        ; 0D88: 3188
        movwf           mem_2d      ; 0D89: 00AD
        movlw           0x63        ; 0D8A: 3063
        movwf           mem_52      ; 0D8B: 00D2
        movlw           0x88        ; 0D8C: 3088
        call            I2CRead    ; 0D8D: 25FD

        movlp           0x08        ; 0D8E: 3188
        movwf           mem_2c      ; 0D8F: 00AC
        movlw           0x64        ; 0D90: 3064
        movwf           mem_52      ; 0D91: 00D2
        movlw           0x88        ; 0D92: 3088
        call            I2CRead    ; 0D93: 25FD

        movlp           0x08        ; 0D94: 3188
        movlb           0x01        ; 0D95: 0021
        movwf           mem_ab      ; 0D96: 00AB
        movlw           0x65        ; 0D97: 3065
        movlb           0x00        ; 0D98: 0020
        movwf           mem_52      ; 0D99: 00D2
        movlw           0x88        ; 0D9A: 3088
        call            I2CRead    ; 0D9B: 25FD

        movlp           0x08        ; 0D9C: 3188
        movlb           0x01        ; 0D9D: 0021
        movwf           mem_aa      ; 0D9E: 00AA
        movlw           0x66        ; 0D9F: 3066
        movlb           0x00        ; 0DA0: 0020
        movwf           mem_52      ; 0DA1: 00D2
        movlw           0x88        ; 0DA2: 3088
        call            I2CRead    ; 0DA3: 25FD

        movlp           0x08        ; 0DA4: 3188
        movlb           0x01        ; 0DA5: 0021
        movwf           mem_ad      ; 0DA6: 00AD
        movlw           0x67        ; 0DA7: 3067
        movlb           0x00        ; 0DA8: 0020
        movwf           mem_52      ; 0DA9: 00D2
        movlw           0x88        ; 0DAA: 3088
        call            I2CRead    ; 0DAB: 25FD

        movlp           0x08        ; 0DAC: 3188
        movlb           0x01        ; 0DAD: 0021
        movwf           mem_ac      ; 0DAE: 00AC
        movlw           0x68        ; 0DAF: 3068
        movlb           0x00        ; 0DB0: 0020
        movwf           mem_52      ; 0DB1: 00D2
        movlw           0x88        ; 0DB2: 3088
        call            I2CRead    ; 0DB3: 25FD

        movlp           0x08        ; 0DB4: 3188
        movwf           mem_3e      ; 0DB5: 00BE
        movlw           0x69        ; 0DB6: 3069
        movwf           mem_52      ; 0DB7: 00D2
        movlw           0x88        ; 0DB8: 3088
        call            I2CRead    ; 0DB9: 25FD

        movlp           0x08        ; 0DBA: 3188
        movwf           mem_3f      ; 0DBB: 00BF
        movlw           0x6a        ; 0DBC: 306A
        movwf           mem_52      ; 0DBD: 00D2
        movlw           0x88        ; 0DBE: 3088
        call            I2CRead    ; 0DBF: 25FD

        movlp           0x08        ; 0DC0: 3188
        movwf           mem_3c      ; 0DC1: 00BC
        movlw           0x6b        ; 0DC2: 306B
        movwf           mem_52      ; 0DC3: 00D2
        movlw           0x88        ; 0DC4: 3088
        call            I2CRead    ; 0DC5: 25FD

        movlp           0x08        ; 0DC6: 3188
        movwf           mem_3d      ; 0DC7: 00BD
        movlw           0x6c        ; 0DC8: 306C
        movwf           mem_52      ; 0DC9: 00D2
        movlw           0x88        ; 0DCA: 3088
        call            I2CRead    ; 0DCB: 25FD

        movlp           0x08        ; 0DCC: 3188
        movwf           mem_41      ; 0DCD: 00C1
        movlw           0x6d        ; 0DCE: 306D
        movwf           mem_52      ; 0DCF: 00D2
        movlw           0x88        ; 0DD0: 3088
        call            I2CRead    ; 0DD1: 25FD

        movlp           0x08        ; 0DD2: 3188
        movwf           mem_42      ; 0DD3: 00C2
        movlw           0x6e        ; 0DD4: 306E
        movwf           mem_52      ; 0DD5: 00D2
        movlw           0x88        ; 0DD6: 3088
        call            I2CRead    ; 0DD7: 25FD

        movlp           0x08        ; 0DD8: 3188
        movwf           mem_40      ; 0DD9: 00C0
        movlw           0x6f        ; 0DDA: 306F
        movwf           mem_52      ; 0DDB: 00D2
        movlw           0x88        ; 0DDC: 3088
        call            I2CRead    ; 0DDD: 25FD

        movlp           0x08        ; 0DDE: 3188
        movlb           0x01        ; 0DDF: 0021
        movwf           mem_d9      ; 0DE0: 00D9
        movlw           0x70        ; 0DE1: 3070
        movlb           0x00        ; 0DE2: 0020
        movwf           mem_52      ; 0DE3: 00D2
        movlw           0x88        ; 0DE4: 3088
        call            I2CRead    ; 0DE5: 25FD

        movlp           0x08        ; 0DE6: 3188
        movwf           mem_44      ; 0DE7: 00C4
        movlw           0x71        ; 0DE8: 3071
        movwf           mem_52      ; 0DE9: 00D2
        movlw           0x88        ; 0DEA: 3088
        call            I2CRead    ; 0DEB: 25FD

        movlp           0x08        ; 0DEC: 3188
        movlb           0x01        ; 0DED: 0021
        movwf           mem_db      ; 0DEE: 00DB
        movlw           0x72        ; 0DEF: 3072
        movlb           0x00        ; 0DF0: 0020
        movwf           mem_52      ; 0DF1: 00D2
        movlw           0x88        ; 0DF2: 3088
        call            I2CRead    ; 0DF3: 25FD

        movlp           0x08        ; 0DF4: 3188
        movwf           mem_43      ; 0DF5: 00C3
        movlw           0x73        ; 0DF6: 3073
        movwf           mem_52      ; 0DF7: 00D2
        movlw           0x88        ; 0DF8: 3088
        call            I2CRead    ; 0DF9: 25FD

        movlb           0x01        ; 0DFA: 0021
        movwf           mem_da      ; 0DFB: 00DA
        return                      ; 0DFC: 0008

;------------------------------------------------------------
; Subroutine: I2CRead
;
; called from: 0CD1
; called from: 0CD6
; called from: 0CDB
; called from: 0CE0
; called from: 0CE5
; called from: 0D0F
; called from: 0D14
; called from: 0D19
; called from: 0D1E
; called from: 0D23
; called from: 0D28
; called from: 0D4C
; called from: 0D51
; called from: 0D56
; called from: 0D5B
; called from: 0D60
; called from: 0D6A
; called from: 0D7B
; called from: 0D81
; called from: 0D87
; called from: 0D8D
; called from: 0D93
; called from: 0D9B
; called from: 0DA3
; called from: 0DAB
; called from: 0DB3
; called from: 0DB9
; called from: 0DBF
; called from: 0DC5
; called from: 0DCB
; called from: 0DD1
; called from: 0DD7
; called from: 0DDD
; called from: 0DE5
; called from: 0DEB
; called from: 0DF3
; called from: 0DF9
; called from: 1806
; called from: 192D
; called from: 1936
; called from: 1940
; called from: 19B4
; called from: 19BD
; called from: 19C7
; called from: 19E8
; called from: 19F1
; called from: 19FB
; called from: 20FC
; called from: 210A
; called from: 2113
; called from: 2124
; called from: 212D
; called from: 2145
; called from: 214E
; called from: 2165
; called from: 216B
; called from: 2393
; called from: 23B1
; called from: 23C0
; called from: 23C7
; called from: 23CE
; called from: 23DC
; called from: 23E3
; called from: 23FE
; called from: 2405
; called from: 271C
; called from: 2725
; called from: 27B2
; called from: 27BB
; called from: 27C4
; called from: 27CD
; called from: 27D6
; called from: 27DF
; called from: 27E8
; called from: 27F1
; called from: 2808
; called from: 2811
; called from: 281B
; called from: 3018
; called from: 3021
; called from: 302A
; called from: 3033
; called from: 303C
; called from: 3045
; called from: 308D
; called from: 3096
; called from: 30A0
; called from: 30AD
; called from: 30B6
; called from: 30C0
; called from: 3110
; called from: 3119
; called from: 3146
; called from: 314F
; called from: 3159
; called from: 331E
; called from: 3327
; called from: 3331
; called from: 3428
; called from: 3431
; called from: 343A
; called from: 3443
; called from: 344C
; called from: 3F4C
; called from: 3F55
; called from: 3F5E
; called from: 3F73
; called from: 3FB8

I2CRead
; jump here from: 0CEA
; jump here from: 0D65
        movlb           0x00        ; 0DFD: 0020
        movwf           mem_53      ; 0DFE: 00D3
        clrf            mem_54      ; 0DFF: 01D4
        bcf             INTCON, GIE ; 0E00: 138B
        call            I2CStart    ; 0E01: 2710

        movlp           0x08        ; 0E02: 3188
        movlw           0xa0        ; 0E03: 30A0
        call            I2CSend    ; 0E04: 262C

        movlp           0x08        ; 0E05: 3188
        call            I2CAck    ; 0E06: 2623

        movlp           0x08        ; 0E07: 3188
        movf            mem_53, W   ; 0E08: 0853
        call            I2CSend    ; 0E09: 262C

        movlp           0x08        ; 0E0A: 3188
        call            I2CAck    ; 0E0B: 2623

        movlp           0x08        ; 0E0C: 3188
        movf            mem_52, W   ; 0E0D: 0852
        call            I2CSend    ; 0E0E: 262C

        movlp           0x08        ; 0E0F: 3188
        call            I2CAck    ; 0E10: 2623

        movlp           0x08        ; 0E11: 3188
        call            I2CStart    ; 0E12: 2710

        movlp           0x08        ; 0E13: 3188
        movlw           0xa1        ; 0E14: 30A1
        call            I2CSend    ; 0E15: 262C

        movlp           0x08        ; 0E16: 3188
        call            I2CAck    ; 0E17: 2623

        movlp           0x3f        ; 0E18: 31BF
        call            I2CRecv    ; 0E19: 27E5

        movlp           0x08        ; 0E1A: 3188
        movwf           mem_54      ; 0E1B: 00D4
        movlp           0x10        ; 0E1C: 3190
        call            I2CNoAck    ; 0E1D: 2003

        movlp           0x08        ; 0E1E: 3188
        call            I2CStop    ; 0E1F: 27DC

        bsf             INTCON, GIE ; 0E20: 178B
        movf            mem_54, W   ; 0E21: 0854
        return                      ; 0E22: 0008

;------------------------------------------------------------
; Subroutine: I2CAck
;
; called from: 0CBA
; called from: 0CBF
; called from: 0CC4
; called from: 0CC9
; called from: 0CF3
; called from: 0CF8
; called from: 0CFD
; called from: 0D04
; called from: 0D30
; called from: 0D35
; called from: 0D3A
; called from: 0D41
; called from: 0E06
; called from: 0E0B
; called from: 0E10
; called from: 0E17

I2CAck
        bsf             PORTC, RC5  ; 0E23: 168E
        movlb           0x01        ; 0E24: 0021
        bsf             TRISC, TRISC5; 0E25: 168E
        movlb           0x00        ; 0E26: 0020
        bsf             PORTC, RC4  ; 0E27: 160E
        call            delay_2ns    ; 0E28: 271B

        movlp           0x08        ; 0E29: 3188
        bcf             PORTC, RC4  ; 0E2A: 120E
        goto            delay_1ns  ; 0E2B: 2F36

;------------------------------------------------------------
; Subroutine: I2CSend
;
; called from: 0CB8
; called from: 0CBD
; called from: 0CC2
; called from: 0CC7
; called from: 0CF1
; called from: 0CF6
; called from: 0CFB
; called from: 0D02
; called from: 0D2E
; called from: 0D33
; called from: 0D38
; called from: 0D3F
; called from: 0E04
; called from: 0E09
; called from: 0E0E
; called from: 0E15

I2CSend
        movlb           0x00        ; 0E2C: 0020
        movwf           mem_4f      ; 0E2D: 00CF
        movlb           0x01        ; 0E2E: 0021
        bcf             TRISC, TRISC5; 0E2F: 128E
        movlb           0x00        ; 0E30: 0020
        clrf            mem_50      ; 0E31: 01D0

label_0e32
; jump here from: 0E46
        bcf             PORTC, RC4  ; 0E32: 120E
        call            delay_2ns    ; 0E33: 271B

        movlp           0x08        ; 0E34: 3188
        btfss           mem_4f, 7   ; 0E35: 1FCF
        goto            loop_0e39   ; 0E36: 2E39

        bsf             PORTC, RC5  ; 0E37: 168E
        goto            label_0e3a  ; 0E38: 2E3A

loop_0e39
; jump here from: 0E36
        bcf             PORTC, RC5  ; 0E39: 128E

label_0e3a
; jump here from: 0E38
        call            delay_2ns    ; 0E3A: 271B

        movlp           0x08        ; 0E3B: 3188
        bsf             PORTC, RC4  ; 0E3C: 160E
        call            delay_2ns    ; 0E3D: 271B

        movlp           0x08        ; 0E3E: 3188
        movlw           0x08        ; 0E3F: 3008
        bcf             PORTC, RC4  ; 0E40: 120E
        lslf            mem_4f, f   ; 0E41: 35CF
        incf            mem_50, f   ; 0E42: 0AD0
        subwf           mem_50, W   ; 0E43: 0250
        btfsc           STATUS, C   ; 0E44: 1803
        return                      ; 0E45: 0008
        goto            label_0e32  ; 0E46: 2E32

;------------------------------------------------------------
; Subroutine: sub_0e47
;
; called from: 06A2
; called from: 0814
; called from: 0838
; called from: 08D2
; called from: 0923
; called from: 0951
; called from: 0A49
; called from: 2FF5

sub_0e47
        movlb           0x01        ; 0E47: 0021
        btfss           mem_bb, 0   ; 0E48: 1C3B
        goto            loop_0e4d   ; 0E49: 2E4D

        movlb           0x02        ; 0E4A: 0022
        bsf             mem_153, 0  ; 0E4B: 1453
        goto            label_0e4f  ; 0E4C: 2E4F

loop_0e4d
; jump here from: 0E49
        movlb           0x02        ; 0E4D: 0022
        bcf             mem_153, 0  ; 0E4E: 1053

label_0e4f
; jump here from: 0E4C
        movlb           0x01        ; 0E4F: 0021
        btfss           mem_bb, 1   ; 0E50: 1CBB
        goto            loop_0e55   ; 0E51: 2E55

        movlb           0x02        ; 0E52: 0022
        bsf             mem_154, 0  ; 0E53: 1454
        goto            label_0e57  ; 0E54: 2E57

loop_0e55
; jump here from: 0E51
        movlb           0x02        ; 0E55: 0022
        bcf             mem_154, 0  ; 0E56: 1054

label_0e57
; jump here from: 0E54
        movlb           0x01        ; 0E57: 0021
        btfss           mem_bb, 2   ; 0E58: 1D3B
        goto            loop_0e5d   ; 0E59: 2E5D

        movlb           0x02        ; 0E5A: 0022
        bsf             mem_155, 0  ; 0E5B: 1455
        goto            label_0e5f  ; 0E5C: 2E5F

loop_0e5d
; jump here from: 0E59
        movlb           0x02        ; 0E5D: 0022
        bcf             mem_155, 0  ; 0E5E: 1055

label_0e5f
; jump here from: 0E5C
        movlb           0x01        ; 0E5F: 0021
        btfss           mem_bb, 3   ; 0E60: 1DBB
        goto            loop_0e65   ; 0E61: 2E65

        movlb           0x02        ; 0E62: 0022
        bsf             mem_156, 0  ; 0E63: 1456
        goto            label_0e67  ; 0E64: 2E67

loop_0e65
; jump here from: 0E61
        movlb           0x02        ; 0E65: 0022
        bcf             mem_156, 0  ; 0E66: 1056

label_0e67
; jump here from: 0E64
        movlb           0x01        ; 0E67: 0021
        btfss           mem_bb, 4   ; 0E68: 1E3B
        goto            loop_0e6d   ; 0E69: 2E6D

        movlb           0x02        ; 0E6A: 0022
        bsf             mem_14f, 0  ; 0E6B: 144F
        goto            label_0e6f  ; 0E6C: 2E6F

loop_0e6d
; jump here from: 0E69
        movlb           0x02        ; 0E6D: 0022
        bcf             mem_14f, 0  ; 0E6E: 104F

label_0e6f
; jump here from: 0E6C
        movlb           0x01        ; 0E6F: 0021
        btfss           mem_bb, 5   ; 0E70: 1EBB
        goto            loop_0e75   ; 0E71: 2E75

        movlb           0x02        ; 0E72: 0022
        bsf             mem_150, 0  ; 0E73: 1450
        goto            label_0e77  ; 0E74: 2E77

loop_0e75
; jump here from: 0E71
        movlb           0x02        ; 0E75: 0022
        bcf             mem_150, 0  ; 0E76: 1050

label_0e77
; jump here from: 0E74
        movlb           0x01        ; 0E77: 0021
        btfss           mem_bb, 6   ; 0E78: 1F3B
        goto            loop_0e7d   ; 0E79: 2E7D

        movlb           0x02        ; 0E7A: 0022
        bsf             mem_151, 0  ; 0E7B: 1451
        goto            label_0e7f  ; 0E7C: 2E7F

loop_0e7d
; jump here from: 0E79
        movlb           0x02        ; 0E7D: 0022
        bcf             mem_151, 0  ; 0E7E: 1051

label_0e7f
; jump here from: 0E7C
        movlb           0x01        ; 0E7F: 0021
        btfss           mem_bb, 7   ; 0E80: 1FBB
        goto            loop_0e85   ; 0E81: 2E85

        movlb           0x02        ; 0E82: 0022
        bsf             mem_152, 0  ; 0E83: 1452
        goto            label_0e87  ; 0E84: 2E87

loop_0e85
; jump here from: 0E81
        movlb           0x02        ; 0E85: 0022
        bcf             mem_152, 0  ; 0E86: 1052

label_0e87
; jump here from: 0E84
        movlb           0x00        ; 0E87: 0020
        movlw           0x03        ; 0E88: 3003
        bcf             PORTE, RE0  ; 0E89: 1010
        movwf           mem_4f      ; 0E8A: 00CF
        movlw           0xa0        ; 0E8B: 30A0
        call            LCDSend2    ; 0E8C: 27C1

        movlp           0x08        ; 0E8D: 3188
        movlw           0x06        ; 0E8E: 3006
        movwf           mem_4f      ; 0E8F: 00CF
        movlw           0x00        ; 0E90: 3000
        call            LCDSend2    ; 0E91: 27C1

        movlp           0x08        ; 0E92: 3188
        movlw           0x04        ; 0E93: 3004
        movwf           mem_4f      ; 0E94: 00CF
        movlb           0x02        ; 0E95: 0022
        swapf           mem_14b, W  ; 0E96: 0E4B
        andlw           0x0f        ; 0E97: 390F
        call            LCDSend    ; 0E98: 26FB

        movlp           0x08        ; 0E99: 3188
        movlw           0x08        ; 0E9A: 3008
        movwf           mem_14f     ; 0E9B: 00CF
        movlb           0x02        ; 0E9C: 0022
        movf            mem_157, W  ; 0E9D: 0857
        call            LCDSend    ; 0E9E: 26FB

        movlp           0x08        ; 0E9F: 3188
        movlw           0x08        ; 0EA0: 3008
        movwf           mem_14f     ; 0EA1: 00CF
        movlb           0x02        ; 0EA2: 0022
        movf            mem_158, W  ; 0EA3: 0858
        call            LCDSend    ; 0EA4: 26FB

        movlp           0x08        ; 0EA5: 3188
        movlw           0x08        ; 0EA6: 3008
        movwf           mem_14f     ; 0EA7: 00CF
        movlb           0x02        ; 0EA8: 0022
        movf            mem_14d, W  ; 0EA9: 084D
        call            LCDSend    ; 0EAA: 26FB

        movlp           0x08        ; 0EAB: 3188
        movlw           0x08        ; 0EAC: 3008
        movwf           mem_14f     ; 0EAD: 00CF
        movlb           0x02        ; 0EAE: 0022
        movf            mem_14e, W  ; 0EAF: 084E
        call            LCDSend    ; 0EB0: 26FB

        movlp           0x08        ; 0EB1: 3188
        movlw           0x08        ; 0EB2: 3008
        movwf           mem_14f     ; 0EB3: 00CF
        movlb           0x02        ; 0EB4: 0022
        movf            mem_149, W  ; 0EB5: 0849
        call            LCDSend    ; 0EB6: 26FB

        movlp           0x08        ; 0EB7: 3188
        movlw           0x04        ; 0EB8: 3004
        movwf           mem_14f     ; 0EB9: 00CF
        movlb           0x02        ; 0EBA: 0022
        movf            mem_14a, W  ; 0EBB: 084A
        call            LCDSend    ; 0EBC: 26FB

        movlp           0x08        ; 0EBD: 3188
        movlw           0x08        ; 0EBE: 3008
        movwf           mem_14f     ; 0EBF: 00CF
        movlb           0x02        ; 0EC0: 0022
        movf            mem_153, W  ; 0EC1: 0853
        call            LCDSend    ; 0EC2: 26FB

        movlp           0x08        ; 0EC3: 3188
        movlw           0x08        ; 0EC4: 3008
        movwf           mem_14f     ; 0EC5: 00CF
        movlb           0x02        ; 0EC6: 0022
        movf            mem_154, W  ; 0EC7: 0854
        call            LCDSend    ; 0EC8: 26FB

        movlp           0x08        ; 0EC9: 3188
        movlw           0x08        ; 0ECA: 3008
        movwf           mem_14f     ; 0ECB: 00CF
        movlb           0x02        ; 0ECC: 0022
        movf            mem_155, W  ; 0ECD: 0855
        call            LCDSend    ; 0ECE: 26FB

        movlp           0x08        ; 0ECF: 3188
        movlw           0x08        ; 0ED0: 3008
        movwf           mem_14f     ; 0ED1: 00CF
        movlb           0x02        ; 0ED2: 0022
        movf            mem_156, W  ; 0ED3: 0856
        call            LCDSend    ; 0ED4: 26FB

        movlp           0x08        ; 0ED5: 3188
        movlw           0x08        ; 0ED6: 3008
        movwf           mem_14f     ; 0ED7: 00CF
        movlb           0x02        ; 0ED8: 0022
        movf            mem_14c, W  ; 0ED9: 084C
        call            LCDSend    ; 0EDA: 26FB

        movlp           0x08        ; 0EDB: 3188
        movlw           0x04        ; 0EDC: 3004
        movwf           mem_14f     ; 0EDD: 00CF
        movlb           0x02        ; 0EDE: 0022
        movf            mem_14b, W  ; 0EDF: 084B
        call            LCDSend    ; 0EE0: 26FB

        movlp           0x08        ; 0EE1: 3188
        movlw           0x08        ; 0EE2: 3008
        movwf           mem_14f     ; 0EE3: 00CF
        movlb           0x02        ; 0EE4: 0022
        movf            mem_14f, W  ; 0EE5: 084F
        call            LCDSend    ; 0EE6: 26FB

        movlp           0x08        ; 0EE7: 3188
        movlw           0x08        ; 0EE8: 3008
        movwf           mem_14f     ; 0EE9: 00CF
        movlb           0x02        ; 0EEA: 0022
        movf            mem_150, W  ; 0EEB: 0850
        call            LCDSend    ; 0EEC: 26FB

        movlp           0x08        ; 0EED: 3188
        movlw           0x08        ; 0EEE: 3008
        movwf           mem_14f     ; 0EEF: 00CF
        movlb           0x02        ; 0EF0: 0022
        movf            mem_151, W  ; 0EF1: 0851
        call            LCDSend    ; 0EF2: 26FB

        movlp           0x08        ; 0EF3: 3188
        movlw           0x08        ; 0EF4: 3008
        movwf           mem_14f     ; 0EF5: 00CF
        movlb           0x02        ; 0EF6: 0022
        movf            mem_152, W  ; 0EF7: 0852
        call            LCDSend    ; 0EF8: 26FB

        bsf             LATE, LATE0 ; 0EF9: 1410
        return                      ; 0EFA: 0008

;------------------------------------------------------------
; Subroutine: LCDSend
;
; called from: 0E98
; called from: 0E9E
; called from: 0EA4
; called from: 0EAA
; called from: 0EB0
; called from: 0EB6
; called from: 0EBC
; called from: 0EC2
; called from: 0EC8
; called from: 0ECE
; called from: 0ED4
; called from: 0EDA
; called from: 0EE0
; called from: 0EE6
; called from: 0EEC
; called from: 0EF2
; called from: 0EF8

LCDSend
        movlb           0x00        ; 0EFB: 0020
        movwf           mem_50      ; 0EFC: 00D0
        clrf            mem_51      ; 0EFD: 01D1

label_0efe
; jump here from: 0F0F
        movf            mem_4f, W   ; 0EFE: 084F
        subwf           mem_51, W   ; 0EFF: 0251
        btfsc           STATUS, C   ; 0F00: 1803
        return                      ; 0F01: 0008
        btfsc           mem_50, 0   ; 0F02: 1850
        goto            loop_0f06   ; 0F03: 2F06

        bcf             PORTA, RA4  ; 0F04: 120C
        goto            label_0f07  ; 0F05: 2F07

loop_0f06
; jump here from: 0F03
        bsf             PORTA, RA4  ; 0F06: 160C

label_0f07
; jump here from: 0F05
        bcf             PORTA, RA5  ; 0F07: 128C
        call            delay_10ns    ; 0F08: 27D5

        movlp           0x08        ; 0F09: 3188
        bsf             PORTA, RA5  ; 0F0A: 168C
        call            delay_10ns    ; 0F0B: 27D5

        movlp           0x08        ; 0F0C: 3188
        lsrf            mem_50, f   ; 0F0D: 36D0
        incf            mem_51, f   ; 0F0E: 0AD1
        goto            label_0efe  ; 0F0F: 2EFE

;------------------------------------------------------------
; Subroutine: I2CStart
;
; called from: 0CB5
; called from: 0CEE
; called from: 0D2B
; called from: 0E01
; called from: 0E12

I2CStart
        movlb           0x01        ; 0F10: 0021
        bcf             TRISC, TRISC5; 0F11: 128E
        movlb           0x00        ; 0F12: 0020
        bsf             PORTC, RC5  ; 0F13: 168E
        bsf             PORTC, RC4  ; 0F14: 160E
        call            delay_2ns    ; 0F15: 271B

        movlp           0x08        ; 0F16: 3188
        bcf             PORTC, RC5  ; 0F17: 128E
        call            delay_2ns    ; 0F18: 271B

        bcf             PORTC, RC4  ; 0F19: 120E
        return                      ; 0F1A: 0008

;------------------------------------------------------------
; Subroutine: delay_2ns
;
; called from: 0E28
; called from: 0E33
; called from: 0E3A
; called from: 0E3D
; called from: 0F15
; called from: 0F18
; called from: 0FD5
; called from: 0FD7
; called from: 0FD9
; called from: 0FE0
; called from: 0FE3
; called from: 1008
; called from: 100C
; called from: 3340
; called from: 3349
; called from: 3FEC
; called from: 3FF2
; called from: 3FF6

delay_2ns
        goto            delay_1ns  ; 0F1B: 2F36

;------------------------------------------------------------
; Subroutine: sub_0f1c
;
; called from: 0808
; called from: 080D
; called from: 093A
; called from: 0944
; called from: 0FF1

sub_0f1c
        movlw           0x88        ; 0F1C: 3088
        movlb           0x00        ; 0F1D: 0020
        movwf           mem_4f      ; 0F1E: 00CF
        movlw           0x13        ; 0F1F: 3013
        movwf           mem_50      ; 0F20: 00D0

label_0f21
; jump here from: 0F2A
        movlw           0x01        ; 0F21: 3001
        subwf           mem_4f, f   ; 0F22: 02CF
        movlw           0x00        ; 0F23: 3000
        subwfb          mem_50, f   ; 0F24: 3BD0
        incf            mem_4f, W   ; 0F25: 0A4F
        btfsc           STATUS, Z   ; 0F26: 1903
        incf            mem_50, W   ; 0F27: 0A50
        btfsc           STATUS, Z   ; 0F28: 1903
        return                      ; 0F29: 0008
        goto            label_0f21  ; 0F2A: 2F21

;------------------------------------------------------------
; Subroutine: radio_disable2
;
; called from: 097F
; called from: 0A06

radio_disable2
        movlb           0x00        ; 0F2B: 0020
        bcf             PORTB, RB1  ; 0F2C: 108D
        movlb           0x02        ; 0F2D: 0022
        clrf            mem_radio_status     ; 0F2E: 01C5
        bcf             INTCON, INTE; 0F2F: 120B
        return                      ; 0F30: 0008

;------------------------------------------------------------
; Subroutine: sub_0f31
;
; called from: 093D
; called from: 0947

sub_0f31
        movlw           0x8d        ; 0F31: 308D
        movlb           0x00        ; 0F32: 0020
        movwf           T1CON       ; 0F33: 0098
        clrf            T1GCON      ; 0F34: 0199
        return                      ; 0F35: 0008

delay_1ns
; jump here from: 0E2B
; jump here from: 0F1B
; jump here from: 0FDB
; jump here from: 0FE6
; jump here from: 100F
        return                      ; 0F36: 0008

;------------------------------------------------------------
; Subroutine: sub_0f37
;
; called from: 0B90
; called from: 0BBA

sub_0f37
        movlb           0x01        ; 0F37: 0021
        movwf           mem_a9      ; 0F38: 00A9
        movlb           0x00        ; 0F39: 0020
        movf            mem_2a, W   ; 0F3A: 082A
        movlb           0x01        ; 0F3B: 0021
        movwf           mem_a8      ; 0F3C: 00A8
        movlb           0x00        ; 0F3D: 0020
        movf            mem_2d, W   ; 0F3E: 082D
        movlb           0x01        ; 0F3F: 0021
        subwf           mem_a9, W   ; 0F40: 0229
        btfss           STATUS, Z   ; 0F41: 1D03
        goto            loop_0f47   ; 0F42: 2F47

        movlb           0x00        ; 0F43: 0020
        movf            mem_2c, W   ; 0F44: 082C
        movlb           0x01        ; 0F45: 0021
        subwf           mem_a8, W   ; 0F46: 0228

loop_0f47
; jump here from: 0F42
        btfsc           STATUS, C   ; 0F47: 1803
        goto            loop_0f51   ; 0F48: 2F51

        movlb           0x00        ; 0F49: 0020
        movf            mem_2d, W   ; 0F4A: 082D
        movlb           0x01        ; 0F4B: 0021
        movwf           mem_a9      ; 0F4C: 00A9
        movlb           0x00        ; 0F4D: 0020
        movf            mem_2c, W   ; 0F4E: 082C
        movlb           0x01        ; 0F4F: 0021
        movwf           mem_a8      ; 0F50: 00A8

loop_0f51
; jump here from: 0F48
        movf            mem_ab, W   ; 0F51: 082B
        subwf           mem_a9, W   ; 0F52: 0229
        btfss           STATUS, Z   ; 0F53: 1D03
        return                      ; 0F54: 0008
        movf            mem_2a, W   ; 0F55: 082A
        subwf           mem_28, W   ; 0F56: 0228
        return                      ; 0F57: 0008

;------------------------------------------------------------
; Subroutine: sub_0f58
;
; called from: 0C66
; called from: 0C8F

sub_0f58
        movlb           0x00        ; 0F58: 0020
        movwf           mem_55      ; 0F59: 00D5
        movlb           0x01        ; 0F5A: 0021
        movf            mem_ab, W   ; 0F5B: 082B
        movlb           0x00        ; 0F5C: 0020
        movwf           mem_56      ; 0F5D: 00D6
        retlw           0x88        ; 0F5E: 3488

;------------------------------------------------------------
; Subroutine: sub_0f5f
;
; called from: 0C2D
; called from: 0C45
; called from: 0C6E
; called from: 222D

sub_0f5f
        movwf           mem_2a      ; 0F5F: 00AA
        movlw           0x60        ; 0F60: 3060
        clrf            mem_2b      ; 0F61: 01AB
        movwf           mem_55      ; 0F62: 00D5
        movf            mem_2b, W   ; 0F63: 082B
        movwf           mem_56      ; 0F64: 00D6
        retlw           0x88        ; 0F65: 3488

;------------------------------------------------------------
; Subroutine: sub_0f66
;
; called from: 0C6A
; called from: 0C93
; called from: 12F5
; called from: 1315

sub_0f66
        movlw           0x65        ; 0F66: 3065
        movwf           mem_55      ; 0F67: 00D5
        movlb           0x01        ; 0F68: 0021
        movf            mem_aa, W   ; 0F69: 082A
        movlb           0x00        ; 0F6A: 0020
        movwf           mem_56      ; 0F6B: 00D6
        retlw           0x88        ; 0F6C: 3488

;------------------------------------------------------------
; Subroutine: sub_0f6d
;
; called from: 0C3D
; called from: 0C55
; called from: 0C7E

sub_0f6d
        movlw           0x32        ; 0F6D: 3032
        movwf           mem_2c      ; 0F6E: 00AC
        movlw           0x62        ; 0F6F: 3062
        clrf            mem_2d      ; 0F70: 01AD
        movwf           mem_55      ; 0F71: 00D5
        movf            mem_2d, W   ; 0F72: 082D
        movwf           mem_56      ; 0F73: 00D6
        retlw           0x88        ; 0F74: 3488

;------------------------------------------------------------
; Subroutine: sub_0f75
;
; called from: 0C64
; called from: 0C8D

sub_0f75
        movlw           0x96        ; 0F75: 3096
        movlb           0x01        ; 0F76: 0021
        movwf           mem_aa      ; 0F77: 00AA
        movlw           0x64        ; 0F78: 3064
        clrf            mem_ab      ; 0F79: 01AB
        return                      ; 0F7A: 0008

;------------------------------------------------------------
; Subroutine: sub_0f7b
;
; called from: 0ADA
; called from: 0B1E
; called from: 2B22
; called from: 2B32

sub_0f7b
        movf            mem_38, W   ; 0F7B: 0838
        movwf           mem_55      ; 0F7C: 00D5
        movf            mem_35, W   ; 0F7D: 0835
        movwf           mem_56      ; 0F7E: 00D6
        movf            mem_39, W   ; 0F7F: 0839
        return                      ; 0F80: 0008

;------------------------------------------------------------
; Subroutine: sub_0f81
;
; called from: 08E8
; called from: 08ED
; called from: 21AA
; called from: 21B1

sub_0f81
        movwf           mem_55      ; 0F81: 00D5
        movlw           0x88        ; 0F82: 3088
        clrf            mem_56      ; 0F83: 01D6
        incf            mem_56, f   ; 0F84: 0AD6
        return                      ; 0F85: 0008

;------------------------------------------------------------
; Subroutine: sub_0f86
;
; called from: 08D4
; called from: 0925

sub_0f86
        movlw           0x7f        ; 0F86: 307F
        movlb           0x00        ; 0F87: 0020
        andwf           PORTD, W    ; 0F88: 050F
        movlb           0x03        ; 0F89: 0023
        movwf           mem_1d8     ; 0F8A: 00D8
        return                      ; 0F8B: 0008

;------------------------------------------------------------
; Subroutine: sub_0f8c
;
; called from: 0C60
; called from: 0C89

sub_0f8c
        clrf            mem_42      ; 0F8C: 01C2
        movwf           mem_40      ; 0F8D: 00C0
        movlb           0x01        ; 0F8E: 0021
        clrf            mem_d9      ; 0F8F: 01D9
        return                      ; 0F90: 0008

;------------------------------------------------------------
; Subroutine: sub_0f91
;
; called from: 0D0D
; called from: 0D4A

sub_0f91
        bsf             INTCON, GIE ; 0F91: 178B
        movlw           0x7f        ; 0F92: 307F
        movwf           mem_52      ; 0F93: 00D2
        movf            mem_56, W   ; 0F94: 0856
        return                      ; 0F95: 0008

;------------------------------------------------------------
; Subroutine: sub_0f96
;
; called from: 080F

sub_0f96
        call            sub_0fa6    ; 0F96: 27A6

        movlp           0x08        ; 0F97: 3188
        movlw           0x01        ; 0F98: 3001
        call            sub_0fb4    ; 0F99: 27B4

        movlp           0x08        ; 0F9A: 3188
        call            sub_0fa6    ; 0F9B: 27A6

        movlp           0x08        ; 0F9C: 3188
        movlw           0x03        ; 0F9D: 3003
        call            sub_0fb4    ; 0F9E: 27B4

        movlp           0x08        ; 0F9F: 3188
        call            sub_0fa6    ; 0FA0: 27A6

        movlp           0x08        ; 0FA1: 3188
        movlw           0x28        ; 0FA2: 3028
        call            sub_0fb4    ; 0FA3: 27B4

        movlp           0x08        ; 0FA4: 3188
        goto            sub_0fa6    ; 0FA5: 2FA6

;------------------------------------------------------------
; Subroutine: sub_0fa6
;
; called from: 0F96
; called from: 0F9B
; called from: 0FA0

sub_0fa6
; jump here from: 0FA5
        movlw           0xf4        ; 0FA6: 30F4
        movwf           mem_4f      ; 0FA7: 00CF
        movlw           0x01        ; 0FA8: 3001
        movwf           mem_50      ; 0FA9: 00D0

label_0faa
; jump here from: 0FB3
        movlw           0x01        ; 0FAA: 3001
        subwf           mem_4f, f   ; 0FAB: 02CF
        movlw           0x00        ; 0FAC: 3000
        subwfb          mem_50, f   ; 0FAD: 3BD0
        incf            mem_4f, W   ; 0FAE: 0A4F
        btfsc           STATUS, Z   ; 0FAF: 1903
        incf            mem_50, W   ; 0FB0: 0A50
        btfsc           STATUS, Z   ; 0FB1: 1903
        return                      ; 0FB2: 0008
        goto            label_0faa  ; 0FB3: 2FAA

;------------------------------------------------------------
; Subroutine: sub_0fb4
;
; called from: 0F99
; called from: 0F9E
; called from: 0FA3

sub_0fb4
        movwf           mem_52      ; 0FB4: 00D2
        movlw           0x03        ; 0FB5: 3003
        bcf             PORTE, RE0  ; 0FB6: 1010
        movwf           mem_4f      ; 0FB7: 00CF
        movlw           0x80        ; 0FB8: 3080
        call            LCDSend2    ; 0FB9: 27C1

        movlp           0x08        ; 0FBA: 3188
        movlw           0x09        ; 0FBB: 3009
        movwf           mem_4f      ; 0FBC: 00CF
        movf            mem_52, W   ; 0FBD: 0852
        call            LCDSend2    ; 0FBE: 27C1

        bsf             PORTE, RE0  ; 0FBF: 1410
        return                      ; 0FC0: 0008

;------------------------------------------------------------
; Subroutine: LCDSend2
;
; called from: 0E8C
; called from: 0E91
; called from: 0FB9
; called from: 0FBE

LCDSend2
        movwf           mem_50      ; 0FC1: 00D0
        clrf            mem_51      ; 0FC2: 01D1

label_0fc3
; jump here from: 0FD4
        movf            mem_4f, W   ; 0FC3: 084F
        subwf           mem_51, W   ; 0FC4: 0251
        btfsc           STATUS, C   ; 0FC5: 1803
        return                      ; 0FC6: 0008
        btfsc           mem_50, 7   ; 0FC7: 1BD0
        goto            loop_0fcb   ; 0FC8: 2FCB

        bcf             PORTA, RA4  ; 0FC9: 120C
        goto            label_0fcc  ; 0FCA: 2FCC

loop_0fcb
; jump here from: 0FC8
        bsf             PORTA, RA4  ; 0FCB: 160C

label_0fcc
; jump here from: 0FCA
        bcf             PORTA, RA5  ; 0FCC: 128C
        call            delay_10ns    ; 0FCD: 27D5

        movlp           0x08        ; 0FCE: 3188
        bsf             PORTA, RA5  ; 0FCF: 168C
        call            delay_10ns    ; 0FD0: 27D5

        movlp           0x08        ; 0FD1: 3188
        lslf            mem_50, f   ; 0FD2: 35D0
        incf            mem_51, f   ; 0FD3: 0AD1
        goto            label_0fc3  ; 0FD4: 2FC3

;------------------------------------------------------------
; Subroutine: delay_10ns
;
; called from: 0F08
; called from: 0F0B
; called from: 0FCD
; called from: 0FD0

delay_10ns
        call            delay_2ns    ; 0FD5: 271B

        movlp           0x08        ; 0FD6: 3188
        call            delay_2ns    ; 0FD7: 271B

        movlp           0x08        ; 0FD8: 3188
        call            delay_2ns    ; 0FD9: 271B

        movlp           0x08        ; 0FDA: 3188
        goto            delay_1ns  ; 0FDB: 2F36

;------------------------------------------------------------
; Subroutine: I2CStop
;
; called from: 0CCB
; called from: 0D0B
; called from: 0D48
; called from: 0E1F

I2CStop
        movlb           0x01        ; 0FDC: 0021
        bcf             TRISC, TRISC5; 0FDD: 128E
        movlb           0x00        ; 0FDE: 0020
        bcf             PORTC, RC5  ; 0FDF: 128E
        call            delay_2ns    ; 0FE0: 271B

        movlp           0x08        ; 0FE1: 3188
        bsf             PORTC, RC4  ; 0FE2: 160E
        call            delay_2ns    ; 0FE3: 271B

        movlp           0x08        ; 0FE4: 3188
        bsf             PORTC, RC5  ; 0FE5: 168E
        goto            delay_1ns  ; 0FE6: 2F36

;------------------------------------------------------------
; Subroutine: sub_0fe7
;
; called from: 081D
; called from: 082C
; called from: 0840

sub_0fe7
        movlw           0x0a        ; 0FE7: 300A
        movlb           0x00        ; 0FE8: 0020
        movwf           mem_51      ; 0FE9: 00D1
        clrwdt                      ; 0FEA: 0064

label_0feb
; jump here from: 0FF3
        movlb           0x00        ; 0FEB: 0020
        decf            mem_51, f   ; 0FEC: 03D1
        movf            mem_51, W   ; 0FED: 0851
        xorlw           0xff        ; 0FEE: 3AFF
        btfsc           STATUS, Z   ; 0FEF: 1903
        return                      ; 0FF0: 0008
        call            sub_0f1c    ; 0FF1: 271C

        movlp           0x08        ; 0FF2: 3188
        goto            label_0feb  ; 0FF3: 2FEB

;------------------------------------------------------------
; Subroutine: disable_serial
;
; called from: 0967
; called from: 0988

disable_serial
        movlb           0x01        ; 0FF4: 0021
        bcf             PIE1, TXIE  ; 0FF5: 1211
        movlb           0x03        ; 0FF6: 0023
        bcf             TXSTA, TXEN ; 0FF7: 129E
        bcf             RCSTA, CREN ; 0FF8: 121D
        return                      ; 0FF9: 0008

;------------------------------------------------------------
; Subroutine: init_serial
;
; called from: 0985

init_serial
        movlb           0x01        ; 0FFA: 0021
        bcf             PIE1, TXIE  ; 0FFB: 1211
        movlb           0x03        ; 0FFC: 0023
        bsf             TXSTA, TXEN ; 0FFD: 169E
        bsf             RCSTA, CREN ; 0FFE: 161D
        return                      ; 0FFF: 0008
Bank1000_Vector org 0x1000

;------------------------------------------------------------
; Subroutine: sub_1000
;
; called from: 0177

sub_1000
        bcf             INTCON, T0IF; 1000: 110B
        bsf             INTCON, T0IE; 1001: 168B
        return                      ; 1002: 0008

;------------------------------------------------------------
; Subroutine: I2CNoAck
;
; called from: 0E1D

I2CNoAck
        movlb           0x01        ; 1003: 0021
        bcf             TRISC, TRISC5; 1004: 128E
        movlb           0x00        ; 1005: 0020
        bsf             PORTC, RC5  ; 1006: 168E
        movlp           0x0f        ; 1007: 318F
        call            delay_2ns    ; 1008: 271B

        movlp           0x10        ; 1009: 3190
        bsf             PORTC, RC4  ; 100A: 160E
        movlp           0x0f        ; 100B: 318F
        call            delay_2ns    ; 100C: 271B

        bcf             PORTC, RC4  ; 100D: 120E
        movlp           0x0f        ; 100E: 318F
        goto            delay_1ns  ; 100F: 2F36

label_1010
; jump here from: 2F47
        goto            label_1024  ; 1010: 2824
;
; end of label_1010
;------------------------------------------------------------


loop_1011
; jump here from: 1028
        call            sub_1034    ; 1011: 2034

        movlp           0x0c        ; 1012: 318C
        call            I2CWrite    ; 1013: 24B3

        movlw           0x07        ; 1014: 3007
        movwf           mem_3b      ; 1015: 00BB
        movf            mem_3c, W   ; 1016: 083C
        movwf           mem_46      ; 1017: 00C6
        movf            mem_3d, W   ; 1018: 083D
        movwf           mem_45      ; 1019: 00C5

label_101a
; jump here from: 1023
; jump here from: 1032
        clrf            mem_3a      ; 101A: 01BA
        return                      ; 101B: 0008

loop_101c
; jump here from: 102B
        goto            label_16ca  ; 101C: 2ECA

loop_101d
; jump here from: 102E
        goto            label_16d2  ; 101D: 2ED2
;
; end of loop_101d
;------------------------------------------------------------


loop_101e
; jump here from: 1031
        call            sub_1034    ; 101E: 2034

        movlp           0x0c        ; 101F: 318C
        call            I2CWrite    ; 1020: 24B3

        movlp           0x10        ; 1021: 3190
        clrf            mem_3b      ; 1022: 01BB
        goto            label_101a  ; 1023: 281A

label_1024
; jump here from: 1010
        movlb           0x00        ; 1024: 0020
        movf            mem_3a, W   ; 1025: 083A
        xorlw           0x01        ; 1026: 3A01
        btfsc           STATUS, Z   ; 1027: 1903
        goto            loop_1011   ; 1028: 2811

        xorlw           0x03        ; 1029: 3A03
        btfsc           STATUS, Z   ; 102A: 1903
        goto            loop_101c   ; 102B: 281C

        xorlw           0x01        ; 102C: 3A01
        btfsc           STATUS, Z   ; 102D: 1903
        goto            loop_101d   ; 102E: 281D

        xorlw           0x07        ; 102F: 3A07
        btfsc           STATUS, Z   ; 1030: 1903
        goto            loop_101e   ; 1031: 281E
        goto            label_101a  ; 1032: 281A
;
; end of label_1024
;------------------------------------------------------------

        return                      ; 1033: 0008

;------------------------------------------------------------
; Subroutine: sub_1034
;
; called from: 1011
; called from: 101E

sub_1034
        movf            mem_45, W   ; 1034: 0845
        movwf           mem_3f      ; 1035: 00BF
        movlw           0x69        ; 1036: 3069
        movwf           mem_55      ; 1037: 00D5
        movf            mem_3f, W   ; 1038: 083F
        movwf           mem_56      ; 1039: 00D6
        retlw           0x88        ; 103A: 3488

label_103b
; jump here from: 2F38
        goto            label_1060  ; 103B: 2860

loop_103c
; jump here from: 1064
        call            sub_1070    ; 103C: 2070

        movlp           0x0c        ; 103D: 318C
        call            I2CWrite    ; 103E: 24B3

        movlp           0x10        ; 103F: 3190
        movlw           0x04        ; 1040: 3004
        movwf           mem_3b      ; 1041: 00BB
        movlb           0x01        ; 1042: 0021
        movf            mem_e3, W   ; 1043: 0863
        movlb           0x00        ; 1044: 0020
        movwf           mem_45      ; 1045: 00C5
        movlw           0x00        ; 1046: 3000
        call            sub_1682    ; 1047: 2682

loop_1048
; jump here from: 104F
; jump here from: 1051
; jump here from: 1056
; jump here from: 1059
; jump here from: 105F
; jump here from: 106E
        movlb           0x00        ; 1048: 0020
        clrf            mem_3a      ; 1049: 01BA
        return                      ; 104A: 0008

loop_104b
; jump here from: 1067
        movlw           0x06        ; 104B: 3006
        incf            mem_45, f   ; 104C: 0AC5
        subwf           mem_45, W   ; 104D: 0245
        btfss           STATUS, C   ; 104E: 1C03
        goto            loop_1048   ; 104F: 2848

        clrf            mem_45      ; 1050: 01C5
        goto            loop_1048   ; 1051: 2848

loop_1052
; jump here from: 106A
        movlw           0x06        ; 1052: 3006
        decf            mem_45, f   ; 1053: 03C5
        subwf           mem_45, W   ; 1054: 0245
        btfss           STATUS, C   ; 1055: 1C03
        goto            loop_1048   ; 1056: 2848

        movlw           0x05        ; 1057: 3005
        movwf           mem_45      ; 1058: 00C5
        goto            loop_1048   ; 1059: 2848

loop_105a
; jump here from: 106D
        call            sub_1070    ; 105A: 2070

        movlp           0x0c        ; 105B: 318C
        call            I2CWrite    ; 105C: 24B3

        movlp           0x10        ; 105D: 3190
        clrf            mem_3b      ; 105E: 01BB
        goto            loop_1048   ; 105F: 2848

label_1060
; jump here from: 103B
        movlb           0x00        ; 1060: 0020
        movf            mem_3a, W   ; 1061: 083A
        xorlw           0x01        ; 1062: 3A01
        btfsc           STATUS, Z   ; 1063: 1903
        goto            loop_103c   ; 1064: 283C

        xorlw           0x03        ; 1065: 3A03
        btfsc           STATUS, Z   ; 1066: 1903
        goto            loop_104b   ; 1067: 284B

        xorlw           0x01        ; 1068: 3A01
        btfsc           STATUS, Z   ; 1069: 1903
        goto            loop_1052   ; 106A: 2852

        xorlw           0x07        ; 106B: 3A07
        btfsc           STATUS, Z   ; 106C: 1903
        goto            loop_105a   ; 106D: 285A
        goto            loop_1048   ; 106E: 2848
;
; end of label_1060
;------------------------------------------------------------

        return                      ; 106F: 0008

;------------------------------------------------------------
; Subroutine: sub_1070
;
; called from: 103C
; called from: 105A

sub_1070
        movf            mem_45, W   ; 1070: 0845
        movlb           0x01        ; 1071: 0021
        movwf           mem_b4      ; 1072: 00B4
        movlw           0x06        ; 1073: 3006
        movlb           0x00        ; 1074: 0020
        movwf           mem_55      ; 1075: 00D5
        movlb           0x01        ; 1076: 0021
        movf            mem_b4, W   ; 1077: 0834
        movlb           0x00        ; 1078: 0020
        movwf           mem_56      ; 1079: 00D6
        retlw           0x88        ; 107A: 3488

label_107b
; jump here from: 2FA1
        goto            label_10a5  ; 107B: 28A5

loop_107c
; jump here from: 10A9
        movf            mem_45, W   ; 107C: 0845
        movwf           mem_37      ; 107D: 00B7
        movlp           0x26        ; 107E: 31A6
        call            sub_2627    ; 107F: 2627

        movlp           0x10        ; 1080: 3190
        movlb           0x01        ; 1081: 0021
        movwf           mem_d6      ; 1082: 00D6
        call            sub_10b5    ; 1083: 20B5

        movlp           0x0c        ; 1084: 318C
        call            I2CWrite    ; 1085: 24B3

        movlb           0x03        ; 1086: 0023
        movlw           0x19        ; 1087: 3019
        clrf            mem_1c9     ; 1088: 01C9
        incf            mem_1c9, f  ; 1089: 0AC9
        movlb           0x00        ; 108A: 0020
        movwf           mem_3b      ; 108B: 00BB
        movf            mem_35, W   ; 108C: 0835
        movwf           mem_46      ; 108D: 00C6
        movf            mem_38, W   ; 108E: 0838
        movwf           mem_45      ; 108F: 00C5

label_1090
; jump here from: 10A4
; jump here from: 10B3
        clrf            mem_3a      ; 1090: 01BA
        return                      ; 1091: 0008

loop_1092
; jump here from: 10AC
        goto            label_16ca  ; 1092: 2ECA

loop_1093
; jump here from: 10AF
        goto            label_16d2  ; 1093: 2ED2
;
; end of loop_1093
;------------------------------------------------------------


loop_1094
; jump here from: 10B2
        movf            mem_45, W   ; 1094: 0845
        movwf           mem_37      ; 1095: 00B7
        movlp           0x26        ; 1096: 31A6
        call            sub_2627    ; 1097: 2627

        movlp           0x10        ; 1098: 3190
        movlb           0x01        ; 1099: 0021
        movwf           mem_d6      ; 109A: 00D6
        call            sub_10b5    ; 109B: 20B5

        movlp           0x0c        ; 109C: 318C
        call            I2CWrite    ; 109D: 24B3

        movlp           0x10        ; 109E: 3190
        movlb           0x03        ; 109F: 0023
        clrf            mem_1c9     ; 10A0: 01C9
        incf            mem_1c9, f  ; 10A1: 0AC9
        movlb           0x00        ; 10A2: 0020
        clrf            mem_3b      ; 10A3: 01BB
        goto            label_1090  ; 10A4: 2890

label_10a5
; jump here from: 107B
        movlb           0x00        ; 10A5: 0020
        movf            mem_3a, W   ; 10A6: 083A
        xorlw           0x01        ; 10A7: 3A01
        btfsc           STATUS, Z   ; 10A8: 1903
        goto            loop_107c   ; 10A9: 287C

        xorlw           0x03        ; 10AA: 3A03
        btfsc           STATUS, Z   ; 10AB: 1903
        goto            loop_1092   ; 10AC: 2892

        xorlw           0x01        ; 10AD: 3A01
        btfsc           STATUS, Z   ; 10AE: 1903
        goto            loop_1093   ; 10AF: 2893

        xorlw           0x07        ; 10B0: 3A07
        btfsc           STATUS, Z   ; 10B1: 1903
        goto            loop_1094   ; 10B2: 2894
        goto            label_1090  ; 10B3: 2890
;
; end of label_10a5
;------------------------------------------------------------

        return                      ; 10B4: 0008

;------------------------------------------------------------
; Subroutine: sub_10b5
;
; called from: 0B3B
; called from: 1083
; called from: 109B

sub_10b5
        movlw           0x14        ; 10B5: 3014
        movlb           0x00        ; 10B6: 0020
        movwf           mem_55      ; 10B7: 00D5
        movlb           0x01        ; 10B8: 0021
        movf            mem_d6, W   ; 10B9: 0856
        movlb           0x00        ; 10BA: 0020
        movwf           mem_56      ; 10BB: 00D6
        retlw           0x88        ; 10BC: 3488

label_10bd
; jump here from: 2F3D
        goto            label_10f4  ; 10BD: 28F4

loop_10be
; jump here from: 10F8
        movlp           0x0c        ; 10BE: 318C
        call            sub_0c08    ; 10BF: 2408

        movlp           0x10        ; 10C0: 3190
        goto            label_10d5  ; 10C1: 28D5

loop_10c2
; jump here from: 10D9
        movlw           0x11        ; 10C2: 3011
        movlb           0x00        ; 10C3: 0020
        movwf           mem_3b      ; 10C4: 00BB
        movf            mem_2b, W   ; 10C5: 082B
        movwf           mem_29      ; 10C6: 00A9
        movf            mem_2a, W   ; 10C7: 082A
        movwf           mem_28      ; 10C8: 00A8
        movlw           0x03        ; 10C9: 3003
        movlb           0x01        ; 10CA: 0021
        movwf           mem_be      ; 10CB: 00BE
        goto            label_10db  ; 10CC: 28DB

label_10cd
; jump here from: 10DA
        movlw           0x05        ; 10CD: 3005
        movlb           0x00        ; 10CE: 0020
        movwf           mem_3b      ; 10CF: 00BB
        movf            mem_3e, W   ; 10D0: 083E
        movwf           mem_46      ; 10D1: 00C6
        movf            mem_3f, W   ; 10D2: 083F
        movwf           mem_45      ; 10D3: 00C5
        goto            label_10db  ; 10D4: 28DB

label_10d5
; jump here from: 10C1
        movlb           0x01        ; 10D5: 0021
        movf            mem_e3, W   ; 10D6: 0863
        xorlw           0x00        ; 10D7: 3A00
        btfsc           STATUS, Z   ; 10D8: 1903
        goto            loop_10c2   ; 10D9: 28C2
        goto            label_10cd  ; 10DA: 28CD
;
; end of label_10d5
;------------------------------------------------------------


label_10db
; jump here from: 10CC
; jump here from: 10D4
        movlw           0x00        ; 10DB: 3000
        call            sub_1682    ; 10DC: 2682

loop_10dd
; jump here from: 10E4
; jump here from: 10E6
; jump here from: 10EB
; jump here from: 10EE
; jump here from: 10F3
; jump here from: 1102
        movlb           0x00        ; 10DD: 0020
        clrf            mem_3a      ; 10DE: 01BA
        return                      ; 10DF: 0008

loop_10e0
; jump here from: 10FB
        movlw           0x04        ; 10E0: 3004
        incf            mem_45, f   ; 10E1: 0AC5
        subwf           mem_45, W   ; 10E2: 0245
        btfss           STATUS, C   ; 10E3: 1C03
        goto            loop_10dd   ; 10E4: 28DD

        clrf            mem_45      ; 10E5: 01C5
        goto            loop_10dd   ; 10E6: 28DD

loop_10e7
; jump here from: 10FE
        movlw           0x04        ; 10E7: 3004
        decf            mem_45, f   ; 10E8: 03C5
        subwf           mem_45, W   ; 10E9: 0245
        btfss           STATUS, C   ; 10EA: 1C03
        goto            loop_10dd   ; 10EB: 28DD

        movlw           0x03        ; 10EC: 3003
        movwf           mem_45      ; 10ED: 00C5
        goto            loop_10dd   ; 10EE: 28DD

loop_10ef
; jump here from: 1101
        movlp           0x0c        ; 10EF: 318C
        call            sub_0c08    ; 10F0: 2408

        movlp           0x10        ; 10F1: 3190
        clrf            mem_3b      ; 10F2: 01BB
        goto            loop_10dd   ; 10F3: 28DD

label_10f4
; jump here from: 10BD
        movlb           0x00        ; 10F4: 0020
        movf            mem_3a, W   ; 10F5: 083A
        xorlw           0x01        ; 10F6: 3A01
        btfsc           STATUS, Z   ; 10F7: 1903
        goto            loop_10be   ; 10F8: 28BE

        xorlw           0x03        ; 10F9: 3A03
        btfsc           STATUS, Z   ; 10FA: 1903
        goto            loop_10e0   ; 10FB: 28E0

        xorlw           0x01        ; 10FC: 3A01
        btfsc           STATUS, Z   ; 10FD: 1903
        goto            loop_10e7   ; 10FE: 28E7

        xorlw           0x07        ; 10FF: 3A07
        btfsc           STATUS, Z   ; 1100: 1903
        goto            loop_10ef   ; 1101: 28EF
        goto            loop_10dd   ; 1102: 28DD
;
; end of label_10f4
;------------------------------------------------------------

        return                      ; 1103: 0008

label_1104
; jump here from: 2FC4
        goto            label_1148  ; 1104: 2948

loop_1105
; jump here from: 114C
        movlp           0x1f        ; 1105: 319F
        call            sub_1f25    ; 1106: 2725

        btfsc           STATUS, C   ; 1107: 1803
        clrf            mem_65      ; 1108: 01E5

loop_1109
; jump here from: 110E
; jump here from: 111D
; jump here from: 1121
; jump here from: 1141
; jump here from: 1147
; jump here from: 1159
        movlb           0x00        ; 1109: 0020
        clrf            mem_3a      ; 110A: 01BA
        return                      ; 110B: 0008

loop_110c
; jump here from: 114F
        movf            mem_45, W   ; 110C: 0845
        btfsc           STATUS, Z   ; 110D: 1903
        goto            loop_1109   ; 110E: 2909

        movlw           0x08        ; 110F: 3008
        decf            mem_45, f   ; 1110: 03C5
        decf            mem_46, f   ; 1111: 03C6
        subwf           mem_46, W   ; 1112: 0246
        btfss           STATUS, C   ; 1113: 1C03
        goto            loop_1117   ; 1114: 2917

        movlw           0x07        ; 1115: 3007
        movwf           mem_46      ; 1116: 00C6

loop_1117
; jump here from: 1114
; jump here from: 1127
; jump here from: 1129
        movlp           0x19        ; 1117: 3199
        call            sub_19d5    ; 1118: 21D5

        movlp           0x10        ; 1119: 3190
        movlp           0x2a        ; 111A: 31AA
        call            sub_2a8d    ; 111B: 228D

        movlp           0x10        ; 111C: 3190
        goto            loop_1109   ; 111D: 2909

loop_111e
; jump here from: 1152
        movlw           0x07        ; 111E: 3007
        subwf           mem_45, W   ; 111F: 0245
        btfsc           STATUS, C   ; 1120: 1803
        goto            loop_1109   ; 1121: 2909

        movlw           0x08        ; 1122: 3008
        incf            mem_45, f   ; 1123: 0AC5
        incf            mem_46, f   ; 1124: 0AC6
        subwf           mem_46, W   ; 1125: 0246
        btfss           STATUS, C   ; 1126: 1C03
        goto            loop_1117   ; 1127: 2917

        clrf            mem_46      ; 1128: 01C6
        goto            loop_1117   ; 1129: 2917

loop_112a
; jump here from: 1155
        movlw           0x00        ; 112A: 3000
        call            sub_1682    ; 112B: 2682

        movlb           0x00        ; 112C: 0020
        clrf            mem_45      ; 112D: 01C5
        movlb           0x01        ; 112E: 0021
        movf            mem_e9, W   ; 112F: 0869
        movlb           0x00        ; 1130: 0020
        movwf           mem_46      ; 1131: 00C6
        movlp           0x19        ; 1132: 3199
        call            sub_1926    ; 1133: 2126

        movlp           0x10        ; 1134: 3190
        movlb           0x00        ; 1135: 0020
        movf            mem_39, W   ; 1136: 0839
        movlb           0x01        ; 1137: 0021
        movwf           mem_c2      ; 1138: 00C2
        movlp           0x2a        ; 1139: 31AA
        call            sub_2abc    ; 113A: 22BC

        movlp           0x10        ; 113B: 3190
        movlb           0x01        ; 113C: 0021
        movwf           mem_c1      ; 113D: 00C1
        movlw           0x20        ; 113E: 3020
        movlb           0x00        ; 113F: 0020
        movwf           mem_3b      ; 1140: 00BB
        goto            loop_1109   ; 1141: 2909

loop_1142
; jump here from: 1158
        movlw           0x00        ; 1142: 3000
        call            sub_1682    ; 1143: 2682

        movlp           0x10        ; 1144: 3190
        movlb           0x00        ; 1145: 0020
        clrf            mem_3b      ; 1146: 01BB
        goto            loop_1109   ; 1147: 2909

label_1148
; jump here from: 1104
        movlb           0x00        ; 1148: 0020
        movf            mem_3a, W   ; 1149: 083A
        xorlw           0x01        ; 114A: 3A01
        btfsc           STATUS, Z   ; 114B: 1903
        goto            loop_1105   ; 114C: 2905

        xorlw           0x03        ; 114D: 3A03
        btfsc           STATUS, Z   ; 114E: 1903
        goto            loop_110c   ; 114F: 290C

        xorlw           0x01        ; 1150: 3A01
        btfsc           STATUS, Z   ; 1151: 1903
        goto            loop_111e   ; 1152: 291E

        xorlw           0x07        ; 1153: 3A07
        btfsc           STATUS, Z   ; 1154: 1903
        goto            loop_112a   ; 1155: 292A

        xorlw           0x03        ; 1156: 3A03
        btfsc           STATUS, Z   ; 1157: 1903
        goto            loop_1142   ; 1158: 2942
        goto            loop_1109   ; 1159: 2909
;
; end of label_1148
;------------------------------------------------------------

        return                      ; 115A: 0008

label_115b
; jump here from: 2F51
        goto            label_1191  ; 115B: 2991

loop_115c
; jump here from: 1195
        call            sub_16dc    ; 115C: 26DC

        movlp           0x10        ; 115D: 3190
        movwf           mem_32      ; 115E: 00B2
        movf            mem_32, f   ; 115F: 08B2
        btfss           STATUS, Z   ; 1160: 1D03
        goto            loop_117b   ; 1161: 297B

        movf            mem_45, W   ; 1162: 0845
        call            sub_17cc    ; 1163: 27CC

        movlp           0x0c        ; 1164: 318C
        call            I2CWrite    ; 1165: 24B3

        movlp           0x10        ; 1166: 3190
        movlw           0x02        ; 1167: 3002
        movlb           0x01        ; 1168: 0021
        subwf           mem_e3, W   ; 1169: 0263
        btfss           STATUS, C   ; 116A: 1C03
        goto            loop_1174   ; 116B: 2974

        movlw           0x09        ; 116C: 3009
        movlb           0x00        ; 116D: 0020
        movwf           mem_3b      ; 116E: 00BB
        movf            mem_41, W   ; 116F: 0841
        movwf           mem_46      ; 1170: 00C6
        movf            mem_42, W   ; 1171: 0842
        movwf           mem_45      ; 1172: 00C5
        goto            label_117c  ; 1173: 297C

loop_1174
; jump here from: 116B
        movlw           0x11        ; 1174: 3011
        movlb           0x00        ; 1175: 0020
        call            sub_172a    ; 1176: 272A

        movlp           0x10        ; 1177: 3190
        call            sub_1682    ; 1178: 2682

        movlp           0x10        ; 1179: 3190
        goto            label_117c  ; 117A: 297C

loop_117b
; jump here from: 1161
        call            sub_167c    ; 117B: 267C

label_117c
; jump here from: 1173
; jump here from: 117A
; jump here from: 1190
; jump here from: 119F
        movlb           0x00        ; 117C: 0020
        clrf            mem_3a      ; 117D: 01BA
        return                      ; 117E: 0008

loop_117f
; jump here from: 1198
        goto            label_16ca  ; 117F: 2ECA

loop_1180
; jump here from: 119B
        goto            label_16d2  ; 1180: 2ED2
;
; end of loop_1180
;------------------------------------------------------------


loop_1181
; jump here from: 119E
        call            sub_16dc    ; 1181: 26DC

        movlp           0x10        ; 1182: 3190
        movwf           mem_32      ; 1183: 00B2
        movf            mem_32, f   ; 1184: 08B2
        btfss           STATUS, Z   ; 1185: 1D03
        goto            loop_118d   ; 1186: 298D

        movf            mem_45, W   ; 1187: 0845
        call            sub_17cc    ; 1188: 27CC

        movlp           0x0c        ; 1189: 318C
        call            I2CWrite    ; 118A: 24B3

        movlp           0x10        ; 118B: 3190
        goto            label_118f  ; 118C: 298F

loop_118d
; jump here from: 1186
        call            sub_167c    ; 118D: 267C

        movlp           0x10        ; 118E: 3190

label_118f
; jump here from: 118C
        clrf            mem_3b      ; 118F: 01BB
        goto            label_117c  ; 1190: 297C

label_1191
; jump here from: 115B
        movlb           0x00        ; 1191: 0020
        movf            mem_3a, W   ; 1192: 083A
        xorlw           0x01        ; 1193: 3A01
        btfsc           STATUS, Z   ; 1194: 1903
        goto            loop_115c   ; 1195: 295C

        xorlw           0x03        ; 1196: 3A03
        btfsc           STATUS, Z   ; 1197: 1903
        goto            loop_117f   ; 1198: 297F

        xorlw           0x01        ; 1199: 3A01
        btfsc           STATUS, Z   ; 119A: 1903
        goto            loop_1180   ; 119B: 2980

        xorlw           0x07        ; 119C: 3A07
        btfsc           STATUS, Z   ; 119D: 1903
        goto            loop_1181   ; 119E: 2981
        goto            label_117c  ; 119F: 297C
;
; end of label_1191
;------------------------------------------------------------

        return                      ; 11A0: 0008

label_11a1
; jump here from: 2F2E
        goto            label_11db  ; 11A1: 29DB

loop_11a2
; jump here from: 11DF
        call            sub_170c    ; 11A2: 270C

        movlp           0x0c        ; 11A3: 318C
        call            I2CWrite    ; 11A4: 24B3

        movlp           0x10        ; 11A5: 3190
        movlp           0x22        ; 11A6: 31A2
        call            sub_223d    ; 11A7: 223D

        movlp           0x10        ; 11A8: 3190
        movlp           0x0c        ; 11A9: 318C
        call            I2CWrite    ; 11AA: 24B3

        movlp           0x10        ; 11AB: 3190
        call            sub_17a4    ; 11AC: 27A4

        movlp           0x10        ; 11AD: 3190
        call            sub_1682    ; 11AE: 2682

loop_11af
; jump here from: 11BB
; jump here from: 11BF
; jump here from: 11C9
; jump here from: 11CE
; jump here from: 11DA
; jump here from: 11E9
        movlb           0x00        ; 11AF: 0020
        clrf            mem_3a      ; 11B0: 01BA
        return                      ; 11B1: 0008

loop_11b2
; jump here from: 11E2
        incf            mem_28, f   ; 11B2: 0AA8
        btfsc           STATUS, Z   ; 11B3: 1903
        incf            mem_29, f   ; 11B4: 0AA9
        movlw           0x02        ; 11B5: 3002
        subwf           mem_29, W   ; 11B6: 0229
        movlw           0x59        ; 11B7: 3059
        btfsc           STATUS, Z   ; 11B8: 1903
        subwf           mem_28, W   ; 11B9: 0228
        btfss           STATUS, C   ; 11BA: 1C03
        goto            loop_11af   ; 11BB: 29AF

        movlw           0x5a        ; 11BC: 305A
        movwf           mem_28      ; 11BD: 00A8
        clrf            mem_29      ; 11BE: 01A9
        goto            loop_11af   ; 11BF: 29AF

loop_11c0
; jump here from: 11E5
        movlw           0x01        ; 11C0: 3001
        subwf           mem_28, f   ; 11C1: 02A8
        movlw           0x00        ; 11C2: 3000
        subwfb          mem_29, f   ; 11C3: 3BA9
        subwf           mem_29, W   ; 11C4: 0229
        movlw           0x5a        ; 11C5: 305A
        btfsc           STATUS, Z   ; 11C6: 1903
        subwf           mem_28, W   ; 11C7: 0228
        btfsc           STATUS, C   ; 11C8: 1803
        goto            loop_11af   ; 11C9: 29AF

        movlw           0x58        ; 11CA: 3058
        movwf           mem_28      ; 11CB: 00A8
        movlw           0x02        ; 11CC: 3002
        movwf           mem_29      ; 11CD: 00A9
        goto            loop_11af   ; 11CE: 29AF

loop_11cf
; jump here from: 11E8
        call            sub_170c    ; 11CF: 270C

        movlp           0x0c        ; 11D0: 318C
        call            I2CWrite    ; 11D1: 24B3

        movlp           0x10        ; 11D2: 3190
        movlp           0x22        ; 11D3: 31A2
        call            sub_223d    ; 11D4: 223D

        movlp           0x10        ; 11D5: 3190
        movlp           0x0c        ; 11D6: 318C
        call            I2CWrite    ; 11D7: 24B3

        movlp           0x10        ; 11D8: 3190
        clrf            mem_3b      ; 11D9: 01BB
        goto            loop_11af   ; 11DA: 29AF

label_11db
; jump here from: 11A1
        movlb           0x00        ; 11DB: 0020
        movf            mem_3a, W   ; 11DC: 083A
        xorlw           0x01        ; 11DD: 3A01
        btfsc           STATUS, Z   ; 11DE: 1903
        goto            loop_11a2   ; 11DF: 29A2

        xorlw           0x03        ; 11E0: 3A03
        btfsc           STATUS, Z   ; 11E1: 1903
        goto            loop_11b2   ; 11E2: 29B2

        xorlw           0x01        ; 11E3: 3A01
        btfsc           STATUS, Z   ; 11E4: 1903
        goto            loop_11c0   ; 11E5: 29C0

        xorlw           0x07        ; 11E6: 3A07
        btfsc           STATUS, Z   ; 11E7: 1903
        goto            loop_11cf   ; 11E8: 29CF
        goto            loop_11af   ; 11E9: 29AF
;
; end of label_11db
;------------------------------------------------------------

        return                      ; 11EA: 0008

label_11eb
; jump here from: 2F33
        goto            label_122b  ; 11EB: 2A2B

loop_11ec
; jump here from: 122F
        call            sub_16fd    ; 11EC: 26FD

        movlp           0x0c        ; 11ED: 318C
        call            I2CWrite    ; 11EE: 24B3

        movlp           0x10        ; 11EF: 3190
        movlp           0x22        ; 11F0: 31A2
        call            sub_2236    ; 11F1: 2236

        movlp           0x10        ; 11F2: 3190
        movlp           0x0c        ; 11F3: 318C
        call            I2CWrite    ; 11F4: 24B3

        movlp           0x10        ; 11F5: 3190
        call            sub_17a4    ; 11F6: 27A4

        movlp           0x10        ; 11F7: 3190
        call            sub_1682    ; 11F8: 2682

loop_11f9
; jump here from: 1206
; jump here from: 120A
; jump here from: 1219
; jump here from: 121E
; jump here from: 122A
; jump here from: 1239
        movlb           0x00        ; 11F9: 0020
        clrf            mem_3a      ; 11FA: 01BA
        return                      ; 11FB: 0008

loop_11fc
; jump here from: 1232
        movlw           0x64        ; 11FC: 3064
        addwf           mem_28, f   ; 11FD: 07A8
        btfsc           STATUS, C   ; 11FE: 1803
        incf            mem_29, f   ; 11FF: 0AA9
        movlw           0x27        ; 1200: 3027
        subwf           mem_29, W   ; 1201: 0229
        movlw           0x11        ; 1202: 3011
        btfsc           STATUS, Z   ; 1203: 1903
        subwf           mem_28, W   ; 1204: 0228
        btfss           STATUS, C   ; 1205: 1C03
        goto            loop_11f9   ; 1206: 29F9

        movlw           0x64        ; 1207: 3064
        movwf           mem_28      ; 1208: 00A8
        clrf            mem_29      ; 1209: 01A9
        goto            loop_11f9   ; 120A: 29F9

loop_120b
; jump here from: 1235
        movlw           0x64        ; 120B: 3064
        subwf           mem_28, f   ; 120C: 02A8
        movlw           0x00        ; 120D: 3000
        subwfb          mem_29, f   ; 120E: 3BA9
        movlw           0x27        ; 120F: 3027
        subwf           mem_29, W   ; 1210: 0229
        movlw           0x11        ; 1211: 3011
        btfsc           STATUS, Z   ; 1212: 1903
        subwf           mem_28, W   ; 1213: 0228
        btfsc           STATUS, C   ; 1214: 1803
        goto            loop_121a   ; 1215: 2A1A

        movf            mem_29, W   ; 1216: 0829
        iorwf           mem_28, W   ; 1217: 0428
        btfss           STATUS, Z   ; 1218: 1D03
        goto            loop_11f9   ; 1219: 29F9

loop_121a
; jump here from: 1215
        movlw           0x10        ; 121A: 3010
        movwf           mem_28      ; 121B: 00A8
        movlw           0x27        ; 121C: 3027
        movwf           mem_29      ; 121D: 00A9
        goto            loop_11f9   ; 121E: 29F9

loop_121f
; jump here from: 1238
        call            sub_16fd    ; 121F: 26FD

        movlp           0x0c        ; 1220: 318C
        call            I2CWrite    ; 1221: 24B3

        movlp           0x10        ; 1222: 3190
        movlp           0x22        ; 1223: 31A2
        call            sub_2236    ; 1224: 2236

        movlp           0x10        ; 1225: 3190
        movlp           0x0c        ; 1226: 318C
        call            I2CWrite    ; 1227: 24B3

        movlp           0x10        ; 1228: 3190
        clrf            mem_3b      ; 1229: 01BB
        goto            loop_11f9   ; 122A: 29F9

label_122b
; jump here from: 11EB
        movlb           0x00        ; 122B: 0020
        movf            mem_3a, W   ; 122C: 083A
        xorlw           0x01        ; 122D: 3A01
        btfsc           STATUS, Z   ; 122E: 1903
        goto            loop_11ec   ; 122F: 29EC

        xorlw           0x03        ; 1230: 3A03
        btfsc           STATUS, Z   ; 1231: 1903
        goto            loop_11fc   ; 1232: 29FC

        xorlw           0x01        ; 1233: 3A01
        btfsc           STATUS, Z   ; 1234: 1903
        goto            loop_120b   ; 1235: 2A0B

        xorlw           0x07        ; 1236: 3A07
        btfsc           STATUS, Z   ; 1237: 1903
        goto            loop_121f   ; 1238: 2A1F
        goto            loop_11f9   ; 1239: 29F9
;
; end of label_122b
;------------------------------------------------------------

        return                      ; 123A: 0008

label_123b
; jump here from: 2F7E
        goto            label_1268  ; 123B: 2A68

loop_123c
; jump here from: 126C
        movlb           0x01        ; 123C: 0021
        movf            mem_be, W   ; 123D: 083E
        btfsc           STATUS, Z   ; 123E: 1903
        goto            loop_1242   ; 123F: 2A42

        decf            mem_be, f   ; 1240: 03BE
        goto            label_1259  ; 1241: 2A59

loop_1242
; jump here from: 123F
        movlb           0x00        ; 1242: 0020
        call            sub_1783    ; 1243: 2783

        movlp           0x0c        ; 1244: 318C
        call            I2CWrite    ; 1245: 24B3

        movlp           0x10        ; 1246: 3190
        call            sub_175f    ; 1247: 275F

        movlp           0x0c        ; 1248: 318C
        call            I2CWrite    ; 1249: 24B3

        movlp           0x10        ; 124A: 3190
        movlb           0x01        ; 124B: 0021
        movf            mem_e3, W   ; 124C: 0863
        btfsc           STATUS, Z   ; 124D: 1903
        goto            loop_1258   ; 124E: 2A58

        movlb           0x00        ; 124F: 0020
        movf            mem_2d, W   ; 1250: 082D
        movwf           mem_29      ; 1251: 00A9
        movf            mem_2c, W   ; 1252: 082C
        movwf           mem_28      ; 1253: 00A8
        movlw           0x12        ; 1254: 3012
        call            sub_17fb    ; 1255: 27FB

        movlp           0x10        ; 1256: 3190
        goto            label_1259  ; 1257: 2A59

loop_1258
; jump here from: 124E
        call            sub_13d3    ; 1258: 23D3

label_1259
; jump here from: 1241
; jump here from: 1257
; jump here from: 1267
; jump here from: 1276
        movlb           0x00        ; 1259: 0020
        clrf            mem_3a      ; 125A: 01BA
        return                      ; 125B: 0008

loop_125c
; jump here from: 126F
        goto            label_132c  ; 125C: 2B2C

loop_125d
; jump here from: 1272
        goto            label_137f  ; 125D: 2B7F
;
; end of loop_125d
;------------------------------------------------------------


loop_125e
; jump here from: 1275
        call            sub_1783    ; 125E: 2783

        movlp           0x0c        ; 125F: 318C
        call            I2CWrite    ; 1260: 24B3

        movlp           0x10        ; 1261: 3190
        call            sub_175f    ; 1262: 275F

        movlp           0x0c        ; 1263: 318C
        call            I2CWrite    ; 1264: 24B3

        movlp           0x10        ; 1265: 3190
        clrf            mem_3b      ; 1266: 01BB
        goto            label_1259  ; 1267: 2A59

label_1268
; jump here from: 123B
        movlb           0x00        ; 1268: 0020
        movf            mem_3a, W   ; 1269: 083A
        xorlw           0x01        ; 126A: 3A01
        btfsc           STATUS, Z   ; 126B: 1903
        goto            loop_123c   ; 126C: 2A3C

        xorlw           0x03        ; 126D: 3A03
        btfsc           STATUS, Z   ; 126E: 1903
        goto            loop_125c   ; 126F: 2A5C

        xorlw           0x01        ; 1270: 3A01
        btfsc           STATUS, Z   ; 1271: 1903
        goto            loop_125d   ; 1272: 2A5D

        xorlw           0x07        ; 1273: 3A07
        btfsc           STATUS, Z   ; 1274: 1903
        goto            loop_125e   ; 1275: 2A5E
        goto            label_1259  ; 1276: 2A59
;
; end of label_1268
;------------------------------------------------------------

        return                      ; 1277: 0008

label_1278
; jump here from: 2F8D
        goto            label_1298  ; 1278: 2A98

loop_1279
; jump here from: 129C
        movlb           0x01        ; 1279: 0021
        movf            mem_be, W   ; 127A: 083E
        btfsc           STATUS, Z   ; 127B: 1903
        goto            loop_127f   ; 127C: 2A7F

        decf            mem_be, f   ; 127D: 03BE
        goto            label_1289  ; 127E: 2A89

loop_127f
; jump here from: 127C
        movlb           0x00        ; 127F: 0020
        call            sub_16ee    ; 1280: 26EE

        movlp           0x0c        ; 1281: 318C
        call            I2CWrite    ; 1282: 24B3

        movlp           0x10        ; 1283: 3190
        call            sub_1764    ; 1284: 2764

        movlp           0x0c        ; 1285: 318C
        call            I2CWrite    ; 1286: 24B3

        movlp           0x10        ; 1287: 3190
        call            sub_13d3    ; 1288: 23D3

label_1289
; jump here from: 127E
; jump here from: 1297
; jump here from: 12A6
        movlb           0x00        ; 1289: 0020
        clrf            mem_3a      ; 128A: 01BA
        return                      ; 128B: 0008

loop_128c
; jump here from: 129F
        goto            label_132c  ; 128C: 2B2C

loop_128d
; jump here from: 12A2
        goto            label_137f  ; 128D: 2B7F
;
; end of loop_128d
;------------------------------------------------------------


loop_128e
; jump here from: 12A5
        call            sub_16ee    ; 128E: 26EE

        movlp           0x0c        ; 128F: 318C
        call            I2CWrite    ; 1290: 24B3

        movlp           0x10        ; 1291: 3190
        call            sub_1764    ; 1292: 2764

        movlp           0x0c        ; 1293: 318C
        call            I2CWrite    ; 1294: 24B3

        movlp           0x10        ; 1295: 3190
        clrf            mem_3b      ; 1296: 01BB
        goto            label_1289  ; 1297: 2A89

label_1298
; jump here from: 1278
        movlb           0x00        ; 1298: 0020
        movf            mem_3a, W   ; 1299: 083A
        xorlw           0x01        ; 129A: 3A01
        btfsc           STATUS, Z   ; 129B: 1903
        goto            loop_1279   ; 129C: 2A79

        xorlw           0x03        ; 129D: 3A03
        btfsc           STATUS, Z   ; 129E: 1903
        goto            loop_128c   ; 129F: 2A8C

        xorlw           0x01        ; 12A0: 3A01
        btfsc           STATUS, Z   ; 12A1: 1903
        goto            loop_128d   ; 12A2: 2A8D

        xorlw           0x07        ; 12A3: 3A07
        btfsc           STATUS, Z   ; 12A4: 1903
        goto            loop_128e   ; 12A5: 2A8E
        goto            label_1289  ; 12A6: 2A89
;
; end of label_1298
;------------------------------------------------------------

        return                      ; 12A7: 0008

label_12a8
; jump here from: 2F83
        goto            label_12d8  ; 12A8: 2AD8

loop_12a9
; jump here from: 12DC
        movlb           0x01        ; 12A9: 0021
        movf            mem_be, W   ; 12AA: 083E
        btfsc           STATUS, Z   ; 12AB: 1903
        goto            loop_12af   ; 12AC: 2AAF

        decf            mem_be, f   ; 12AD: 03BE
        goto            label_12c9  ; 12AE: 2AC9

loop_12af
; jump here from: 12AC
        movlb           0x00        ; 12AF: 0020
        call            sub_177a    ; 12B0: 277A

        movlp           0x0c        ; 12B1: 318C
        call            I2CWrite    ; 12B2: 24B3

        movlp           0x10        ; 12B3: 3190
        call            sub_1775    ; 12B4: 2775

        movlp           0x0c        ; 12B5: 318C
        call            I2CWrite    ; 12B6: 24B3

        movlp           0x10        ; 12B7: 3190
        movlw           0x02        ; 12B8: 3002
        movlb           0x01        ; 12B9: 0021
        subwf           mem_e3, W   ; 12BA: 0263
        btfss           STATUS, C   ; 12BB: 1C03
        goto            loop_12c8   ; 12BC: 2AC8

        movf            mem_ab, W   ; 12BD: 082B
        movlb           0x00        ; 12BE: 0020
        movwf           mem_29      ; 12BF: 00A9
        movlb           0x01        ; 12C0: 0021
        movf            mem_aa, W   ; 12C1: 082A
        movlb           0x00        ; 12C2: 0020
        movwf           mem_28      ; 12C3: 00A8
        movlw           0x13        ; 12C4: 3013
        call            sub_17fb    ; 12C5: 27FB

        movlp           0x10        ; 12C6: 3190
        goto            label_12c9  ; 12C7: 2AC9

loop_12c8
; jump here from: 12BC
        call            sub_13d3    ; 12C8: 23D3

label_12c9
; jump here from: 12AE
; jump here from: 12C7
; jump here from: 12D7
; jump here from: 12E6
        movlb           0x00        ; 12C9: 0020
        clrf            mem_3a      ; 12CA: 01BA
        return                      ; 12CB: 0008

loop_12cc
; jump here from: 12DF
        goto            label_132c  ; 12CC: 2B2C

loop_12cd
; jump here from: 12E2
        goto            label_137f  ; 12CD: 2B7F
;
; end of loop_12cd
;------------------------------------------------------------


loop_12ce
; jump here from: 12E5
        call            sub_177a    ; 12CE: 277A

        movlp           0x0c        ; 12CF: 318C
        call            I2CWrite    ; 12D0: 24B3

        movlp           0x10        ; 12D1: 3190
        call            sub_1775    ; 12D2: 2775

        movlp           0x0c        ; 12D3: 318C
        call            I2CWrite    ; 12D4: 24B3

        movlp           0x10        ; 12D5: 3190
        clrf            mem_3b      ; 12D6: 01BB
        goto            label_12c9  ; 12D7: 2AC9

label_12d8
; jump here from: 12A8
        movlb           0x00        ; 12D8: 0020
        movf            mem_3a, W   ; 12D9: 083A
        xorlw           0x01        ; 12DA: 3A01
        btfsc           STATUS, Z   ; 12DB: 1903
        goto            loop_12a9   ; 12DC: 2AA9

        xorlw           0x03        ; 12DD: 3A03
        btfsc           STATUS, Z   ; 12DE: 1903
        goto            loop_12cc   ; 12DF: 2ACC

        xorlw           0x01        ; 12E0: 3A01
        btfsc           STATUS, Z   ; 12E1: 1903
        goto            loop_12cd   ; 12E2: 2ACD

        xorlw           0x07        ; 12E3: 3A07
        btfsc           STATUS, Z   ; 12E4: 1903
        goto            loop_12ce   ; 12E5: 2ACE
        goto            label_12c9  ; 12E6: 2AC9
;
; end of label_12d8
;------------------------------------------------------------

        return                      ; 12E7: 0008

label_12e8
; jump here from: 2F88
        goto            label_131c  ; 12E8: 2B1C

loop_12e9
; jump here from: 1320
        movlb           0x01        ; 12E9: 0021
        movf            mem_be, W   ; 12EA: 083E
        btfsc           STATUS, Z   ; 12EB: 1903
        goto            loop_12ef   ; 12EC: 2AEF

        decf            mem_be, f   ; 12ED: 03BE
        goto            label_130b  ; 12EE: 2B0B

loop_12ef
; jump here from: 12EC
        movlb           0x00        ; 12EF: 0020
        call            sub_171b    ; 12F0: 271B

        movlp           0x0c        ; 12F1: 318C
        call            I2CWrite    ; 12F2: 24B3

        movlp           0x10        ; 12F3: 3190
        movlp           0x0f        ; 12F4: 318F
        call            sub_0f66    ; 12F5: 2766

        movlp           0x10        ; 12F6: 3190
        movlp           0x0c        ; 12F7: 318C
        call            I2CWrite    ; 12F8: 24B3

        movlp           0x10        ; 12F9: 3190
        movlw           0x03        ; 12FA: 3003
        movlb           0x01        ; 12FB: 0021
        subwf           mem_e3, W   ; 12FC: 0263
        btfss           STATUS, C   ; 12FD: 1C03
        goto            loop_130a   ; 12FE: 2B0A

        movf            mem_ad, W   ; 12FF: 082D
        movlb           0x00        ; 1300: 0020
        movwf           mem_29      ; 1301: 00A9
        movlb           0x01        ; 1302: 0021
        movf            mem_ac, W   ; 1303: 082C
        movlb           0x00        ; 1304: 0020
        movwf           mem_28      ; 1305: 00A8
        movlw           0x14        ; 1306: 3014
        call            sub_17fb    ; 1307: 27FB

        movlp           0x10        ; 1308: 3190
        goto            label_130b  ; 1309: 2B0B

loop_130a
; jump here from: 12FE
        call            sub_13d3    ; 130A: 23D3

label_130b
; jump here from: 12EE
; jump here from: 1309
; jump here from: 131B
; jump here from: 132A
        movlb           0x00        ; 130B: 0020
        clrf            mem_3a      ; 130C: 01BA
        return                      ; 130D: 0008

loop_130e
; jump here from: 1323
        goto            label_132c  ; 130E: 2B2C

loop_130f
; jump here from: 1326
        goto            label_137f  ; 130F: 2B7F
;
; end of loop_130f
;------------------------------------------------------------


loop_1310
; jump here from: 1329
        call            sub_171b    ; 1310: 271B

        movlp           0x0c        ; 1311: 318C
        call            I2CWrite    ; 1312: 24B3

        movlp           0x10        ; 1313: 3190
        movlp           0x0f        ; 1314: 318F
        call            sub_0f66    ; 1315: 2766

        movlp           0x10        ; 1316: 3190
        movlp           0x0c        ; 1317: 318C
        call            I2CWrite    ; 1318: 24B3

        movlp           0x10        ; 1319: 3190
        clrf            mem_3b      ; 131A: 01BB
        goto            label_130b  ; 131B: 2B0B

label_131c
; jump here from: 12E8
        movlb           0x00        ; 131C: 0020
        movf            mem_3a, W   ; 131D: 083A
        xorlw           0x01        ; 131E: 3A01
        btfsc           STATUS, Z   ; 131F: 1903
        goto            loop_12e9   ; 1320: 2AE9

        xorlw           0x03        ; 1321: 3A03
        btfsc           STATUS, Z   ; 1322: 1903
        goto            loop_130e   ; 1323: 2B0E

        xorlw           0x01        ; 1324: 3A01
        btfsc           STATUS, Z   ; 1325: 1903
        goto            loop_130f   ; 1326: 2B0F

        xorlw           0x07        ; 1327: 3A07
        btfsc           STATUS, Z   ; 1328: 1903
        goto            loop_1310   ; 1329: 2B10
        goto            label_130b  ; 132A: 2B0B
;
; end of label_131c
;------------------------------------------------------------

        return                      ; 132B: 0008

label_132c
; jump here from: 125C
; jump here from: 128C
; jump here from: 12CC
; jump here from: 130E
        goto            label_135c  ; 132C: 2B5C

loop_132d
; jump here from: 1366
        movlb           0x00        ; 132D: 0020
        movlw           0x0a        ; 132E: 300A
        incf            mem_31, f   ; 132F: 0AB1
        subwf           mem_31, W   ; 1330: 0231
        btfss           STATUS, C   ; 1331: 1C03
        goto            loop_1368   ; 1332: 2B68

        clrf            mem_31      ; 1333: 01B1
        goto            loop_1368   ; 1334: 2B68

loop_1335
; jump here from: 1363
        movlb           0x00        ; 1335: 0020
        movlw           0x0a        ; 1336: 300A
        incf            mem_30, f   ; 1337: 0AB0
        subwf           mem_30, W   ; 1338: 0230
        btfss           STATUS, C   ; 1339: 1C03
        goto            loop_1368   ; 133A: 2B68

        clrf            mem_30      ; 133B: 01B0
        goto            loop_1368   ; 133C: 2B68

loop_133d
; jump here from: 1360
        movlb           0x00        ; 133D: 0020
        movlw           0x0a        ; 133E: 300A
        incf            mem_2f, f   ; 133F: 0AAF
        subwf           mem_2f, W   ; 1340: 022F
        btfss           STATUS, C   ; 1341: 1C03
        goto            loop_1368   ; 1342: 2B68

        clrf            mem_2f      ; 1343: 01AF
        goto            loop_1368   ; 1344: 2B68

label_1345
; jump here from: 1367
        movlb           0x00        ; 1345: 0020
        incf            mem_2e, f   ; 1346: 0AAE
        movf            mem_31, f   ; 1347: 08B1
        btfss           STATUS, Z   ; 1348: 1D03
        goto            loop_134f   ; 1349: 2B4F

        movf            mem_30, f   ; 134A: 08B0
        btfsc           STATUS, Z   ; 134B: 1903
        movf            mem_2f, W   ; 134C: 082F
        btfsc           STATUS, Z   ; 134D: 1903
        goto            loop_1355   ; 134E: 2B55

loop_134f
; jump here from: 1349
        movlw           0x0a        ; 134F: 300A
        subwf           mem_2e, W   ; 1350: 022E
        btfss           STATUS, C   ; 1351: 1C03
        goto            loop_1368   ; 1352: 2B68

        clrf            mem_2e      ; 1353: 01AE
        goto            loop_1368   ; 1354: 2B68

loop_1355
; jump here from: 134E
        movlw           0x0a        ; 1355: 300A
        subwf           mem_2e, W   ; 1356: 022E
        btfss           STATUS, C   ; 1357: 1C03
        goto            loop_1368   ; 1358: 2B68

        clrf            mem_2e      ; 1359: 01AE
        incf            mem_2e, f   ; 135A: 0AAE
        goto            loop_1368   ; 135B: 2B68

label_135c
; jump here from: 132C
        movlb           0x01        ; 135C: 0021
        movf            mem_be, W   ; 135D: 083E
        xorlw           0x01        ; 135E: 3A01
        btfsc           STATUS, Z   ; 135F: 1903
        goto            loop_133d   ; 1360: 2B3D

        xorlw           0x03        ; 1361: 3A03
        btfsc           STATUS, Z   ; 1362: 1903
        goto            loop_1335   ; 1363: 2B35

        xorlw           0x01        ; 1364: 3A01
        btfsc           STATUS, Z   ; 1365: 1903
        goto            loop_132d   ; 1366: 2B2D
        goto            label_1345  ; 1367: 2B45
;
; end of label_135c
;------------------------------------------------------------


loop_1368
; jump here from: 1332
; jump here from: 1334
; jump here from: 133A
; jump here from: 133C
; jump here from: 1342
; jump here from: 1344
; jump here from: 1352
; jump here from: 1354
; jump here from: 1358
; jump here from: 135B
        call            sub_1753    ; 1368: 2753

        movlp           0x24        ; 1369: 31A4
        call            sub_2464    ; 136A: 2464

        movlp           0x10        ; 136B: 3190
        call            sub_17e3    ; 136C: 27E3

        movlp           0x10        ; 136D: 3190
        call            sub_17bf    ; 136E: 27BF

        movlw           0x64        ; 136F: 3064
        movwf           mem_51      ; 1370: 00D1
        clrf            mem_52      ; 1371: 01D2
        movlp           0x24        ; 1372: 31A4
        call            sub_2464    ; 1373: 2464

        movlp           0x10        ; 1374: 3190
        call            sub_17d2    ; 1375: 27D2

        movlp           0x10        ; 1376: 3190
        call            sub_17bf    ; 1377: 27BF

        movlw           0x0a        ; 1378: 300A
        movwf           mem_51      ; 1379: 00D1
        clrf            mem_52      ; 137A: 01D2
        movlp           0x24        ; 137B: 31A4
        call            sub_2464    ; 137C: 2464

        movlp           0x10        ; 137D: 3190
        goto            label_176b  ; 137E: 2F6B

label_137f
; jump here from: 125D
; jump here from: 128D
; jump here from: 12CD
; jump here from: 130F
        goto            label_13b0  ; 137F: 2BB0
;
; end of label_137f
;------------------------------------------------------------


loop_1380
; jump here from: 13BA
        movlb           0x00        ; 1380: 0020
        movlw           0x0a        ; 1381: 300A
        decf            mem_31, f   ; 1382: 03B1
        subwf           mem_31, W   ; 1383: 0231
        btfss           STATUS, C   ; 1384: 1C03
        goto            loop_13bc   ; 1385: 2BBC

        movlw           0x09        ; 1386: 3009
        movwf           mem_31      ; 1387: 00B1
        goto            loop_13bc   ; 1388: 2BBC

loop_1389
; jump here from: 13B7
        movlb           0x00        ; 1389: 0020
        movlw           0x0a        ; 138A: 300A
        decf            mem_30, f   ; 138B: 03B0
        subwf           mem_30, W   ; 138C: 0230
        btfss           STATUS, C   ; 138D: 1C03
        goto            loop_13bc   ; 138E: 2BBC

        movlw           0x09        ; 138F: 3009
        movwf           mem_30      ; 1390: 00B0
        goto            loop_13bc   ; 1391: 2BBC

loop_1392
; jump here from: 13B4
        movlb           0x00        ; 1392: 0020
        movlw           0x0a        ; 1393: 300A
        decf            mem_2f, f   ; 1394: 03AF
        subwf           mem_2f, W   ; 1395: 022F
        btfss           STATUS, C   ; 1396: 1C03
        goto            loop_13bc   ; 1397: 2BBC

        movlw           0x09        ; 1398: 3009
        movwf           mem_2f      ; 1399: 00AF
        goto            loop_13bc   ; 139A: 2BBC

label_139b
; jump here from: 13BB
        movlb           0x00        ; 139B: 0020
        decf            mem_2e, f   ; 139C: 03AE
        movf            mem_31, f   ; 139D: 08B1
        btfss           STATUS, Z   ; 139E: 1D03
        goto            loop_13a5   ; 139F: 2BA5

        movf            mem_30, f   ; 13A0: 08B0
        btfsc           STATUS, Z   ; 13A1: 1903
        movf            mem_2f, W   ; 13A2: 082F
        btfsc           STATUS, Z   ; 13A3: 1903
        goto            loop_13ac   ; 13A4: 2BAC

loop_13a5
; jump here from: 139F
; jump here from: 13AF
        movlw           0x0a        ; 13A5: 300A
        subwf           mem_2e, W   ; 13A6: 022E
        btfss           STATUS, C   ; 13A7: 1C03
        goto            loop_13bc   ; 13A8: 2BBC

loop_13a9
; jump here from: 13AE
        movlw           0x09        ; 13A9: 3009
        movwf           mem_2e      ; 13AA: 00AE
        goto            loop_13bc   ; 13AB: 2BBC

loop_13ac
; jump here from: 13A4
        movf            mem_2e, f   ; 13AC: 08AE
        btfsc           STATUS, Z   ; 13AD: 1903
        goto            loop_13a9   ; 13AE: 2BA9
        goto            loop_13a5   ; 13AF: 2BA5
;
; end of loop_13ac
;------------------------------------------------------------


label_13b0
; jump here from: 137F
        movlb           0x01        ; 13B0: 0021
        movf            mem_be, W   ; 13B1: 083E
        xorlw           0x01        ; 13B2: 3A01
        btfsc           STATUS, Z   ; 13B3: 1903
        goto            loop_1392   ; 13B4: 2B92

        xorlw           0x03        ; 13B5: 3A03
        btfsc           STATUS, Z   ; 13B6: 1903
        goto            loop_1389   ; 13B7: 2B89

        xorlw           0x01        ; 13B8: 3A01
        btfsc           STATUS, Z   ; 13B9: 1903
        goto            loop_1380   ; 13BA: 2B80
        goto            label_139b  ; 13BB: 2B9B
;
; end of label_13b0
;------------------------------------------------------------


loop_13bc
; jump here from: 1385
; jump here from: 1388
; jump here from: 138E
; jump here from: 1391
; jump here from: 1397
; jump here from: 139A
; jump here from: 13A8
; jump here from: 13AB
        call            sub_1753    ; 13BC: 2753

        movlp           0x24        ; 13BD: 31A4
        call            sub_2464    ; 13BE: 2464

        movlp           0x10        ; 13BF: 3190
        call            sub_17e3    ; 13C0: 27E3

        movlp           0x10        ; 13C1: 3190
        call            sub_17b8    ; 13C2: 27B8

        movlw           0x64        ; 13C3: 3064
        movwf           mem_51      ; 13C4: 00D1
        clrf            mem_52      ; 13C5: 01D2
        movlp           0x24        ; 13C6: 31A4
        call            sub_2464    ; 13C7: 2464

        movlp           0x10        ; 13C8: 3190
        call            sub_17d2    ; 13C9: 27D2

        movlp           0x10        ; 13CA: 3190
        call            sub_17b8    ; 13CB: 27B8

        movlw           0x0a        ; 13CC: 300A
        movwf           mem_51      ; 13CD: 00D1
        clrf            mem_52      ; 13CE: 01D2
        movlp           0x24        ; 13CF: 31A4
        call            sub_2464    ; 13D0: 2464

        movlp           0x10        ; 13D1: 3190
        goto            label_176b  ; 13D2: 2F6B

;------------------------------------------------------------
; Subroutine: sub_13d3
;
; called from: 1258
; called from: 1288
; called from: 12C8
; called from: 130A

sub_13d3
        movlw           0x00        ; 13D3: 3000
        call            sub_1682    ; 13D4: 2682

        movlb           0x01        ; 13D5: 0021
        movf            mem_b3, W   ; 13D6: 0833
        movlb           0x00        ; 13D7: 0020
        movwf           mem_45      ; 13D8: 00C5
        movlw           0x15        ; 13D9: 3015
        movwf           mem_3b      ; 13DA: 00BB
        return                      ; 13DB: 0008

label_13dc
; jump here from: 2F5B
        goto            label_142c  ; 13DC: 2C2C

        movf            mem_3f, W   ; 13DD: 083F
        call            sub_174d    ; 13DE: 274D

        movlp           0x10        ; 13DF: 3190
        movf            mem_41, W   ; 13E0: 0841
        call            sub_17ab    ; 13E1: 27AB

        movlp           0x10        ; 13E2: 3190
        call            sub_1610    ; 13E3: 2610

        movlp           0x10        ; 13E4: 3190
        movwf           mem_32      ; 13E5: 00B2
        movf            mem_32, f   ; 13E6: 08B2
        btfss           STATUS, Z   ; 13E7: 1D03
        goto            loop_13f3   ; 13E8: 2BF3

        movf            mem_3e, W   ; 13E9: 083E
        xorwf           mem_41, W   ; 13EA: 0641
        btfss           STATUS, Z   ; 13EB: 1D03
        goto            loop_13f3   ; 13EC: 2BF3

        movf            mem_3f, W   ; 13ED: 083F
        xorwf           mem_45, W   ; 13EE: 0645
        btfss           STATUS, Z   ; 13EF: 1D03
        goto            loop_13f3   ; 13F0: 2BF3

        clrf            mem_32      ; 13F1: 01B2
        incf            mem_32, f   ; 13F2: 0AB2

loop_13f3
; jump here from: 13E8
; jump here from: 13EC
; jump here from: 13F0
        movf            mem_32, f   ; 13F3: 08B2
        btfss           STATUS, Z   ; 13F4: 1D03
        goto            loop_1404   ; 13F5: 2C04

        movf            mem_45, W   ; 13F6: 0845
        call            sub_17c6    ; 13F7: 27C6

        movlp           0x0c        ; 13F8: 318C
        call            I2CWrite    ; 13F9: 24B3

        movlp           0x10        ; 13FA: 3190
        movlw           0x0b        ; 13FB: 300B
        movwf           mem_3b      ; 13FC: 00BB
        movf            mem_40, W   ; 13FD: 0840
        movwf           mem_46      ; 13FE: 00C6
        movlb           0x01        ; 13FF: 0021
        movf            mem_d9, W   ; 1400: 0859
        movlb           0x00        ; 1401: 0020
        movwf           mem_45      ; 1402: 00C5
        goto            label_1405  ; 1403: 2C05

loop_1404
; jump here from: 13F5
        call            sub_167c    ; 1404: 267C

label_1405
; jump here from: 1403
; jump here from: 142B
; jump here from: 143A
        clrf            mem_3a      ; 1405: 01BA
        return                      ; 1406: 0008

loop_1407
; jump here from: 1433
        goto            label_16ca  ; 1407: 2ECA

loop_1408
; jump here from: 1436
        goto            label_16d2  ; 1408: 2ED2
;
; end of loop_1408
;------------------------------------------------------------


loop_1409
; jump here from: 1439
        movf            mem_3f, W   ; 1409: 083F
        call            sub_174d    ; 140A: 274D

        movlp           0x10        ; 140B: 3190
        movf            mem_41, W   ; 140C: 0841
        call            sub_17ab    ; 140D: 27AB

        movlp           0x10        ; 140E: 3190
        call            sub_1610    ; 140F: 2610

        movlp           0x10        ; 1410: 3190
        movwf           mem_32      ; 1411: 00B2
        movf            mem_32, f   ; 1412: 08B2
        btfss           STATUS, Z   ; 1413: 1D03
        goto            loop_141f   ; 1414: 2C1F

        movf            mem_3e, W   ; 1415: 083E
        xorwf           mem_41, W   ; 1416: 0641
        btfss           STATUS, Z   ; 1417: 1D03
        goto            loop_141f   ; 1418: 2C1F

        movf            mem_3f, W   ; 1419: 083F
        xorwf           mem_45, W   ; 141A: 0645
        btfss           STATUS, Z   ; 141B: 1D03
        goto            loop_141f   ; 141C: 2C1F

        clrf            mem_32      ; 141D: 01B2
        incf            mem_32, f   ; 141E: 0AB2

loop_141f
; jump here from: 1414
; jump here from: 1418
; jump here from: 141C
        movf            mem_32, f   ; 141F: 08B2
        btfss           STATUS, Z   ; 1420: 1D03
        goto            loop_1428   ; 1421: 2C28

        movf            mem_45, W   ; 1422: 0845
        call            sub_17c6    ; 1423: 27C6

        movlp           0x0c        ; 1424: 318C
        call            I2CWrite    ; 1425: 24B3

        movlp           0x10        ; 1426: 3190
        goto            label_142a  ; 1427: 2C2A

loop_1428
; jump here from: 1421
        call            sub_167c    ; 1428: 267C

        movlp           0x10        ; 1429: 3190

label_142a
; jump here from: 1427
        clrf            mem_3b      ; 142A: 01BB
        goto            label_1405  ; 142B: 2C05

label_142c
; jump here from: 13DC
        movlb           0x00        ; 142C: 0020
        movf            mem_3a, W   ; 142D: 083A
        xorlw           0x01        ; 142E: 3A01
        btfsc           STATUS, Z   ; 142F: 1903
        goto            loop_17dd   ; 1430: 2BDD

        xorlw           0x03        ; 1431: 3A03
        btfsc           STATUS, Z   ; 1432: 1903
        goto            loop_1407   ; 1433: 2C07

        xorlw           0x01        ; 1434: 3A01
        btfsc           STATUS, Z   ; 1435: 1903
        goto            loop_1408   ; 1436: 2C08

        xorlw           0x07        ; 1437: 3A07
        btfsc           STATUS, Z   ; 1438: 1903
        goto            loop_1409   ; 1439: 2C09
        goto            label_1405  ; 143A: 2C05
;
; end of label_142c
;------------------------------------------------------------

        return                      ; 143B: 0008

label_143c
; jump here from: 2F6F
        goto            label_148c  ; 143C: 2C8C

loop_143d
; jump here from: 1490
        movf            mem_3f, W   ; 143D: 083F
        call            sub_174d    ; 143E: 274D

        movlp           0x10        ; 143F: 3190
        movf            mem_44, W   ; 1440: 0844
        call            sub_17ab    ; 1441: 27AB

        movlp           0x10        ; 1442: 3190
        call            sub_1610    ; 1443: 2610

        movlp           0x10        ; 1444: 3190
        movwf           mem_32      ; 1445: 00B2
        movf            mem_32, f   ; 1446: 08B2
        btfss           STATUS, Z   ; 1447: 1D03
        goto            loop_1451   ; 1448: 2C51

        movf            mem_42, W   ; 1449: 0842
        call            sub_173c    ; 144A: 273C

        movlp           0x10        ; 144B: 3190
        call            sub_17d8    ; 144C: 27D8

        movlp           0x10        ; 144D: 3190
        call            sub_1610    ; 144E: 2610

        movlp           0x10        ; 144F: 3190
        movwf           mem_32      ; 1450: 00B2

loop_1451
; jump here from: 1448
        movf            mem_32, f   ; 1451: 08B2
        btfss           STATUS, Z   ; 1452: 1D03
        goto            loop_1464   ; 1453: 2C64

        movf            mem_45, W   ; 1454: 0845
        movlb           0x01        ; 1455: 0021
        movwf           mem_db      ; 1456: 00DB
        call            sub_178c    ; 1457: 278C

        movlp           0x0c        ; 1458: 318C
        call            I2CWrite    ; 1459: 24B3

        movlp           0x10        ; 145A: 3190
        movlw           0x0f        ; 145B: 300F
        movwf           mem_bb      ; 145C: 00BB
        movf            mem_c3, W   ; 145D: 0843
        movwf           mem_c6      ; 145E: 00C6
        movlb           0x01        ; 145F: 0021
        movf            mem_da, W   ; 1460: 085A
        movlb           0x00        ; 1461: 0020
        movwf           mem_45      ; 1462: 00C5
        goto            label_1465  ; 1463: 2C65

loop_1464
; jump here from: 1453
        call            sub_167c    ; 1464: 267C

label_1465
; jump here from: 1463
; jump here from: 148B
; jump here from: 149A
        clrf            mem_3a      ; 1465: 01BA
        return                      ; 1466: 0008

loop_1467
; jump here from: 1493
        goto            label_16ca  ; 1467: 2ECA

loop_1468
; jump here from: 1496
        goto            label_16d2  ; 1468: 2ED2
;
; end of loop_1468
;------------------------------------------------------------


loop_1469
; jump here from: 1499
        movf            mem_3f, W   ; 1469: 083F
        call            sub_174d    ; 146A: 274D

        movlp           0x10        ; 146B: 3190
        movf            mem_44, W   ; 146C: 0844
        call            sub_17ab    ; 146D: 27AB

        movlp           0x10        ; 146E: 3190
        call            sub_1610    ; 146F: 2610

        movlp           0x10        ; 1470: 3190
        movwf           mem_32      ; 1471: 00B2
        movf            mem_32, f   ; 1472: 08B2
        btfss           STATUS, Z   ; 1473: 1D03
        goto            loop_147d   ; 1474: 2C7D

        movf            mem_42, W   ; 1475: 0842
        call            sub_173c    ; 1476: 273C

        movlp           0x10        ; 1477: 3190
        call            sub_17d8    ; 1478: 27D8

        movlp           0x10        ; 1479: 3190
        call            sub_1610    ; 147A: 2610

        movlp           0x10        ; 147B: 3190
        movwf           mem_32      ; 147C: 00B2

loop_147d
; jump here from: 1474
        movf            mem_32, f   ; 147D: 08B2
        btfss           STATUS, Z   ; 147E: 1D03
        goto            loop_1488   ; 147F: 2C88

        movf            mem_45, W   ; 1480: 0845
        movlb           0x01        ; 1481: 0021
        movwf           mem_db      ; 1482: 00DB
        call            sub_178c    ; 1483: 278C

        movlp           0x0c        ; 1484: 318C
        call            I2CWrite    ; 1485: 24B3

        movlp           0x10        ; 1486: 3190
        goto            label_148a  ; 1487: 2C8A

loop_1488
; jump here from: 147F
        call            sub_167c    ; 1488: 267C

        movlp           0x10        ; 1489: 3190

label_148a
; jump here from: 1487
        clrf            mem_bb      ; 148A: 01BB
        goto            label_1465  ; 148B: 2C65

label_148c
; jump here from: 143C
        movlb           0x00        ; 148C: 0020
        movf            mem_3a, W   ; 148D: 083A
        xorlw           0x01        ; 148E: 3A01
        btfsc           STATUS, Z   ; 148F: 1903
        goto            loop_143d   ; 1490: 2C3D

        xorlw           0x03        ; 1491: 3A03
        btfsc           STATUS, Z   ; 1492: 1903
        goto            loop_1467   ; 1493: 2C67

        xorlw           0x01        ; 1494: 3A01
        btfsc           STATUS, Z   ; 1495: 1903
        goto            loop_1468   ; 1496: 2C68

        xorlw           0x07        ; 1497: 3A07
        btfsc           STATUS, Z   ; 1498: 1903
        goto            loop_1469   ; 1499: 2C69
        goto            label_1465  ; 149A: 2C65
;
; end of label_148c
;------------------------------------------------------------

        return                      ; 149B: 0008

label_149c
; jump here from: 2F65
        goto            label_152a  ; 149C: 2D2A

loop_149d
; jump here from: 152E
        movf            mem_41, W   ; 149D: 0841
        xorwf           mem_40, W   ; 149E: 0640
        btfss           STATUS, Z   ; 149F: 1D03
        goto            loop_14a7   ; 14A0: 2CA7

        movf            mem_42, W   ; 14A1: 0842
        xorwf           mem_45, W   ; 14A2: 0645
        btfss           STATUS, Z   ; 14A3: 1D03
        goto            loop_14a7   ; 14A4: 2CA7

        clrf            mem_32      ; 14A5: 01B2
        incf            mem_32, f   ; 14A6: 0AB2

loop_14a7
; jump here from: 14A0
; jump here from: 14A4
        movf            mem_32, f   ; 14A7: 08B2
        btfss           STATUS, Z   ; 14A8: 1D03
        goto            loop_14b3   ; 14A9: 2CB3

        movf            mem_3f, W   ; 14AA: 083F
        call            sub_174d    ; 14AB: 274D

        movlp           0x10        ; 14AC: 3190
        movf            mem_40, W   ; 14AD: 0840
        call            sub_17ab    ; 14AE: 27AB

        movlp           0x10        ; 14AF: 3190
        call            sub_1610    ; 14B0: 2610

        movlp           0x10        ; 14B1: 3190
        movwf           mem_32      ; 14B2: 00B2

loop_14b3
; jump here from: 14A9
        movf            mem_32, f   ; 14B3: 08B2
        btfss           STATUS, Z   ; 14B4: 1D03
        goto            loop_14be   ; 14B5: 2CBE

        movf            mem_42, W   ; 14B6: 0842
        movwf           mem_4f      ; 14B7: 00CF
        movf            mem_40, W   ; 14B8: 0840
        call            sub_1733    ; 14B9: 2733

        movlp           0x10        ; 14BA: 3190
        call            sub_1610    ; 14BB: 2610

        movlp           0x10        ; 14BC: 3190
        movwf           mem_32      ; 14BD: 00B2

loop_14be
; jump here from: 14B5
        movf            mem_32, f   ; 14BE: 08B2
        btfss           STATUS, Z   ; 14BF: 1D03
        goto            loop_14c9   ; 14C0: 2CC9

        movf            mem_42, W   ; 14C1: 0842
        movwf           mem_4f      ; 14C2: 00CF
        movf            mem_40, W   ; 14C3: 0840
        call            sub_1744    ; 14C4: 2744

        movlp           0x10        ; 14C5: 3190
        call            sub_1610    ; 14C6: 2610

        movlp           0x10        ; 14C7: 3190
        movwf           mem_32      ; 14C8: 00B2

loop_14c9
; jump here from: 14C0
        movf            mem_32, f   ; 14C9: 08B2
        btfss           STATUS, Z   ; 14CA: 1D03
        goto            loop_14e9   ; 14CB: 2CE9

        movf            mem_45, W   ; 14CC: 0845
        movlb           0x01        ; 14CD: 0021
        movwf           mem_d9      ; 14CE: 00D9
        call            sub_179c    ; 14CF: 279C

        movlp           0x0c        ; 14D0: 318C
        call            I2CWrite    ; 14D1: 24B3

        movlp           0x10        ; 14D2: 3190
        movlw           0x03        ; 14D3: 3003
        movlb           0x01        ; 14D4: 0021
        subwf           mem_e3, W   ; 14D5: 0263
        btfss           STATUS, C   ; 14D6: 1C03
        goto            loop_14e2   ; 14D7: 2CE2

        movlw           0x0d        ; 14D8: 300D
        movlb           0x00        ; 14D9: 0020
        movwf           mem_3b      ; 14DA: 00BB
        movf            mem_44, W   ; 14DB: 0844
        movwf           mem_46      ; 14DC: 00C6
        movlb           0x01        ; 14DD: 0021
        movf            mem_db, W   ; 14DE: 085B
        movlb           0x00        ; 14DF: 0020
        movwf           mem_45      ; 14E0: 00C5
        goto            label_14ea  ; 14E1: 2CEA

loop_14e2
; jump here from: 14D7
        movlw           0x11        ; 14E2: 3011
        movlb           0x00        ; 14E3: 0020
        call            sub_172a    ; 14E4: 272A

        movlp           0x10        ; 14E5: 3190
        call            sub_1682    ; 14E6: 2682

        movlp           0x10        ; 14E7: 3190
        goto            label_14ea  ; 14E8: 2CEA

loop_14e9
; jump here from: 14CB
        call            sub_167c    ; 14E9: 267C

label_14ea
; jump here from: 14E1
; jump here from: 14E8
; jump here from: 1529
; jump here from: 1538
        movlb           0x00        ; 14EA: 0020
        clrf            mem_3a      ; 14EB: 01BA
        return                      ; 14EC: 0008

loop_14ed
; jump here from: 1531
        goto            label_16ca  ; 14ED: 2ECA

loop_14ee
; jump here from: 1534
        goto            label_16d2  ; 14EE: 2ED2
;
; end of loop_14ee
;------------------------------------------------------------


loop_14ef
; jump here from: 1537
        movf            mem_41, W   ; 14EF: 0841
        xorwf           mem_40, W   ; 14F0: 0640
        btfss           STATUS, Z   ; 14F1: 1D03
        goto            loop_14f9   ; 14F2: 2CF9

        movf            mem_42, W   ; 14F3: 0842
        xorwf           mem_45, W   ; 14F4: 0645
        btfss           STATUS, Z   ; 14F5: 1D03
        goto            loop_14f9   ; 14F6: 2CF9

        clrf            mem_32      ; 14F7: 01B2
        incf            mem_32, f   ; 14F8: 0AB2

loop_14f9
; jump here from: 14F2
; jump here from: 14F6
        movf            mem_32, f   ; 14F9: 08B2
        btfss           STATUS, Z   ; 14FA: 1D03
        goto            loop_1505   ; 14FB: 2D05

        movf            mem_3f, W   ; 14FC: 083F
        call            sub_174d    ; 14FD: 274D

        movlp           0x10        ; 14FE: 3190
        movf            mem_40, W   ; 14FF: 0840
        call            sub_17ab    ; 1500: 27AB

        movlp           0x10        ; 1501: 3190
        call            sub_1610    ; 1502: 2610

        movlp           0x10        ; 1503: 3190
        movwf           mem_32      ; 1504: 00B2

loop_1505
; jump here from: 14FB
        movf            mem_32, f   ; 1505: 08B2
        btfss           STATUS, Z   ; 1506: 1D03
        goto            loop_1510   ; 1507: 2D10

        movf            mem_42, W   ; 1508: 0842
        movwf           mem_4f      ; 1509: 00CF
        movf            mem_40, W   ; 150A: 0840
        call            sub_1733    ; 150B: 2733

        movlp           0x10        ; 150C: 3190
        call            sub_1610    ; 150D: 2610

        movlp           0x10        ; 150E: 3190
        movwf           mem_32      ; 150F: 00B2

loop_1510
; jump here from: 1507
        movf            mem_32, f   ; 1510: 08B2
        btfss           STATUS, Z   ; 1511: 1D03
        goto            loop_151b   ; 1512: 2D1B

        movf            mem_42, W   ; 1513: 0842
        movwf           mem_4f      ; 1514: 00CF
        movf            mem_40, W   ; 1515: 0840
        call            sub_1744    ; 1516: 2744

        movlp           0x10        ; 1517: 3190
        call            sub_1610    ; 1518: 2610

        movlp           0x10        ; 1519: 3190
        movwf           mem_32      ; 151A: 00B2

loop_151b
; jump here from: 1512
        movf            mem_32, f   ; 151B: 08B2
        btfss           STATUS, Z   ; 151C: 1D03
        goto            loop_1526   ; 151D: 2D26

        movf            mem_45, W   ; 151E: 0845
        movlb           0x01        ; 151F: 0021
        movwf           mem_d9      ; 1520: 00D9
        call            sub_179c    ; 1521: 279C

        movlp           0x0c        ; 1522: 318C
        call            I2CWrite    ; 1523: 24B3

        movlp           0x10        ; 1524: 3190
        goto            label_1528  ; 1525: 2D28

loop_1526
; jump here from: 151D
        call            sub_167c    ; 1526: 267C

        movlp           0x10        ; 1527: 3190

label_1528
; jump here from: 1525
        clrf            mem_bb      ; 1528: 01BB
        goto            label_14ea  ; 1529: 2CEA

label_152a
; jump here from: 149C
        movlb           0x00        ; 152A: 0020
        movf            mem_3a, W   ; 152B: 083A
        xorlw           0x01        ; 152C: 3A01
        btfsc           STATUS, Z   ; 152D: 1903
        goto            loop_149d   ; 152E: 2C9D

        xorlw           0x03        ; 152F: 3A03
        btfsc           STATUS, Z   ; 1530: 1903
        goto            loop_14ed   ; 1531: 2CED

        xorlw           0x01        ; 1532: 3A01
        btfsc           STATUS, Z   ; 1533: 1903
        goto            loop_14ee   ; 1534: 2CEE

        xorlw           0x07        ; 1535: 3A07
        btfsc           STATUS, Z   ; 1536: 1903
        goto            loop_14ef   ; 1537: 2CEF
        goto            label_14ea  ; 1538: 2CEA
;
; end of label_152a
;------------------------------------------------------------

        return                      ; 1539: 0008

label_153a
; jump here from: 2F79
        goto            label_1600  ; 153A: 2E00

loop_153b
; jump here from: 1604
        movf            mem_44, W   ; 153B: 0844
        xorwf           mem_43, W   ; 153C: 0643
        btfss           STATUS, Z   ; 153D: 1D03
        goto            loop_1547   ; 153E: 2D47

        movlb           0x01        ; 153F: 0021
        movf            mem_db, W   ; 1540: 085B
        movlb           0x00        ; 1541: 0020
        xorwf           mem_45, W   ; 1542: 0645
        btfss           STATUS, Z   ; 1543: 1D03
        goto            loop_1547   ; 1544: 2D47

        clrf            mem_32      ; 1545: 01B2
        incf            mem_32, f   ; 1546: 0AB2

loop_1547
; jump here from: 153E
; jump here from: 1544
        movf            mem_32, f   ; 1547: 08B2
        btfss           STATUS, Z   ; 1548: 1D03
        goto            loop_1553   ; 1549: 2D53

        movf            mem_3f, W   ; 154A: 083F
        call            sub_174d    ; 154B: 274D

        movlp           0x10        ; 154C: 3190
        movf            mem_43, W   ; 154D: 0843
        call            sub_17ab    ; 154E: 27AB

        movlp           0x10        ; 154F: 3190
        call            sub_1610    ; 1550: 2610

        movlp           0x10        ; 1551: 3190
        movwf           mem_32      ; 1552: 00B2

loop_1553
; jump here from: 1549
        movf            mem_32, f   ; 1553: 08B2
        btfss           STATUS, Z   ; 1554: 1D03
        goto            loop_155f   ; 1555: 2D5F

        movf            mem_42, W   ; 1556: 0842
        call            sub_173c    ; 1557: 273C

        movlp           0x10        ; 1558: 3190
        movf            mem_43, W   ; 1559: 0843
        call            sub_17de    ; 155A: 27DE

        movlp           0x10        ; 155B: 3190
        call            sub_1610    ; 155C: 2610

        movlp           0x10        ; 155D: 3190
        movwf           mem_32      ; 155E: 00B2

loop_155f
; jump here from: 1555
        movf            mem_32, f   ; 155F: 08B2
        btfss           STATUS, Z   ; 1560: 1D03
        goto            loop_156a   ; 1561: 2D6A

        movlb           0x01        ; 1562: 0021
        call            sub_16e6    ; 1563: 26E6

        movlp           0x10        ; 1564: 3190
        call            sub_17f5    ; 1565: 27F5

        movlp           0x10        ; 1566: 3190
        call            sub_1610    ; 1567: 2610

        movlp           0x10        ; 1568: 3190
        movwf           mem_b2      ; 1569: 00B2

loop_156a
; jump here from: 1561
        movf            mem_32, f   ; 156A: 08B2
        btfss           STATUS, Z   ; 156B: 1D03
        goto            loop_1575   ; 156C: 2D75

        movlb           0x01        ; 156D: 0021
        call            sub_16e6    ; 156E: 26E6

        movlp           0x10        ; 156F: 3190
        call            sub_17ef    ; 1570: 27EF

        movlp           0x10        ; 1571: 3190
        call            sub_1610    ; 1572: 2610

        movlp           0x10        ; 1573: 3190
        movwf           mem_b2      ; 1574: 00B2

loop_1575
; jump here from: 156C
        movf            mem_b2, f   ; 1575: 08B2
        btfss           STATUS, Z   ; 1576: 1D03
        goto            loop_1580   ; 1577: 2D80

        movlb           0x01        ; 1578: 0021
        call            sub_16e6    ; 1579: 26E6

        movlp           0x10        ; 157A: 3190
        call            sub_17e9    ; 157B: 27E9

        movlp           0x10        ; 157C: 3190
        call            sub_1610    ; 157D: 2610

        movlp           0x10        ; 157E: 3190
        movwf           mem_b2      ; 157F: 00B2

loop_1580
; jump here from: 1577
        movf            mem_b2, f   ; 1580: 08B2
        btfss           STATUS, Z   ; 1581: 1D03
        goto            loop_158b   ; 1582: 2D8B

        movlb           0x01        ; 1583: 0021
        call            sub_16e6    ; 1584: 26E6

        movlp           0x10        ; 1585: 3190
        call            sub_17b0    ; 1586: 27B0

        movlp           0x10        ; 1587: 3190
        call            sub_1610    ; 1588: 2610

        movlp           0x10        ; 1589: 3190
        movwf           mem_b2      ; 158A: 00B2

loop_158b
; jump here from: 1582
        movf            mem_b2, f   ; 158B: 08B2
        btfss           STATUS, Z   ; 158C: 1D03
        goto            loop_159b   ; 158D: 2D9B

        movf            mem_c5, W   ; 158E: 0845
        movlb           0x01        ; 158F: 0021
        movwf           mem_da      ; 1590: 00DA
        call            sub_1794    ; 1591: 2794

        movlp           0x0c        ; 1592: 318C
        call            I2CWrite    ; 1593: 24B3

        movlp           0x10        ; 1594: 3190
        movlw           0x11        ; 1595: 3011
        call            sub_172a    ; 1596: 272A

        movlp           0x10        ; 1597: 3190
        call            sub_1682    ; 1598: 2682

        movlp           0x10        ; 1599: 3190
        goto            label_159c  ; 159A: 2D9C

loop_159b
; jump here from: 158D
        call            sub_167c    ; 159B: 267C

label_159c
; jump here from: 159A
; jump here from: 15FF
; jump here from: 160E
        movlb           0x00        ; 159C: 0020
        clrf            mem_3a      ; 159D: 01BA
        return                      ; 159E: 0008

loop_159f
; jump here from: 1607
        goto            label_16ca  ; 159F: 2ECA

loop_15a0
; jump here from: 160A
        goto            label_16d2  ; 15A0: 2ED2
;
; end of loop_15a0
;------------------------------------------------------------


loop_15a1
; jump here from: 160D
        movf            mem_44, W   ; 15A1: 0844
        xorwf           mem_43, W   ; 15A2: 0643
        btfss           STATUS, Z   ; 15A3: 1D03
        goto            loop_15ad   ; 15A4: 2DAD

        movlb           0x01        ; 15A5: 0021
        movf            mem_db, W   ; 15A6: 085B
        movlb           0x00        ; 15A7: 0020
        xorwf           mem_45, W   ; 15A8: 0645
        btfss           STATUS, Z   ; 15A9: 1D03
        goto            loop_15ad   ; 15AA: 2DAD

        clrf            mem_32      ; 15AB: 01B2
        incf            mem_32, f   ; 15AC: 0AB2

loop_15ad
; jump here from: 15A4
; jump here from: 15AA
        movf            mem_32, f   ; 15AD: 08B2
        btfss           STATUS, Z   ; 15AE: 1D03
        goto            loop_15b9   ; 15AF: 2DB9

        movf            mem_3f, W   ; 15B0: 083F
        call            sub_174d    ; 15B1: 274D

        movlp           0x10        ; 15B2: 3190
        movf            mem_43, W   ; 15B3: 0843
        call            sub_17ab    ; 15B4: 27AB

        movlp           0x10        ; 15B5: 3190
        call            sub_1610    ; 15B6: 2610

        movlp           0x10        ; 15B7: 3190
        movwf           mem_32      ; 15B8: 00B2

loop_15b9
; jump here from: 15AF
        movf            mem_32, f   ; 15B9: 08B2
        btfss           STATUS, Z   ; 15BA: 1D03
        goto            loop_15c5   ; 15BB: 2DC5

        movf            mem_42, W   ; 15BC: 0842
        call            sub_173c    ; 15BD: 273C

        movlp           0x10        ; 15BE: 3190
        movf            mem_43, W   ; 15BF: 0843
        call            sub_17de    ; 15C0: 27DE

        movlp           0x10        ; 15C1: 3190
        call            sub_1610    ; 15C2: 2610

        movlp           0x10        ; 15C3: 3190
        movwf           mem_32      ; 15C4: 00B2

loop_15c5
; jump here from: 15BB
        movf            mem_32, f   ; 15C5: 08B2
        btfss           STATUS, Z   ; 15C6: 1D03
        goto            loop_15d0   ; 15C7: 2DD0

        movlb           0x01        ; 15C8: 0021
        call            sub_16e6    ; 15C9: 26E6

        movlp           0x10        ; 15CA: 3190
        call            sub_17f5    ; 15CB: 27F5

        movlp           0x10        ; 15CC: 3190
        call            sub_1610    ; 15CD: 2610

        movlp           0x10        ; 15CE: 3190
        movwf           mem_b2      ; 15CF: 00B2

loop_15d0
; jump here from: 15C7
        movf            mem_32, f   ; 15D0: 08B2
        btfss           STATUS, Z   ; 15D1: 1D03
        goto            loop_15db   ; 15D2: 2DDB

        movlb           0x01        ; 15D3: 0021
        call            sub_16e6    ; 15D4: 26E6

        movlp           0x10        ; 15D5: 3190
        call            sub_17ef    ; 15D6: 27EF

        movlp           0x10        ; 15D7: 3190
        call            sub_1610    ; 15D8: 2610

        movlp           0x10        ; 15D9: 3190
        movwf           mem_b2      ; 15DA: 00B2

loop_15db
; jump here from: 15D2
        movf            mem_b2, f   ; 15DB: 08B2
        btfss           STATUS, Z   ; 15DC: 1D03
        goto            loop_15e6   ; 15DD: 2DE6

        movlb           0x01        ; 15DE: 0021
        call            sub_16e6    ; 15DF: 26E6

        movlp           0x10        ; 15E0: 3190
        call            sub_17e9    ; 15E1: 27E9

        movlp           0x10        ; 15E2: 3190
        call            sub_1610    ; 15E3: 2610

        movlp           0x10        ; 15E4: 3190
        movwf           mem_b2      ; 15E5: 00B2

loop_15e6
; jump here from: 15DD
        movf            mem_b2, f   ; 15E6: 08B2
        btfss           STATUS, Z   ; 15E7: 1D03
        goto            loop_15f1   ; 15E8: 2DF1

        movlb           0x01        ; 15E9: 0021
        call            sub_16e6    ; 15EA: 26E6

        movlp           0x10        ; 15EB: 3190
        call            sub_17b0    ; 15EC: 27B0

        movlp           0x10        ; 15ED: 3190
        call            sub_1610    ; 15EE: 2610

        movlp           0x10        ; 15EF: 3190
        movwf           mem_b2      ; 15F0: 00B2

loop_15f1
; jump here from: 15E8
        movf            mem_b2, f   ; 15F1: 08B2
        btfss           STATUS, Z   ; 15F2: 1D03
        goto            loop_15fc   ; 15F3: 2DFC

        movf            mem_c5, W   ; 15F4: 0845
        movlb           0x01        ; 15F5: 0021
        movwf           mem_da      ; 15F6: 00DA
        call            sub_1794    ; 15F7: 2794

        movlp           0x0c        ; 15F8: 318C
        call            I2CWrite    ; 15F9: 24B3

        movlp           0x10        ; 15FA: 3190
        goto            label_15fe  ; 15FB: 2DFE

loop_15fc
; jump here from: 15F3
        call            sub_167c    ; 15FC: 267C

        movlp           0x10        ; 15FD: 3190

label_15fe
; jump here from: 15FB
        clrf            mem_bb      ; 15FE: 01BB
        goto            label_159c  ; 15FF: 2D9C

label_1600
; jump here from: 153A
        movlb           0x00        ; 1600: 0020
        movf            mem_3a, W   ; 1601: 083A
        xorlw           0x01        ; 1602: 3A01
        btfsc           STATUS, Z   ; 1603: 1903
        goto            loop_153b   ; 1604: 2D3B

        xorlw           0x03        ; 1605: 3A03
        btfsc           STATUS, Z   ; 1606: 1903
        goto            loop_159f   ; 1607: 2D9F

        xorlw           0x01        ; 1608: 3A01
        btfsc           STATUS, Z   ; 1609: 1903
        goto            loop_15a0   ; 160A: 2DA0

        xorlw           0x07        ; 160B: 3A07
        btfsc           STATUS, Z   ; 160C: 1903
        goto            loop_15a1   ; 160D: 2DA1
        goto            label_159c  ; 160E: 2D9C
;
; end of label_1600
;------------------------------------------------------------

        return                      ; 160F: 0008

;------------------------------------------------------------
; Subroutine: sub_1610
;
; called from: 13E3
; called from: 140F
; called from: 1443
; called from: 144E
; called from: 146F
; called from: 147A
; called from: 14B0
; called from: 14BB
; called from: 14C6
; called from: 1502
; called from: 150D
; called from: 1518
; called from: 1550
; called from: 155C
; called from: 1567
; called from: 1572
; called from: 157D
; called from: 1588
; called from: 15B6
; called from: 15C2
; called from: 15CD
; called from: 15D8
; called from: 15E3
; called from: 15EE

sub_1610
        movwf           mem_d6      ; 1610: 00D6
        movf            mem_d0, W   ; 1611: 0850
        subwf           mem_d6, W   ; 1612: 0256
        btfsc           STATUS, C   ; 1613: 1803
        goto            loop_1617   ; 1614: 2E17

        clrf            mem_d4      ; 1615: 01D4
        goto            label_166f  ; 1616: 2E6F

loop_1617
; jump here from: 1614
        movf            mem_56, W   ; 1617: 0856
        xorwf           mem_50, W   ; 1618: 0650
        btfss           STATUS, Z   ; 1619: 1D03
        goto            loop_1624   ; 161A: 2E24

        movf            mem_51, W   ; 161B: 0851
        subwf           mem_4f, W   ; 161C: 024F
        btfsc           STATUS, C   ; 161D: 1803
        goto            loop_1622   ; 161E: 2E22

        clrf            mem_54      ; 161F: 01D4
        incf            mem_54, f   ; 1620: 0AD4
        goto            label_166f  ; 1621: 2E6F

loop_1622
; jump here from: 161E
        movlw           0x02        ; 1622: 3002
        goto            label_1625  ; 1623: 2E25

loop_1624
; jump here from: 161A
        movlw           0x03        ; 1624: 3003

label_1625
; jump here from: 1623
        movwf           mem_54      ; 1625: 00D4
        goto            label_166f  ; 1626: 2E6F

loop_1627
; jump here from: 1672
        movf            mem_56, W   ; 1627: 0856
        subwf           mem_52, W   ; 1628: 0252
        btfsc           STATUS, C   ; 1629: 1803
        goto            loop_162d   ; 162A: 2E2D

loop_162b
; jump here from: 1634
; jump here from: 1643
; jump here from: 1648
; jump here from: 164C
; jump here from: 1669
        clrf            mem_55      ; 162B: 01D5
        goto            label_167a  ; 162C: 2E7A

loop_162d
; jump here from: 162A
        movf            mem_52, W   ; 162D: 0852
        xorwf           mem_56, W   ; 162E: 0656
        btfss           STATUS, Z   ; 162F: 1D03
        goto            loop_1638   ; 1630: 2E38

label_1631
; jump here from: 166E
        movf            mem_53, W   ; 1631: 0853
        subwf           mem_4f, W   ; 1632: 024F

label_1633
; jump here from: 1661
        btfsc           STATUS, C   ; 1633: 1803
        goto            loop_162b   ; 1634: 2E2B

loop_1635
; jump here from: 163F
; jump here from: 1651
; jump here from: 1655
; jump here from: 165A
; jump here from: 166D
        clrf            mem_55      ; 1635: 01D5
        incf            mem_55, f   ; 1636: 0AD5
        goto            label_167a  ; 1637: 2E7A

loop_1638
; jump here from: 1630
        movf            mem_52, W   ; 1638: 0852
        subwf           mem_56, W   ; 1639: 0256
        btfsc           STATUS, C   ; 163A: 1803
        goto            loop_1640   ; 163B: 2E40

        movf            mem_50, W   ; 163C: 0850
        subwf           mem_52, W   ; 163D: 0252
        btfss           STATUS, C   ; 163E: 1C03
        goto            loop_1635   ; 163F: 2E35

loop_1640
; jump here from: 163B
        movf            mem_52, W   ; 1640: 0852
        xorwf           mem_50, W   ; 1641: 0650
        btfss           STATUS, Z   ; 1642: 1D03
        goto            loop_162b   ; 1643: 2E2B
        goto            label_165f  ; 1644: 2E5F
;
; end of loop_1640
;------------------------------------------------------------


loop_1645
; jump here from: 1675
        movf            mem_52, W   ; 1645: 0852
        xorwf           mem_56, W   ; 1646: 0656
        btfss           STATUS, Z   ; 1647: 1D03
        goto            loop_162b   ; 1648: 2E2B

        movf            mem_53, W   ; 1649: 0853
        subwf           mem_4f, W   ; 164A: 024F
        btfsc           STATUS, C   ; 164B: 1803
        goto            loop_162b   ; 164C: 2E2B
        goto            label_165f  ; 164D: 2E5F
;
; end of loop_1645
;------------------------------------------------------------


loop_164e
; jump here from: 1678
        movf            mem_52, W   ; 164E: 0852
        xorwf           mem_56, W   ; 164F: 0656
        btfss           STATUS, Z   ; 1650: 1D03
        goto            loop_1635   ; 1651: 2E35

        movf            mem_53, W   ; 1652: 0853
        subwf           mem_4f, W   ; 1653: 024F
        btfss           STATUS, C   ; 1654: 1C03
        goto            loop_1635   ; 1655: 2E35
        goto            label_165f  ; 1656: 2E5F
;
; end of loop_164e
;------------------------------------------------------------


label_1657
; jump here from: 1679
        movf            mem_50, W   ; 1657: 0850
        subwf           mem_52, W   ; 1658: 0252
        btfss           STATUS, C   ; 1659: 1C03
        goto            loop_1635   ; 165A: 2E35

        movf            mem_52, W   ; 165B: 0852
        xorwf           mem_50, W   ; 165C: 0650
        btfss           STATUS, Z   ; 165D: 1D03
        goto            loop_1662   ; 165E: 2E62

label_165f
; jump here from: 1644
; jump here from: 164D
; jump here from: 1656
        movf            mem_51, W   ; 165F: 0851
        subwf           mem_53, W   ; 1660: 0253
        goto            label_1633  ; 1661: 2E33

loop_1662
; jump here from: 165E
        movf            mem_52, W   ; 1662: 0852
        subwf           mem_50, W   ; 1663: 0250
        btfsc           STATUS, C   ; 1664: 1803
        goto            loop_166a   ; 1665: 2E6A

        movf            mem_56, W   ; 1666: 0856
        subwf           mem_52, W   ; 1667: 0252
        btfss           STATUS, C   ; 1668: 1C03
        goto            loop_162b   ; 1669: 2E2B

loop_166a
; jump here from: 1665
        movf            mem_52, W   ; 166A: 0852
        xorwf           mem_56, W   ; 166B: 0656
        btfss           STATUS, Z   ; 166C: 1D03
        goto            loop_1635   ; 166D: 2E35
        goto            label_1631  ; 166E: 2E31
;
; end of loop_166a
;------------------------------------------------------------


label_166f
; jump here from: 1616
; jump here from: 1621
; jump here from: 1626
        movf            mem_54, W   ; 166F: 0854
        xorlw           0x00        ; 1670: 3A00
        btfsc           STATUS, Z   ; 1671: 1903
        goto            loop_1627   ; 1672: 2E27

        xorlw           0x01        ; 1673: 3A01
        btfsc           STATUS, Z   ; 1674: 1903
        goto            loop_1645   ; 1675: 2E45

        xorlw           0x03        ; 1676: 3A03
        btfsc           STATUS, Z   ; 1677: 1903
        goto            loop_164e   ; 1678: 2E4E
        goto            label_1657  ; 1679: 2E57
;
; end of label_166f
;------------------------------------------------------------


label_167a
; jump here from: 162C
; jump here from: 1637
        movf            mem_55, W   ; 167A: 0855
        return                      ; 167B: 0008

;------------------------------------------------------------
; Subroutine: sub_167c
;
; called from: 117B
; called from: 118D
; called from: 1404
; called from: 1428
; called from: 1464
; called from: 1488
; called from: 14E9
; called from: 1526
; called from: 159B
; called from: 15FC
; called from: 35E4
; called from: 35F8
; called from: 3627
; called from: 3644
; called from: 367D
; called from: 36A4
; called from: 36F8
; called from: 373A

sub_167c
        movlw           0x02        ; 167C: 3002
        movlb           0x02        ; 167D: 0022
        movwf           usb_count     ; 167E: 00B3
        movlb           0x00        ; 167F: 0020
        bsf             PORTC, RC3  ; 1680: 158E
        return                      ; 1681: 0008

;------------------------------------------------------------
; Subroutine: sub_1682
;
; called from: 056D
; called from: 0575
; called from: 05C9
; called from: 05EC
; called from: 0637
; called from: 0692
; called from: 06B4
; called from: 0812
; called from: 0836
; called from: 089A
; called from: 094F
; called from: 0982
; called from: 1047
; called from: 10DC
; called from: 112B
; called from: 1143
; called from: 1178
; called from: 11AE
; called from: 11F8
; called from: 13D4
; called from: 14E6
; called from: 1598
; called from: 1869
; called from: 1876
; called from: 1897
; called from: 18A4
; called from: 18F6
; called from: 190E
; called from: 1988
; called from: 1995
; called from: 224E

sub_1682
        movlb           0x00        ; 1682: 0020
        movwf           mem_4f      ; 1683: 00CF
        movlb           0x01        ; 1684: 0021
        movwf           mem_bb      ; 1685: 00BB
        movlb           0x00        ; 1686: 0020
        movf            mem_4f, W   ; 1687: 084F
        movlb           0x02        ; 1688: 0022
        movwf           mem_14b     ; 1689: 00CB
        movlb           0x00        ; 168A: 0020
        movf            mem_4f, W   ; 168B: 084F
        movlb           0x02        ; 168C: 0022
        movwf           mem_157     ; 168D: 00D7
        movlb           0x00        ; 168E: 0020
        movf            mem_4f, W   ; 168F: 084F
        movlb           0x02        ; 1690: 0022
        movwf           mem_158     ; 1691: 00D8
        movlb           0x00        ; 1692: 0020
        movf            mem_4f, W   ; 1693: 084F
        movlb           0x02        ; 1694: 0022
        movwf           mem_14d     ; 1695: 00CD
        movlb           0x00        ; 1696: 0020
        movf            mem_4f, W   ; 1697: 084F
        movlb           0x02        ; 1698: 0022
        movwf           mem_14e     ; 1699: 00CE
        movlb           0x00        ; 169A: 0020
        movf            mem_4f, W   ; 169B: 084F
        movlb           0x02        ; 169C: 0022
        movwf           mem_149     ; 169D: 00C9
        movlb           0x00        ; 169E: 0020
        movf            mem_4f, W   ; 169F: 084F
        movlb           0x02        ; 16A0: 0022
        movwf           mem_14a     ; 16A1: 00CA
        movlb           0x00        ; 16A2: 0020
        movf            mem_4f, W   ; 16A3: 084F
        movlb           0x02        ; 16A4: 0022
        movwf           mem_153     ; 16A5: 00D3
        movlb           0x00        ; 16A6: 0020
        movf            mem_4f, W   ; 16A7: 084F
        movlb           0x02        ; 16A8: 0022
        movwf           mem_154     ; 16A9: 00D4
        movlb           0x00        ; 16AA: 0020
        movf            mem_4f, W   ; 16AB: 084F
        movlb           0x02        ; 16AC: 0022
        movwf           mem_155     ; 16AD: 00D5
        movlb           0x00        ; 16AE: 0020
        movf            mem_4f, W   ; 16AF: 084F
        movlb           0x02        ; 16B0: 0022
        movwf           mem_156     ; 16B1: 00D6
        movlb           0x00        ; 16B2: 0020
        movf            mem_4f, W   ; 16B3: 084F
        movlb           0x02        ; 16B4: 0022
        movwf           mem_14c     ; 16B5: 00CC
        movlb           0x00        ; 16B6: 0020
        movf            mem_4f, W   ; 16B7: 084F
        movlb           0x02        ; 16B8: 0022
        movwf           mem_14f     ; 16B9: 00CF
        movlb           0x00        ; 16BA: 0020
        movf            mem_4f, W   ; 16BB: 084F
        movlb           0x02        ; 16BC: 0022
        movwf           mem_150     ; 16BD: 00D0
        movlb           0x00        ; 16BE: 0020
        movf            mem_4f, W   ; 16BF: 084F
        movlb           0x02        ; 16C0: 0022
        movwf           mem_151     ; 16C1: 00D1
        movlb           0x00        ; 16C2: 0020
        movf            mem_4f, W   ; 16C3: 084F
        movlb           0x02        ; 16C4: 0022
        movwf           mem_152     ; 16C5: 00D2
        movlb           0x03        ; 16C6: 0023
        clrf            mem_1c5     ; 16C7: 01C5
        incf            mem_1c5, f  ; 16C8: 0AC5
        return                      ; 16C9: 0008

label_16ca
; jump here from: 101C
; jump here from: 1092
; jump here from: 117F
; jump here from: 1407
; jump here from: 1467
; jump here from: 14ED
; jump here from: 159F
        movlb           0x00        ; 16CA: 0020
        movlw           0x3c        ; 16CB: 303C
        incf            mem_45, f   ; 16CC: 0AC5
        subwf           mem_45, W   ; 16CD: 0245
        btfsc           STATUS, C   ; 16CE: 1803
        clrf            mem_45      ; 16CF: 01C5
        clrf            mem_3a      ; 16D0: 01BA
        return                      ; 16D1: 0008

label_16d2
; jump here from: 101D
; jump here from: 1093
; jump here from: 1180
; jump here from: 1408
; jump here from: 1468
; jump here from: 14EE
; jump here from: 15A0
        movlb           0x00        ; 16D2: 0020
        movlw           0x3c        ; 16D3: 303C
        decf            mem_45, f   ; 16D4: 03C5
        subwf           mem_45, W   ; 16D5: 0245
        btfss           STATUS, C   ; 16D6: 1C03
        goto            loop_16da   ; 16D7: 2EDA

        movlw           0x3b        ; 16D8: 303B
        movwf           mem_45      ; 16D9: 00C5

loop_16da
; jump here from: 16D7
        clrf            mem_3a      ; 16DA: 01BA
        return                      ; 16DB: 0008

;------------------------------------------------------------
; Subroutine: sub_16dc
;
; called from: 115C
; called from: 1181

sub_16dc
        movlb           0x00        ; 16DC: 0020
        movf            mem_3e, W   ; 16DD: 083E
        xorwf           mem_3c, W   ; 16DE: 063C
        btfss           STATUS, Z   ; 16DF: 1D03
        retlw           0x00        ; 16E0: 3400
        movf            mem_3f, W   ; 16E1: 083F
        xorwf           mem_46, W   ; 16E2: 0646
        btfsc           STATUS, Z   ; 16E3: 1903
        retlw           0x01        ; 16E4: 3401
        retlw           0x00        ; 16E5: 3400

;------------------------------------------------------------
; Subroutine: sub_16e6
;
; called from: 1563
; called from: 156E
; called from: 1579
; called from: 1584
; called from: 15C9
; called from: 15D4
; called from: 15DF
; called from: 15EA

sub_16e6
        movf            mem_db, W   ; 16E6: 085B
        movlb           0x00        ; 16E7: 0020
        movwf           mem_4f      ; 16E8: 00CF
        movf            mem_43, W   ; 16E9: 0843
        movwf           mem_50      ; 16EA: 00D0
        movf            mem_45, W   ; 16EB: 0845
        movwf           mem_51      ; 16EC: 00D1
        return                      ; 16ED: 0008

;------------------------------------------------------------
; Subroutine: sub_16ee
;
; called from: 1280
; called from: 128E

sub_16ee
        movf            mem_29, W   ; 16EE: 0829
        movlb           0x01        ; 16EF: 0021
        movwf           mem_ad      ; 16F0: 00AD
        movlb           0x00        ; 16F1: 0020
        movf            mem_28, W   ; 16F2: 0828
        movlb           0x01        ; 16F3: 0021
        movwf           mem_ac      ; 16F4: 00AC
        movlw           0x66        ; 16F5: 3066
        movlb           0x00        ; 16F6: 0020
        movwf           mem_55      ; 16F7: 00D5
        movlb           0x01        ; 16F8: 0021
        movf            mem_ad, W   ; 16F9: 082D
        movlb           0x00        ; 16FA: 0020
        movwf           mem_56      ; 16FB: 00D6
        retlw           0x88        ; 16FC: 3488

;------------------------------------------------------------
; Subroutine: sub_16fd
;
; called from: 11EC
; called from: 121F

sub_16fd
        movf            mem_29, W   ; 16FD: 0829
        movlb           0x01        ; 16FE: 0021
        movwf           mem_a7      ; 16FF: 00A7
        movlb           0x00        ; 1700: 0020
        movf            mem_28, W   ; 1701: 0828
        movlb           0x01        ; 1702: 0021
        movwf           mem_a6      ; 1703: 00A6
        movlw           0x22        ; 1704: 3022
        movlb           0x00        ; 1705: 0020
        movwf           mem_55      ; 1706: 00D5
        movlb           0x01        ; 1707: 0021
        movf            mem_a7, W   ; 1708: 0827
        movlb           0x00        ; 1709: 0020
        movwf           mem_56      ; 170A: 00D6
        retlw           0x88        ; 170B: 3488

;------------------------------------------------------------
; Subroutine: sub_170c
;
; called from: 11A2
; called from: 11CF

sub_170c
        movf            mem_29, W   ; 170C: 0829
        movlb           0x01        ; 170D: 0021
        movwf           mem_b1      ; 170E: 00B1
        movlb           0x00        ; 170F: 0020
        movf            mem_28, W   ; 1710: 0828
        movlb           0x01        ; 1711: 0021
        movwf           mem_b0      ; 1712: 00B0
        movlw           0x0c        ; 1713: 300C
        movlb           0x00        ; 1714: 0020
        movwf           mem_55      ; 1715: 00D5
        movlb           0x01        ; 1716: 0021
        movf            mem_b1, W   ; 1717: 0831
        movlb           0x00        ; 1718: 0020
        movwf           mem_56      ; 1719: 00D6
        retlw           0x88        ; 171A: 3488

;------------------------------------------------------------
; Subroutine: sub_171b
;
; called from: 12F0
; called from: 1310

sub_171b
        movf            mem_29, W   ; 171B: 0829
        movlb           0x01        ; 171C: 0021
        movwf           mem_ab      ; 171D: 00AB
        movlb           0x00        ; 171E: 0020
        movf            mem_28, W   ; 171F: 0828
        movlb           0x01        ; 1720: 0021
        movwf           mem_aa      ; 1721: 00AA
        movlw           0x64        ; 1722: 3064
        movlb           0x00        ; 1723: 0020
        movwf           mem_55      ; 1724: 00D5
        movlb           0x01        ; 1725: 0021
        movf            mem_ab, W   ; 1726: 082B
        movlb           0x00        ; 1727: 0020
        movwf           mem_56      ; 1728: 00D6
        retlw           0x88        ; 1729: 3488

;------------------------------------------------------------
; Subroutine: sub_172a
;
; called from: 1176
; called from: 14E4
; called from: 1596

sub_172a
        movwf           mem_bb      ; 172A: 00BB
        movf            mem_ab, W   ; 172B: 082B
        movwf           mem_a9      ; 172C: 00A9
        movf            mem_aa, W   ; 172D: 082A
        movwf           mem_a8      ; 172E: 00A8
        movlw           0x03        ; 172F: 3003
        movlb           0x01        ; 1730: 0021
        movwf           mem_be      ; 1731: 00BE
        retlw           0x00        ; 1732: 3400

;------------------------------------------------------------
; Subroutine: sub_1733
;
; called from: 14B9
; called from: 150B

sub_1733
        movwf           mem_50      ; 1733: 00D0
        movf            mem_45, W   ; 1734: 0845
        movwf           mem_51      ; 1735: 00D1
        movf            mem_3e, W   ; 1736: 083E
        movwf           mem_52      ; 1737: 00D2
        movf            mem_3f, W   ; 1738: 083F
        movwf           mem_53      ; 1739: 00D3
        movf            mem_41, W   ; 173A: 0841
        return                      ; 173B: 0008

;------------------------------------------------------------
; Subroutine: sub_173c
;
; called from: 144A
; called from: 1476
; called from: 1557
; called from: 15BD

sub_173c
        movwf           mem_4f      ; 173C: 00CF
        movf            mem_40, W   ; 173D: 0840
        movwf           mem_50      ; 173E: 00D0
        movlb           0x01        ; 173F: 0021
        movf            mem_d9, W   ; 1740: 0859
        movlb           0x00        ; 1741: 0020
        movwf           mem_51      ; 1742: 00D1
        return                      ; 1743: 0008

;------------------------------------------------------------
; Subroutine: sub_1744
;
; called from: 14C4
; called from: 1516

sub_1744
        movwf           mem_50      ; 1744: 00D0
        movf            mem_45, W   ; 1745: 0845
        movwf           mem_51      ; 1746: 00D1
        movf            mem_3c, W   ; 1747: 083C
        movwf           mem_52      ; 1748: 00D2
        movf            mem_3d, W   ; 1749: 083D
        movwf           mem_53      ; 174A: 00D3
        movf            mem_41, W   ; 174B: 0841
        return                      ; 174C: 0008

;------------------------------------------------------------
; Subroutine: sub_174d
;
; called from: 13DE
; called from: 140A
; called from: 143E
; called from: 146A
; called from: 14AB
; called from: 14FD
; called from: 154B
; called from: 15B1

sub_174d
        movwf           mem_4f      ; 174D: 00CF
        movf            mem_3c, W   ; 174E: 083C
        movwf           mem_50      ; 174F: 00D0
        movf            mem_3d, W   ; 1750: 083D
        movwf           mem_51      ; 1751: 00D1
        return                      ; 1752: 0008

;------------------------------------------------------------
; Subroutine: sub_1753
;
; called from: 1368
; called from: 13BC

sub_1753
        movf            mem_b1, W   ; 1753: 0831
        movwf           mem_a8      ; 1754: 00A8
        movlw           0xe8        ; 1755: 30E8
        clrf            mem_a9      ; 1756: 01A9
        movwf           mem_cf      ; 1757: 00CF
        movlw           0x03        ; 1758: 3003
        movwf           mem_d0      ; 1759: 00D0
        movf            mem_a9, W   ; 175A: 0829
        movwf           mem_d2      ; 175B: 00D2
        movf            mem_a8, W   ; 175C: 0828
        movwf           mem_d1      ; 175D: 00D1
        return                      ; 175E: 0008

;------------------------------------------------------------
; Subroutine: sub_175f
;
; called from: 0C31
; called from: 0C49
; called from: 0C72
; called from: 1247
; called from: 1262
; called from: 2233

sub_175f
        movlw           0x61        ; 175F: 3061
        movwf           mem_55      ; 1760: 00D5
        movf            mem_2a, W   ; 1761: 082A
        movwf           mem_56      ; 1762: 00D6
        retlw           0x88        ; 1763: 3488

;------------------------------------------------------------
; Subroutine: sub_1764
;
; called from: 0CB0
; called from: 1284
; called from: 1292

sub_1764
        movlw           0x67        ; 1764: 3067
        movwf           mem_55      ; 1765: 00D5
        movlb           0x01        ; 1766: 0021
        movf            mem_ac, W   ; 1767: 082C
        movlb           0x00        ; 1768: 0020
        movwf           mem_56      ; 1769: 00D6
        retlw           0x88        ; 176A: 3488

label_176b
; jump here from: 137E
; jump here from: 13D2
        movf            mem_cf, W   ; 176B: 084F
        addwf           mem_a8, f   ; 176C: 07A8
        movf            mem_d0, W   ; 176D: 0850
        addwfc          mem_a9, f   ; 176E: 3DA9
        movf            mem_ae, W   ; 176F: 082E
        addwf           mem_a8, f   ; 1770: 07A8
        btfsc           STATUS, C   ; 1771: 1803
        incf            mem_a9, f   ; 1772: 0AA9
        clrf            mem_ba      ; 1773: 01BA
        return                      ; 1774: 0008

;------------------------------------------------------------
; Subroutine: sub_1775
;
; called from: 0C41
; called from: 0C59
; called from: 0C82
; called from: 12B4
; called from: 12D2

sub_1775
        movlw           0x63        ; 1775: 3063
        movwf           mem_55      ; 1776: 00D5
        movf            mem_2c, W   ; 1777: 082C
        movwf           mem_56      ; 1778: 00D6
        retlw           0x88        ; 1779: 3488

;------------------------------------------------------------
; Subroutine: sub_177a
;
; called from: 12B0
; called from: 12CE

sub_177a
        movf            mem_29, W   ; 177A: 0829
        movwf           mem_2d      ; 177B: 00AD
        movf            mem_28, W   ; 177C: 0828
        movwf           mem_2c      ; 177D: 00AC
        movlw           0x62        ; 177E: 3062
        movwf           mem_55      ; 177F: 00D5
        movf            mem_2d, W   ; 1780: 082D
        movwf           mem_56      ; 1781: 00D6
        retlw           0x88        ; 1782: 3488

;------------------------------------------------------------
; Subroutine: sub_1783
;
; called from: 1243
; called from: 125E

sub_1783
        movf            mem_29, W   ; 1783: 0829
        movwf           mem_2b      ; 1784: 00AB
        movf            mem_28, W   ; 1785: 0828
        movwf           mem_2a      ; 1786: 00AA
        movlw           0x60        ; 1787: 3060
        movwf           mem_55      ; 1788: 00D5
        movf            mem_2b, W   ; 1789: 082B
        movwf           mem_56      ; 178A: 00D6
        retlw           0x88        ; 178B: 3488

;------------------------------------------------------------
; Subroutine: sub_178c
;
; called from: 1457
; called from: 1483

sub_178c
        movlw           0x71        ; 178C: 3071
        movlb           0x00        ; 178D: 0020
        movwf           mem_55      ; 178E: 00D5
        movlb           0x01        ; 178F: 0021
        movf            mem_db, W   ; 1790: 085B
        movlb           0x00        ; 1791: 0020
        movwf           mem_56      ; 1792: 00D6
        retlw           0x88        ; 1793: 3488

;------------------------------------------------------------
; Subroutine: sub_1794
;
; called from: 1591
; called from: 15F7

sub_1794
        movlw           0x73        ; 1794: 3073
        movlb           0x00        ; 1795: 0020
        movwf           mem_55      ; 1796: 00D5
        movlb           0x01        ; 1797: 0021
        movf            mem_da, W   ; 1798: 085A
        movlb           0x00        ; 1799: 0020
        movwf           mem_56      ; 179A: 00D6
        retlw           0x88        ; 179B: 3488

;------------------------------------------------------------
; Subroutine: sub_179c
;
; called from: 14CF
; called from: 1521

sub_179c
        movlw           0x6f        ; 179C: 306F
        movlb           0x00        ; 179D: 0020
        movwf           mem_55      ; 179E: 00D5
        movlb           0x01        ; 179F: 0021
        movf            mem_d9, W   ; 17A0: 0859
        movlb           0x00        ; 17A1: 0020
        movwf           mem_56      ; 17A2: 00D6
        retlw           0x88        ; 17A3: 3488

;------------------------------------------------------------
; Subroutine: sub_17a4
;
; called from: 11AC
; called from: 11F6

sub_17a4
        movlw           0x03        ; 17A4: 3003
        movwf           mem_3b      ; 17A5: 00BB
        movlb           0x01        ; 17A6: 0021
        movf            mem_b4, W   ; 17A7: 0834
        movlb           0x00        ; 17A8: 0020
        movwf           mem_45      ; 17A9: 00C5
        retlw           0x00        ; 17AA: 3400

;------------------------------------------------------------
; Subroutine: sub_17ab
;
; called from: 13E1
; called from: 140D
; called from: 1441
; called from: 146D
; called from: 14AE
; called from: 1500
; called from: 154E
; called from: 15B4

sub_17ab
        movwf           mem_52      ; 17AB: 00D2
        movf            mem_45, W   ; 17AC: 0845
        movwf           mem_53      ; 17AD: 00D3
        movf            mem_3e, W   ; 17AE: 083E
        return                      ; 17AF: 0008

;------------------------------------------------------------
; Subroutine: sub_17b0
;
; called from: 1586
; called from: 15EC

sub_17b0
        movf            mem_c0, W   ; 17B0: 0840
        movwf           mem_d2      ; 17B1: 00D2
        movlb           0x01        ; 17B2: 0021
        movf            mem_d9, W   ; 17B3: 0859
        movlb           0x00        ; 17B4: 0020
        movwf           mem_53      ; 17B5: 00D3
        movf            mem_44, W   ; 17B6: 0844
        return                      ; 17B7: 0008

;------------------------------------------------------------
; Subroutine: sub_17b8
;
; called from: 13C2
; called from: 13CB

sub_17b8
        movwf           mem_d5      ; 17B8: 00D5
        clrf            mem_d6      ; 17B9: 01D6
        movf            mem_d6, W   ; 17BA: 0856
        movwf           mem_d0      ; 17BB: 00D0
        movf            mem_d5, W   ; 17BC: 0855
        movwf           mem_cf      ; 17BD: 00CF
        return                      ; 17BE: 0008

;------------------------------------------------------------
; Subroutine: sub_17bf
;
; called from: 136E
; called from: 1377

sub_17bf
        movwf           mem_d5      ; 17BF: 00D5
        clrf            mem_d6      ; 17C0: 01D6
        movf            mem_d6, W   ; 17C1: 0856
        movwf           mem_d0      ; 17C2: 00D0
        movf            mem_d5, W   ; 17C3: 0855
        movwf           mem_cf      ; 17C4: 00CF
        return                      ; 17C5: 0008

;------------------------------------------------------------
; Subroutine: sub_17c6
;
; called from: 13F7
; called from: 1423

sub_17c6
        movwf           mem_42      ; 17C6: 00C2
        movlw           0x6d        ; 17C7: 306D
        movwf           mem_55      ; 17C8: 00D5
        movf            mem_42, W   ; 17C9: 0842
        movwf           mem_56      ; 17CA: 00D6
        retlw           0x88        ; 17CB: 3488

;------------------------------------------------------------
; Subroutine: sub_17cc
;
; called from: 1163
; called from: 1188

sub_17cc
        movwf           mem_3d      ; 17CC: 00BD
        movlw           0x6b        ; 17CD: 306B
        movwf           mem_55      ; 17CE: 00D5
        movf            mem_3d, W   ; 17CF: 083D
        movwf           mem_56      ; 17D0: 00D6
        retlw           0x88        ; 17D1: 3488

;------------------------------------------------------------
; Subroutine: sub_17d2
;
; called from: 1375
; called from: 13C9

sub_17d2
        movf            mem_cf, W   ; 17D2: 084F
        addwf           mem_a8, f   ; 17D3: 07A8
        movf            mem_d0, W   ; 17D4: 0850
        addwfc          mem_a9, f   ; 17D5: 3DA9
        movf            mem_af, W   ; 17D6: 082F
        return                      ; 17D7: 0008

;------------------------------------------------------------
; Subroutine: sub_17d8
;
; called from: 144C
; called from: 1478

sub_17d8
        movf            mem_44, W   ; 17D8: 0844
        movwf           mem_52      ; 17D9: 00D2
        movf            mem_45, W   ; 17DA: 0845
        movwf           mem_53      ; 17DB: 00D3
        movf            mem_41, W   ; 17DC: 0841

loop_17dd
; jump here from: 1430
        return                      ; 17DD: 0008

;------------------------------------------------------------
; Subroutine: sub_17de
;
; called from: 155A
; called from: 15C0

sub_17de
        movwf           mem_52      ; 17DE: 00D2
        movf            mem_45, W   ; 17DF: 0845
        movwf           mem_53      ; 17E0: 00D3
        movf            mem_41, W   ; 17E1: 0841
        return                      ; 17E2: 0008

;------------------------------------------------------------
; Subroutine: sub_17e3
;
; called from: 136C
; called from: 13C0

sub_17e3
        movf            mem_d0, W   ; 17E3: 0850
        movwf           mem_a9      ; 17E4: 00A9
        movf            mem_cf, W   ; 17E5: 084F
        movwf           mem_a8      ; 17E6: 00A8
        movf            mem_b0, W   ; 17E7: 0830
        return                      ; 17E8: 0008

;------------------------------------------------------------
; Subroutine: sub_17e9
;
; called from: 157B
; called from: 15E1

sub_17e9
        movf            mem_c1, W   ; 17E9: 0841
        movwf           mem_d2      ; 17EA: 00D2
        movf            mem_c2, W   ; 17EB: 0842
        movwf           mem_d3      ; 17EC: 00D3
        movf            mem_c4, W   ; 17ED: 0844
        return                      ; 17EE: 0008

;------------------------------------------------------------
; Subroutine: sub_17ef
;
; called from: 1570
; called from: 15D6

sub_17ef
        movf            mem_bc, W   ; 17EF: 083C
        movwf           mem_d2      ; 17F0: 00D2
        movf            mem_bd, W   ; 17F1: 083D
        movwf           mem_d3      ; 17F2: 00D3
        movf            mem_c4, W   ; 17F3: 0844
        return                      ; 17F4: 0008

;------------------------------------------------------------
; Subroutine: sub_17f5
;
; called from: 1565
; called from: 15CB

sub_17f5
        movf            mem_be, W   ; 17F5: 083E
        movwf           mem_d2      ; 17F6: 00D2
        movf            mem_bf, W   ; 17F7: 083F
        movwf           mem_d3      ; 17F8: 00D3
        movf            mem_c4, W   ; 17F9: 0844
        return                      ; 17FA: 0008

;------------------------------------------------------------
; Subroutine: sub_17fb
;
; called from: 1255
; called from: 12C5
; called from: 1307

sub_17fb
        movwf           mem_3b      ; 17FB: 00BB
        movlw           0x03        ; 17FC: 3003
        movlb           0x01        ; 17FD: 0021
        movwf           mem_be      ; 17FE: 00BE
        return                      ; 17FF: 0008
Bank1800_Vector org 0x1800

;------------------------------------------------------------
; Subroutine: sub_1801
;
; called from: 0854
; called from: 22F9

sub_1801
        movlw           0x48        ; 1801: 3048
        movlb           0x00        ; 1802: 0020
        movwf           mem_52      ; 1803: 00D2
        movlw           0x86        ; 1804: 3086
        movlp           0x0d        ; 1805: 318D
        call            I2CRead    ; 1806: 25FD

        movlp           0x18        ; 1807: 3198
        movlb           0x01        ; 1808: 0021
        movwf           mem_c9      ; 1809: 00C9
        movlw           0x18        ; 180A: 3018
        subwf           mem_c9, W   ; 180B: 0249
        btfss           STATUS, C   ; 180C: 1C03
        return                      ; 180D: 0008
        movlw           0x48        ; 180E: 3048
        clrf            mem_49      ; 180F: 01C9
        movlb           0x00        ; 1810: 0020
        movwf           mem_55      ; 1811: 00D5
        movlw           0x86        ; 1812: 3086
        clrf            mem_56      ; 1813: 01D6
        movlp           0x0c        ; 1814: 318C
        goto            I2CWrite    ; 1815: 2CB3

;------------------------------------------------------------
; Subroutine: sub_1816
;
; called from: 0A83

sub_1816
        movlb           0x02        ; 1816: 0022
        movf            mem_13d, W  ; 1817: 083D
        movlb           0x00        ; 1818: 0020
        movwf           mem_23      ; 1819: 00A3
        movlb           0x02        ; 181A: 0022
        movf            mem_13e, W  ; 181B: 083E
        movlb           0x00        ; 181C: 0020
        movwf           mem_22      ; 181D: 00A2
        movlb           0x02        ; 181E: 0022
        movf            mem_13c, W  ; 181F: 083C
        movlb           0x00        ; 1820: 0020
        movwf           mem_33      ; 1821: 00B3
        movlb           0x01        ; 1822: 0021
        movf            mem_dd, W   ; 1823: 085D
        movlb           0x00        ; 1824: 0020
        movwf           mem_21      ; 1825: 00A1
        movlb           0x01        ; 1826: 0021
        movf            mem_de, W   ; 1827: 085E
        movlb           0x00        ; 1828: 0020
        movwf           mem_20      ; 1829: 00A0
        movlb           0x01        ; 182A: 0021
        movf            mem_dc, W   ; 182B: 085C
        movwf           mem_ba      ; 182C: 00BA
        call            sub_1b70    ; 182D: 2370

        movf            mem_a3, W   ; 182E: 0823
        movlb           0x01        ; 182F: 0021
        movwf           mem_dd      ; 1830: 00DD
        movlb           0x00        ; 1831: 0020
        movf            mem_22, W   ; 1832: 0822
        movlb           0x01        ; 1833: 0021
        movwf           mem_de      ; 1834: 00DE
        movlb           0x00        ; 1835: 0020
        movf            mem_33, W   ; 1836: 0833
        movlb           0x01        ; 1837: 0021
        movwf           mem_dc      ; 1838: 00DC
        movf            mem_b8, W   ; 1839: 0838
        addwf           mem_b8, W   ; 183A: 0738
        addwf           mem_b8, W   ; 183B: 0738
        movlb           0x00        ; 183C: 0020
        movwf           mem_58      ; 183D: 00D8
        movwf           mem_55      ; 183E: 00D5
        movf            mem_23, W   ; 183F: 0823
        movwf           mem_56      ; 1840: 00D6
        movlw           0x87        ; 1841: 3087
        movlp           0x0c        ; 1842: 318C
        call            I2CWrite    ; 1843: 24B3

        movlp           0x18        ; 1844: 3198
        incf            mem_58, W   ; 1845: 0A58
        movwf           mem_55      ; 1846: 00D5
        movf            mem_22, W   ; 1847: 0822
        movwf           mem_56      ; 1848: 00D6
        movlw           0x87        ; 1849: 3087
        movlp           0x0c        ; 184A: 318C
        call            I2CWrite    ; 184B: 24B3

        movlp           0x18        ; 184C: 3198
        movf            mem_58, W   ; 184D: 0858
        addlw           0x02        ; 184E: 3E02
        movwf           mem_55      ; 184F: 00D5
        movf            mem_33, W   ; 1850: 0833
        movwf           mem_56      ; 1851: 00D6
        movlw           0x87        ; 1852: 3087
        movlp           0x0c        ; 1853: 318C
        goto            I2CWrite    ; 1854: 2CB3

;------------------------------------------------------------
; Subroutine: sub_1855
;
; called from: 2FB7

sub_1855
        movlb           0x02        ; 1855: 0022
        bsf             mem_14c, 6  ; 1856: 174C
        bsf             mem_14b, 1  ; 1857: 14CB
        call            sub_19ff    ; 1858: 21FF

        movlp           0x18        ; 1859: 3198
        movlb           0x01        ; 185A: 0021
        movf            mem_ea, f   ; 185B: 08EA
        btfss           STATUS, Z   ; 185C: 1D03
        return                      ; 185D: 0008
        movlp           0x2d        ; 185E: 31AD
        goto            sub_2d0a    ; 185F: 2D0A

label_1860
; jump here from: 2FBA
        goto            label_1881  ; 1860: 2881
;
; end of label_1860
;------------------------------------------------------------


loop_1861
; jump here from: 1885
        call            sub_1f25    ; 1861: 2725

        btfsc           STATUS, C   ; 1862: 1803
        clrf            mem_65      ; 1863: 01E5

label_1864
; jump here from: 1880
; jump here from: 188C
        movlb           0x00        ; 1864: 0020
        clrf            mem_3a      ; 1865: 01BA
        return                      ; 1866: 0008

loop_1867
; jump here from: 1888
        movlw           0x00        ; 1867: 3000
        movlp           0x16        ; 1868: 3196
        call            sub_1682    ; 1869: 2682

        movlp           0x18        ; 186A: 3198
        movlb           0x01        ; 186B: 0021
        movf            mem_cd, W   ; 186C: 084D
        movwf           mem_e7      ; 186D: 00E7
        movf            mem_ce, W   ; 186E: 084E
        movwf           mem_e8      ; 186F: 00E8
        movf            mem_cc, W   ; 1870: 084C
        movwf           mem_e6      ; 1871: 00E6
        movlw           0x1e        ; 1872: 301E
        goto            label_187e  ; 1873: 287E

loop_1874
; jump here from: 188B
        movlw           0x00        ; 1874: 3000
        movlp           0x16        ; 1875: 3196
        call            sub_1682    ; 1876: 2682

        movlp           0x18        ; 1877: 3198
        call            sub_1f0e    ; 1878: 270E

        movlp           0x18        ; 1879: 3198
        call            sub_19d5    ; 187A: 21D5

        movlp           0x18        ; 187B: 3198
        call            sub_1ecf    ; 187C: 26CF

        movlp           0x18        ; 187D: 3198

label_187e
; jump here from: 1873
        movlb           0x00        ; 187E: 0020
        movwf           mem_3b      ; 187F: 00BB
        goto            label_1864  ; 1880: 2864

label_1881
; jump here from: 1860
        movlb           0x00        ; 1881: 0020
        movf            mem_3a, W   ; 1882: 083A
        xorlw           0x01        ; 1883: 3A01
        btfsc           STATUS, Z   ; 1884: 1903
        goto            loop_1861   ; 1885: 2861

        xorlw           0x05        ; 1886: 3A05
        btfsc           STATUS, Z   ; 1887: 1903
        goto            loop_1867   ; 1888: 2867

        xorlw           0x03        ; 1889: 3A03
        btfsc           STATUS, Z   ; 188A: 1903
        goto            loop_1874   ; 188B: 2874
        goto            label_1864  ; 188C: 2864
;
; end of label_1881
;------------------------------------------------------------

        return                      ; 188D: 0008

label_188e
; jump here from: 2FB5
        goto            label_18af  ; 188E: 28AF

loop_188f
; jump here from: 18B3
        call            sub_1f25    ; 188F: 2725

        btfsc           STATUS, C   ; 1890: 1803
        clrf            mem_65      ; 1891: 01E5

label_1892
; jump here from: 18AE
; jump here from: 18BA
        movlb           0x00        ; 1892: 0020
        clrf            mem_3a      ; 1893: 01BA
        return                      ; 1894: 0008

loop_1895
; jump here from: 18B6
        movlw           0x00        ; 1895: 3000
        movlp           0x16        ; 1896: 3196
        call            sub_1682    ; 1897: 2682

        movlp           0x18        ; 1898: 3198
        movlb           0x01        ; 1899: 0021
        movf            mem_ec, W   ; 189A: 086C
        movwf           mem_e7      ; 189B: 00E7
        movf            mem_ed, W   ; 189C: 086D
        movwf           mem_e8      ; 189D: 00E8
        movf            mem_eb, W   ; 189E: 086B
        movwf           mem_e6      ; 189F: 00E6
        movlw           0x1d        ; 18A0: 301D
        goto            label_18ac  ; 18A1: 28AC

loop_18a2
; jump here from: 18B9
        movlw           0x00        ; 18A2: 3000
        movlp           0x16        ; 18A3: 3196
        call            sub_1682    ; 18A4: 2682

        movlp           0x18        ; 18A5: 3198
        call            sub_1f0e    ; 18A6: 270E

        movlp           0x18        ; 18A7: 3198
        call            sub_19d5    ; 18A8: 21D5

        movlp           0x18        ; 18A9: 3198
        call            sub_1ecf    ; 18AA: 26CF

        movlp           0x18        ; 18AB: 3198

label_18ac
; jump here from: 18A1
        movlb           0x00        ; 18AC: 0020
        movwf           mem_3b      ; 18AD: 00BB
        goto            label_1892  ; 18AE: 2892

label_18af
; jump here from: 188E
        movlb           0x00        ; 18AF: 0020
        movf            mem_3a, W   ; 18B0: 083A
        xorlw           0x01        ; 18B1: 3A01
        btfsc           STATUS, Z   ; 18B2: 1903
        goto            loop_188f   ; 18B3: 288F

        xorlw           0x05        ; 18B4: 3A05
        btfsc           STATUS, Z   ; 18B5: 1903
        goto            loop_1895   ; 18B6: 2895

        xorlw           0x03        ; 18B7: 3A03
        btfsc           STATUS, Z   ; 18B8: 1903
        goto            loop_18a2   ; 18B9: 28A2
        goto            label_1892  ; 18BA: 2892
;
; end of label_18af
;------------------------------------------------------------

        return                      ; 18BB: 0008

label_18bc
; jump here from: 2FC9
        goto            label_1913  ; 18BC: 2913

loop_18bd
; jump here from: 1917
        call            sub_1f25    ; 18BD: 2725

        btfsc           STATUS, C   ; 18BE: 1803
        clrf            mem_65      ; 18BF: 01E5

loop_18c0
; jump here from: 18C5
; jump here from: 18D5
; jump here from: 18DA
; jump here from: 18DC
; jump here from: 18E0
; jump here from: 18EB
; jump here from: 18F0
; jump here from: 18F3
; jump here from: 1912
; jump here from: 1924
        movlb           0x00        ; 18C0: 0020
        clrf            mem_3a      ; 18C1: 01BA
        return                      ; 18C2: 0008

loop_18c3
; jump here from: 191A
        movf            mem_45, W   ; 18C3: 0845
        btfsc           STATUS, Z   ; 18C4: 1903
        goto            loop_18c0   ; 18C5: 28C0

        movlw           0x08        ; 18C6: 3008
        decf            mem_45, f   ; 18C7: 03C5
        decf            mem_46, f   ; 18C8: 03C6
        subwf           mem_46, W   ; 18C9: 0246
        btfss           STATUS, C   ; 18CA: 1C03
        goto            loop_18ce   ; 18CB: 28CE

        movlw           0x07        ; 18CC: 3007
        movwf           mem_46      ; 18CD: 00C6

loop_18ce
; jump here from: 18CB
        call            sub_1926    ; 18CE: 2126

        movlp           0x18        ; 18CF: 3198
        movlb           0x01        ; 18D0: 0021
        movlw           0x36        ; 18D1: 3036
        incf            mem_c1, f   ; 18D2: 0AC1
        subwf           mem_c1, W   ; 18D3: 0241
        btfss           STATUS, C   ; 18D4: 1C03
        goto            loop_18c0   ; 18D5: 28C0

        movlw           0x64        ; 18D6: 3064
        call            sub_1f45    ; 18D7: 2745

        movlp           0x18        ; 18D8: 3198
        btfss           STATUS, C   ; 18D9: 1C03
        goto            loop_18c0   ; 18DA: 28C0

        clrf            mem_c2      ; 18DB: 01C2
        goto            loop_18c0   ; 18DC: 28C0

loop_18dd
; jump here from: 191D
        movlw           0x07        ; 18DD: 3007
        subwf           mem_45, W   ; 18DE: 0245
        btfsc           STATUS, C   ; 18DF: 1803
        goto            loop_18c0   ; 18E0: 28C0

        movlw           0x08        ; 18E1: 3008
        incf            mem_45, f   ; 18E2: 0AC5
        incf            mem_46, f   ; 18E3: 0AC6
        subwf           mem_46, W   ; 18E4: 0246
        btfsc           STATUS, C   ; 18E5: 1803
        clrf            mem_46      ; 18E6: 01C6
        call            sub_1926    ; 18E7: 2126

        movlp           0x18        ; 18E8: 3198
        movlb           0x01        ; 18E9: 0021
        decfsz          mem_c1, f   ; 18EA: 0BC1
        goto            loop_18c0   ; 18EB: 28C0

        movlw           0x35        ; 18EC: 3035
        call            sub_1f4a    ; 18ED: 274A

        movlp           0x18        ; 18EE: 3198
        btfss           STATUS, C   ; 18EF: 1C03
        goto            loop_18c0   ; 18F0: 28C0

        movlw           0x63        ; 18F1: 3063
        movwf           mem_c2      ; 18F2: 00C2
        goto            loop_18c0   ; 18F3: 28C0

loop_18f4
; jump here from: 1920
        movlw           0x00        ; 18F4: 3000
        movlp           0x16        ; 18F5: 3196
        call            sub_1682    ; 18F6: 2682

        movlp           0x18        ; 18F7: 3198
        movlb           0x00        ; 18F8: 0020
        clrf            mem_45      ; 18F9: 01C5
        movlb           0x01        ; 18FA: 0021
        movf            mem_c9, W   ; 18FB: 0849
        movlb           0x00        ; 18FC: 0020
        movwf           mem_46      ; 18FD: 00C6
        call            sub_19ad    ; 18FE: 21AD

        movlb           0x00        ; 18FF: 0020
        movf            mem_39, W   ; 1900: 0839
        movlb           0x01        ; 1901: 0021
        movwf           mem_c2      ; 1902: 00C2
        movlb           0x00        ; 1903: 0020
        movf            mem_38, W   ; 1904: 0838
        movlb           0x01        ; 1905: 0021
        movwf           mem_c1      ; 1906: 00C1
        movlw           0x21        ; 1907: 3021
        movlb           0x00        ; 1908: 0020
        movwf           mem_3b      ; 1909: 00BB
        clrf            mem_3a      ; 190A: 01BA
        return                      ; 190B: 0008

loop_190c
; jump here from: 1923
        movlw           0x00        ; 190C: 3000
        movlp           0x16        ; 190D: 3196
        call            sub_1682    ; 190E: 2682

        movlp           0x18        ; 190F: 3198
        movlb           0x00        ; 1910: 0020
        clrf            mem_3b      ; 1911: 01BB
        goto            loop_18c0   ; 1912: 28C0

label_1913
; jump here from: 18BC
        movlb           0x00        ; 1913: 0020
        movf            mem_3a, W   ; 1914: 083A
        xorlw           0x01        ; 1915: 3A01
        btfsc           STATUS, Z   ; 1916: 1903
        goto            loop_18bd   ; 1917: 28BD

        xorlw           0x03        ; 1918: 3A03
        btfsc           STATUS, Z   ; 1919: 1903
        goto            loop_18c3   ; 191A: 28C3

        xorlw           0x01        ; 191B: 3A01
        btfsc           STATUS, Z   ; 191C: 1903
        goto            loop_18dd   ; 191D: 28DD

        xorlw           0x07        ; 191E: 3A07
        btfsc           STATUS, Z   ; 191F: 1903
        goto            loop_18f4   ; 1920: 28F4

        xorlw           0x03        ; 1921: 3A03
        btfsc           STATUS, Z   ; 1922: 1903
        goto            loop_190c   ; 1923: 290C
        goto            loop_18c0   ; 1924: 28C0
;
; end of label_1913
;------------------------------------------------------------

        return                      ; 1925: 0008

;------------------------------------------------------------
; Subroutine: sub_1926
;
; called from: 1133
; called from: 18CE
; called from: 18E7

sub_1926
        movf            mem_c6, W   ; 1926: 0846
        addwf           mem_c6, W   ; 1927: 0746
        addwf           mem_c6, W   ; 1928: 0746
        movwf           mem_d5      ; 1929: 00D5
        movwf           mem_d2      ; 192A: 00D2
        movlw           0x83        ; 192B: 3083
        movlp           0x0d        ; 192C: 318D
        call            I2CRead    ; 192D: 25FD

        movlp           0x18        ; 192E: 3198
        movlb           0x01        ; 192F: 0021
        movwf           mem_e7      ; 1930: 00E7
        movlb           0x00        ; 1931: 0020
        incf            mem_55, W   ; 1932: 0A55
        movwf           mem_52      ; 1933: 00D2
        movlw           0x83        ; 1934: 3083
        movlp           0x0d        ; 1935: 318D
        call            I2CRead    ; 1936: 25FD

        movlp           0x18        ; 1937: 3198
        movlb           0x01        ; 1938: 0021
        movwf           mem_e8      ; 1939: 00E8
        movlb           0x00        ; 193A: 0020
        movf            mem_55, W   ; 193B: 0855
        addlw           0x02        ; 193C: 3E02
        movwf           mem_52      ; 193D: 00D2
        movlw           0x83        ; 193E: 3083
        movlp           0x0d        ; 193F: 318D
        call            I2CRead    ; 1940: 25FD

        movlp           0x18        ; 1941: 3198
        call            sub_1f40    ; 1942: 2740

        movlp           0x18        ; 1943: 3198
        btfss           STATUS, Z   ; 1944: 1D03
        return                      ; 1945: 0008
        movlb           0x01        ; 1946: 0021
        call            sub_1ea7    ; 1947: 26A7

        movlp           0x18        ; 1948: 3198
        call            sub_1ec3    ; 1949: 26C3

        movlp           0x18        ; 194A: 3198
        call            sub_1b70    ; 194B: 2370

        movlp           0x07        ; 194C: 3187
        goto            label_0730  ; 194D: 2F30

label_194e
; jump here from: 2FCE
        goto            label_199a  ; 194E: 299A
;
; end of label_194e
;------------------------------------------------------------


loop_194f
; jump here from: 199E
        call            sub_1f25    ; 194F: 2725

        btfsc           STATUS, C   ; 1950: 1803
        clrf            mem_65      ; 1951: 01E5

loop_1952
; jump here from: 1957
; jump here from: 1967
; jump here from: 196C
; jump here from: 196E
; jump here from: 1972
; jump here from: 197D
; jump here from: 1982
; jump here from: 1985
; jump here from: 1992
; jump here from: 1999
; jump here from: 19AB
        movlb           0x00        ; 1952: 0020
        clrf            mem_3a      ; 1953: 01BA
        return                      ; 1954: 0008

loop_1955
; jump here from: 19A1
        movf            mem_45, W   ; 1955: 0845
        btfsc           STATUS, Z   ; 1956: 1903
        goto            loop_1952   ; 1957: 2952

        movlw           0x18        ; 1958: 3018
        decf            mem_45, f   ; 1959: 03C5
        decf            mem_46, f   ; 195A: 03C6
        subwf           mem_46, W   ; 195B: 0246
        btfss           STATUS, C   ; 195C: 1C03
        goto            loop_1960   ; 195D: 2960

        movlw           0x17        ; 195E: 3017
        movwf           mem_46      ; 195F: 00C6

loop_1960
; jump here from: 195D
        call            sub_19ad    ; 1960: 21AD

        movlp           0x18        ; 1961: 3198
        movlb           0x01        ; 1962: 0021
        movlw           0x0d        ; 1963: 300D
        incf            mem_c1, f   ; 1964: 0AC1
        subwf           mem_c1, W   ; 1965: 0241
        btfss           STATUS, C   ; 1966: 1C03
        goto            loop_1952   ; 1967: 2952

        movlw           0x64        ; 1968: 3064
        call            sub_1f45    ; 1969: 2745

        movlp           0x18        ; 196A: 3198
        btfss           STATUS, C   ; 196B: 1C03
        goto            loop_1952   ; 196C: 2952

        clrf            mem_c2      ; 196D: 01C2
        goto            loop_1952   ; 196E: 2952

loop_196f
; jump here from: 19A4
        movlw           0x17        ; 196F: 3017
        subwf           mem_45, W   ; 1970: 0245
        btfsc           STATUS, C   ; 1971: 1803
        goto            loop_1952   ; 1972: 2952

        movlw           0x18        ; 1973: 3018
        incf            mem_45, f   ; 1974: 0AC5
        incf            mem_46, f   ; 1975: 0AC6
        subwf           mem_46, W   ; 1976: 0246
        btfsc           STATUS, C   ; 1977: 1803
        clrf            mem_46      ; 1978: 01C6
        call            sub_19ad    ; 1979: 21AD

        movlp           0x18        ; 197A: 3198
        movlb           0x01        ; 197B: 0021
        decfsz          mem_c1, f   ; 197C: 0BC1
        goto            loop_1952   ; 197D: 2952

        movlw           0x0c        ; 197E: 300C
        call            sub_1f4a    ; 197F: 274A

        movlp           0x18        ; 1980: 3198
        btfss           STATUS, C   ; 1981: 1C03
        goto            loop_1952   ; 1982: 2952

        movlw           0x63        ; 1983: 3063
        movwf           mem_c2      ; 1984: 00C2
        goto            loop_1952   ; 1985: 2952

loop_1986
; jump here from: 19A7
        movlw           0x00        ; 1986: 3000
        movlp           0x16        ; 1987: 3196
        call            sub_1682    ; 1988: 2682

        movlp           0x18        ; 1989: 3198
        call            sub_1f0e    ; 198A: 270E

        movlp           0x18        ; 198B: 3198
        call            sub_19d5    ; 198C: 21D5

        movlp           0x18        ; 198D: 3198
        call            sub_1ecf    ; 198E: 26CF

        movlp           0x18        ; 198F: 3198
        movlb           0x00        ; 1990: 0020
        movwf           mem_3b      ; 1991: 00BB
        goto            loop_1952   ; 1992: 2952

loop_1993
; jump here from: 19AA
        movlw           0x00        ; 1993: 3000
        movlp           0x16        ; 1994: 3196
        call            sub_1682    ; 1995: 2682

        movlp           0x18        ; 1996: 3198
        movlb           0x00        ; 1997: 0020
        clrf            mem_3b      ; 1998: 01BB
        goto            loop_1952   ; 1999: 2952

label_199a
; jump here from: 194E
        movlb           0x00        ; 199A: 0020
        movf            mem_3a, W   ; 199B: 083A
        xorlw           0x01        ; 199C: 3A01
        btfsc           STATUS, Z   ; 199D: 1903
        goto            loop_194f   ; 199E: 294F

        xorlw           0x03        ; 199F: 3A03
        btfsc           STATUS, Z   ; 19A0: 1903
        goto            loop_1955   ; 19A1: 2955

        xorlw           0x01        ; 19A2: 3A01
        btfsc           STATUS, Z   ; 19A3: 1903
        goto            loop_196f   ; 19A4: 296F

        xorlw           0x07        ; 19A5: 3A07
        btfsc           STATUS, Z   ; 19A6: 1903
        goto            loop_1986   ; 19A7: 2986

        xorlw           0x03        ; 19A8: 3A03
        btfsc           STATUS, Z   ; 19A9: 1903
        goto            loop_1993   ; 19AA: 2993
        goto            loop_1952   ; 19AB: 2952
;
; end of label_199a
;------------------------------------------------------------

        return                      ; 19AC: 0008

;------------------------------------------------------------
; Subroutine: sub_19ad
;
; called from: 18FE
; called from: 1960
; called from: 1979

sub_19ad
        movf            mem_c6, W   ; 19AD: 0846
        addwf           mem_c6, W   ; 19AE: 0746
        addwf           mem_c6, W   ; 19AF: 0746
        movwf           mem_d5      ; 19B0: 00D5
        movwf           mem_d2      ; 19B1: 00D2
        movlw           0x86        ; 19B2: 3086
        movlp           0x0d        ; 19B3: 318D
        call            I2CRead    ; 19B4: 25FD

        movlp           0x18        ; 19B5: 3198
        movlb           0x01        ; 19B6: 0021
        movwf           mem_e7      ; 19B7: 00E7
        movlb           0x00        ; 19B8: 0020
        incf            mem_55, W   ; 19B9: 0A55
        movwf           mem_52      ; 19BA: 00D2
        movlw           0x86        ; 19BB: 3086
        movlp           0x0d        ; 19BC: 318D
        call            I2CRead    ; 19BD: 25FD

        movlp           0x18        ; 19BE: 3198
        movlb           0x01        ; 19BF: 0021
        movwf           mem_e8      ; 19C0: 00E8
        movlb           0x00        ; 19C1: 0020
        movf            mem_55, W   ; 19C2: 0855
        addlw           0x02        ; 19C3: 3E02
        movwf           mem_52      ; 19C4: 00D2
        movlw           0x86        ; 19C5: 3086
        movlp           0x0d        ; 19C6: 318D
        call            I2CRead    ; 19C7: 25FD

        movlp           0x18        ; 19C8: 3198
        call            sub_1f40    ; 19C9: 2740

        movlp           0x18        ; 19CA: 3198
        btfss           STATUS, Z   ; 19CB: 1D03
        return                      ; 19CC: 0008
        movlb           0x01        ; 19CD: 0021
        call            sub_1ea7    ; 19CE: 26A7

        movlp           0x18        ; 19CF: 3198
        call            sub_1ec3    ; 19D0: 26C3

        movlp           0x18        ; 19D1: 3198
        call            sub_1b70    ; 19D2: 2370

        movlp           0x07        ; 19D3: 3187
        goto            label_0730  ; 19D4: 2F30

;------------------------------------------------------------
; Subroutine: sub_19d5
;
; called from: 057B
; called from: 1118
; called from: 187A
; called from: 18A8
; called from: 198C

sub_19d5
        movlb           0x00        ; 19D5: 0020
        movf            mem_45, f   ; 19D6: 08C5
        btfss           STATUS, Z   ; 19D7: 1D03
        goto            loop_19e1   ; 19D8: 29E1

        movlb           0x01        ; 19D9: 0021
        movf            mem_dd, W   ; 19DA: 085D
        movwf           mem_e7      ; 19DB: 00E7
        movf            mem_de, W   ; 19DC: 085E
        movwf           mem_e8      ; 19DD: 00E8
        movf            mem_dc, W   ; 19DE: 085C
        movwf           mem_e6      ; 19DF: 00E6
        return                      ; 19E0: 0008

loop_19e1
; jump here from: 19D8
        movf            mem_46, W   ; 19E1: 0846
        addwf           mem_46, W   ; 19E2: 0746
        addwf           mem_46, W   ; 19E3: 0746
        movwf           mem_55      ; 19E4: 00D5
        movwf           mem_52      ; 19E5: 00D2
        movlw           0x87        ; 19E6: 3087
        movlp           0x0d        ; 19E7: 318D
        call            I2CRead    ; 19E8: 25FD

        movlp           0x18        ; 19E9: 3198
        movlb           0x01        ; 19EA: 0021
        movwf           mem_e7      ; 19EB: 00E7
        movlb           0x00        ; 19EC: 0020
        incf            mem_55, W   ; 19ED: 0A55
        movwf           mem_52      ; 19EE: 00D2
        movlw           0x87        ; 19EF: 3087
        movlp           0x0d        ; 19F0: 318D
        call            I2CRead    ; 19F1: 25FD

        movlp           0x18        ; 19F2: 3198
        movlb           0x01        ; 19F3: 0021
        movwf           mem_e8      ; 19F4: 00E8
        movlb           0x00        ; 19F5: 0020
        movf            mem_55, W   ; 19F6: 0855
        addlw           0x02        ; 19F7: 3E02
        movwf           mem_52      ; 19F8: 00D2
        movlw           0x87        ; 19F9: 3087
        movlp           0x0d        ; 19FA: 318D
        call            I2CRead    ; 19FB: 25FD

        movlb           0x01        ; 19FC: 0021
        movwf           mem_e6      ; 19FD: 00E6
        return                      ; 19FE: 0008

;------------------------------------------------------------
; Subroutine: sub_19ff
;
; called from: 1858
; called from: 27F6
; called from: 2C02
; called from: 30EB
; called from: 318F
; called from: 31C2

sub_19ff
        goto            label_1a31  ; 19FF: 2A31

loop_1a00
; jump here from: 1A35
        movf            mem_e7, W   ; 1A00: 0867
        movlb           0x00        ; 1A01: 0020
        movwf           mem_23      ; 1A02: 00A3
        movlb           0x01        ; 1A03: 0021
        movf            mem_e8, W   ; 1A04: 0868
        movlb           0x00        ; 1A05: 0020
        movwf           mem_22      ; 1A06: 00A2
        movlb           0x01        ; 1A07: 0021
        movf            mem_e6, W   ; 1A08: 0866
        movlb           0x00        ; 1A09: 0020
        movwf           mem_33      ; 1A0A: 00B3
        call            sub_1d02    ; 1A0B: 2502

        movlp           0x18        ; 1A0C: 3198
        goto            label_1a3d  ; 1A0D: 2A3D

loop_1a0e
; jump here from: 1A38
        call            sub_1f1c    ; 1A0E: 271C

        movlp           0x18        ; 1A0F: 3198
        call            sub_1b5a    ; 1A10: 235A

        movlp           0x28        ; 1A11: 31A8
        call            sub_289d    ; 1A12: 209D

        movlp           0x18        ; 1A13: 3198
        movlb           0x01        ; 1A14: 0021
        movwf           mem_ba      ; 1A15: 00BA
        movlp           0x2e        ; 1A16: 31AE
        call            sub_2e22    ; 1A17: 2622

        movlp           0x18        ; 1A18: 3198
        call            sub_1ec3    ; 1A19: 26C3

        movlp           0x18        ; 1A1A: 3198
        call            sub_1c28    ; 1A1B: 2428

        movlp           0x18        ; 1A1C: 3198
        call            sub_1d14    ; 1A1D: 2514

        movlp           0x18        ; 1A1E: 3198
        goto            label_1a3d  ; 1A1F: 2A3D

loop_1a20
; jump here from: 1A3B
        call            sub_1f3b    ; 1A20: 273B

        movlp           0x18        ; 1A21: 3198
        call            sub_1b5a    ; 1A22: 235A

        movlp           0x18        ; 1A23: 3198
        call            sub_1f36    ; 1A24: 2736

        movlb           0x01        ; 1A25: 0021
        movwf           mem_ba      ; 1A26: 00BA
        movlp           0x2e        ; 1A27: 31AE
        call            sub_2e22    ; 1A28: 2622

        movlp           0x18        ; 1A29: 3198
        call            sub_1ec3    ; 1A2A: 26C3

        movlp           0x18        ; 1A2B: 3198
        call            sub_1c28    ; 1A2C: 2428

        movlp           0x18        ; 1A2D: 3198
        call            sub_1d0b    ; 1A2E: 250B

        movlp           0x18        ; 1A2F: 3198
        goto            label_1a3d  ; 1A30: 2A3D

label_1a31
; jump here from: 19FF
        movlb           0x01        ; 1A31: 0021
        movf            mem_e5, W   ; 1A32: 0865
        xorlw           0x00        ; 1A33: 3A00
        btfsc           STATUS, Z   ; 1A34: 1903
        goto            loop_1a00   ; 1A35: 2A00

        xorlw           0x01        ; 1A36: 3A01
        btfsc           STATUS, Z   ; 1A37: 1903
        goto            loop_1a0e   ; 1A38: 2A0E

        xorlw           0x03        ; 1A39: 3A03
        btfsc           STATUS, Z   ; 1A3A: 1903
        goto            loop_1a20   ; 1A3B: 2A20
        goto            label_1a3d  ; 1A3C: 2A3D

label_1a3d
; jump here from: 1A0D
; jump here from: 1A1F
; jump here from: 1A30
; jump here from: 1A3C
        goto            label_1d87  ; 1A3D: 2D87
;
; end of label_1a3d
;------------------------------------------------------------


;------------------------------------------------------------
; Subroutine: sub_1a3e
;
; called from: 0BEB

sub_1a3e
        movlb           0x01        ; 1A3E: 0021
        movf            mem_ea, W   ; 1A3F: 086A
        movlb           0x00        ; 1A40: 0020
        movwf           mem_22      ; 1A41: 00A2
        clrf            mem_23      ; 1A42: 01A3
        incf            mem_22, f   ; 1A43: 0AA2
        btfsc           STATUS, Z   ; 1A44: 1903
        incf            mem_23, f   ; 1A45: 0AA3
        call            sub_1b5a    ; 1A46: 235A

        movlp           0x18        ; 1A47: 3198
        call            sub_1fdb    ; 1A48: 27DB

        movlp           0x18        ; 1A49: 3198
        movf            mem_6a, W   ; 1A4A: 086A
        movlb           0x00        ; 1A4B: 0020
        movwf           mem_22      ; 1A4C: 00A2
        clrf            mem_23      ; 1A4D: 01A3
        call            sub_1b5a    ; 1A4E: 235A

        movlp           0x18        ; 1A4F: 3198
        call            sub_1e9b    ; 1A50: 269B

        movlp           0x2e        ; 1A51: 31AE
        call            sub_2e22    ; 1A52: 2622

        movlp           0x18        ; 1A53: 3198
        call            sub_1f02    ; 1A54: 2702

        movlp           0x18        ; 1A55: 3198
        call            sub_1c28    ; 1A56: 2428

        movlp           0x18        ; 1A57: 3198
        movlb           0x00        ; 1A58: 0020
        call            sub_1ef6    ; 1A59: 26F6

        movlp           0x18        ; 1A5A: 3198
        movlb           0x02        ; 1A5B: 0022
        movf            mem_163, W  ; 1A5C: 0863
        movlb           0x00        ; 1A5D: 0020
        movwf           mem_23      ; 1A5E: 00A3
        movlb           0x02        ; 1A5F: 0022
        movf            mem_164, W  ; 1A60: 0864
        movlb           0x00        ; 1A61: 0020
        movwf           mem_22      ; 1A62: 00A2
        movlb           0x02        ; 1A63: 0022
        movf            mem_162, W  ; 1A64: 0862
        movlb           0x00        ; 1A65: 0020
        movwf           mem_33      ; 1A66: 00B3
        call            sub_1e9b    ; 1A67: 269B

        movlp           0x2e        ; 1A68: 31AE
        call            sub_2e22    ; 1A69: 2622

        movlp           0x18        ; 1A6A: 3198
        call            sub_1f02    ; 1A6B: 2702

        movlp           0x18        ; 1A6C: 3198
        call            sub_1b70    ; 1A6D: 2370

        movlp           0x18        ; 1A6E: 3198
        call            sub_1ef6    ; 1A6F: 26F6

        movlw           0x1c        ; 1A70: 301C
        movlb           0x00        ; 1A71: 0020
        movwf           mem_55      ; 1A72: 00D5
        movlb           0x01        ; 1A73: 0021
        movf            mem_ec, W   ; 1A74: 086C
        movlb           0x00        ; 1A75: 0020
        movwf           mem_56      ; 1A76: 00D6
        movlw           0x88        ; 1A77: 3088
        movlp           0x0c        ; 1A78: 318C
        call            I2CWrite    ; 1A79: 24B3

        movlp           0x18        ; 1A7A: 3198
        movlw           0x1d        ; 1A7B: 301D
        movwf           mem_55      ; 1A7C: 00D5
        movlb           0x01        ; 1A7D: 0021
        movf            mem_ed, W   ; 1A7E: 086D
        movlb           0x00        ; 1A7F: 0020
        movwf           mem_56      ; 1A80: 00D6
        movlw           0x88        ; 1A81: 3088
        movlp           0x0c        ; 1A82: 318C
        call            I2CWrite    ; 1A83: 24B3

        movlp           0x18        ; 1A84: 3198
        movlw           0x1e        ; 1A85: 301E
        movwf           mem_55      ; 1A86: 00D5
        movlb           0x01        ; 1A87: 0021
        movf            mem_eb, W   ; 1A88: 086B
        movlb           0x00        ; 1A89: 0020
        movwf           mem_56      ; 1A8A: 00D6
        movlw           0x88        ; 1A8B: 3088
        movlp           0x0c        ; 1A8C: 318C
        call            I2CWrite    ; 1A8D: 24B3

        movlp           0x18        ; 1A8E: 3198
        movlb           0x01        ; 1A8F: 0021
        movlw           0x17        ; 1A90: 3017
        incf            mem_ea, f   ; 1A91: 0AEA
        movlb           0x00        ; 1A92: 0020
        movwf           mem_55      ; 1A93: 00D5
        movlb           0x01        ; 1A94: 0021
        movf            mem_ea, W   ; 1A95: 086A
        movlb           0x00        ; 1A96: 0020
        movwf           mem_56      ; 1A97: 00D6
        movlw           0x88        ; 1A98: 3088
        movlp           0x0c        ; 1A99: 318C
        call            I2CWrite    ; 1A9A: 24B3

        movlp           0x18        ; 1A9B: 3198
        movlb           0x01        ; 1A9C: 0021
        movlw           0x08        ; 1A9D: 3008
        decf            mem_e9, f   ; 1A9E: 03E9
        subwf           mem_e9, W   ; 1A9F: 0269
        btfss           STATUS, C   ; 1AA0: 1C03
        goto            loop_1aa4   ; 1AA1: 2AA4

        movlw           0x07        ; 1AA2: 3007
        movwf           mem_e9      ; 1AA3: 00E9

loop_1aa4
; jump here from: 1AA1
        movlw           0x48        ; 1AA4: 3048
        movlb           0x00        ; 1AA5: 0020
        movwf           mem_55      ; 1AA6: 00D5
        movlb           0x01        ; 1AA7: 0021
        movf            mem_e9, W   ; 1AA8: 0869
        movlb           0x00        ; 1AA9: 0020
        movwf           mem_56      ; 1AAA: 00D6
        movlw           0x83        ; 1AAB: 3083
        movlp           0x0c        ; 1AAC: 318C
        call            I2CWrite    ; 1AAD: 24B3

        movlp           0x18        ; 1AAE: 3198
        movlp           0x24        ; 1AAF: 31A4
        call            sub_243e    ; 1AB0: 243E

        movlp           0x18        ; 1AB1: 3198
        call            sub_1f30    ; 1AB2: 2730

        movwf           mem_58      ; 1AB3: 00D8
        movwf           mem_55      ; 1AB4: 00D5
        movlw           0x83        ; 1AB5: 3083
        clrf            mem_56      ; 1AB6: 01D6
        movlp           0x0c        ; 1AB7: 318C
        call            I2CWrite    ; 1AB8: 24B3

        movlp           0x18        ; 1AB9: 3198
        incf            mem_58, W   ; 1ABA: 0A58
        movwf           mem_55      ; 1ABB: 00D5
        movlw           0x83        ; 1ABC: 3083
        clrf            mem_56      ; 1ABD: 01D6
        movlp           0x0c        ; 1ABE: 318C
        call            I2CWrite    ; 1ABF: 24B3

        movlp           0x18        ; 1AC0: 3198
        movf            mem_58, W   ; 1AC1: 0858
        addlw           0x02        ; 1AC2: 3E02
        movwf           mem_55      ; 1AC3: 00D5
        movlw           0x83        ; 1AC4: 3083
        clrf            mem_56      ; 1AC5: 01D6
        movlp           0x0c        ; 1AC6: 318C
        goto            I2CWrite    ; 1AC7: 2CB3

;------------------------------------------------------------
; Subroutine: sub_1ac8
;
; called from: 0AD3

sub_1ac8
        movlb           0x01        ; 1AC8: 0021
        movlp           0x07        ; 1AC9: 3187
        call            sub_0748    ; 1ACA: 2748

        movlp           0x18        ; 1ACB: 3198
        incf            mem_a2, f   ; 1ACC: 0AA2
        btfsc           STATUS, Z   ; 1ACD: 1903
        incf            mem_a3, f   ; 1ACE: 0AA3
        call            sub_1b5a    ; 1ACF: 235A

        movlp           0x18        ; 1AD0: 3198
        call            sub_1fdb    ; 1AD1: 27DB

        movlp           0x07        ; 1AD2: 3187
        call            sub_0748    ; 1AD3: 2748

        movlp           0x18        ; 1AD4: 3198
        call            sub_1b5a    ; 1AD5: 235A

        movlp           0x18        ; 1AD6: 3198
        call            sub_1e9b    ; 1AD7: 269B

        movlp           0x2e        ; 1AD8: 31AE
        call            sub_2e22    ; 1AD9: 2622

        movlp           0x18        ; 1ADA: 3198
        movlp           0x07        ; 1ADB: 3187
        call            sub_073c    ; 1ADC: 273C

        movlp           0x18        ; 1ADD: 3198
        call            sub_1c28    ; 1ADE: 2428

        movlp           0x18        ; 1ADF: 3198
        movlb           0x00        ; 1AE0: 0020
        call            sub_1eea    ; 1AE1: 26EA

        movlp           0x18        ; 1AE2: 3198
        call            sub_1ea7    ; 1AE3: 26A7

        movlp           0x18        ; 1AE4: 3198
        call            sub_1e9b    ; 1AE5: 269B

        movlp           0x2e        ; 1AE6: 31AE
        call            sub_2e22    ; 1AE7: 2622

        movlp           0x18        ; 1AE8: 3198
        movlp           0x07        ; 1AE9: 3187
        call            sub_073c    ; 1AEA: 273C

        movlp           0x18        ; 1AEB: 3198
        call            sub_1b70    ; 1AEC: 2370

        movlp           0x18        ; 1AED: 3198
        call            sub_1eea    ; 1AEE: 26EA

        movlw           0x19        ; 1AEF: 3019
        movlb           0x00        ; 1AF0: 0020
        movwf           mem_55      ; 1AF1: 00D5
        movlb           0x01        ; 1AF2: 0021
        movf            mem_b6, W   ; 1AF3: 0836
        movlb           0x00        ; 1AF4: 0020
        movwf           mem_56      ; 1AF5: 00D6
        movlw           0x88        ; 1AF6: 3088
        movlp           0x0c        ; 1AF7: 318C
        call            I2CWrite    ; 1AF8: 24B3

        movlp           0x18        ; 1AF9: 3198
        movlw           0x1a        ; 1AFA: 301A
        movwf           mem_55      ; 1AFB: 00D5
        movlb           0x01        ; 1AFC: 0021
        movf            mem_b7, W   ; 1AFD: 0837
        movlb           0x00        ; 1AFE: 0020
        movwf           mem_56      ; 1AFF: 00D6
        movlw           0x88        ; 1B00: 3088
        movlp           0x0c        ; 1B01: 318C
        call            I2CWrite    ; 1B02: 24B3

        movlp           0x18        ; 1B03: 3198
        movlw           0x1b        ; 1B04: 301B
        movwf           mem_55      ; 1B05: 00D5
        movlb           0x01        ; 1B06: 0021
        movf            mem_b5, W   ; 1B07: 0835
        movlb           0x00        ; 1B08: 0020
        movwf           mem_56      ; 1B09: 00D6
        movlw           0x88        ; 1B0A: 3088
        movlp           0x0c        ; 1B0B: 318C
        call            I2CWrite    ; 1B0C: 24B3

        movlp           0x18        ; 1B0D: 3198
        movlb           0x01        ; 1B0E: 0021
        incf            mem_a2, f   ; 1B0F: 0AA2
        btfsc           STATUS, Z   ; 1B10: 1903
        incf            mem_a3, f   ; 1B11: 0AA3
        movlw           0x15        ; 1B12: 3015
        movlb           0x00        ; 1B13: 0020
        movwf           mem_55      ; 1B14: 00D5
        movlb           0x01        ; 1B15: 0021
        movf            mem_a3, W   ; 1B16: 0823
        movlb           0x00        ; 1B17: 0020
        movwf           mem_56      ; 1B18: 00D6
        movlw           0x88        ; 1B19: 3088
        movlp           0x0c        ; 1B1A: 318C
        call            I2CWrite    ; 1B1B: 24B3

        movlp           0x18        ; 1B1C: 3198
        movlw           0x16        ; 1B1D: 3016
        movwf           mem_55      ; 1B1E: 00D5
        movlb           0x01        ; 1B1F: 0021
        movf            mem_a2, W   ; 1B20: 0822
        movlb           0x00        ; 1B21: 0020
        movwf           mem_56      ; 1B22: 00D6
        movlw           0x88        ; 1B23: 3088
        movlp           0x0c        ; 1B24: 318C
        call            I2CWrite    ; 1B25: 24B3

        movlp           0x18        ; 1B26: 3198
        movlb           0x01        ; 1B27: 0021
        movlw           0x08        ; 1B28: 3008
        decf            mem_b8, f   ; 1B29: 03B8
        subwf           mem_b8, W   ; 1B2A: 0238
        btfss           STATUS, C   ; 1B2B: 1C03
        goto            loop_1b2f   ; 1B2C: 2B2F

        movlw           0x07        ; 1B2D: 3007
        movwf           mem_b8      ; 1B2E: 00B8

loop_1b2f
; jump here from: 1B2C
        movlw           0x48        ; 1B2F: 3048
        movlb           0x00        ; 1B30: 0020
        movwf           mem_55      ; 1B31: 00D5
        movlb           0x01        ; 1B32: 0021
        movf            mem_b8, W   ; 1B33: 0838
        movlb           0x00        ; 1B34: 0020
        movwf           mem_56      ; 1B35: 00D6
        movlw           0x87        ; 1B36: 3087
        movlp           0x0c        ; 1B37: 318C
        call            I2CWrite    ; 1B38: 24B3

        movlp           0x18        ; 1B39: 3198
        movlb           0x01        ; 1B3A: 0021
        movf            mem_b8, W   ; 1B3B: 0838
        addwf           mem_b8, W   ; 1B3C: 0738
        addwf           mem_b8, W   ; 1B3D: 0738
        movlb           0x00        ; 1B3E: 0020
        movwf           mem_59      ; 1B3F: 00D9
        movwf           mem_55      ; 1B40: 00D5
        movlw           0x87        ; 1B41: 3087
        clrf            mem_56      ; 1B42: 01D6
        movlp           0x0c        ; 1B43: 318C
        call            I2CWrite    ; 1B44: 24B3

        movlp           0x18        ; 1B45: 3198
        incf            mem_59, W   ; 1B46: 0A59
        movwf           mem_55      ; 1B47: 00D5
        movlw           0x87        ; 1B48: 3087
        clrf            mem_56      ; 1B49: 01D6
        movlp           0x0c        ; 1B4A: 318C
        call            I2CWrite    ; 1B4B: 24B3

        movlp           0x18        ; 1B4C: 3198
        movf            mem_59, W   ; 1B4D: 0859
        addlw           0x02        ; 1B4E: 3E02
        movwf           mem_55      ; 1B4F: 00D5
        movlw           0x87        ; 1B50: 3087
        clrf            mem_56      ; 1B51: 01D6
        movlp           0x0c        ; 1B52: 318C
        call            I2CWrite    ; 1B53: 24B3

        movlp           0x18        ; 1B54: 3198
        call            sub_1c95    ; 1B55: 2495

        movlp           0x18        ; 1B56: 3198
        call            sub_1cca    ; 1B57: 24CA

        movlp           0x24        ; 1B58: 31A4
        goto            sub_2439    ; 1B59: 2C39

;------------------------------------------------------------
; Subroutine: sub_1b5a
;
; called from: 060A
; called from: 0611
; called from: 1A10
; called from: 1A22
; called from: 1A46
; called from: 1A4E
; called from: 1ACF
; called from: 1AD5
; called from: 1D53
; called from: 1D75
; called from: 1F5E
; called from: 285A

sub_1b5a
        movlb           0x01        ; 1B5A: 0021
        clrf            mem_bf      ; 1B5B: 01BF
        movlb           0x00        ; 1B5C: 0020
        btfss           mem_23, 7   ; 1B5D: 1FA3
        goto            loop_1b64   ; 1B5E: 2B64

        movlb           0x01        ; 1B5F: 0021
        bsf             mem_bf, 7   ; 1B60: 17BF
        movlp           0x2e        ; 1B61: 31AE
        call            sub_2e07    ; 1B62: 2607

        movlp           0x18        ; 1B63: 3198

loop_1b64
; jump here from: 1B5E
        movlw           0x0f        ; 1B64: 300F
        movwf           mem_33      ; 1B65: 00B3
        clrf            mem_25      ; 1B66: 01A5
        clrf            mem_24      ; 1B67: 01A4
        movlp           0x2e        ; 1B68: 31AE
        call            sub_2e7d    ; 1B69: 267D

        movlp           0x18        ; 1B6A: 3198
        movlb           0x01        ; 1B6B: 0021
        btfss           mem_bf, 7   ; 1B6C: 1FBF
        return                      ; 1B6D: 0008
        movlp           0x2e        ; 1B6E: 31AE
        goto            sub_2e07    ; 1B6F: 2E07

;------------------------------------------------------------
; Subroutine: sub_1b70
;
; called from: 0632
; called from: 182D
; called from: 194B
; called from: 19D2
; called from: 1A6D
; called from: 1AEC
; called from: 1CA4
; called from: 1CD9
; called from: 1F7D
; called from: 3493
; called from: 3FD8

sub_1b70
        call            sub_1bbc    ; 1B70: 23BC

        movlp           0x18        ; 1B71: 3198
        call            sub_1bcd    ; 1B72: 23CD

        movlp           0x18        ; 1B73: 3198
        movlb           0x03        ; 1B74: 0023
        decfsz          mem_1c6, W  ; 1B75: 0B46
        goto            loop_1b78   ; 1B76: 2B78
        goto            label_1b8c  ; 1B77: 2B8C
;
; end of sub_1b70
;------------------------------------------------------------


loop_1b78
; jump here from: 1B76
        movlb           0x02        ; 1B78: 0022
        decfsz          mem_134, W  ; 1B79: 0B34
        goto            loop_1b7d   ; 1B7A: 2B7D

        call            sub_1bf5    ; 1B7B: 23F5

        movlp           0x18        ; 1B7C: 3198

loop_1b7d
; jump here from: 1B7A
        movlb           0x01        ; 1B7D: 0021
        movf            mem_ba, W   ; 1B7E: 083A
        movlb           0x00        ; 1B7F: 0020
        subwf           mem_33, f   ; 1B80: 02B3

loop_1b81
; jump here from: 1B87
        call            sub_1c15    ; 1B81: 2415

        movlp           0x18        ; 1B82: 3198
        movlb           0x00        ; 1B83: 0020
        incf            mem_33, f   ; 1B84: 0AB3
        movf            mem_33, W   ; 1B85: 0833
        btfss           STATUS, Z   ; 1B86: 1D03
        goto            loop_1b81   ; 1B87: 2B81

        movlb           0x01        ; 1B88: 0021
        movf            mem_ba, W   ; 1B89: 083A
        movlb           0x00        ; 1B8A: 0020
        movwf           mem_33      ; 1B8B: 00B3

label_1b8c
; jump here from: 1B77
        movlb           0x00        ; 1B8C: 0020
        movf            mem_21, W   ; 1B8D: 0821
        iorwf           mem_23, W   ; 1B8E: 0423
        movlb           0x01        ; 1B8F: 0021
        movwf           mem_bf      ; 1B90: 00BF
        movlb           0x00        ; 1B91: 0020
        movf            mem_23, W   ; 1B92: 0823
        movlb           0x01        ; 1B93: 0021
        movwf           mem_ba      ; 1B94: 00BA
        call            sub_1bb6    ; 1B95: 23B6

        movlp           0x18        ; 1B96: 3198
        movlb           0x01        ; 1B97: 0021
        btfsc           mem_bf, 7   ; 1B98: 1BBF
        goto            loop_1baf   ; 1B99: 2BAF

        movlb           0x00        ; 1B9A: 0020
        btfsc           mem_23, 7   ; 1B9B: 1BA3
        goto            loop_1baf   ; 1B9C: 2BAF

        btfss           mem_21, 7   ; 1B9D: 1FA1
        goto            loop_1baa   ; 1B9E: 2BAA

        movlb           0x01        ; 1B9F: 0021
        btfss           mem_ba, 7   ; 1BA0: 1FBA
        goto            loop_1baa   ; 1BA1: 2BAA

        movlb           0x00        ; 1BA2: 0020
        lsrf            mem_22, f   ; 1BA3: 36A2
        btfss           mem_23, 0   ; 1BA4: 1C23
        goto            loop_1ba7   ; 1BA5: 2BA7

        bsf             mem_22, 7   ; 1BA6: 17A2

loop_1ba7
; jump here from: 1BA5
        lsrf            mem_23, f   ; 1BA7: 36A3
        bsf             mem_23, 7   ; 1BA8: 17A3
        incf            mem_33, f   ; 1BA9: 0AB3

loop_1baa
; jump here from: 1B9E
; jump here from: 1BA1
        movlb           0x00        ; 1BAA: 0020
        clrf            mem_25      ; 1BAB: 01A5
        clrf            mem_24      ; 1BAC: 01A4
        movlp           0x2e        ; 1BAD: 31AE
        goto            sub_2e7d    ; 1BAE: 2E7D

loop_1baf
; jump here from: 1B99
; jump here from: 1B9C
        movlb           0x00        ; 1BAF: 0020
        incf            mem_33, f   ; 1BB0: 0AB3
        lsrf            mem_22, f   ; 1BB1: 36A2
        btfsc           mem_23, 0   ; 1BB2: 1823
        bsf             mem_22, 7   ; 1BB3: 17A2
        lsrf            mem_23, f   ; 1BB4: 36A3
        return                      ; 1BB5: 0008

;------------------------------------------------------------
; Subroutine: sub_1bb6
;
; called from: 1B95

sub_1bb6
        movlb           0x00        ; 1BB6: 0020
        movf            mem_20, W   ; 1BB7: 0820
        addwf           mem_22, f   ; 1BB8: 07A2
        movf            mem_21, W   ; 1BB9: 0821
        addwfc          mem_23, f   ; 1BBA: 3DA3
        return                      ; 1BBB: 0008

;------------------------------------------------------------
; Subroutine: sub_1bbc
;
; called from: 1B70

sub_1bbc
        movlb           0x00        ; 1BBC: 0020
        movf            mem_21, f   ; 1BBD: 08A1
        btfss           STATUS, Z   ; 1BBE: 1D03
        goto            loop_1bc5   ; 1BBF: 2BC5

        movf            mem_20, f   ; 1BC0: 08A0
        btfss           STATUS, Z   ; 1BC1: 1D03
        goto            loop_1bc5   ; 1BC2: 2BC5

        movlb           0x01        ; 1BC3: 0021
        clrf            mem_ba      ; 1BC4: 01BA

loop_1bc5
; jump here from: 1BBF
; jump here from: 1BC2
        movlb           0x00        ; 1BC5: 0020
        movf            mem_23, f   ; 1BC6: 08A3
        btfss           STATUS, Z   ; 1BC7: 1D03
        return                      ; 1BC8: 0008
        movf            mem_22, f   ; 1BC9: 08A2
        btfsc           STATUS, Z   ; 1BCA: 1903
        clrf            mem_33      ; 1BCB: 01B3
        return                      ; 1BCC: 0008

;------------------------------------------------------------
; Subroutine: sub_1bcd
;
; called from: 1B72

sub_1bcd
        movlb           0x01        ; 1BCD: 0021
        movf            mem_ba, W   ; 1BCE: 083A
        movlb           0x00        ; 1BCF: 0020
        xorwf           mem_33, W   ; 1BD0: 0633
        movlb           0x02        ; 1BD1: 0022
        movwf           mem_12f     ; 1BD2: 00AF
        movlb           0x01        ; 1BD3: 0021
        movf            mem_ba, W   ; 1BD4: 083A
        movlb           0x00        ; 1BD5: 0020
        subwf           mem_33, W   ; 1BD6: 0233
        btfss           STATUS, C   ; 1BD7: 1C03
        goto            loop_1bdd   ; 1BD8: 2BDD

        movlb           0x02        ; 1BD9: 0022
        clrf            mem_134     ; 1BDA: 01B4
        incf            mem_134, f  ; 1BDB: 0AB4
        goto            label_1bdf  ; 1BDC: 2BDF

loop_1bdd
; jump here from: 1BD8
        movlb           0x02        ; 1BDD: 0022
        clrf            mem_134     ; 1BDE: 01B4

label_1bdf
; jump here from: 1BDC
        movlb           0x00        ; 1BDF: 0020
        movf            mem_33, W   ; 1BE0: 0833
        movlb           0x01        ; 1BE1: 0021
        xorwf           mem_ba, W   ; 1BE2: 063A
        btfss           STATUS, Z   ; 1BE3: 1D03
        goto            loop_1be9   ; 1BE4: 2BE9

        movlb           0x03        ; 1BE5: 0023
        clrf            mem_1c6     ; 1BE6: 01C6
        incf            mem_1c6, f  ; 1BE7: 0AC6
        goto            label_1beb  ; 1BE8: 2BEB

loop_1be9
; jump here from: 1BE4
        movlb           0x03        ; 1BE9: 0023
        clrf            mem_1c6     ; 1BEA: 01C6

label_1beb
; jump here from: 1BE8
        movlb           0x02        ; 1BEB: 0022
        btfss           mem_12f, 7  ; 1BEC: 1FAF
        return                      ; 1BED: 0008
        decfsz          mem_34, W   ; 1BEE: 0B34
        goto            loop_1bf2   ; 1BEF: 2BF2

        clrf            mem_34      ; 1BF0: 01B4
        return                      ; 1BF1: 0008

loop_1bf2
; jump here from: 1BEF
        clrf            mem_34      ; 1BF2: 01B4
        incf            mem_34, f   ; 1BF3: 0AB4
        return                      ; 1BF4: 0008

;------------------------------------------------------------
; Subroutine: sub_1bf5
;
; called from: 1B7B

sub_1bf5
        movlb           0x00        ; 1BF5: 0020
        movf            mem_21, W   ; 1BF6: 0821
        movlb           0x01        ; 1BF7: 0021
        movwf           mem_df      ; 1BF8: 00DF
        movlb           0x00        ; 1BF9: 0020
        movf            mem_23, W   ; 1BFA: 0823
        movwf           mem_21      ; 1BFB: 00A1
        movlb           0x01        ; 1BFC: 0021
        movf            mem_df, W   ; 1BFD: 085F
        movlb           0x00        ; 1BFE: 0020
        movwf           mem_23      ; 1BFF: 00A3
        movf            mem_20, W   ; 1C00: 0820
        movlb           0x01        ; 1C01: 0021
        movwf           mem_df      ; 1C02: 00DF
        movlb           0x00        ; 1C03: 0020
        movf            mem_22, W   ; 1C04: 0822
        movwf           mem_20      ; 1C05: 00A0
        movlb           0x01        ; 1C06: 0021
        movf            mem_df, W   ; 1C07: 085F
        movlb           0x00        ; 1C08: 0020
        movwf           mem_22      ; 1C09: 00A2
        movlb           0x01        ; 1C0A: 0021
        movf            mem_ba, W   ; 1C0B: 083A
        movwf           mem_df      ; 1C0C: 00DF
        movlb           0x00        ; 1C0D: 0020
        movf            mem_33, W   ; 1C0E: 0833
        movlb           0x01        ; 1C0F: 0021
        movwf           mem_ba      ; 1C10: 00BA
        movf            mem_df, W   ; 1C11: 085F
        movlb           0x00        ; 1C12: 0020
        movwf           mem_33      ; 1C13: 00B3
        return                      ; 1C14: 0008

;------------------------------------------------------------
; Subroutine: sub_1c15
;
; called from: 1B81

sub_1c15
        movlb           0x02        ; 1C15: 0022
        clrf            mem_134     ; 1C16: 01B4
        movlb           0x00        ; 1C17: 0020
        btfss           mem_23, 7   ; 1C18: 1FA3
        goto            loop_1c1d   ; 1C19: 2C1D

        movlb           0x02        ; 1C1A: 0022
        clrf            mem_134     ; 1C1B: 01B4
        incf            mem_134, f  ; 1C1C: 0AB4

loop_1c1d
; jump here from: 1C19
        movlb           0x00        ; 1C1D: 0020
        lsrf            mem_22, f   ; 1C1E: 36A2
        btfsc           mem_23, 0   ; 1C1F: 1823
        bsf             mem_22, 7   ; 1C20: 17A2
        lsrf            mem_23, f   ; 1C21: 36A3
        movlb           0x02        ; 1C22: 0022
        decfsz          mem_134, W  ; 1C23: 0B34
        return                      ; 1C24: 0008
        movlb           0x00        ; 1C25: 0020
        bsf             mem_23, 7   ; 1C26: 17A3
        return                      ; 1C27: 0008

;------------------------------------------------------------
; Subroutine: sub_1c28
;
; called from: 03B6
; called from: 0615
; called from: 1A1B
; called from: 1A2C
; called from: 1A56
; called from: 1ADE
; called from: 1D67
; called from: 1D70
; called from: 1E50
; called from: 1E5A
; called from: 1F66
; called from: 2869

sub_1c28
        movlp           0x25        ; 1C28: 31A5
        call            sub_2598    ; 1C29: 2598

        movlp           0x18        ; 1C2A: 3198
        call            sub_1c8a    ; 1C2B: 248A

        movlp           0x18        ; 1C2C: 3198
        clrf            mem_a5      ; 1C2D: 01A5
        clrf            mem_a4      ; 1C2E: 01A4

loop_1c2f
; jump here from: 1C5C
        movlb           0x00        ; 1C2F: 0020
        movf            mem_27, W   ; 1C30: 0827
        movwf           mem_51      ; 1C31: 00D1
        movlw           0x01        ; 1C32: 3001
        andwf           mem_51, f   ; 1C33: 05D1
        lsrf            mem_27, W   ; 1C34: 3627
        movwf           mem_27      ; 1C35: 00A7
        rrf             mem_51, f   ; 1C36: 0CD1
        clrf            mem_51      ; 1C37: 01D1
        rrf             mem_51, f   ; 1C38: 0CD1
        movf            mem_26, W   ; 1C39: 0826
        movwf           mem_50      ; 1C3A: 00D0
        movlw           0x01        ; 1C3B: 3001
        andwf           mem_50, f   ; 1C3C: 05D0
        lsrf            mem_26, f   ; 1C3D: 36A6
        movf            mem_51, W   ; 1C3E: 0851
        iorwf           mem_26, f   ; 1C3F: 04A6
        movf            mem_50, W   ; 1C40: 0850
        btfsc           STATUS, Z   ; 1C41: 1903
        goto            loop_1c45   ; 1C42: 2C45

        call            sub_1fb6    ; 1C43: 23B6

        movlp           0x18        ; 1C44: 3198

loop_1c45
; jump here from: 1C42
        movf            mem_25, W   ; 1C45: 0825
        call            sub_1f15    ; 1C46: 2715

        movlp           0x18        ; 1C47: 3198
        lsrf            mem_24, f   ; 1C48: 36A4
        movf            mem_51, W   ; 1C49: 0851
        iorwf           mem_24, f   ; 1C4A: 04A4
        movf            mem_22, W   ; 1C4B: 0822
        call            sub_1f15    ; 1C4C: 2715

        movlp           0x18        ; 1C4D: 3198
        lsrf            mem_25, W   ; 1C4E: 3625
        movwf           mem_25      ; 1C4F: 00A5
        iorwf           mem_51, W   ; 1C50: 0451
        movwf           mem_25      ; 1C51: 00A5
        movf            mem_23, W   ; 1C52: 0823
        call            sub_1f15    ; 1C53: 2715

        movlp           0x18        ; 1C54: 3198
        lsrf            mem_22, f   ; 1C55: 36A2
        movf            mem_51, W   ; 1C56: 0851
        iorwf           mem_22, f   ; 1C57: 04A2
        lsrf            mem_23, W   ; 1C58: 3623
        movwf           mem_23      ; 1C59: 00A3
        movlb           0x01        ; 1C5A: 0021
        decfsz          mem_df, f   ; 1C5B: 0BDF
        goto            loop_1c2f   ; 1C5C: 2C2F

        movf            mem_ba, W   ; 1C5D: 083A
        movlb           0x00        ; 1C5E: 0020
        addwf           mem_33, f   ; 1C5F: 07B3
        movf            mem_23, W   ; 1C60: 0823
        btfss           STATUS, Z   ; 1C61: 1D03
        goto            loop_1c73   ; 1C62: 2C73

        movf            mem_22, W   ; 1C63: 0822
        btfss           STATUS, Z   ; 1C64: 1D03
        goto            loop_1c6d   ; 1C65: 2C6D

        movf            mem_25, W   ; 1C66: 0825
        movwf           mem_23      ; 1C67: 00A3
        movf            mem_24, W   ; 1C68: 0824
        call            sub_1edc    ; 1C69: 26DC

        movlp           0x18        ; 1C6A: 3198
        movlw           0xf1        ; 1C6B: 30F1
        goto            label_1c72  ; 1C6C: 2C72

loop_1c6d
; jump here from: 1C65
        movf            mem_22, W   ; 1C6D: 0822
        movwf           mem_23      ; 1C6E: 00A3
        movf            mem_25, W   ; 1C6F: 0825
        call            sub_1edc    ; 1C70: 26DC

        movlw           0xf9        ; 1C71: 30F9

label_1c72
; jump here from: 1C6C
        addwf           mem_33, f   ; 1C72: 07B3

loop_1c73
; jump here from: 1C62
        movlp           0x2e        ; 1C73: 31AE
        call            sub_2e7d    ; 1C74: 267D

        movlp           0x18        ; 1C75: 3198
        movlb           0x01        ; 1C76: 0021
        btfss           mem_bf, 7   ; 1C77: 1FBF
        return                      ; 1C78: 0008
        movlw           0xff        ; 1C79: 30FF
        movlb           0x00        ; 1C7A: 0020
        xorwf           mem_24, f   ; 1C7B: 06A4
        incf            mem_24, f   ; 1C7C: 0AA4
        btfsc           STATUS, Z   ; 1C7D: 1903
        decf            mem_25, f   ; 1C7E: 03A5
        xorwf           mem_25, f   ; 1C7F: 06A5
        movf            mem_25, W   ; 1C80: 0825
        btfsc           STATUS, Z   ; 1C81: 1903
        decf            mem_22, f   ; 1C82: 03A2
        movlw           0xff        ; 1C83: 30FF
        xorwf           mem_22, f   ; 1C84: 06A2
        movf            mem_22, f   ; 1C85: 08A2
        btfsc           STATUS, Z   ; 1C86: 1903
        decf            mem_23, f   ; 1C87: 03A3
        xorwf           mem_23, f   ; 1C88: 06A3
        return                      ; 1C89: 0008

;------------------------------------------------------------
; Subroutine: sub_1c8a
;
; called from: 1C2B

sub_1c8a
        movlw           0x0f        ; 1C8A: 300F
        movlb           0x01        ; 1C8B: 0021
        movwf           mem_df      ; 1C8C: 00DF
        movlb           0x00        ; 1C8D: 0020
        movf            mem_23, W   ; 1C8E: 0823
        movwf           mem_27      ; 1C8F: 00A7
        movf            mem_22, W   ; 1C90: 0822
        movwf           mem_26      ; 1C91: 00A6
        clrf            mem_22      ; 1C92: 01A2
        clrf            mem_23      ; 1C93: 01A3
        return                      ; 1C94: 0008

;------------------------------------------------------------
; Subroutine: sub_1c95
;
; called from: 1B55

sub_1c95
        movlb           0x01        ; 1C95: 0021
        call            sub_1ea7    ; 1C96: 26A7

        movlp           0x18        ; 1C97: 3198
        movlb           0x02        ; 1C98: 0022
        movf            mem_163, W  ; 1C99: 0863
        movlb           0x00        ; 1C9A: 0020
        movwf           mem_21      ; 1C9B: 00A1
        movlb           0x02        ; 1C9C: 0022
        movf            mem_164, W  ; 1C9D: 0864
        movlb           0x00        ; 1C9E: 0020
        movwf           mem_20      ; 1C9F: 00A0
        movlb           0x02        ; 1CA0: 0022
        movf            mem_162, W  ; 1CA1: 0862
        movlb           0x01        ; 1CA2: 0021
        movwf           mem_ba      ; 1CA3: 00BA
        call            sub_1b70    ; 1CA4: 2370

        movlp           0x18        ; 1CA5: 3198
        movf            mem_a3, W   ; 1CA6: 0823
        movlb           0x02        ; 1CA7: 0022
        movwf           mem_163     ; 1CA8: 00E3
        movlb           0x00        ; 1CA9: 0020
        movf            mem_22, W   ; 1CAA: 0822
        movlb           0x02        ; 1CAB: 0022
        movwf           mem_164     ; 1CAC: 00E4
        movlb           0x00        ; 1CAD: 0020
        movf            mem_33, W   ; 1CAE: 0833
        movlb           0x02        ; 1CAF: 0022
        movwf           mem_162     ; 1CB0: 00E2
        call            sub_1f30    ; 1CB1: 2730

        movwf           mem_158     ; 1CB2: 00D8
        movwf           mem_155     ; 1CB3: 00D5
        movf            mem_123, W  ; 1CB4: 0823
        movwf           mem_156     ; 1CB5: 00D6
        movlw           0x83        ; 1CB6: 3083
        movlp           0x0c        ; 1CB7: 318C
        call            I2CWrite    ; 1CB8: 24B3

        movlp           0x18        ; 1CB9: 3198
        incf            mem_158, W  ; 1CBA: 0A58
        movwf           mem_155     ; 1CBB: 00D5
        movf            mem_122, W  ; 1CBC: 0822
        movwf           mem_156     ; 1CBD: 00D6
        movlw           0x83        ; 1CBE: 3083
        movlp           0x0c        ; 1CBF: 318C
        call            I2CWrite    ; 1CC0: 24B3

        movlp           0x18        ; 1CC1: 3198
        movf            mem_158, W  ; 1CC2: 0858
        addlw           0x02        ; 1CC3: 3E02
        movwf           mem_155     ; 1CC4: 00D5
        movf            usb_count, W  ; 1CC5: 0833
        movwf           mem_156     ; 1CC6: 00D6
        movlw           0x83        ; 1CC7: 3083
        movlp           0x0c        ; 1CC8: 318C
        goto            I2CWrite    ; 1CC9: 2CB3

;------------------------------------------------------------
; Subroutine: sub_1cca
;
; called from: 1B57

sub_1cca
        movlb           0x01        ; 1CCA: 0021
        call            sub_1ea7    ; 1CCB: 26A7

        movlp           0x18        ; 1CCC: 3198
        movlb           0x02        ; 1CCD: 0022
        movf            mem_160, W  ; 1CCE: 0860
        movlb           0x00        ; 1CCF: 0020
        movwf           mem_21      ; 1CD0: 00A1
        movlb           0x02        ; 1CD1: 0022
        movf            mem_161, W  ; 1CD2: 0861
        movlb           0x00        ; 1CD3: 0020
        movwf           mem_20      ; 1CD4: 00A0
        movlb           0x02        ; 1CD5: 0022
        movf            mem_15f, W  ; 1CD6: 085F
        movlb           0x01        ; 1CD7: 0021
        movwf           mem_ba      ; 1CD8: 00BA
        call            sub_1b70    ; 1CD9: 2370

        movf            mem_a3, W   ; 1CDA: 0823
        movlb           0x02        ; 1CDB: 0022
        movwf           mem_160     ; 1CDC: 00E0
        movlb           0x00        ; 1CDD: 0020
        movf            mem_22, W   ; 1CDE: 0822
        movlb           0x02        ; 1CDF: 0022
        movwf           mem_161     ; 1CE0: 00E1
        movlb           0x00        ; 1CE1: 0020
        movf            mem_33, W   ; 1CE2: 0833
        movlb           0x02        ; 1CE3: 0022
        movwf           mem_15f     ; 1CE4: 00DF
        movlb           0x01        ; 1CE5: 0021
        movf            mem_c9, W   ; 1CE6: 0849
        addwf           mem_c9, W   ; 1CE7: 0749
        addwf           mem_c9, W   ; 1CE8: 0749
        movlb           0x00        ; 1CE9: 0020
        movwf           mem_58      ; 1CEA: 00D8
        movwf           mem_55      ; 1CEB: 00D5
        movf            mem_23, W   ; 1CEC: 0823
        movwf           mem_56      ; 1CED: 00D6
        movlw           0x86        ; 1CEE: 3086
        movlp           0x0c        ; 1CEF: 318C
        call            I2CWrite    ; 1CF0: 24B3

        movlp           0x18        ; 1CF1: 3198
        incf            mem_58, W   ; 1CF2: 0A58
        movwf           mem_55      ; 1CF3: 00D5
        movf            mem_22, W   ; 1CF4: 0822
        movwf           mem_56      ; 1CF5: 00D6
        movlw           0x86        ; 1CF6: 3086
        movlp           0x0c        ; 1CF7: 318C
        call            I2CWrite    ; 1CF8: 24B3

        movlp           0x18        ; 1CF9: 3198
        movf            mem_58, W   ; 1CFA: 0858
        addlw           0x02        ; 1CFB: 3E02
        movwf           mem_55      ; 1CFC: 00D5
        movf            mem_33, W   ; 1CFD: 0833
        movwf           mem_56      ; 1CFE: 00D6
        movlw           0x86        ; 1CFF: 3086
        movlp           0x0c        ; 1D00: 318C
        goto            I2CWrite    ; 1D01: 2CB3

;------------------------------------------------------------
; Subroutine: sub_1d02
;
; called from: 1A0B

sub_1d02
        movlb           0x01        ; 1D02: 0021
        movlw           0xf0        ; 1D03: 30F0
        bsf             mem_bb, 0   ; 1D04: 143B
        movlp           0x2d        ; 1D05: 31AD
        call            sub_2d31    ; 1D06: 2531

        bcf             mem_ce, 5   ; 1D07: 12CE
        andwf           mem_ce, f   ; 1D08: 05CE
        bsf             mem_ce, 0   ; 1D09: 144E
        return                      ; 1D0A: 0008

;------------------------------------------------------------
; Subroutine: sub_1d0b
;
; called from: 1A2E

sub_1d0b
        movlb           0x01        ; 1D0B: 0021
        movlw           0xf0        ; 1D0C: 30F0
        bcf             mem_bb, 0   ; 1D0D: 103B
        movlp           0x2d        ; 1D0E: 31AD
        call            sub_2d31    ; 1D0F: 2531

        bsf             mem_ce, 5   ; 1D10: 16CE
        andwf           mem_ce, f   ; 1D11: 05CE
        bcf             mem_ce, 0   ; 1D12: 104E
        return                      ; 1D13: 0008

;------------------------------------------------------------
; Subroutine: sub_1d14
;
; called from: 1A1D

sub_1d14
        movlb           0x01        ; 1D14: 0021
        bcf             mem_bb, 0   ; 1D15: 103B
        movf            mem_b4, W   ; 1D16: 0834
        call            sub_1d1e    ; 1D17: 251E

        movlb           0x02        ; 1D18: 0022
        movlw           0xf9        ; 1D19: 30F9
        bcf             mem_14e, 5  ; 1D1A: 12CE
        andwf           mem_14e, f  ; 1D1B: 05CE
        bcf             mem_14e, 0  ; 1D1C: 104E
        return                      ; 1D1D: 0008

;------------------------------------------------------------
; Subroutine: sub_1d1e
;
; called from: 075B
; called from: 1D17
; called from: 2D23

sub_1d1e
; jump here from: 24C4
        movlb           0x00        ; 1D1E: 0020
        movwf           mem_4f      ; 1D1F: 00CF
        movlw           0xf0        ; 1D20: 30F0
        movlb           0x02        ; 1D21: 0022
        andwf           mem_14a, f  ; 1D22: 05CA
        movlw           0x0f        ; 1D23: 300F
        andwf           mem_149, f  ; 1D24: 05C9
        goto            label_1d38  ; 1D25: 2D38

label_1d26
; jump here from: 0389
        movlb           0x02        ; 1D26: 0022
        bsf             mem_149, 7  ; 1D27: 17C9
        return                      ; 1D28: 0008

label_1d29
; jump here from: 038B
        movlb           0x02        ; 1D29: 0022
        bsf             mem_149, 6  ; 1D2A: 1749
        return                      ; 1D2B: 0008

label_1d2c
; jump here from: 038D
        movlb           0x02        ; 1D2C: 0022
        bsf             mem_149, 5  ; 1D2D: 16C9
        return                      ; 1D2E: 0008

label_1d2f
; jump here from: 038F
        movlb           0x02        ; 1D2F: 0022
        bsf             mem_149, 4  ; 1D30: 1649
        return                      ; 1D31: 0008

label_1d32
; jump here from: 0391
        movlb           0x02        ; 1D32: 0022
        bsf             mem_14a, 3  ; 1D33: 15CA
        return                      ; 1D34: 0008

label_1d35
; jump here from: 0393
        movlb           0x02        ; 1D35: 0022
        bsf             mem_14a, 0  ; 1D36: 144A
        return                      ; 1D37: 0008

label_1d38
; jump here from: 1D25
        movlb           0x00        ; 1D38: 0020
        movf            mem_4f, W   ; 1D39: 084F
        movwf           FSR0L       ; 1D3A: 0084
        movlw           0x06        ; 1D3B: 3006
        subwf           FSR0L, W    ; 1D3C: 0204
        btfsc           STATUS, C   ; 1D3D: 1803
        return                      ; 1D3E: 0008
        movlp           0x03        ; 1D3F: 3183
        lslf            FSR0L, W    ; 1D40: 3504
        addlw           0x88        ; 1D41: 3E88
        movwf           PCL         ; 1D42: 0082
        return                      ; 1D43: 0008

;------------------------------------------------------------
; Subroutine: sub_1d44
;
; called from: 2C5D

sub_1d44
        goto            label_1d7a  ; 1D44: 2D7A

loop_1d45
; jump here from: 1D7E
        movf            mem_d0, W   ; 1D45: 0850
        movlb           0x00        ; 1D46: 0020
        movwf           mem_23      ; 1D47: 00A3
        movlb           0x01        ; 1D48: 0021
        movf            mem_d1, W   ; 1D49: 0851
        movlb           0x00        ; 1D4A: 0020
        movwf           mem_22      ; 1D4B: 00A2
        movlb           0x01        ; 1D4C: 0021
        movf            mem_cf, W   ; 1D4D: 084F
        movlb           0x00        ; 1D4E: 0020
        movwf           mem_33      ; 1D4F: 00B3
        goto            label_1d86  ; 1D50: 2D86

loop_1d51
; jump here from: 1D81
        call            sub_1f1c    ; 1D51: 271C

        movlp           0x18        ; 1D52: 3198
        call            sub_1b5a    ; 1D53: 235A

        movlp           0x28        ; 1D54: 31A8
        call            sub_289d    ; 1D55: 209D

        movlp           0x18        ; 1D56: 3198

label_1d57
; jump here from: 1D79
        movlb           0x01        ; 1D57: 0021
        movwf           mem_ba      ; 1D58: 00BA
        movlp           0x2e        ; 1D59: 31AE
        call            sub_2e22    ; 1D5A: 2622

        movlp           0x18        ; 1D5B: 3198
        movlb           0x01        ; 1D5C: 0021
        movf            mem_d0, W   ; 1D5D: 0850
        movlb           0x00        ; 1D5E: 0020
        movwf           mem_21      ; 1D5F: 00A1
        movlb           0x01        ; 1D60: 0021
        movf            mem_d1, W   ; 1D61: 0851
        movlb           0x00        ; 1D62: 0020
        movwf           mem_20      ; 1D63: 00A0
        movlb           0x01        ; 1D64: 0021
        movf            mem_cf, W   ; 1D65: 084F
        movwf           mem_ba      ; 1D66: 00BA
        call            sub_1c28    ; 1D67: 2428

        movlp           0x18        ; 1D68: 3198
        movlw           0x60        ; 1D69: 3060
        movlb           0x00        ; 1D6A: 0020
        movwf           mem_21      ; 1D6B: 00A1
        movlw           0x05        ; 1D6C: 3005
        clrf            mem_20      ; 1D6D: 01A0
        movlb           0x01        ; 1D6E: 0021
        movwf           mem_ba      ; 1D6F: 00BA
        call            sub_1c28    ; 1D70: 2428

        movlp           0x18        ; 1D71: 3198
        goto            label_1d86  ; 1D72: 2D86

loop_1d73
; jump here from: 1D84
        call            sub_1f3b    ; 1D73: 273B

        movlp           0x18        ; 1D74: 3198
        call            sub_1b5a    ; 1D75: 235A

        movlp           0x18        ; 1D76: 3198
        call            sub_1f36    ; 1D77: 2736

        movlp           0x18        ; 1D78: 3198
        goto            label_1d57  ; 1D79: 2D57

label_1d7a
; jump here from: 1D44
        movlb           0x01        ; 1D7A: 0021
        movf            mem_e5, W   ; 1D7B: 0865
        xorlw           0x00        ; 1D7C: 3A00
        btfsc           STATUS, Z   ; 1D7D: 1903
        goto            loop_1d45   ; 1D7E: 2D45

        xorlw           0x01        ; 1D7F: 3A01
        btfsc           STATUS, Z   ; 1D80: 1903
        goto            loop_1d51   ; 1D81: 2D51

        xorlw           0x03        ; 1D82: 3A03
        btfsc           STATUS, Z   ; 1D83: 1903
        goto            loop_1d73   ; 1D84: 2D73
        goto            label_1d86  ; 1D85: 2D86

label_1d86
; jump here from: 1D50
; jump here from: 1D72
; jump here from: 1D85
        goto            label_1d87  ; 1D86: 2D87
;
; end of label_1d86
;------------------------------------------------------------


label_1d87
; jump here from: 1A3D
; jump here from: 1D86
        call            sub_1e3f    ; 1D87: 263F

        movlp           0x18        ; 1D88: 3198
        movlb           0x01        ; 1D89: 0021
        bcf             mem_bb, 1   ; 1D8A: 10BB
        bcf             mem_bb, 2   ; 1D8B: 113B
        bcf             mem_bb, 3   ; 1D8C: 11BB
        goto            label_1dec  ; 1D8D: 2DEC

loop_1d8e
; jump here from: 0379
; jump here from: 1DF2
        movlb           0x00        ; 1D8E: 0020
        clrf            mem_31      ; 1D8F: 01B1
        clrf            mem_30      ; 1D90: 01B0
        clrf            mem_2f      ; 1D91: 01AF
        clrf            mem_2e      ; 1D92: 01AE

label_1d93
; jump here from: 1DDB
        movlb           0x01        ; 1D93: 0021
        bsf             mem_bb, 1   ; 1D94: 14BB
        goto            loop_1df7   ; 1D95: 2DF7

label_1d96
; jump here from: 037B
        call            sub_1eb3    ; 1D96: 26B3

        movlp           0x18        ; 1D97: 3198
        andlw           0x0f        ; 1D98: 390F
        movwf           mem_2e      ; 1D99: 00AE
        movlw           0x0f        ; 1D9A: 300F
        andwf           mem_2e, f   ; 1D9B: 05AE
        movf            mem_31, f   ; 1D9C: 08B1
        btfss           STATUS, Z   ; 1D9D: 1D03
        goto            loop_1df7   ; 1D9E: 2DF7

        movlw           0x10        ; 1D9F: 3010
        movwf           mem_31      ; 1DA0: 00B1
        movf            mem_30, f   ; 1DA1: 08B0
        btfss           STATUS, Z   ; 1DA2: 1D03
        goto            loop_1df7   ; 1DA3: 2DF7

        movlw           0x10        ; 1DA4: 3010
        movwf           mem_30      ; 1DA5: 00B0
        movf            mem_2f, f   ; 1DA6: 08AF
        btfss           STATUS, Z   ; 1DA7: 1D03
        goto            loop_1df7   ; 1DA8: 2DF7

        movlw           0x10        ; 1DA9: 3010
        movwf           mem_2f      ; 1DAA: 00AF
        goto            loop_1df7   ; 1DAB: 2DF7

label_1dac
; jump here from: 037D
        call            sub_1eb3    ; 1DAC: 26B3

        movlp           0x18        ; 1DAD: 3198
        call            sub_1f2a    ; 1DAE: 272A

        movlp           0x18        ; 1DAF: 3198
        bsf             mem_3b, 3   ; 1DB0: 15BB
        movlb           0x00        ; 1DB1: 0020
        movf            mem_31, f   ; 1DB2: 08B1
        btfss           STATUS, Z   ; 1DB3: 1D03
        goto            loop_1df7   ; 1DB4: 2DF7

        movlw           0x10        ; 1DB5: 3010
        movwf           mem_31      ; 1DB6: 00B1
        movf            mem_30, f   ; 1DB7: 08B0
        btfss           STATUS, Z   ; 1DB8: 1D03
        goto            loop_1df7   ; 1DB9: 2DF7

        movlw           0x10        ; 1DBA: 3010
        movwf           mem_30      ; 1DBB: 00B0
        goto            loop_1df7   ; 1DBC: 2DF7

label_1dbd
; jump here from: 037F
        call            sub_1eb3    ; 1DBD: 26B3

        movlp           0x18        ; 1DBE: 3198
        call            sub_1f2a    ; 1DBF: 272A

        movlp           0x18        ; 1DC0: 3198
        bsf             mem_3b, 2   ; 1DC1: 153B
        movlb           0x00        ; 1DC2: 0020
        movf            mem_31, f   ; 1DC3: 08B1
        btfss           STATUS, Z   ; 1DC4: 1D03
        goto            loop_1df7   ; 1DC5: 2DF7

        movlw           0x10        ; 1DC6: 3010
        movwf           mem_31      ; 1DC7: 00B1
        goto            loop_1df7   ; 1DC8: 2DF7

label_1dc9
; jump here from: 0381
        call            sub_1eb3    ; 1DC9: 26B3

        movlp           0x18        ; 1DCA: 3198
        goto            label_1de4  ; 1DCB: 2DE4

label_1dcc
; jump here from: 0383
        movlb           0x00        ; 1DCC: 0020
        clrf            mem_31      ; 1DCD: 01B1
        movf            mem_25, W   ; 1DCE: 0825
        movwf           mem_30      ; 1DCF: 00B0
        movlw           0x0f        ; 1DD0: 300F
        andwf           mem_30, f   ; 1DD1: 05B0
        swapf           mem_24, W   ; 1DD2: 0E24
        andlw           0x0f        ; 1DD3: 390F
        movwf           mem_2f      ; 1DD4: 00AF
        movlw           0x0f        ; 1DD5: 300F
        andwf           mem_2f, f   ; 1DD6: 05AF
        movf            mem_24, W   ; 1DD7: 0824

label_1dd8
; jump here from: 1DE5
; jump here from: 1DEB
        movwf           mem_2e      ; 1DD8: 00AE
        movlw           0x0f        ; 1DD9: 300F
        andwf           mem_2e, f   ; 1DDA: 05AE
        goto            label_1d93  ; 1DDB: 2D93

label_1ddc
; jump here from: 0385
        movlb           0x00        ; 1DDC: 0020
        clrf            mem_31      ; 1DDD: 01B1
        clrf            mem_30      ; 1DDE: 01B0
        movf            mem_25, W   ; 1DDF: 0825
        movwf           mem_2f      ; 1DE0: 00AF
        movlw           0x0f        ; 1DE1: 300F
        andwf           mem_2f, f   ; 1DE2: 05AF
        swapf           mem_24, W   ; 1DE3: 0E24

label_1de4
; jump here from: 1DCB
        andlw           0x0f        ; 1DE4: 390F
        goto            label_1dd8  ; 1DE5: 2DD8

label_1de6
; jump here from: 0387
        movlb           0x00        ; 1DE6: 0020
        clrf            mem_31      ; 1DE7: 01B1
        clrf            mem_30      ; 1DE8: 01B0
        clrf            mem_2f      ; 1DE9: 01AF
        movf            mem_25, W   ; 1DEA: 0825
        goto            label_1dd8  ; 1DEB: 2DD8

label_1dec
; jump here from: 1D8D
        movlb           0x02        ; 1DEC: 0022
        movf            mem_130, W  ; 1DED: 0830
        movwf           FSR0L       ; 1DEE: 0084
        movlw           0x08        ; 1DEF: 3008
        subwf           FSR0L, W    ; 1DF0: 0204
        btfsc           STATUS, C   ; 1DF1: 1803
        goto            loop_1d8e   ; 1DF2: 2D8E

        movlp           0x03        ; 1DF3: 3183
        lslf            FSR0L, W    ; 1DF4: 3504
        addlw           0x78        ; 1DF5: 3E78
        movwf           PCL         ; 1DF6: 0082

loop_1df7
; jump here from: 1D95
; jump here from: 1D9E
; jump here from: 1DA3
; jump here from: 1DA8
; jump here from: 1DAB
; jump here from: 1DB4
; jump here from: 1DB9
; jump here from: 1DBC
; jump here from: 1DC5
; jump here from: 1DC8
        movlb           0x00        ; 1DF7: 0020
        movf            mem_31, W   ; 1DF8: 0831
        addlw           0xd8        ; 1DF9: 3ED8
        movlp           0x02        ; 1DFA: 3182
        callw                       ; 1DFB: 000A

        movlp           0x07        ; 1DFC: 3187
        call            sub_07f8    ; 1DFD: 27F8

        movlp           0x18        ; 1DFE: 3198
        movlp           0x02        ; 1DFF: 3182
        callw                       ; 1E00: 000A

        movlb           0x02        ; 1E01: 0022
        movwf           mem_154     ; 1E02: 00D4
        movlb           0x00        ; 1E03: 0020
        movf            mem_2f, W   ; 1E04: 082F
        addlw           0xd8        ; 1E05: 3ED8
        movlp           0x02        ; 1E06: 3182
        callw                       ; 1E07: 000A

        movlb           0x02        ; 1E08: 0022
        movwf           mem_155     ; 1E09: 00D5
        movlb           0x00        ; 1E0A: 0020
        movf            mem_2e, W   ; 1E0B: 082E
        addlw           0xd8        ; 1E0C: 3ED8
        movlp           0x02        ; 1E0D: 3182
        callw                       ; 1E0E: 000A

        movlp           0x1e        ; 1E0F: 319E
        movlb           0x02        ; 1E10: 0022
        movwf           mem_156     ; 1E11: 00D6
        movlb           0x01        ; 1E12: 0021
        decfsz          mem_e5, W   ; 1E13: 0B65
        return                      ; 1E14: 0008
        goto            label_1e32  ; 1E15: 2E32

label_1e16
; jump here from: 1E3D
        movlb           0x01        ; 1E16: 0021
        bcf             mem_bb, 1   ; 1E17: 10BB
        bsf             mem_bb, 2   ; 1E18: 153B
        bcf             mem_bb, 3   ; 1E19: 11BB
        movlb           0x02        ; 1E1A: 0022
        clrf            mem_153     ; 1E1B: 01D3
        movlb           0x00        ; 1E1C: 0020
        movf            mem_31, W   ; 1E1D: 0831
        addlw           0xd8        ; 1E1E: 3ED8
        movlp           0x02        ; 1E1F: 3182
        callw                       ; 1E20: 000A

        movlb           0x02        ; 1E21: 0022
        movwf           mem_154     ; 1E22: 00D4
        movlb           0x00        ; 1E23: 0020
        movf            mem_30, W   ; 1E24: 0830
        addlw           0xd8        ; 1E25: 3ED8
        movlp           0x02        ; 1E26: 3182
        callw                       ; 1E27: 000A

        movlb           0x02        ; 1E28: 0022
        movwf           mem_155     ; 1E29: 00D5
        movlb           0x00        ; 1E2A: 0020
        movf            mem_2f, W   ; 1E2B: 082F
        addlw           0xd8        ; 1E2C: 3ED8
        movlp           0x02        ; 1E2D: 3182
        callw                       ; 1E2E: 000A

        movlb           0x02        ; 1E2F: 0022
        movwf           mem_156     ; 1E30: 00D6
        return                      ; 1E31: 0008

label_1e32
; jump here from: 1E15
        movlb           0x02        ; 1E32: 0022
        movf            mem_130, W  ; 1E33: 0830
        xorlw           0x01        ; 1E34: 3A01
        btfsc           STATUS, Z   ; 1E35: 1903
        goto            loop_1e3e   ; 1E36: 2E3E

        xorlw           0x03        ; 1E37: 3A03
        btfsc           STATUS, Z   ; 1E38: 1903
        goto            loop_1e3e   ; 1E39: 2E3E

        xorlw           0x01        ; 1E3A: 3A01
        btfsc           STATUS, Z   ; 1E3B: 1903
        goto            loop_1e3e   ; 1E3C: 2E3E
        goto            label_1e16  ; 1E3D: 2E16
;
; end of label_1e32
;------------------------------------------------------------


loop_1e3e
; jump here from: 1E36
; jump here from: 1E39
; jump here from: 1E3C
        return                      ; 1E3E: 0008

;------------------------------------------------------------
; Subroutine: sub_1e3f
;
; called from: 1D87

sub_1e3f
        movlb           0x02        ; 1E3F: 0022
        clrf            mem_130     ; 1E40: 01B0
        clrf            mem_12f     ; 1E41: 01AF
        movlb           0x00        ; 1E42: 0020
        clrf            mem_21      ; 1E43: 01A1
        movlp           0x25        ; 1E44: 31A5
        call            sub_2598    ; 1E45: 2598

        movlp           0x18        ; 1E46: 3198
        movlw           0x50        ; 1E47: 3050
        clrf            mem_20      ; 1E48: 01A0
        movwf           mem_21      ; 1E49: 00A1
        movlw           0x04        ; 1E4A: 3004
        movlb           0x01        ; 1E4B: 0021
        movwf           mem_ba      ; 1E4C: 00BA

label_1e4d
; jump here from: 1E54
        movlb           0x00        ; 1E4D: 0020
        btfss           mem_33, 7   ; 1E4E: 1FB3
        goto            loop_1e55   ; 1E4F: 2E55

        call            sub_1c28    ; 1E50: 2428

        movlp           0x18        ; 1E51: 3198
        movlb           0x02        ; 1E52: 0022
        incf            mem_130, f  ; 1E53: 0AB0
        goto            label_1e4d  ; 1E54: 2E4D

loop_1e55
; jump here from: 1E4F
; jump here from: 1E5E
        movlw           0x0c        ; 1E55: 300C
        movlb           0x00        ; 1E56: 0020
        subwf           mem_33, W   ; 1E57: 0233
        btfsc           STATUS, C   ; 1E58: 1803
        goto            loop_1e5f   ; 1E59: 2E5F

        call            sub_1c28    ; 1E5A: 2428

        movlp           0x18        ; 1E5B: 3198
        movlb           0x02        ; 1E5C: 0022
        incf            mem_130, f  ; 1E5D: 0AB0
        goto            loop_1e55   ; 1E5E: 2E55

loop_1e5f
; jump here from: 1E59
; jump here from: 1E69
        movlw           0x10        ; 1E5F: 3010
        movlb           0x00        ; 1E60: 0020
        subwf           mem_33, W   ; 1E61: 0233
        btfss           STATUS, C   ; 1E62: 1C03
        goto            loop_1e6a   ; 1E63: 2E6A

        movlp           0x2e        ; 1E64: 31AE
        call            sub_2e22    ; 1E65: 2622

        movlp           0x18        ; 1E66: 3198
        movlb           0x02        ; 1E67: 0022
        incf            mem_12f, f  ; 1E68: 0AAF
        goto            loop_1e5f   ; 1E69: 2E5F

loop_1e6a
; jump here from: 1E63
        movlp           0x2e        ; 1E6A: 31AE
        call            sub_2e10    ; 1E6B: 2610

        movlp           0x18        ; 1E6C: 3198
        movlp           0x25        ; 1E6D: 31A5
        call            sub_25ab    ; 1E6E: 25AB

        movlp           0x18        ; 1E6F: 3198
        movlb           0x00        ; 1E70: 0020
        movf            mem_25, W   ; 1E71: 0825
        btfss           STATUS, Z   ; 1E72: 1D03
        return                      ; 1E73: 0008
        movlw           0x04        ; 1E74: 3004
        movlb           0x02        ; 1E75: 0022
        movwf           mem_166     ; 1E76: 00E6

loop_1e77
; jump here from: 1E93
        movlb           0x00        ; 1E77: 0020
        movf            mem_24, W   ; 1E78: 0824
        movwf           mem_55      ; 1E79: 00D5
        movlw           0x80        ; 1E7A: 3080
        andwf           mem_55, f   ; 1E7B: 05D5
        lslf            mem_25, W   ; 1E7C: 3525
        movwf           mem_25      ; 1E7D: 00A5
        rlf             mem_55, f   ; 1E7E: 0DD5
        clrf            mem_55      ; 1E7F: 01D5
        rlf             mem_55, f   ; 1E80: 0DD5
        iorwf           mem_55, W   ; 1E81: 0455
        movwf           mem_25      ; 1E82: 00A5
        movf            mem_27, W   ; 1E83: 0827
        movwf           mem_55      ; 1E84: 00D5
        movlw           0x80        ; 1E85: 3080
        andwf           mem_55, f   ; 1E86: 05D5
        lslf            mem_24, f   ; 1E87: 35A4
        rlf             mem_55, f   ; 1E88: 0DD5
        clrf            mem_55      ; 1E89: 01D5
        rlf             mem_55, f   ; 1E8A: 0DD5
        movf            mem_55, W   ; 1E8B: 0855
        iorwf           mem_24, f   ; 1E8C: 04A4
        lslf            mem_27, W   ; 1E8D: 3527
        movwf           mem_27      ; 1E8E: 00A7
        movlb           0x02        ; 1E8F: 0022
        decf            mem_166, f  ; 1E90: 03E6
        movf            mem_166, W  ; 1E91: 0866
        btfss           STATUS, Z   ; 1E92: 1D03
        goto            loop_1e77   ; 1E93: 2E77

        movf            mem_12f, f  ; 1E94: 08AF
        btfsc           STATUS, Z   ; 1E95: 1903
        goto            loop_1e99   ; 1E96: 2E99

        decf            mem_12f, f  ; 1E97: 03AF
        return                      ; 1E98: 0008

loop_1e99
; jump here from: 1E96
        incf            mem_130, f  ; 1E99: 0AB0
        return                      ; 1E9A: 0008

;------------------------------------------------------------
; Subroutine: sub_1e9b
;
; called from: 0618
; called from: 1A50
; called from: 1A67
; called from: 1AD7
; called from: 1AE5
; called from: 1F60
; called from: 1F77

sub_1e9b
        movlb           0x01        ; 1E9B: 0021
        movf            mem_af, W   ; 1E9C: 082F
        movlb           0x00        ; 1E9D: 0020
        movwf           mem_21      ; 1E9E: 00A1
        movlb           0x01        ; 1E9F: 0021
        movf            mem_ae, W   ; 1EA0: 082E
        movlb           0x00        ; 1EA1: 0020
        movwf           mem_20      ; 1EA2: 00A0
        movlb           0x01        ; 1EA3: 0021
        movf            mem_e4, W   ; 1EA4: 0864
        movwf           mem_ba      ; 1EA5: 00BA
        return                      ; 1EA6: 0008

;------------------------------------------------------------
; Subroutine: sub_1ea7
;
; called from: 0629
; called from: 1947
; called from: 19CE
; called from: 1AE3
; called from: 1C96
; called from: 1CCB

sub_1ea7
        movf            mem_dd, W   ; 1EA7: 085D
        movlb           0x00        ; 1EA8: 0020
        movwf           mem_23      ; 1EA9: 00A3
        movlb           0x01        ; 1EAA: 0021
        movf            mem_de, W   ; 1EAB: 085E
        movlb           0x00        ; 1EAC: 0020
        movwf           mem_22      ; 1EAD: 00A2
        movlb           0x01        ; 1EAE: 0021
        movf            mem_dc, W   ; 1EAF: 085C
        movlb           0x00        ; 1EB0: 0020
        movwf           mem_33      ; 1EB1: 00B3
        return                      ; 1EB2: 0008

;------------------------------------------------------------
; Subroutine: sub_1eb3
;
; called from: 1D96
; called from: 1DAC
; called from: 1DBD
; called from: 1DC9

sub_1eb3
        movlb           0x00        ; 1EB3: 0020
        movf            mem_25, W   ; 1EB4: 0825
        movwf           mem_31      ; 1EB5: 00B1
        movlw           0x0f        ; 1EB6: 300F
        andwf           mem_31, f   ; 1EB7: 05B1
        swapf           mem_24, W   ; 1EB8: 0E24
        andlw           0x0f        ; 1EB9: 390F
        movwf           mem_30      ; 1EBA: 00B0
        movlw           0x0f        ; 1EBB: 300F
        andwf           mem_30, f   ; 1EBC: 05B0
        movf            mem_24, W   ; 1EBD: 0824
        movwf           mem_2f      ; 1EBE: 00AF
        movlw           0x0f        ; 1EBF: 300F
        andwf           mem_2f, f   ; 1EC0: 05AF
        swapf           mem_27, W   ; 1EC1: 0E27
        return                      ; 1EC2: 0008

;------------------------------------------------------------
; Subroutine: sub_1ec3
;
; called from: 062F
; called from: 1949
; called from: 19D0
; called from: 1A19
; called from: 1A2A

sub_1ec3
        movlb           0x01        ; 1EC3: 0021
        movf            mem_e7, W   ; 1EC4: 0867
        movlb           0x00        ; 1EC5: 0020
        movwf           mem_21      ; 1EC6: 00A1
        movlb           0x01        ; 1EC7: 0021
        movf            mem_e8, W   ; 1EC8: 0868
        movlb           0x00        ; 1EC9: 0020
        movwf           mem_20      ; 1ECA: 00A0
        movlb           0x01        ; 1ECB: 0021
        movf            mem_e6, W   ; 1ECC: 0866
        movwf           mem_ba      ; 1ECD: 00BA
        return                      ; 1ECE: 0008

;------------------------------------------------------------
; Subroutine: sub_1ecf
;
; called from: 057E
; called from: 187C
; called from: 18AA
; called from: 198E

sub_1ecf
        movlb           0x00        ; 1ECF: 0020
        movf            mem_39, W   ; 1ED0: 0839
        movlb           0x01        ; 1ED1: 0021
        movwf           mem_c2      ; 1ED2: 00C2
        movlb           0x00        ; 1ED3: 0020
        movf            mem_38, W   ; 1ED4: 0838
        movlb           0x01        ; 1ED5: 0021
        movwf           mem_c1      ; 1ED6: 00C1
        movlb           0x00        ; 1ED7: 0020
        movf            mem_35, W   ; 1ED8: 0835
        movlb           0x02        ; 1ED9: 0022
        movwf           mem_13a     ; 1EDA: 00BA
        retlw           0x1f        ; 1EDB: 341F

;------------------------------------------------------------
; Subroutine: sub_1edc
;
; called from: 1C69
; called from: 1C70

sub_1edc
        movwf           mem_22      ; 1EDC: 00A2
        movf            mem_23, W   ; 1EDD: 0823
        movwf           mem_51      ; 1EDE: 00D1
        movlw           0x01        ; 1EDF: 3001
        andwf           mem_51, f   ; 1EE0: 05D1
        lsrf            mem_23, W   ; 1EE1: 3623
        movwf           mem_23      ; 1EE2: 00A3
        rrf             mem_51, f   ; 1EE3: 0CD1
        clrf            mem_51      ; 1EE4: 01D1
        rrf             mem_51, f   ; 1EE5: 0CD1
        lsrf            mem_22, f   ; 1EE6: 36A2
        movf            mem_51, W   ; 1EE7: 0851
        iorwf           mem_22, f   ; 1EE8: 04A2
        return                      ; 1EE9: 0008

;------------------------------------------------------------
; Subroutine: sub_1eea
;
; called from: 1AE1
; called from: 1AEE

sub_1eea
        movf            mem_23, W   ; 1EEA: 0823
        movlb           0x01        ; 1EEB: 0021
        movwf           mem_b6      ; 1EEC: 00B6
        movlb           0x00        ; 1EED: 0020
        movf            mem_22, W   ; 1EEE: 0822
        movlb           0x01        ; 1EEF: 0021
        movwf           mem_b7      ; 1EF0: 00B7
        movlb           0x00        ; 1EF1: 0020
        movf            mem_33, W   ; 1EF2: 0833
        movlb           0x01        ; 1EF3: 0021
        movwf           mem_b5      ; 1EF4: 00B5
        return                      ; 1EF5: 0008

;------------------------------------------------------------
; Subroutine: sub_1ef6
;
; called from: 1A59
; called from: 1A6F

sub_1ef6
        movf            mem_23, W   ; 1EF6: 0823
        movlb           0x01        ; 1EF7: 0021
        movwf           mem_ec      ; 1EF8: 00EC
        movlb           0x00        ; 1EF9: 0020
        movf            mem_22, W   ; 1EFA: 0822
        movlb           0x01        ; 1EFB: 0021
        movwf           mem_ed      ; 1EFC: 00ED
        movlb           0x00        ; 1EFD: 0020
        movf            mem_33, W   ; 1EFE: 0833
        movlb           0x01        ; 1EFF: 0021
        movwf           mem_eb      ; 1F00: 00EB
        return                      ; 1F01: 0008

;------------------------------------------------------------
; Subroutine: sub_1f02
;
; called from: 1A54
; called from: 1A6B

sub_1f02
        movlb           0x01        ; 1F02: 0021
        movf            mem_ec, W   ; 1F03: 086C
        movlb           0x00        ; 1F04: 0020
        movwf           mem_21      ; 1F05: 00A1
        movlb           0x01        ; 1F06: 0021
        movf            mem_ed, W   ; 1F07: 086D
        movlb           0x00        ; 1F08: 0020
        movwf           mem_20      ; 1F09: 00A0
        movlb           0x01        ; 1F0A: 0021
        movf            mem_eb, W   ; 1F0B: 086B
        movwf           mem_ba      ; 1F0C: 00BA
        return                      ; 1F0D: 0008

;------------------------------------------------------------
; Subroutine: sub_1f0e
;
; called from: 0578
; called from: 1878
; called from: 18A6
; called from: 198A

sub_1f0e
        movlb           0x00        ; 1F0E: 0020
        clrf            mem_45      ; 1F0F: 01C5
        movlb           0x01        ; 1F10: 0021
        movf            mem_b8, W   ; 1F11: 0838
        movlb           0x00        ; 1F12: 0020
        movwf           mem_46      ; 1F13: 00C6
        return                      ; 1F14: 0008

;------------------------------------------------------------
; Subroutine: sub_1f15
;
; called from: 1C46
; called from: 1C4C
; called from: 1C53

sub_1f15
        movwf           mem_51      ; 1F15: 00D1
        movlw           0x01        ; 1F16: 3001
        andwf           mem_51, f   ; 1F17: 05D1
        rrf             mem_51, f   ; 1F18: 0CD1
        clrf            mem_51      ; 1F19: 01D1
        rrf             mem_51, f   ; 1F1A: 0CD1
        return                      ; 1F1B: 0008

;------------------------------------------------------------
; Subroutine: sub_1f1c
;
; called from: 1A0E
; called from: 1D51

sub_1f1c
        movlb           0x02        ; 1F1C: 0022
        movf            mem_121, W  ; 1F1D: 0821
        movlb           0x00        ; 1F1E: 0020
        movwf           mem_23      ; 1F1F: 00A3
        movlb           0x02        ; 1F20: 0022
        movf            mem_120, W  ; 1F21: 0820
        movlb           0x00        ; 1F22: 0020
        movwf           mem_22      ; 1F23: 00A2
        return                      ; 1F24: 0008

;------------------------------------------------------------
; Subroutine: sub_1f25
;
; called from: 0565
; called from: 1106
; called from: 1861
; called from: 188F
; called from: 18BD
; called from: 194F

sub_1f25
        movlb           0x01        ; 1F25: 0021
        movlw           0x03        ; 1F26: 3003
        incf            mem_e5, f   ; 1F27: 0AE5
        subwf           mem_e5, W   ; 1F28: 0265
        return                      ; 1F29: 0008

;------------------------------------------------------------
; Subroutine: sub_1f2a
;
; called from: 1DAE
; called from: 1DBF

sub_1f2a
        andlw           0x0f        ; 1F2A: 390F
        movwf           mem_2e      ; 1F2B: 00AE
        movlw           0x0f        ; 1F2C: 300F
        andwf           mem_2e, f   ; 1F2D: 05AE
        movlb           0x01        ; 1F2E: 0021
        return                      ; 1F2F: 0008

;------------------------------------------------------------
; Subroutine: sub_1f30
;
; called from: 1AB2
; called from: 1CB1

sub_1f30
        movlb           0x01        ; 1F30: 0021
        movf            mem_e9, W   ; 1F31: 0869
        addwf           mem_e9, W   ; 1F32: 0769
        addwf           mem_e9, W   ; 1F33: 0769
        movlb           0x00        ; 1F34: 0020
        return                      ; 1F35: 0008

;------------------------------------------------------------
; Subroutine: sub_1f36
;
; called from: 1A24
; called from: 1D77

sub_1f36
        movlb           0x00        ; 1F36: 0020
        movlw           0x64        ; 1F37: 3064
        clrf            mem_20      ; 1F38: 01A0
        movwf           mem_21      ; 1F39: 00A1
        retlw           0x07        ; 1F3A: 3407

;------------------------------------------------------------
; Subroutine: sub_1f3b
;
; called from: 1A20
; called from: 1D73

sub_1f3b
        movf            mem_b3, W   ; 1F3B: 0833
        movlb           0x00        ; 1F3C: 0020
        movwf           mem_22      ; 1F3D: 00A2
        clrf            mem_23      ; 1F3E: 01A3
        return                      ; 1F3F: 0008

;------------------------------------------------------------
; Subroutine: sub_1f40
;
; called from: 1942
; called from: 19C9

sub_1f40
        movlb           0x01        ; 1F40: 0021
        movwf           mem_e6      ; 1F41: 00E6
        movlb           0x00        ; 1F42: 0020
        movf            mem_45, f   ; 1F43: 08C5
        return                      ; 1F44: 0008

;------------------------------------------------------------
; Subroutine: sub_1f45
;
; called from: 18D7
; called from: 1969

sub_1f45
        clrf            mem_c1      ; 1F45: 01C1
        incf            mem_c1, f   ; 1F46: 0AC1
        incf            mem_c2, f   ; 1F47: 0AC2
        subwf           mem_c2, W   ; 1F48: 0242
        return                      ; 1F49: 0008

;------------------------------------------------------------
; Subroutine: sub_1f4a
;
; called from: 18ED
; called from: 197F

sub_1f4a
        movwf           mem_c1      ; 1F4A: 00C1
        movlw           0x64        ; 1F4B: 3064
        decf            mem_c2, f   ; 1F4C: 03C2
        subwf           mem_c2, W   ; 1F4D: 0242
        return                      ; 1F4E: 0008

;------------------------------------------------------------
; Subroutine: sub_1f4f
;
; called from: 0AE5

sub_1f4f
        movf            mem_ca, W   ; 1F4F: 084A
        movlb           0x00        ; 1F50: 0020
        movwf           mem_22      ; 1F51: 00A2
        clrf            mem_23      ; 1F52: 01A3
        incf            mem_22, f   ; 1F53: 0AA2
        btfsc           STATUS, Z   ; 1F54: 1903
        incf            mem_23, f   ; 1F55: 0AA3
        call            sub_1f5a    ; 1F56: 235A

        movlp           0x18        ; 1F57: 3198
        call            sub_1fdb    ; 1F58: 27DB

        movlp           0x18        ; 1F59: 3198

;------------------------------------------------------------
; Subroutine: sub_1f5a
;
; called from: 1F56

sub_1f5a
        movf            mem_4a, W   ; 1F5A: 084A
        movlb           0x00        ; 1F5B: 0020
        movwf           mem_22      ; 1F5C: 00A2
        clrf            mem_23      ; 1F5D: 01A3
        call            sub_1b5a    ; 1F5E: 235A

        movlp           0x18        ; 1F5F: 3198
        call            sub_1e9b    ; 1F60: 269B

        movlp           0x2e        ; 1F61: 31AE
        call            sub_2e22    ; 1F62: 2622

        movlp           0x18        ; 1F63: 3198
        call            sub_1ff4    ; 1F64: 27F4

        movlp           0x18        ; 1F65: 3198
        call            sub_1c28    ; 1F66: 2428

        movlp           0x18        ; 1F67: 3198
        movlb           0x00        ; 1F68: 0020
        call            sub_1fe8    ; 1F69: 27E8

        movlp           0x18        ; 1F6A: 3198
        movlb           0x02        ; 1F6B: 0022
        movf            mem_160, W  ; 1F6C: 0860
        movlb           0x00        ; 1F6D: 0020
        movwf           mem_23      ; 1F6E: 00A3
        movlb           0x02        ; 1F6F: 0022
        movf            mem_161, W  ; 1F70: 0861
        movlb           0x00        ; 1F71: 0020
        movwf           mem_22      ; 1F72: 00A2
        movlb           0x02        ; 1F73: 0022
        movf            mem_15f, W  ; 1F74: 085F
        movlb           0x00        ; 1F75: 0020
        movwf           mem_33      ; 1F76: 00B3
        call            sub_1e9b    ; 1F77: 269B

        movlp           0x2e        ; 1F78: 31AE
        call            sub_2e22    ; 1F79: 2622

        movlp           0x18        ; 1F7A: 3198
        call            sub_1ff4    ; 1F7B: 27F4

        movlp           0x18        ; 1F7C: 3198
        call            sub_1b70    ; 1F7D: 2370

        movlp           0x18        ; 1F7E: 3198
        call            sub_1fe8    ; 1F7F: 27E8

        movlw           0x1f        ; 1F80: 301F
        movlb           0x00        ; 1F81: 0020
        movwf           mem_55      ; 1F82: 00D5
        movlb           0x01        ; 1F83: 0021
        movf            mem_cd, W   ; 1F84: 084D
        movlb           0x00        ; 1F85: 0020
        movwf           mem_56      ; 1F86: 00D6
        movlw           0x88        ; 1F87: 3088
        movlp           0x0c        ; 1F88: 318C
        call            I2CWrite    ; 1F89: 24B3

        movlp           0x18        ; 1F8A: 3198
        movlw           0x20        ; 1F8B: 3020
        movwf           mem_55      ; 1F8C: 00D5
        movlb           0x01        ; 1F8D: 0021
        movf            mem_ce, W   ; 1F8E: 084E
        movlb           0x00        ; 1F8F: 0020
        movwf           mem_56      ; 1F90: 00D6
        movlw           0x88        ; 1F91: 3088
        movlp           0x0c        ; 1F92: 318C
        call            I2CWrite    ; 1F93: 24B3

        movlp           0x18        ; 1F94: 3198
        movlw           0x21        ; 1F95: 3021
        movwf           mem_55      ; 1F96: 00D5
        movlb           0x01        ; 1F97: 0021
        movf            mem_cc, W   ; 1F98: 084C
        movlb           0x00        ; 1F99: 0020
        movwf           mem_56      ; 1F9A: 00D6
        movlw           0x88        ; 1F9B: 3088
        movlp           0x0c        ; 1F9C: 318C
        call            I2CWrite    ; 1F9D: 24B3

        movlp           0x18        ; 1F9E: 3198
        movlb           0x01        ; 1F9F: 0021
        movlw           0x18        ; 1FA0: 3018
        incf            mem_ca, f   ; 1FA1: 0ACA
        movlb           0x00        ; 1FA2: 0020
        movwf           mem_55      ; 1FA3: 00D5
        movlb           0x01        ; 1FA4: 0021
        movf            mem_ca, W   ; 1FA5: 084A
        movlb           0x00        ; 1FA6: 0020
        movwf           mem_56      ; 1FA7: 00D6
        movlw           0x88        ; 1FA8: 3088
        movlp           0x0c        ; 1FA9: 318C
        call            I2CWrite    ; 1FAA: 24B3

        movlp           0x18        ; 1FAB: 3198
        movlb           0x01        ; 1FAC: 0021
        movlw           0x18        ; 1FAD: 3018
        decf            mem_c9, f   ; 1FAE: 03C9
        subwf           mem_c9, W   ; 1FAF: 0249
        btfss           STATUS, C   ; 1FB0: 1C03
        goto            loop_1fb4   ; 1FB1: 2FB4

        movlw           0x17        ; 1FB2: 3017
        movwf           mem_c9      ; 1FB3: 00C9

loop_1fb4
; jump here from: 1FB1
        movlw           0x48        ; 1FB4: 3048
        movlb           0x00        ; 1FB5: 0020

;------------------------------------------------------------
; Subroutine: sub_1fb6
;
; called from: 1C43

sub_1fb6
        movwf           mem_55      ; 1FB6: 00D5
        movlb           0x01        ; 1FB7: 0021
        movf            mem_c9, W   ; 1FB8: 0849
        movlb           0x00        ; 1FB9: 0020
        movwf           mem_56      ; 1FBA: 00D6
        movlw           0x86        ; 1FBB: 3086
        movlp           0x0c        ; 1FBC: 318C
        call            I2CWrite    ; 1FBD: 24B3

        movlp           0x18        ; 1FBE: 3198
        movlp           0x24        ; 1FBF: 31A4
        call            sub_2443    ; 1FC0: 2443

        movlp           0x18        ; 1FC1: 3198
        movlb           0x01        ; 1FC2: 0021
        movf            mem_c9, W   ; 1FC3: 0849
        addwf           mem_c9, W   ; 1FC4: 0749
        addwf           mem_c9, W   ; 1FC5: 0749
        movlb           0x00        ; 1FC6: 0020
        movwf           mem_58      ; 1FC7: 00D8
        movwf           mem_55      ; 1FC8: 00D5
        movlw           0x86        ; 1FC9: 3086
        clrf            mem_56      ; 1FCA: 01D6
        movlp           0x0c        ; 1FCB: 318C
        call            I2CWrite    ; 1FCC: 24B3

        movlp           0x18        ; 1FCD: 3198
        incf            mem_58, W   ; 1FCE: 0A58
        movwf           mem_55      ; 1FCF: 00D5
        movlw           0x86        ; 1FD0: 3086
        clrf            mem_56      ; 1FD1: 01D6
        movlp           0x0c        ; 1FD2: 318C
        call            I2CWrite    ; 1FD3: 24B3

        movf            mem_58, W   ; 1FD4: 0858
        addlw           0x02        ; 1FD5: 3E02
        movwf           mem_55      ; 1FD6: 00D5
        movlw           0x86        ; 1FD7: 3086
        clrf            mem_56      ; 1FD8: 01D6
        movlp           0x0c        ; 1FD9: 318C
        goto            I2CWrite    ; 1FDA: 2CB3

;------------------------------------------------------------
; Subroutine: sub_1fdb
;
; called from: 060D
; called from: 1A48
; called from: 1AD1
; called from: 1F58

sub_1fdb
        movlb           0x00        ; 1FDB: 0020
        movf            mem_23, W   ; 1FDC: 0823
        movlb           0x01        ; 1FDD: 0021
        movwf           mem_af      ; 1FDE: 00AF
        movlb           0x00        ; 1FDF: 0020
        movf            mem_22, W   ; 1FE0: 0822
        movlb           0x01        ; 1FE1: 0021
        movwf           mem_ae      ; 1FE2: 00AE
        movlb           0x00        ; 1FE3: 0020
        movf            mem_33, W   ; 1FE4: 0833
        movlb           0x01        ; 1FE5: 0021
        movwf           mem_e4      ; 1FE6: 00E4
        return                      ; 1FE7: 0008

;------------------------------------------------------------
; Subroutine: sub_1fe8
;
; called from: 1F69
; called from: 1F7F

sub_1fe8
        movf            mem_23, W   ; 1FE8: 0823
        movlb           0x01        ; 1FE9: 0021
        movwf           mem_cd      ; 1FEA: 00CD
        movlb           0x00        ; 1FEB: 0020
        movf            mem_22, W   ; 1FEC: 0822
        movlb           0x01        ; 1FED: 0021
        movwf           mem_ce      ; 1FEE: 00CE
        movlb           0x00        ; 1FEF: 0020
        movf            mem_33, W   ; 1FF0: 0833
        movlb           0x01        ; 1FF1: 0021
        movwf           mem_cc      ; 1FF2: 00CC
        return                      ; 1FF3: 0008

;------------------------------------------------------------
; Subroutine: sub_1ff4
;
; called from: 1F64
; called from: 1F7B

sub_1ff4
        movlb           0x01        ; 1FF4: 0021
        movf            mem_cd, W   ; 1FF5: 084D
        movlb           0x00        ; 1FF6: 0020
        movwf           mem_21      ; 1FF7: 00A1
        movlb           0x01        ; 1FF8: 0021
        movf            mem_ce, W   ; 1FF9: 084E
        movlb           0x00        ; 1FFA: 0020
        movwf           mem_20      ; 1FFB: 00A0
        movlb           0x01        ; 1FFC: 0021
        movf            mem_cc, W   ; 1FFD: 084C
        movwf           mem_ba      ; 1FFE: 00BA
        return                      ; 1FFF: 0008
Bank2000_Vector org 0x2000

;------------------------------------------------------------
; Subroutine: sub_2000
;
; called from: 0081

sub_2000
        movlw           0x45        ; 2000: 3045
        movlb           0x03        ; 2001: 0023
        movwf           serial_output6     ; 2002: 00A6
        movlw           0x4c        ; 2003: 304C
        movwf           serial_output7     ; 2004: 00A7
        movf            serial_buffer2, W  ; 2005: 083C
        movwf           serial_output8     ; 2006: 00A8
        movf            serial_buffer3, W  ; 2007: 083D
        movwf           serial_output9     ; 2008: 00A9
        movlw           0x06        ; 2009: 3006
        movlb           0x02        ; 200A: 0022
        movwf           mem_16f     ; 200B: 00EF
        call            enable_tx_serial    ; 200C: 200E

        return                      ; 200D: 0008

;------------------------------------------------------------
; Subroutine: enable_tx_serial
;
; called from: 0034
; called from: 200C

enable_tx_serial
        movlb           0x03        ; 200E: 0023
        bcf             RCSTA, CREN ; 200F: 121D
        bsf             TXSTA, TXEN ; 2010: 169E
        movlb           0x01        ; 2011: 0021
        bsf             PIE1, TXIE  ; 2012: 1611
        return                      ; 2013: 0008

;------------------------------------------------------------
; Subroutine: radio_get_data
;
; called from: 01FA
; called from: 0209
; called from: 0218
; called from: 0227
; called from: 022C
; called from: 0231
; called from: 0236
; called from: 023B

radio_get_data
        clrf            mem_1f2     ; 2014: 01F2
        movlw           0x08        ; 2015: 3008
        movwf           mem_1f1     ; 2016: 00F1

label_2017
; jump here from: 203B
        movf            mem_71, f   ; 2017: 08F1
        btfsc           STATUS, Z   ; 2018: 1903
        goto            loop_203c   ; 2019: 283C

        lslf            mem_72, f   ; 201A: 35F2
        call            sleep_10    ; 201B: 203E

        movlp           0x20        ; 201C: 31A0
        movlb           0x00        ; 201D: 0020
        clrf            mem_34      ; 201E: 01B4
        call            radio_read    ; 201F: 2045

        movlp           0x20        ; 2020: 31A0
        movlw           0x23        ; 2021: 3023
        subwf           mem_34, W   ; 2022: 0234
        btfsc           STATUS, C   ; 2023: 1803
        goto            loop_2027   ; 2024: 2827

        bsf             mem_72, 0   ; 2025: 1472
        goto            label_2028  ; 2026: 2828

loop_2027
; jump here from: 2024
        bcf             mem_72, 0   ; 2027: 1072

label_2028
; jump here from: 2026
        call            sub_20f0    ; 2028: 20F0

        movlp           0x20        ; 2029: 31A0
        call            sleep_10    ; 202A: 203E

        movlp           0x20        ; 202B: 31A0
        btfsc           PORTB, RB0  ; 202C: 180D
        btfss           PORTB, RB0  ; 202D: 1C0D
        goto            loop_203a   ; 202E: 283A

        btfsc           PORTB, RB0  ; 202F: 180D
        btfss           PORTB, RB0  ; 2030: 1C0D
        goto            loop_203a   ; 2031: 283A

        btfsc           PORTB, RB0  ; 2032: 180D
        btfss           PORTB, RB0  ; 2033: 1C0D
        goto            loop_203a   ; 2034: 283A

        btfsc           PORTB, RB0  ; 2035: 180D
        btfss           PORTB, RB0  ; 2036: 1C0D
        goto            loop_203a   ; 2037: 283A

        btfss           PORTB, RB0  ; 2038: 1C0D
        goto            loop_203a   ; 2039: 283A

loop_203a
; jump here from: 202E
; jump here from: 2031
; jump here from: 2034
; jump here from: 2037
; jump here from: 2039
        decf            mem_71, f   ; 203A: 03F1
        goto            label_2017  ; 203B: 2817

loop_203c
; jump here from: 2019
        movf            mem_72, W   ; 203C: 0872
        return                      ; 203D: 0008

;------------------------------------------------------------
; Subroutine: sleep_10
;
; called from: 201B
; called from: 202A

sleep_10
        clrf            mem_70      ; 203E: 01F0

label_203f
; jump here from: 2044
        movlw           0x09        ; 203F: 3009
        incf            mem_70, f   ; 2040: 0AF0
        subwf           mem_70, W   ; 2041: 0270
        btfsc           STATUS, C   ; 2042: 1803
        return                      ; 2043: 0008
        goto            label_203f  ; 2044: 283F

;------------------------------------------------------------
; Subroutine: radio_read
;
; called from: 0188
; called from: 0190
; called from: 0193
; called from: 019B
; called from: 019E
; called from: 01A1
; called from: 01AD
; called from: 01B0
; called from: 01B3
; called from: 01C6
; called from: 01C9
; called from: 01DA
; called from: 01E2
; called from: 01EA
; called from: 201F

radio_read
        btfss           PORTB, RB0  ; 2045: 1C0D
        goto            loop_2049   ; 2046: 2849

        incf            mem_34, f   ; 2047: 0AB4
        goto            label_204a  ; 2048: 284A

loop_2049
; jump here from: 2046
        decf            mem_34, f   ; 2049: 03B4

label_204a
; jump here from: 2048
        btfsc           PORTB, RB0  ; 204A: 180D
        goto            loop_204e   ; 204B: 284E

        decf            mem_34, f   ; 204C: 03B4
        goto            label_204f  ; 204D: 284F

loop_204e
; jump here from: 204B
        incf            mem_34, f   ; 204E: 0AB4

label_204f
; jump here from: 204D
        btfss           PORTB, RB0  ; 204F: 1C0D
        goto            loop_2053   ; 2050: 2853

        incf            mem_34, f   ; 2051: 0AB4
        goto            label_2054  ; 2052: 2854

loop_2053
; jump here from: 2050
        decf            mem_34, f   ; 2053: 03B4

label_2054
; jump here from: 2052
        btfsc           PORTB, RB0  ; 2054: 180D
        goto            loop_2058   ; 2055: 2858

        decf            mem_34, f   ; 2056: 03B4
        goto            label_2059  ; 2057: 2859

loop_2058
; jump here from: 2055
        incf            mem_34, f   ; 2058: 0AB4

label_2059
; jump here from: 2057
        btfss           PORTB, RB0  ; 2059: 1C0D
        goto            loop_205d   ; 205A: 285D

        incf            mem_34, f   ; 205B: 0AB4
        goto            label_205e  ; 205C: 285E

loop_205d
; jump here from: 205A
        decf            mem_34, f   ; 205D: 03B4

label_205e
; jump here from: 205C
        btfsc           PORTB, RB0  ; 205E: 180D
        goto            loop_2062   ; 205F: 2862

        decf            mem_34, f   ; 2060: 03B4
        goto            label_2063  ; 2061: 2863

loop_2062
; jump here from: 205F
        incf            mem_34, f   ; 2062: 0AB4

label_2063
; jump here from: 2061
        btfss           PORTB, RB0  ; 2063: 1C0D
        goto            loop_2067   ; 2064: 2867

        incf            mem_34, f   ; 2065: 0AB4
        goto            label_2068  ; 2066: 2868

loop_2067
; jump here from: 2064
        decf            mem_34, f   ; 2067: 03B4

label_2068
; jump here from: 2066
        btfsc           PORTB, RB0  ; 2068: 180D
        goto            loop_206c   ; 2069: 286C

        decf            mem_34, f   ; 206A: 03B4
        goto            label_206d  ; 206B: 286D

loop_206c
; jump here from: 2069
        incf            mem_34, f   ; 206C: 0AB4

label_206d
; jump here from: 206B
        btfss           PORTB, RB0  ; 206D: 1C0D
        goto            loop_2071   ; 206E: 2871

        incf            mem_34, f   ; 206F: 0AB4
        goto            label_2072  ; 2070: 2872

loop_2071
; jump here from: 206E
        decf            mem_34, f   ; 2071: 03B4

label_2072
; jump here from: 2070
        btfsc           PORTB, RB0  ; 2072: 180D
        goto            loop_2076   ; 2073: 2876

        decf            mem_34, f   ; 2074: 03B4
        goto            label_2077  ; 2075: 2877

loop_2076
; jump here from: 2073
        incf            mem_34, f   ; 2076: 0AB4

label_2077
; jump here from: 2075
        btfss           PORTB, RB0  ; 2077: 1C0D
        goto            loop_207b   ; 2078: 287B

        incf            mem_34, f   ; 2079: 0AB4
        goto            label_207c  ; 207A: 287C

loop_207b
; jump here from: 2078
        decf            mem_34, f   ; 207B: 03B4

label_207c
; jump here from: 207A
        btfsc           PORTB, RB0  ; 207C: 180D
        goto            loop_2080   ; 207D: 2880

        decf            mem_34, f   ; 207E: 03B4
        goto            label_2081  ; 207F: 2881

loop_2080
; jump here from: 207D
        incf            mem_34, f   ; 2080: 0AB4

label_2081
; jump here from: 207F
        btfss           PORTB, RB0  ; 2081: 1C0D
        goto            loop_2085   ; 2082: 2885

        incf            mem_34, f   ; 2083: 0AB4
        goto            label_2086  ; 2084: 2886

loop_2085
; jump here from: 2082
        decf            mem_34, f   ; 2085: 03B4

label_2086
; jump here from: 2084
        btfsc           PORTB, RB0  ; 2086: 180D
        goto            loop_208a   ; 2087: 288A

        decf            mem_34, f   ; 2088: 03B4
        goto            label_208b  ; 2089: 288B

loop_208a
; jump here from: 2087
        incf            mem_34, f   ; 208A: 0AB4

label_208b
; jump here from: 2089
        btfss           PORTB, RB0  ; 208B: 1C0D
        goto            loop_208f   ; 208C: 288F

        incf            mem_34, f   ; 208D: 0AB4
        goto            label_2090  ; 208E: 2890

loop_208f
; jump here from: 208C
        decf            mem_34, f   ; 208F: 03B4

label_2090
; jump here from: 208E
        btfsc           PORTB, RB0  ; 2090: 180D
        goto            loop_2094   ; 2091: 2894

        decf            mem_34, f   ; 2092: 03B4
        goto            label_2095  ; 2093: 2895

loop_2094
; jump here from: 2091
        incf            mem_34, f   ; 2094: 0AB4

label_2095
; jump here from: 2093
        btfss           PORTB, RB0  ; 2095: 1C0D
        goto            loop_2099   ; 2096: 2899

        incf            mem_34, f   ; 2097: 0AB4
        goto            label_209a  ; 2098: 289A

loop_2099
; jump here from: 2096
        decf            mem_34, f   ; 2099: 03B4

label_209a
; jump here from: 2098
        btfsc           PORTB, RB0  ; 209A: 180D
        goto            loop_209e   ; 209B: 289E

        decf            mem_34, f   ; 209C: 03B4
        goto            label_209f  ; 209D: 289F

loop_209e
; jump here from: 209B
        incf            mem_34, f   ; 209E: 0AB4

label_209f
; jump here from: 209D
        btfss           PORTB, RB0  ; 209F: 1C0D
        goto            loop_20a3   ; 20A0: 28A3

        incf            mem_34, f   ; 20A1: 0AB4
        goto            label_20a4  ; 20A2: 28A4

loop_20a3
; jump here from: 20A0
        decf            mem_34, f   ; 20A3: 03B4

label_20a4
; jump here from: 20A2
        btfsc           PORTB, RB0  ; 20A4: 180D
        goto            loop_20a8   ; 20A5: 28A8

        decf            mem_34, f   ; 20A6: 03B4
        goto            label_20a9  ; 20A7: 28A9

loop_20a8
; jump here from: 20A5
        incf            mem_34, f   ; 20A8: 0AB4

label_20a9
; jump here from: 20A7
        btfss           PORTB, RB0  ; 20A9: 1C0D
        goto            loop_20ad   ; 20AA: 28AD

        incf            mem_34, f   ; 20AB: 0AB4
        goto            label_20ae  ; 20AC: 28AE

loop_20ad
; jump here from: 20AA
        decf            mem_34, f   ; 20AD: 03B4

label_20ae
; jump here from: 20AC
        btfsc           PORTB, RB0  ; 20AE: 180D
        goto            loop_20b2   ; 20AF: 28B2

        decf            mem_34, f   ; 20B0: 03B4
        goto            label_20b3  ; 20B1: 28B3

loop_20b2
; jump here from: 20AF
        incf            mem_34, f   ; 20B2: 0AB4

label_20b3
; jump here from: 20B1
        btfss           PORTB, RB0  ; 20B3: 1C0D
        goto            loop_20b7   ; 20B4: 28B7

        incf            mem_34, f   ; 20B5: 0AB4
        goto            label_20b8  ; 20B6: 28B8

loop_20b7
; jump here from: 20B4
        decf            mem_34, f   ; 20B7: 03B4

label_20b8
; jump here from: 20B6
        btfsc           PORTB, RB0  ; 20B8: 180D
        goto            loop_20bc   ; 20B9: 28BC

        decf            mem_34, f   ; 20BA: 03B4
        goto            label_20bd  ; 20BB: 28BD

loop_20bc
; jump here from: 20B9
        incf            mem_34, f   ; 20BC: 0AB4

label_20bd
; jump here from: 20BB
        btfss           PORTB, RB0  ; 20BD: 1C0D
        goto            loop_20c1   ; 20BE: 28C1

        incf            mem_34, f   ; 20BF: 0AB4
        goto            label_20c2  ; 20C0: 28C2

loop_20c1
; jump here from: 20BE
        decf            mem_34, f   ; 20C1: 03B4

label_20c2
; jump here from: 20C0
        btfsc           PORTB, RB0  ; 20C2: 180D
        goto            loop_20c6   ; 20C3: 28C6

        decf            mem_34, f   ; 20C4: 03B4
        goto            label_20c7  ; 20C5: 28C7

loop_20c6
; jump here from: 20C3
        incf            mem_34, f   ; 20C6: 0AB4

label_20c7
; jump here from: 20C5
        btfss           PORTB, RB0  ; 20C7: 1C0D
        goto            loop_20cb   ; 20C8: 28CB

        incf            mem_34, f   ; 20C9: 0AB4
        goto            label_20cc  ; 20CA: 28CC

loop_20cb
; jump here from: 20C8
        decf            mem_34, f   ; 20CB: 03B4

label_20cc
; jump here from: 20CA
        btfsc           PORTB, RB0  ; 20CC: 180D
        goto            loop_20d0   ; 20CD: 28D0

        decf            mem_34, f   ; 20CE: 03B4
        goto            label_20d1  ; 20CF: 28D1

loop_20d0
; jump here from: 20CD
        incf            mem_34, f   ; 20D0: 0AB4

label_20d1
; jump here from: 20CF
        btfss           PORTB, RB0  ; 20D1: 1C0D
        goto            loop_20d5   ; 20D2: 28D5

        incf            mem_34, f   ; 20D3: 0AB4
        goto            label_20d6  ; 20D4: 28D6

loop_20d5
; jump here from: 20D2
        decf            mem_34, f   ; 20D5: 03B4

label_20d6
; jump here from: 20D4
        btfsc           PORTB, RB0  ; 20D6: 180D
        goto            loop_20da   ; 20D7: 28DA

        decf            mem_34, f   ; 20D8: 03B4
        goto            label_20db  ; 20D9: 28DB

loop_20da
; jump here from: 20D7
        incf            mem_34, f   ; 20DA: 0AB4

label_20db
; jump here from: 20D9
        btfss           PORTB, RB0  ; 20DB: 1C0D
        goto            loop_20df   ; 20DC: 28DF

        incf            mem_34, f   ; 20DD: 0AB4
        goto            label_20e0  ; 20DE: 28E0

loop_20df
; jump here from: 20DC
        decf            mem_34, f   ; 20DF: 03B4

label_20e0
; jump here from: 20DE
        btfsc           PORTB, RB0  ; 20E0: 180D
        goto            loop_20e4   ; 20E1: 28E4

        decf            mem_34, f   ; 20E2: 03B4
        goto            label_20e5  ; 20E3: 28E5

loop_20e4
; jump here from: 20E1
        incf            mem_34, f   ; 20E4: 0AB4

label_20e5
; jump here from: 20E3
        btfss           PORTB, RB0  ; 20E5: 1C0D
        goto            loop_20e9   ; 20E6: 28E9

        incf            mem_34, f   ; 20E7: 0AB4
        goto            label_20ea  ; 20E8: 28EA

loop_20e9
; jump here from: 20E6
        decf            mem_34, f   ; 20E9: 03B4

label_20ea
; jump here from: 20E8
        btfsc           PORTB, RB0  ; 20EA: 180D
        goto            loop_20ee   ; 20EB: 28EE

        decf            mem_34, f   ; 20EC: 03B4
        return                      ; 20ED: 0008

loop_20ee
; jump here from: 20EB
        incf            mem_34, f   ; 20EE: 0AB4
        return                      ; 20EF: 0008

;------------------------------------------------------------
; Subroutine: sub_20f0
;
; called from: 2028

sub_20f0
        clrf            mem_70      ; 20F0: 01F0

label_20f1
; jump here from: 20F6
        movlw           0x0b        ; 20F1: 300B
        incf            mem_70, f   ; 20F2: 0AF0
        subwf           mem_70, W   ; 20F3: 0270
        btfsc           STATUS, C   ; 20F4: 1803
        return                      ; 20F5: 0008
        goto            label_20f1  ; 20F6: 28F1

;------------------------------------------------------------
; Subroutine: sub_20f7
;
; called from: 0863

sub_20f7
        movlw           0x06        ; 20F7: 3006
        movlb           0x00        ; 20F8: 0020
        movwf           mem_52      ; 20F9: 00D2
        movlw           0x88        ; 20FA: 3088
        movlp           0x0d        ; 20FB: 318D
        call            I2CRead    ; 20FC: 25FD

        movlp           0x20        ; 20FD: 31A0
        movlb           0x01        ; 20FE: 0021
        movwf           mem_b4      ; 20FF: 00B4
        movlw           0x06        ; 2100: 3006
        subwf           mem_b4, W   ; 2101: 0234
        btfss           STATUS, C   ; 2102: 1C03
        return                      ; 2103: 0008
        goto            sub_21ec    ; 2104: 29EC

;------------------------------------------------------------
; Subroutine: sub_2105
;
; called from: 0867

sub_2105
        movlw           0x0a        ; 2105: 300A
        movlb           0x00        ; 2106: 0020
        movwf           mem_52      ; 2107: 00D2
        movlw           0x88        ; 2108: 3088
        movlp           0x0d        ; 2109: 318D
        call            I2CRead    ; 210A: 25FD

        movlp           0x20        ; 210B: 31A0
        movlb           0x01        ; 210C: 0021
        movwf           mem_a1      ; 210D: 00A1
        movlw           0x0b        ; 210E: 300B
        movlb           0x00        ; 210F: 0020
        movwf           mem_52      ; 2110: 00D2
        movlw           0x88        ; 2111: 3088
        movlp           0x0d        ; 2112: 318D
        call            I2CRead    ; 2113: 25FD

        movlp           0x20        ; 2114: 31A0
        movlb           0x01        ; 2115: 0021
        movwf           mem_a0      ; 2116: 00A0
        movlw           0x01        ; 2117: 3001
        subwf           mem_a1, W   ; 2118: 0221
        movlw           0x41        ; 2119: 3041
        btfsc           STATUS, Z   ; 211A: 1903
        subwf           mem_a0, W   ; 211B: 0220
        btfss           STATUS, C   ; 211C: 1C03
        return                      ; 211D: 0008
        goto            sub_21fe    ; 211E: 29FE

;------------------------------------------------------------
; Subroutine: sub_211f
;
; called from: 0860

sub_211f
        movlw           0x22        ; 211F: 3022
        movlb           0x00        ; 2120: 0020
        movwf           mem_52      ; 2121: 00D2
        movlw           0x88        ; 2122: 3088
        movlp           0x0d        ; 2123: 318D
        call            I2CRead    ; 2124: 25FD

        movlp           0x20        ; 2125: 31A0
        movlb           0x01        ; 2126: 0021
        movwf           mem_a7      ; 2127: 00A7
        movlw           0x23        ; 2128: 3023
        movlb           0x00        ; 2129: 0020
        movwf           mem_52      ; 212A: 00D2
        movlw           0x88        ; 212B: 3088
        movlp           0x0d        ; 212C: 318D
        call            I2CRead    ; 212D: 25FD

        movlp           0x20        ; 212E: 31A0
        movlb           0x01        ; 212F: 0021
        movwf           mem_a6      ; 2130: 00A6
        movlw           0x01        ; 2131: 3001
        subwf           mem_a7, W   ; 2132: 0227
        movlw           0xf4        ; 2133: 30F4
        btfsc           STATUS, Z   ; 2134: 1903
        subwf           mem_a6, W   ; 2135: 0226
        btfss           STATUS, C   ; 2136: 1C03
        goto            loop_213f   ; 2137: 293F

        movlw           0x27        ; 2138: 3027
        subwf           mem_a7, W   ; 2139: 0227
        movlw           0x11        ; 213A: 3011
        btfsc           STATUS, Z   ; 213B: 1903
        subwf           mem_a6, W   ; 213C: 0226
        btfss           STATUS, C   ; 213D: 1C03
        return                      ; 213E: 0008

loop_213f
; jump here from: 2137
        goto            sub_21d9    ; 213F: 29D9

;------------------------------------------------------------
; Subroutine: sub_2140
;
; called from: 085D

sub_2140
        movlw           0x0c        ; 2140: 300C
        movlb           0x00        ; 2141: 0020
        movwf           mem_52      ; 2142: 00D2
        movlw           0x88        ; 2143: 3088
        movlp           0x0d        ; 2144: 318D
        call            I2CRead    ; 2145: 25FD

        movlp           0x20        ; 2146: 31A0
        movlb           0x01        ; 2147: 0021
        movwf           mem_b1      ; 2148: 00B1
        movlw           0x0d        ; 2149: 300D
        movlb           0x00        ; 214A: 0020
        movwf           mem_52      ; 214B: 00D2
        movlw           0x88        ; 214C: 3088
        movlp           0x0d        ; 214D: 318D
        call            I2CRead    ; 214E: 25FD

        movlp           0x20        ; 214F: 31A0
        movlb           0x01        ; 2150: 0021
        movwf           mem_b0      ; 2151: 00B0
        movlw           0x00        ; 2152: 3000
        subwf           mem_b1, W   ; 2153: 0231
        movlw           0x5a        ; 2154: 305A
        btfsc           STATUS, Z   ; 2155: 1903
        subwf           mem_b0, W   ; 2156: 0230
        btfss           STATUS, C   ; 2157: 1C03
        goto            loop_2160   ; 2158: 2960

        movlw           0x02        ; 2159: 3002
        subwf           mem_b1, W   ; 215A: 0231
        movlw           0x59        ; 215B: 3059
        btfsc           STATUS, Z   ; 215C: 1903
        subwf           mem_b0, W   ; 215D: 0230
        btfss           STATUS, C   ; 215E: 1C03
        return                      ; 215F: 0008

loop_2160
; jump here from: 2158
        goto            sub_21c7    ; 2160: 29C7

;------------------------------------------------------------
; Subroutine: sub_2161
;
; called from: 0848

sub_2161
        movlw           0x88        ; 2161: 3088
        clrf            mem_52      ; 2162: 01D2
        incf            mem_52, f   ; 2163: 0AD2
        movlp           0x0d        ; 2164: 318D
        call            I2CRead    ; 2165: 25FD

        movlp           0x20        ; 2166: 31A0
        movwf           mem_58      ; 2167: 00D8
        movlw           0x88        ; 2168: 3088
        clrf            mem_52      ; 2169: 01D2
        movlp           0x0d        ; 216A: 318D
        call            I2CRead    ; 216B: 25FD

        movlp           0x20        ; 216C: 31A0
        movwf           mem_59      ; 216D: 00D9
        movf            mem_58, W   ; 216E: 0858
        xorlw           0xaa        ; 216F: 3AAA
        btfss           STATUS, Z   ; 2170: 1D03
        goto            loop_2176   ; 2171: 2976

        movf            mem_59, W   ; 2172: 0859
        xorlw           0x55        ; 2173: 3A55
        btfsc           STATUS, Z   ; 2174: 1903
        return                      ; 2175: 0008

loop_2176
; jump here from: 2171
        clrf            mem_5a      ; 2176: 01DA

loop_2177
; jump here from: 2181
        clrwdt                      ; 2177: 0064
        movlb           0x00        ; 2178: 0020
        movf            mem_5a, W   ; 2179: 085A
        movlp           0x0c        ; 217A: 318C
        call            InitMem    ; 217B: 24EB

        movlp           0x20        ; 217C: 31A0
        movlw           0x89        ; 217D: 3089
        incf            mem_5a, f   ; 217E: 0ADA
        subwf           mem_5a, W   ; 217F: 025A
        btfss           STATUS, C   ; 2180: 1C03
        goto            loop_2177   ; 2181: 2977

        movlw           0xaa        ; 2182: 30AA
        clrf            mem_55      ; 2183: 01D5
        incf            mem_55, f   ; 2184: 0AD5
        movwf           mem_56      ; 2185: 00D6
        movlw           0x88        ; 2186: 3088
        movlp           0x0c        ; 2187: 318C
        call            I2CWrite    ; 2188: 24B3

        movlp           0x20        ; 2189: 31A0
        movlw           0x55        ; 218A: 3055
        clrf            mem_55      ; 218B: 01D5
        movwf           mem_56      ; 218C: 00D6
        movlw           0x88        ; 218D: 3088
        movlp           0x0c        ; 218E: 318C
        call            I2CWrite    ; 218F: 24B3

        movlp           0x20        ; 2190: 31A0
        call            sub_21c7    ; 2191: 21C7

        movlp           0x20        ; 2192: 31A0
        call            sub_21d9    ; 2193: 21D9

        movlp           0x20        ; 2194: 31A0
        call            sub_21ec    ; 2195: 21EC

        movlp           0x20        ; 2196: 31A0
        call            sub_21f8    ; 2197: 21F8

        movlp           0x20        ; 2198: 31A0
        call            sub_2216    ; 2199: 2216

        movlp           0x20        ; 219A: 31A0
        call            sub_21fe    ; 219B: 21FE

        movlp           0x20        ; 219C: 31A0
        call            sub_222b    ; 219D: 222B

        movlp           0x20        ; 219E: 31A0
        call            sub_221f    ; 219F: 221F

        movlw           0x10        ; 21A0: 3010
        movwf           mem_55      ; 21A1: 00D5
        movlw           0x13        ; 21A2: 3013
        movwf           mem_56      ; 21A3: 00D6
        movlw           0x88        ; 21A4: 3088
        movlp           0x0c        ; 21A5: 318C
        call            I2CWrite    ; 21A6: 24B3

        movlp           0x20        ; 21A7: 31A0
        movlw           0x11        ; 21A8: 3011
        movlp           0x0f        ; 21A9: 318F
        call            sub_0f81    ; 21AA: 2781

        movlp           0x20        ; 21AB: 31A0
        movlp           0x0c        ; 21AC: 318C
        call            I2CWrite    ; 21AD: 24B3

        movlp           0x20        ; 21AE: 31A0
        movlw           0x12        ; 21AF: 3012
        movlp           0x0f        ; 21B0: 318F
        call            sub_0f81    ; 21B1: 2781

        movlp           0x20        ; 21B2: 31A0
        movlp           0x0c        ; 21B3: 318C
        call            I2CWrite    ; 21B4: 24B3

        movlp           0x20        ; 21B5: 31A0
        movlw           0x13        ; 21B6: 3013
        movwf           mem_55      ; 21B7: 00D5
        movlw           0x88        ; 21B8: 3088
        clrf            mem_56      ; 21B9: 01D6
        movlp           0x0c        ; 21BA: 318C
        call            I2CWrite    ; 21BB: 24B3

        movlp           0x20        ; 21BC: 31A0
        movlw           0x14        ; 21BD: 3014
        movwf           mem_55      ; 21BE: 00D5
        movlw           0x88        ; 21BF: 3088
        clrf            mem_56      ; 21C0: 01D6
        movlp           0x0c        ; 21C1: 318C
        call            I2CWrite    ; 21C2: 24B3

        movlb           0x01        ; 21C3: 0021
        clrf            mem_b9      ; 21C4: 01B9
        incf            mem_b9, f   ; 21C5: 0AB9
        return                      ; 21C6: 0008

;------------------------------------------------------------
; Subroutine: sub_21c7
;
; called from: 2191
; called from: 22DB

sub_21c7
; jump here from: 2160
        movlw           0xf0        ; 21C7: 30F0
        movlb           0x01        ; 21C8: 0021
        movwf           mem_b0      ; 21C9: 00B0
        movlw           0x0c        ; 21CA: 300C
        clrf            mem_b1      ; 21CB: 01B1
        movlb           0x00        ; 21CC: 0020
        movwf           mem_55      ; 21CD: 00D5
        movlb           0x01        ; 21CE: 0021
        movf            mem_b1, W   ; 21CF: 0831
        movlb           0x00        ; 21D0: 0020
        movwf           mem_56      ; 21D1: 00D6
        movlw           0x88        ; 21D2: 3088
        movlp           0x0c        ; 21D3: 318C
        call            I2CWrite    ; 21D4: 24B3

        movlp           0x20        ; 21D5: 31A0
        call            sub_223d    ; 21D6: 223D

        movlp           0x0c        ; 21D7: 318C
        goto            I2CWrite    ; 21D8: 2CB3

;------------------------------------------------------------
; Subroutine: sub_21d9
;
; called from: 2193
; called from: 22DE

sub_21d9
; jump here from: 213F
        movlw           0xf4        ; 21D9: 30F4
        movlb           0x01        ; 21DA: 0021
        movwf           mem_a6      ; 21DB: 00A6
        movlw           0x01        ; 21DC: 3001
        movwf           mem_a7      ; 21DD: 00A7
        movlw           0x22        ; 21DE: 3022
        movlb           0x00        ; 21DF: 0020
        movwf           mem_55      ; 21E0: 00D5
        movlb           0x01        ; 21E1: 0021
        movf            mem_a7, W   ; 21E2: 0827
        movlb           0x00        ; 21E3: 0020
        movwf           mem_56      ; 21E4: 00D6
        movlw           0x88        ; 21E5: 3088
        movlp           0x0c        ; 21E6: 318C
        call            I2CWrite    ; 21E7: 24B3

        movlp           0x20        ; 21E8: 31A0
        call            sub_2236    ; 21E9: 2236

        movlp           0x0c        ; 21EA: 318C
        goto            I2CWrite    ; 21EB: 2CB3

;------------------------------------------------------------
; Subroutine: sub_21ec
;
; called from: 2195
; called from: 22EA

sub_21ec
; jump here from: 2104
        movlb           0x01        ; 21EC: 0021
        movlw           0x06        ; 21ED: 3006
        clrf            mem_b4      ; 21EE: 01B4
        movlb           0x00        ; 21EF: 0020
        movwf           mem_55      ; 21F0: 00D5
        movlb           0x01        ; 21F1: 0021
        movf            mem_b4, W   ; 21F2: 0834
        movlb           0x00        ; 21F3: 0020
        movwf           mem_56      ; 21F4: 00D6
        movlw           0x88        ; 21F5: 3088
        movlp           0x0c        ; 21F6: 318C
        goto            I2CWrite    ; 21F7: 2CB3

;------------------------------------------------------------
; Subroutine: sub_21f8
;
; called from: 2197
; called from: 22E1

sub_21f8
        movlw           0x64        ; 21F8: 3064
        movlb           0x01        ; 21F9: 0021
        movwf           mem_b3      ; 21FA: 00B3
        call            sub_2279    ; 21FB: 2279

        movlp           0x0c        ; 21FC: 318C
        goto            I2CWrite    ; 21FD: 2CB3

;------------------------------------------------------------
; Subroutine: sub_21fe
;
; called from: 219B
; called from: 22E7

sub_21fe
; jump here from: 211E
        movlw           0x14        ; 21FE: 3014
        movlb           0x01        ; 21FF: 0021
        movwf           mem_a0      ; 2200: 00A0
        movlw           0x0b        ; 2201: 300B
        clrf            mem_a1      ; 2202: 01A1
        movlb           0x00        ; 2203: 0020
        movwf           mem_55      ; 2204: 00D5
        movlb           0x01        ; 2205: 0021
        movf            mem_a0, W   ; 2206: 0820
        movlb           0x00        ; 2207: 0020
        movwf           mem_56      ; 2208: 00D6
        movlw           0x88        ; 2209: 3088
        movlp           0x0c        ; 220A: 318C
        call            I2CWrite    ; 220B: 24B3

        movlp           0x20        ; 220C: 31A0
        movlw           0x0a        ; 220D: 300A
        movwf           mem_55      ; 220E: 00D5
        movlb           0x01        ; 220F: 0021
        movf            mem_a1, W   ; 2210: 0821
        movlb           0x00        ; 2211: 0020
        movwf           mem_56      ; 2212: 00D6
        movlw           0x88        ; 2213: 3088
        movlp           0x0c        ; 2214: 318C
        goto            I2CWrite    ; 2215: 2CB3

;------------------------------------------------------------
; Subroutine: sub_2216
;
; called from: 2199
; called from: 22E4

sub_2216
        movlb           0x01        ; 2216: 0021
        movlw           0x09        ; 2217: 3009
        clrf            mem_b2      ; 2218: 01B2
        movlb           0x00        ; 2219: 0020
        movwf           mem_55      ; 221A: 00D5
        movlw           0x88        ; 221B: 3088
        clrf            mem_56      ; 221C: 01D6
        movlp           0x0c        ; 221D: 318C
        goto            I2CWrite    ; 221E: 2CB3

;------------------------------------------------------------
; Subroutine: sub_221f
;
; called from: 0D73
; called from: 219F
; called from: 22F0

sub_221f
        movlb           0x01        ; 221F: 0021
        movlw           0x0e        ; 2220: 300E
        clrf            mem_e3      ; 2221: 01E3
        movlb           0x00        ; 2222: 0020
        movwf           mem_55      ; 2223: 00D5
        movlb           0x01        ; 2224: 0021
        movf            mem_e3, W   ; 2225: 0863
        movlb           0x00        ; 2226: 0020
        movwf           mem_56      ; 2227: 00D6
        movlw           0x88        ; 2228: 3088
        movlp           0x0c        ; 2229: 318C
        goto            I2CWrite    ; 222A: 2CB3

;------------------------------------------------------------
; Subroutine: sub_222b
;
; called from: 219D
; called from: 22ED

sub_222b
; jump here from: 0C2B
; jump here from: 0D76
        movlw           0x82        ; 222B: 3082
        movlp           0x0f        ; 222C: 318F
        call            sub_0f5f    ; 222D: 275F

        movlp           0x20        ; 222E: 31A0
        movlp           0x0c        ; 222F: 318C
        call            I2CWrite    ; 2230: 24B3

        movlp           0x20        ; 2231: 31A0
        movlp           0x17        ; 2232: 3197
        call            sub_175f    ; 2233: 275F

        movlp           0x0c        ; 2234: 318C
        goto            I2CWrite    ; 2235: 2CB3

;------------------------------------------------------------
; Subroutine: sub_2236
;
; called from: 11F1
; called from: 1224
; called from: 21E9

sub_2236
        movlw           0x23        ; 2236: 3023
        movwf           mem_55      ; 2237: 00D5
        movlb           0x01        ; 2238: 0021
        movf            mem_a6, W   ; 2239: 0826
        movlb           0x00        ; 223A: 0020
        movwf           mem_56      ; 223B: 00D6
        retlw           0x88        ; 223C: 3488

;------------------------------------------------------------
; Subroutine: sub_223d
;
; called from: 11A7
; called from: 11D4
; called from: 21D6

sub_223d
        movlw           0x0d        ; 223D: 300D
        movwf           mem_55      ; 223E: 00D5
        movlb           0x01        ; 223F: 0021
        movf            mem_b0, W   ; 2240: 0830
        movlb           0x00        ; 2241: 0020
        movwf           mem_56      ; 2242: 00D6
        retlw           0x88        ; 2243: 3488

label_2244
; jump here from: 2F92
        goto            label_2269  ; 2244: 2A69

loop_2245
; jump here from: 226D
        movf            mem_45, W   ; 2245: 0845
        movlb           0x01        ; 2246: 0021
        movwf           mem_b3      ; 2247: 00B3
        call            sub_2279    ; 2248: 2279

        movlp           0x0c        ; 2249: 318C
        call            I2CWrite    ; 224A: 24B3

        movlp           0x20        ; 224B: 31A0
        movlw           0x00        ; 224C: 3000
        movlp           0x16        ; 224D: 3196
        call            sub_1682    ; 224E: 2682

        movlw           0x16        ; 224F: 3016
        movlb           0x00        ; 2250: 0020
        movwf           mem_3b      ; 2251: 00BB
        movlb           0x01        ; 2252: 0021
        movf            mem_a1, W   ; 2253: 0821
        movlb           0x00        ; 2254: 0020
        movwf           mem_29      ; 2255: 00A9
        movlb           0x01        ; 2256: 0021
        movf            mem_a0, W   ; 2257: 0820
        movlb           0x00        ; 2258: 0020
        movwf           mem_28      ; 2259: 00A8

label_225a
; jump here from: 225D
; jump here from: 225F
; jump here from: 2268
; jump here from: 2277
        clrf            mem_3a      ; 225A: 01BA
        return                      ; 225B: 0008

loop_225c
; jump here from: 2270
        incf            mem_45, f   ; 225C: 0AC5
        goto            label_225a  ; 225D: 2A5A

loop_225e
; jump here from: 2273
        decf            mem_45, f   ; 225E: 03C5
        goto            label_225a  ; 225F: 2A5A

loop_2260
; jump here from: 2276
        movf            mem_45, W   ; 2260: 0845
        movlb           0x01        ; 2261: 0021
        movwf           mem_b3      ; 2262: 00B3
        call            sub_2279    ; 2263: 2279

        movlp           0x0c        ; 2264: 318C
        call            I2CWrite    ; 2265: 24B3

        movlp           0x20        ; 2266: 31A0
        clrf            mem_bb      ; 2267: 01BB
        goto            label_225a  ; 2268: 2A5A

label_2269
; jump here from: 2244
        movlb           0x00        ; 2269: 0020
        movf            mem_3a, W   ; 226A: 083A
        xorlw           0x01        ; 226B: 3A01
        btfsc           STATUS, Z   ; 226C: 1903
        goto            loop_2245   ; 226D: 2A45

        xorlw           0x03        ; 226E: 3A03
        btfsc           STATUS, Z   ; 226F: 1903
        goto            loop_225c   ; 2270: 2A5C

        xorlw           0x01        ; 2271: 3A01
        btfsc           STATUS, Z   ; 2272: 1903
        goto            loop_225e   ; 2273: 2A5E

        xorlw           0x07        ; 2274: 3A07
        btfsc           STATUS, Z   ; 2275: 1903
        goto            loop_2260   ; 2276: 2A60
        goto            label_225a  ; 2277: 2A5A
;
; end of label_2269
;------------------------------------------------------------

        return                      ; 2278: 0008

;------------------------------------------------------------
; Subroutine: sub_2279
;
; called from: 21FB
; called from: 2248
; called from: 2263

sub_2279
        movlw           0x05        ; 2279: 3005
        movlb           0x00        ; 227A: 0020
        movwf           mem_55      ; 227B: 00D5
        movlb           0x01        ; 227C: 0021
        movf            mem_b3, W   ; 227D: 0833
        movlb           0x00        ; 227E: 0020
        movwf           mem_56      ; 227F: 00D6
        retlw           0x88        ; 2280: 3488

label_2281
; jump here from: 0347
        movlb           0x02        ; 2281: 0022
        clrf            mem_122     ; 2282: 01A2
        clrf            mem_123     ; 2283: 01A3
        movlb           0x00        ; 2284: 0020
        clrf            mem_3b      ; 2285: 01BB
        movlb           0x01        ; 2286: 0021
        clrf            mem_ee      ; 2287: 01EE

label_2288
; jump here from: 2294
        movlw           0x89        ; 2288: 3089
        subwf           mem_ee, W   ; 2289: 026E
        btfsc           STATUS, C   ; 228A: 1803
        goto            loop_2295   ; 228B: 2A95

        clrwdt                      ; 228C: 0064
        movlb           0x01        ; 228D: 0021
        movf            mem_ee, W   ; 228E: 086E
        movlp           0x0c        ; 228F: 318C
        call            InitMem    ; 2290: 24EB

        movlp           0x22        ; 2291: 31A2
        movlb           0x01        ; 2292: 0021
        incf            mem_ee, f   ; 2293: 0AEE
        goto            label_2288  ; 2294: 2A88

loop_2295
; jump here from: 228B
        movlb           0x00        ; 2295: 0020
        movlw           0xaa        ; 2296: 30AA
        clrf            mem_55      ; 2297: 01D5
        incf            mem_55, f   ; 2298: 0AD5
        movwf           mem_56      ; 2299: 00D6
        movlw           0x88        ; 229A: 3088
        movlp           0x0c        ; 229B: 318C
        call            I2CWrite    ; 229C: 24B3

        movlp           0x22        ; 229D: 31A2
        movlw           0x55        ; 229E: 3055
        clrf            mem_55      ; 229F: 01D5
        movwf           mem_56      ; 22A0: 00D6
        movlw           0x88        ; 22A1: 3088
        movlp           0x0c        ; 22A2: 318C
        call            I2CWrite    ; 22A3: 24B3

        movlp           0x22        ; 22A4: 31A2
        movlw           0x10        ; 22A5: 3010
        movwf           mem_55      ; 22A6: 00D5
        movlb           0x01        ; 22A7: 0021
        movf            mem_d8, W   ; 22A8: 0858
        movlb           0x00        ; 22A9: 0020
        movwf           mem_56      ; 22AA: 00D6
        movlw           0x88        ; 22AB: 3088
        movlp           0x0c        ; 22AC: 318C
        call            I2CWrite    ; 22AD: 24B3

        movlp           0x22        ; 22AE: 31A2
        movlw           0x11        ; 22AF: 3011
        movwf           mem_55      ; 22B0: 00D5
        movlb           0x01        ; 22B1: 0021
        movf            mem_d7, W   ; 22B2: 0857
        movlb           0x00        ; 22B3: 0020
        movwf           mem_56      ; 22B4: 00D6
        movlw           0x88        ; 22B5: 3088
        movlp           0x0c        ; 22B6: 318C
        call            I2CWrite    ; 22B7: 24B3

        movlp           0x22        ; 22B8: 31A2
        movlw           0x12        ; 22B9: 3012
        movwf           mem_55      ; 22BA: 00D5
        movlb           0x01        ; 22BB: 0021
        movf            mem_d4, W   ; 22BC: 0854
        movlb           0x00        ; 22BD: 0020
        movwf           mem_56      ; 22BE: 00D6
        movlw           0x88        ; 22BF: 3088
        movlp           0x0c        ; 22C0: 318C
        call            I2CWrite    ; 22C1: 24B3

        movlp           0x22        ; 22C2: 31A2
        movlw           0x13        ; 22C3: 3013
        movwf           mem_55      ; 22C4: 00D5
        movlb           0x01        ; 22C5: 0021
        movf            mem_d5, W   ; 22C6: 0855
        movlb           0x00        ; 22C7: 0020
        movwf           mem_56      ; 22C8: 00D6
        movlw           0x88        ; 22C9: 3088
        movlp           0x0c        ; 22CA: 318C
        call            I2CWrite    ; 22CB: 24B3

        movlp           0x22        ; 22CC: 31A2
        movlw           0x14        ; 22CD: 3014
        movwf           mem_55      ; 22CE: 00D5
        movlb           0x01        ; 22CF: 0021
        movf            mem_d6, W   ; 22D0: 0856
        movlb           0x00        ; 22D1: 0020
        movwf           mem_56      ; 22D2: 00D6
        movlw           0x88        ; 22D3: 3088
        movlp           0x0c        ; 22D4: 318C
        call            I2CWrite    ; 22D5: 24B3

        movlp           0x22        ; 22D6: 31A2
        movlp           0x28        ; 22D7: 31A8
        call            sub_2880    ; 22D8: 2080

        movlp           0x22        ; 22D9: 31A2
        movlp           0x21        ; 22DA: 31A1
        call            sub_21c7    ; 22DB: 21C7

        movlp           0x22        ; 22DC: 31A2
        movlp           0x21        ; 22DD: 31A1
        call            sub_21d9    ; 22DE: 21D9

        movlp           0x22        ; 22DF: 31A2
        movlp           0x21        ; 22E0: 31A1
        call            sub_21f8    ; 22E1: 21F8

        movlp           0x22        ; 22E2: 31A2
        movlp           0x22        ; 22E3: 31A2
        call            sub_2216    ; 22E4: 2216

        movlp           0x22        ; 22E5: 31A2
        movlp           0x21        ; 22E6: 31A1
        call            sub_21fe    ; 22E7: 21FE

        movlp           0x22        ; 22E8: 31A2
        movlp           0x21        ; 22E9: 31A1
        call            sub_21ec    ; 22EA: 21EC

        movlp           0x22        ; 22EB: 31A2
        movlp           0x22        ; 22EC: 31A2
        call            sub_222b    ; 22ED: 222B

        movlp           0x22        ; 22EE: 31A2
        movlp           0x22        ; 22EF: 31A2
        call            sub_221f    ; 22F0: 221F

        movlp           0x22        ; 22F1: 31A2
        movlp           0x3f        ; 22F2: 31BF
        call            sub_3f59    ; 22F3: 2759

        movlp           0x22        ; 22F4: 31A2
        movlp           0x3f        ; 22F5: 31BF
        call            sub_3f6e    ; 22F6: 276E

        movlp           0x22        ; 22F7: 31A2
        movlp           0x18        ; 22F8: 3198
        call            sub_1801    ; 22F9: 2001

        movlp           0x22        ; 22FA: 31A2
        movlp           0x31        ; 22FB: 31B1
        call            sub_310b    ; 22FC: 210B

        movlp           0x22        ; 22FD: 31A2
        movlp           0x3f        ; 22FE: 31BF
        call            sub_3fb3    ; 22FF: 27B3

        movlp           0x22        ; 2300: 31A2
        call            sub_242e    ; 2301: 242E

        movlp           0x22        ; 2302: 31A2
        call            sub_2434    ; 2303: 2434

        movlp           0x22        ; 2304: 31A2
        call            sub_2439    ; 2305: 2439

        movlp           0x22        ; 2306: 31A2
        call            sub_243e    ; 2307: 243E

        movlp           0x22        ; 2308: 31A2
        call            sub_2443    ; 2309: 2443

        movlp           0x22        ; 230A: 31A2
        call            sub_2448    ; 230B: 2448

        movlp           0x22        ; 230C: 31A2
        call            sub_2717    ; 230D: 2717

        movlp           0x22        ; 230E: 31A2
        call            sub_27ad    ; 230F: 27AD

        movlp           0x22        ; 2310: 31A2
        call            sub_27b6    ; 2311: 27B6

        movlp           0x22        ; 2312: 31A2
        call            sub_27bf    ; 2313: 27BF

        movlp           0x22        ; 2314: 31A2
        call            sub_27da    ; 2315: 27DA

        movlp           0x30        ; 2316: 31B0
        call            sub_302e    ; 2317: 202E

        movlp           0x22        ; 2318: 31A2
        movlw           0x3c        ; 2319: 303C
        movlp           0x06        ; 231A: 3186
        call            sub_0644    ; 231B: 2644

        movlb           0x03        ; 231C: 0023
        clrf            mem_1ce     ; 231D: 01CE
        clrf            mem_1c9     ; 231E: 01C9
        incf            mem_1c9, f  ; 231F: 0AC9
        return                      ; 2320: 0008

label_2321
; jump here from: 0345
        movlb           0x02        ; 2321: 0022
        movf            mem_148, W  ; 2322: 0848
        btfsc           STATUS, Z   ; 2323: 1903
        return                      ; 2324: 0008
        clrf            mem_48      ; 2325: 01C8
        goto            label_240d  ; 2326: 2C0D

        movf            mem_52, W   ; 2327: 0852
        movlb           0x00        ; 2328: 0020
        movwf           mem_28      ; 2329: 00A8
        clrf            mem_29      ; 232A: 01A9
        movlb           0x01        ; 232B: 0021
        movf            mem_a4, W   ; 232C: 0824
        movlb           0x00        ; 232D: 0020
        addwf           mem_28, f   ; 232E: 07A8
        movlb           0x01        ; 232F: 0021
        movf            mem_a5, W   ; 2330: 0825
        movlb           0x00        ; 2331: 0020
        addwfc          mem_29, f   ; 2332: 3DA9
        movlb           0x01        ; 2333: 0021
        movf            mem_d3, W   ; 2334: 0853
        xorlw           0xf1        ; 2335: 3AF1
        movlw           0x01        ; 2336: 3001
        btfss           STATUS, Z   ; 2337: 1D03
        goto            loop_233b   ; 2338: 2B3B

        movlb           0x00        ; 2339: 0020
        addwf           mem_29, f   ; 233A: 07A9

loop_233b
; jump here from: 2338
        movlb           0x00        ; 233B: 0020
        subwf           mem_29, W   ; 233C: 0229
        movlw           0xa4        ; 233D: 30A4
        btfsc           STATUS, Z   ; 233E: 1903
        subwf           mem_28, W   ; 233F: 0228
        btfss           STATUS, C   ; 2340: 1C03
        goto            loop_2346   ; 2341: 2B46

        movlw           0x5c        ; 2342: 305C
        addwf           mem_28, f   ; 2343: 07A8
        movlw           0xfe        ; 2344: 30FE
        addwfc          mem_29, f   ; 2345: 3DA9

loop_2346
; jump here from: 2341
        movlw           0x2a        ; 2346: 302A
        movwf           mem_4f      ; 2347: 00CF
        clrf            mem_50      ; 2348: 01D0
        movf            mem_29, W   ; 2349: 0829
        movwf           mem_52      ; 234A: 00D2
        movf            mem_28, W   ; 234B: 0828
        movwf           mem_51      ; 234C: 00D1
        call            sub_2479    ; 234D: 2479

        movlp           0x22        ; 234E: 31A2
        movf            mem_50, W   ; 234F: 0850
        movlb           0x03        ; 2350: 0023
        movwf           mem_1bf     ; 2351: 00BF
        movlb           0x00        ; 2352: 0020
        movf            mem_4f, W   ; 2353: 084F
        movlb           0x03        ; 2354: 0023
        movwf           mem_1be     ; 2355: 00BE
        movlw           0x79        ; 2356: 3079
        addwf           mem_1be, f  ; 2357: 07BE
        btfsc           STATUS, C   ; 2358: 1803
        incf            mem_1bf, f  ; 2359: 0ABF
        movf            mem_1be, W  ; 235A: 083E
        movlb           0x00        ; 235B: 0020
        movwf           mem_46      ; 235C: 00C6
        movlw           0x2a        ; 235D: 302A
        movwf           mem_4f      ; 235E: 00CF
        clrf            mem_50      ; 235F: 01D0
        movf            mem_29, W   ; 2360: 0829
        movwf           mem_52      ; 2361: 00D2
        movf            mem_28, W   ; 2362: 0828
        movwf           mem_51      ; 2363: 00D1
        call            sub_249e    ; 2364: 249E

        movlp           0x22        ; 2365: 31A2
        movf            mem_50, W   ; 2366: 0850
        movlb           0x03        ; 2367: 0023
        movwf           mem_1bf     ; 2368: 00BF
        movlb           0x00        ; 2369: 0020
        movf            mem_4f, W   ; 236A: 084F
        movlb           0x03        ; 236B: 0023
        movwf           mem_1be     ; 236C: 00BE
        movlw           0x06        ; 236D: 3006
        movlb           0x00        ; 236E: 0020
        movwf           mem_4f      ; 236F: 00CF
        clrf            mem_50      ; 2370: 01D0
        movlb           0x03        ; 2371: 0023
        movf            mem_1bf, W  ; 2372: 083F
        movlb           0x00        ; 2373: 0020
        movwf           mem_52      ; 2374: 00D2
        movlb           0x03        ; 2375: 0023
        movf            mem_1be, W  ; 2376: 083E
        movlb           0x00        ; 2377: 0020
        movwf           mem_51      ; 2378: 00D1
        call            sub_2464    ; 2379: 2464

        movlp           0x22        ; 237A: 31A2
        movf            mem_50, W   ; 237B: 0850
        movlb           0x03        ; 237C: 0023
        movwf           mem_1bf     ; 237D: 00BF
        movlb           0x00        ; 237E: 0020
        movf            mem_4f, W   ; 237F: 084F
        movlb           0x03        ; 2380: 0023
        movwf           mem_1be     ; 2381: 00BE
        movlb           0x00        ; 2382: 0020
        movwf           mem_45      ; 2383: 00C5
        movlw           0x04        ; 2384: 3004
        movwf           mem_47      ; 2385: 00C7

label_2386
; jump here from: 2398
        movlw           0x0a        ; 2386: 300A
        subwf           mem_47, W   ; 2387: 0247
        btfsc           STATUS, C   ; 2388: 1803
        goto            loop_2399   ; 2389: 2B99

        movf            mem_47, W   ; 238A: 0847
        addlw           0xa0        ; 238B: 3EA0
        movwf           FSR1L       ; 238C: 0086
        movlw           0x01        ; 238D: 3001
        movwf           FSR1H       ; 238E: 0087
        movf            mem_45, W   ; 238F: 0845
        movwf           mem_52      ; 2390: 00D2
        movf            mem_46, W   ; 2391: 0846
        movlp           0x0d        ; 2392: 318D
        call            I2CRead    ; 2393: 25FD

        movlp           0x22        ; 2394: 31A2
        movwf           INDF1       ; 2395: 0081
        incf            mem_45, f   ; 2396: 0AC5
        incf            mem_47, f   ; 2397: 0AC7
        goto            label_2386  ; 2398: 2B86

loop_2399
; jump here from: 2389
        movlb           0x02        ; 2399: 0022
        clrf            mem_16f     ; 239A: 01EF
        call            enable_tx_serial2    ; 239B: 245E

        return                      ; 239D: 0008
		
		
        clrf            mem_153     ; 239C: 01D3
        movlb           0x00        ; 239E: 0020
        clrf            mem_47      ; 239F: 01C7

label_23a0
; jump here from: 23B7
        movlw           0x0a        ; 23A0: 300A
        incf            mem_47, f   ; 23A1: 0AC7
        subwf           mem_47, W   ; 23A2: 0247
        btfsc           STATUS, C   ; 23A3: 1803
        goto            loop_23b8   ; 23A4: 2BB8

        movf            mem_47, W   ; 23A5: 0847
        addlw           0xa0        ; 23A6: 3EA0
        movwf           FSR1L       ; 23A7: 0086
        movlw           0x01        ; 23A8: 3001
        movwf           FSR1H       ; 23A9: 0087
        movlb           0x02        ; 23AA: 0022
        movf            mem_16a, W  ; 23AB: 086A
        movlb           0x00        ; 23AC: 0020
        movwf           mem_52      ; 23AD: 00D2
        movlb           0x02        ; 23AE: 0022
        movf            mem_16b, W  ; 23AF: 086B
        movlp           0x0d        ; 23B0: 318D
        call            I2CRead    ; 23B1: 25FD

        movlp           0x22        ; 23B2: 31A2
        movwf           INDF1       ; 23B3: 0081
        movlb           0x02        ; 23B4: 0022
        incf            mem_16a, f  ; 23B5: 0AEA
        movlb           0x00        ; 23B6: 0020
        goto            label_23a0  ; 23B7: 2BA0

loop_23b8
; jump here from: 23A4
        movlb           0x02        ; 23B8: 0022
        clrf            mem_16f     ; 23B9: 01EF
        incf            mem_16f, f  ; 23BA: 0AEF

label_23bb
; jump here from: 23D7
        goto            enable_tx_serial2    ; 23BB: 2C5E

        movf            mem_b8, W   ; 23BC: 0838
        call            sub_2740    ; 23BD: 2740

        movlw           0x87        ; 23BE: 3087
        movlp           0x0d        ; 23BF: 318D
        call            I2CRead    ; 23C0: 25FD

        movlp           0x22        ; 23C1: 31A2
        movlb           0x03        ; 23C2: 0023
        movwf           serial_output7     ; 23C3: 00A7
        call            sub_2751    ; 23C4: 2751

        movlw           0x87        ; 23C5: 3087
        movlp           0x0d        ; 23C6: 318D
        call            I2CRead    ; 23C7: 25FD

        movlp           0x22        ; 23C8: 31A2
        movlb           0x03        ; 23C9: 0023
        movwf           serial_output8     ; 23CA: 00A8
        call            sub_2751    ; 23CB: 2751

        movlw           0x87        ; 23CC: 3087

label_23cd
; jump here from: 23EA
; jump here from: 240C
        movlp           0x0d        ; 23CD: 318D
        call            I2CRead    ; 23CE: 25FD

        movlp           0x22        ; 23CF: 31A2
        movlb           0x03        ; 23D0: 0023
        movwf           serial_output9     ; 23D1: 00A9
        movlw           0x03        ; 23D2: 3003
        movlb           0x02        ; 23D3: 0022
        movwf           mem_16f     ; 23D4: 00EF
        movlb           0x01        ; 23D5: 0021
        clrf            mem_d3      ; 23D6: 01D3
        goto            label_23bb  ; 23D7: 2BBB

        movf            mem_e9, W   ; 23D8: 0869
        call            sub_2740    ; 23D9: 2740

        movlw           0x83        ; 23DA: 3083
        movlp           0x0d        ; 23DB: 318D
        call            I2CRead    ; 23DC: 25FD

        movlp           0x22        ; 23DD: 31A2
        movlb           0x03        ; 23DE: 0023
        movwf           serial_output7     ; 23DF: 00A7
        call            sub_2751    ; 23E0: 2751

        movlw           0x83        ; 23E1: 3083
        movlp           0x0d        ; 23E2: 318D
        call            I2CRead    ; 23E3: 25FD

        movlp           0x22        ; 23E4: 31A2
        movlb           0x03        ; 23E5: 0023
        movwf           serial_output8     ; 23E6: 00A8
        call            sub_2751    ; 23E7: 2751

        movlp           0x22        ; 23E8: 31A2
        movlw           0x83        ; 23E9: 3083
        goto            label_23cd  ; 23EA: 2BCD

        movf            mem_1c9, W  ; 23EB: 0849
        addwf           mem_1d2, W  ; 23EC: 0752
        movlb           0x00        ; 23ED: 0020
        movwf           mem_47      ; 23EE: 00C7
        movlw           0x18        ; 23EF: 3018
        subwf           mem_47, W   ; 23F0: 0247
        btfss           STATUS, C   ; 23F1: 1C03
        goto            loop_23f5   ; 23F2: 2BF5

        movlw           0xe8        ; 23F3: 30E8
        addwf           mem_47, f   ; 23F4: 07C7

loop_23f5
; jump here from: 23F2
        movf            mem_47, W   ; 23F5: 0847
        addwf           mem_47, W   ; 23F6: 0747
        addwf           mem_47, W   ; 23F7: 0747
        movlb           0x01        ; 23F8: 0021
        movwf           mem_ef      ; 23F9: 00EF
        movlb           0x00        ; 23FA: 0020
        movwf           mem_52      ; 23FB: 00D2
        movlw           0x86        ; 23FC: 3086
        movlp           0x0d        ; 23FD: 318D
        call            I2CRead    ; 23FE: 25FD

        movlp           0x22        ; 23FF: 31A2
        movlb           0x03        ; 2400: 0023
        movwf           serial_output7     ; 2401: 00A7
        call            sub_2751    ; 2402: 2751

        movlw           0x86        ; 2403: 3086
        movlp           0x0d        ; 2404: 318D
        call            I2CRead    ; 2405: 25FD

        movlp           0x22        ; 2406: 31A2
        movlb           0x03        ; 2407: 0023
        movwf           serial_output8     ; 2408: 00A8
        call            sub_2751    ; 2409: 2751

        movlp           0x22        ; 240A: 31A2
        movlw           0x86        ; 240B: 3086
        goto            label_23cd  ; 240C: 2BCD

label_240d
; jump here from: 2326
        movlb           0x01        ; 240D: 0021
        movf            mem_d3, W   ; 240E: 0853
        xorlw           0x03        ; 240F: 3A03
        btfsc           STATUS, Z   ; 2410: 1903
        goto            loop_279e   ; 2411: 2B9E

        xorlw           0x06        ; 2412: 3A06
        btfsc           STATUS, Z   ; 2413: 1903
        goto            loop_27bc   ; 2414: 2BBC

        xorlw           0x03        ; 2415: 3A03
        btfsc           STATUS, Z   ; 2416: 1903
        goto            loop_27d8   ; 2417: 2BD8

        xorlw           0x01        ; 2418: 3A01
        btfsc           STATUS, Z   ; 2419: 1903
        goto            loop_27eb   ; 241A: 2BEB

        xorlw           0xf7        ; 241B: 3AF7
        btfsc           STATUS, Z   ; 241C: 1903
        goto            loop_2727   ; 241D: 2B27

        xorlw           0x01        ; 241E: 3A01
        btfsc           STATUS, Z   ; 241F: 1903
        goto            loop_2727   ; 2420: 2B27
        goto            label_242d  ; 2421: 2C2D
;
; end of label_240d
;------------------------------------------------------------


label_2422
; jump here from: 2F24
        movlb           0x00        ; 2422: 0020
        movf            mem_3b, W   ; 2423: 083B
        movwf           FSR0L       ; 2424: 0084
        movlw           0x25        ; 2425: 3025
        subwf           FSR0L, W    ; 2426: 0204
        btfsc           STATUS, C   ; 2427: 1803
        return                      ; 2428: 0008
		
        movlp           0x03        ; 2429: 3183
        lslf            FSR0L, W    ; 242A: 3504
        addlw           0x00        ; 242B: 3E00
        movwf           PCL         ; 242C: 0082

label_242d
; jump here from: 2421
        return                      ; 242D: 0008

;------------------------------------------------------------
; Subroutine: sub_242e
;
; called from: 0870
; called from: 0A86
; called from: 2301

sub_242e
        movlb           0x02        ; 242E: 0022
        clrf            mem_13d     ; 242F: 01BD
        clrf            mem_13e     ; 2430: 01BE
        clrf            mem_13c     ; 2431: 01BC
        clrf            mem_13b     ; 2432: 01BB
        return                      ; 2433: 0008

;------------------------------------------------------------
; Subroutine: sub_2434
;
; called from: 0AB4
; called from: 2303

sub_2434
        movlb           0x02        ; 2434: 0022
        clrf            mem_15d     ; 2435: 01DD
        clrf            mem_15e     ; 2436: 01DE
        clrf            mem_15c     ; 2437: 01DC
        return                      ; 2438: 0008

;------------------------------------------------------------
; Subroutine: sub_2439
;
; called from: 2305

sub_2439
; jump here from: 1B59
        movlb           0x01        ; 2439: 0021
        clrf            mem_dd      ; 243A: 01DD
        clrf            mem_de      ; 243B: 01DE
        clrf            mem_dc      ; 243C: 01DC
        return                      ; 243D: 0008

;------------------------------------------------------------
; Subroutine: sub_243e
;
; called from: 1AB0
; called from: 2307

sub_243e
        movlb           0x02        ; 243E: 0022
        clrf            mem_163     ; 243F: 01E3
        clrf            mem_164     ; 2440: 01E4
        clrf            mem_162     ; 2441: 01E2
        return                      ; 2442: 0008

;------------------------------------------------------------
; Subroutine: sub_2443
;
; called from: 1FC0
; called from: 2309

sub_2443
        movlb           0x02        ; 2443: 0022
        clrf            mem_160     ; 2444: 01E0
        clrf            mem_161     ; 2445: 01E1
        clrf            mem_15f     ; 2446: 01DF
        return                      ; 2447: 0008

;------------------------------------------------------------
; Subroutine: sub_2448
;
; called from: 230B
; called from: 34FF

sub_2448
        movlb           0x02        ; 2448: 0022
        clrf            mem_15a     ; 2449: 01DA
        clrf            mem_15b     ; 244A: 01DB
        clrf            mem_159     ; 244B: 01D9
        return                      ; 244C: 0008

;------------------------------------------------------------
; Subroutine: sub_244d
;
; called from: 2F3A

sub_244d
        movlw           0xc0        ; 244D: 30C0
        movlb           0x02        ; 244E: 0022
        movwf           mem_14b     ; 244F: 00CB
        movlb           0x01        ; 2450: 0021
        decfsz          mem_bc, W   ; 2451: 0B3C
        goto            loop_245b   ; 2452: 2C5B

        movlb           0x00        ; 2453: 0020
        movf            mem_45, W   ; 2454: 0845
        addlw           0xd9        ; 2455: 3ED9
        movlp           0x02        ; 2456: 3182
        callw                       ; 2457: 000A

        movlb           0x02        ; 2458: 0022
        movwf           mem_157     ; 2459: 00D7
        return                      ; 245A: 0008

loop_245b
; jump here from: 2452
        movlb           0x02        ; 245B: 0022
        clrf            mem_157     ; 245C: 01D7
        return                      ; 245D: 0008

;------------------------------------------------------------
; Subroutine: enable_tx_serial2
;
; called from: 239B

enable_tx_serial2
; jump here from: 23BB
        movlb           0x03        ; 245E: 0023
        bcf             RCSTA, CREN ; 245F: 121D
        bsf             TXSTA, TXEN ; 2460: 169E
        movlb           0x01        ; 2461: 0021
        bsf             PIE1, TXIE  ; 2462: 1611
        return                      ; 2463: 0008

;------------------------------------------------------------
; Subroutine: sub_2464
;
; called from: 136A
; called from: 1373
; called from: 137C
; called from: 13BE
; called from: 13C7
; called from: 13D0
; called from: 2379

sub_2464
        clrf            mem_53      ; 2464: 01D3
        clrf            mem_54      ; 2465: 01D4

loop_2466
; jump here from: 2473
        btfss           mem_4f, 0   ; 2466: 1C4F
        goto            loop_246c   ; 2467: 2C6C

        movf            mem_51, W   ; 2468: 0851
        addwf           mem_53, f   ; 2469: 07D3
        movf            mem_52, W   ; 246A: 0852
        addwfc          mem_54, f   ; 246B: 3DD4

loop_246c
; jump here from: 2467
        lslf            mem_51, f   ; 246C: 35D1
        rlf             mem_52, f   ; 246D: 0DD2
        lsrf            mem_50, f   ; 246E: 36D0
        rrf             mem_4f, f   ; 246F: 0CCF
        movf            mem_50, W   ; 2470: 0850
        iorwf           mem_4f, W   ; 2471: 044F
        btfss           STATUS, Z   ; 2472: 1D03
        goto            loop_2466   ; 2473: 2C66

        movf            mem_54, W   ; 2474: 0854
        movwf           mem_50      ; 2475: 00D0
        movf            mem_53, W   ; 2476: 0853
        movwf           mem_4f      ; 2477: 00CF
        return                      ; 2478: 0008

;------------------------------------------------------------
; Subroutine: sub_2479
;
; called from: 234D
; called from: 2568
; called from: 257D
; called from: 258D
; called from: 2BF8
; called from: 2D43
; called from: 32F9
; called from: 350E

sub_2479
        clrf            mem_53      ; 2479: 01D3
        clrf            mem_54      ; 247A: 01D4
        movf            mem_50, W   ; 247B: 0850
        iorwf           mem_4f, W   ; 247C: 044F
        btfsc           STATUS, Z   ; 247D: 1903
        goto            loop_2499   ; 247E: 2C99

        clrf            mem_55      ; 247F: 01D5

label_2480
; jump here from: 2485
        incf            mem_55, f   ; 2480: 0AD5
        btfsc           mem_50, 7   ; 2481: 1BD0
        goto            loop_2486   ; 2482: 2C86

        lslf            mem_4f, f   ; 2483: 35CF
        rlf             mem_50, f   ; 2484: 0DD0
        goto            label_2480  ; 2485: 2C80

loop_2486
; jump here from: 2482
; jump here from: 2498
        lslf            mem_53, f   ; 2486: 35D3
        rlf             mem_54, f   ; 2487: 0DD4
        movf            mem_50, W   ; 2488: 0850
        subwf           mem_52, W   ; 2489: 0252
        btfss           STATUS, Z   ; 248A: 1D03
        goto            loop_248e   ; 248B: 2C8E

        movf            mem_4f, W   ; 248C: 084F
        subwf           mem_51, W   ; 248D: 0251

loop_248e
; jump here from: 248B
        btfss           STATUS, C   ; 248E: 1C03
        goto            loop_2495   ; 248F: 2C95

        movf            mem_4f, W   ; 2490: 084F
        subwf           mem_51, f   ; 2491: 02D1
        movf            mem_50, W   ; 2492: 0850
        subwfb          mem_52, f   ; 2493: 3BD2
        bsf             mem_53, 0   ; 2494: 1453

loop_2495
; jump here from: 248F
        lsrf            mem_50, f   ; 2495: 36D0
        rrf             mem_4f, f   ; 2496: 0CCF
        decfsz          mem_55, f   ; 2497: 0BD5
        goto            loop_2486   ; 2498: 2C86

loop_2499
; jump here from: 247E
        movf            mem_54, W   ; 2499: 0854
        movwf           mem_50      ; 249A: 00D0
        movf            mem_53, W   ; 249B: 0853
        movwf           mem_4f      ; 249C: 00CF
        return                      ; 249D: 0008

;------------------------------------------------------------
; Subroutine: sub_249e
;
; called from: 2364
; called from: 2574
; called from: 2584
; called from: 2594
; called from: 2BE9
; called from: 2D58
; called from: 330E
; called from: 3523

sub_249e
        movf            mem_50, W   ; 249E: 0850
        iorwf           mem_4f, W   ; 249F: 044F
        btfsc           STATUS, Z   ; 24A0: 1903
        goto            loop_24b9   ; 24A1: 2CB9

        clrf            mem_53      ; 24A2: 01D3

label_24a3
; jump here from: 24A8
        incf            mem_53, f   ; 24A3: 0AD3
        btfsc           mem_50, 7   ; 24A4: 1BD0
        goto            loop_24a9   ; 24A5: 2CA9

        lslf            mem_4f, f   ; 24A6: 35CF
        rlf             mem_50, f   ; 24A7: 0DD0
        goto            label_24a3  ; 24A8: 2CA3

loop_24a9
; jump here from: 24A5
; jump here from: 24B8
        movf            mem_50, W   ; 24A9: 0850
        subwf           mem_52, W   ; 24AA: 0252
        btfss           STATUS, Z   ; 24AB: 1D03
        goto            loop_24af   ; 24AC: 2CAF

        movf            mem_4f, W   ; 24AD: 084F
        subwf           mem_51, W   ; 24AE: 0251

loop_24af
; jump here from: 24AC
        btfss           STATUS, C   ; 24AF: 1C03
        goto            loop_24b5   ; 24B0: 2CB5

        movf            mem_4f, W   ; 24B1: 084F
        subwf           mem_51, f   ; 24B2: 02D1
        movf            mem_50, W   ; 24B3: 0850
        subwfb          mem_52, f   ; 24B4: 3BD2

loop_24b5
; jump here from: 24B0
        lsrf            mem_50, f   ; 24B5: 36D0
        rrf             mem_4f, f   ; 24B6: 0CCF
        decfsz          mem_53, f   ; 24B7: 0BD3
        goto            loop_24a9   ; 24B8: 2CA9

loop_24b9
; jump here from: 24A1
        movf            mem_52, W   ; 24B9: 0852
        movwf           mem_50      ; 24BA: 00D0
        movf            mem_51, W   ; 24BB: 0851
        movwf           mem_4f      ; 24BC: 00CF
        return                      ; 24BD: 0008

;------------------------------------------------------------
; Subroutine: sub_24be
;
; called from: 2F35

sub_24be
        movlb           0x01        ; 24BE: 0021
        decfsz          mem_bc, W   ; 24BF: 0B3C
        goto            loop_24c5   ; 24C0: 2CC5

        movlb           0x00        ; 24C1: 0020
        movf            mem_45, W   ; 24C2: 0845
        movlp           0x1d        ; 24C3: 319D
        goto            sub_1d1e    ; 24C4: 2D1E

loop_24c5
; jump here from: 24C0
        movlw           0xf0        ; 24C5: 30F0
        movlb           0x02        ; 24C6: 0022
        andwf           mem_14a, f  ; 24C7: 05CA
        movlw           0x0f        ; 24C8: 300F
        andwf           mem_149, f  ; 24C9: 05C9
        return                      ; 24CA: 0008

;------------------------------------------------------------
; Subroutine: sub_24cb
;
; called from: 2F30

sub_24cb
        movlb           0x01        ; 24CB: 0021
        decf            mem_bc, W   ; 24CC: 033C
        btfsc           STATUS, Z   ; 24CD: 1903
        goto            loop_24d1   ; 24CE: 2CD1

        decfsz          mem_c4, W   ; 24CF: 0B44
        goto            loop_251b   ; 24D0: 2D1B

loop_24d1
; jump here from: 24CE
        movlb           0x00        ; 24D1: 0020
        movf            mem_29, W   ; 24D2: 0829
        movwf           mem_23      ; 24D3: 00A3
        movf            mem_28, W   ; 24D4: 0828
        movwf           mem_22      ; 24D5: 00A2
        call            sub_25ab    ; 24D6: 25AB

        movlp           0x22        ; 24D7: 31A2
        movlb           0x00        ; 24D8: 0020
        movf            mem_25, W   ; 24D9: 0825
        movlb           0x02        ; 24DA: 0022
        movwf           mem_129     ; 24DB: 00A9
        movlw           0x0f        ; 24DC: 300F
        andwf           mem_129, f  ; 24DD: 05A9
        movlb           0x00        ; 24DE: 0020
        swapf           mem_24, W   ; 24DF: 0E24
        andlw           0x0f        ; 24E0: 390F
        movwf           mem_31      ; 24E1: 00B1
        movf            mem_24, W   ; 24E2: 0824
        movwf           mem_30      ; 24E3: 00B0
        movlw           0x0f        ; 24E4: 300F
        andwf           mem_30, f   ; 24E5: 05B0
        swapf           mem_27, W   ; 24E6: 0E27
        andlw           0x0f        ; 24E7: 390F
        movwf           mem_2f      ; 24E8: 00AF
        movf            mem_27, W   ; 24E9: 0827
        movwf           mem_2e      ; 24EA: 00AE
        movlw           0x0f        ; 24EB: 300F
        andwf           mem_2e, f   ; 24EC: 05AE
        movlb           0x02        ; 24ED: 0022
        movf            mem_129, f  ; 24EE: 08A9
        btfss           STATUS, Z   ; 24EF: 1D03
        goto            loop_24fa   ; 24F0: 2CFA

        movlb           0x01        ; 24F1: 0021
        bcf             mem_bb, 4   ; 24F2: 123B
        movlb           0x00        ; 24F3: 0020
        movf            mem_31, f   ; 24F4: 08B1
        btfss           STATUS, Z   ; 24F5: 1D03
        goto            loop_24fc   ; 24F6: 2CFC

        movlw           0x10        ; 24F7: 3010
        movwf           mem_31      ; 24F8: 00B1
        goto            loop_24fc   ; 24F9: 2CFC

loop_24fa
; jump here from: 24F0
        movlb           0x01        ; 24FA: 0021
        bsf             mem_bb, 4   ; 24FB: 163B

loop_24fc
; jump here from: 24F6
; jump here from: 24F9
        movlb           0x00        ; 24FC: 0020
        movf            mem_31, W   ; 24FD: 0831
        addlw           0xd8        ; 24FE: 3ED8
        movlp           0x02        ; 24FF: 3182
        callw                       ; 2500: 000A

        movlb           0x02        ; 2501: 0022
        movwf           mem_14f     ; 2502: 00CF
        movlb           0x00        ; 2503: 0020
        movf            mem_30, W   ; 2504: 0830
        addlw           0xd8        ; 2505: 3ED8
        movlp           0x02        ; 2506: 3182
        callw                       ; 2507: 000A

        movlb           0x02        ; 2508: 0022
        movwf           mem_150     ; 2509: 00D0
        movlb           0x00        ; 250A: 0020
        movf            mem_2f, W   ; 250B: 082F
        addlw           0xd8        ; 250C: 3ED8
        movlp           0x02        ; 250D: 3182
        callw                       ; 250E: 000A

        movlb           0x02        ; 250F: 0022
        movwf           mem_151     ; 2510: 00D1
        movlb           0x00        ; 2511: 0020
        movf            mem_2e, W   ; 2512: 082E
        addlw           0xd8        ; 2513: 3ED8
        movlp           0x02        ; 2514: 3182
        callw                       ; 2515: 000A

        movlp           0x25        ; 2516: 31A5
        movlb           0x02        ; 2517: 0022
        movwf           mem_152     ; 2518: 00D2
        movlp           0x25        ; 2519: 31A5
        goto            label_251f  ; 251A: 2D1F

loop_251b
; jump here from: 24D0
        movlp           0x27        ; 251B: 31A7
        call            sub_27a7    ; 251C: 27A7

        movlb           0x01        ; 251D: 0021
        bcf             mem_bb, 4   ; 251E: 123B

label_251f
; jump here from: 251A
        movlb           0x02        ; 251F: 0022
        bsf             mem_14c, 1  ; 2520: 14CC
        return                      ; 2521: 0008

;------------------------------------------------------------
; Subroutine: sub_2522
;
; called from: 2F8F

sub_2522
        movlb           0x02        ; 2522: 0022
        bsf             mem_14e, 5  ; 2523: 16CE
        bsf             mem_14e, 0  ; 2524: 144E
        bsf             mem_14e, 2  ; 2525: 154E
        movlb           0x01        ; 2526: 0021
        bsf             mem_bb, 0   ; 2527: 143B
        decf            mem_bc, W   ; 2528: 033C
        btfsc           STATUS, Z   ; 2529: 1903
        goto            loop_252e   ; 252A: 2D2E

        movf            mem_c4, W   ; 252B: 0844
        btfsc           STATUS, Z   ; 252C: 1903
        goto            loop_254a   ; 252D: 2D4A

loop_252e
; jump here from: 252A
        movlb           0x00        ; 252E: 0020
        movf            mem_45, W   ; 252F: 0845
        movwf           mem_56      ; 2530: 00D6
        clrf            mem_57      ; 2531: 01D7
        call            sub_2560    ; 2532: 2560

        movf            mem_30, W   ; 2533: 0830
        addlw           0xd8        ; 2534: 3ED8
        movlp           0x02        ; 2535: 3182
        callw                       ; 2536: 000A

        movlb           0x02        ; 2537: 0022
        movwf           mem_154     ; 2538: 00D4
        movlb           0x00        ; 2539: 0020
        movf            mem_2f, W   ; 253A: 082F
        addlw           0xd8        ; 253B: 3ED8
        movlp           0x02        ; 253C: 3182
        callw                       ; 253D: 000A

        movlb           0x02        ; 253E: 0022
        movwf           mem_155     ; 253F: 00D5
        movlb           0x00        ; 2540: 0020
        movf            mem_2e, W   ; 2541: 082E
        addlw           0xd8        ; 2542: 3ED8
        movlp           0x02        ; 2543: 3182
        callw                       ; 2544: 000A

        movlb           0x02        ; 2545: 0022
        movwf           mem_156     ; 2546: 00D6
        movlb           0x01        ; 2547: 0021
        bsf             mem_bb, 2   ; 2548: 153B
        return                      ; 2549: 0008

loop_254a
; jump here from: 252D
        movlb           0x02        ; 254A: 0022
        goto            label_277e  ; 254B: 2F7E

;------------------------------------------------------------
; Subroutine: sub_254c
;
; called from: 2F2B

sub_254c
        movlb           0x01        ; 254C: 0021
        decf            mem_bc, W   ; 254D: 033C
        btfsc           STATUS, Z   ; 254E: 1903
        goto            loop_2552   ; 254F: 2D52

        decfsz          mem_c4, W   ; 2550: 0B44
        goto            loop_2554   ; 2551: 2D54

loop_2552
; jump here from: 254F
        movlp           0x32        ; 2552: 31B2
        goto            label_32a4  ; 2553: 2AA4

loop_2554
; jump here from: 2551
        movlp           0x3f        ; 2554: 31BF
        goto            label_3f41  ; 2555: 2F41

;------------------------------------------------------------
; Subroutine: sub_2556
;
; called from: 2F7B

sub_2556
        movlw           0xd9        ; 2556: 30D9
        movlp           0x02        ; 2557: 3182
        callw                       ; 2558: 000A

        movlb           0x02        ; 2559: 0022
        movwf           mem_157     ; 255A: 00D7

label_255b
; jump here from: 2708
; jump here from: 270F
; jump here from: 2716
        movlp           0x07        ; 255B: 3187
        goto            label_0756  ; 255C: 2F56

;------------------------------------------------------------
; Subroutine: sub_255d
;
; called from: 2F44

sub_255d
        call            sub_2611    ; 255D: 2611

label_255e
; jump here from: 272B
        movlp           0x29        ; 255E: 31A9
        goto            label_294c  ; 255F: 294C

;------------------------------------------------------------
; Subroutine: sub_2560
;
; called from: 076B
; called from: 2532
; called from: 265E

sub_2560
        movlw           0xe8        ; 2560: 30E8
        movwf           mem_4f      ; 2561: 00CF
        movlw           0x03        ; 2562: 3003
        movwf           mem_50      ; 2563: 00D0
        movf            mem_57, W   ; 2564: 0857
        movwf           mem_52      ; 2565: 00D2
        movf            mem_56, W   ; 2566: 0856
        movwf           mem_51      ; 2567: 00D1
        call            sub_2479    ; 2568: 2479

        movlp           0x22        ; 2569: 31A2
        movf            mem_4f, W   ; 256A: 084F
        movwf           mem_31      ; 256B: 00B1
        movlw           0xe8        ; 256C: 30E8
        movwf           mem_4f      ; 256D: 00CF
        movlw           0x03        ; 256E: 3003
        movwf           mem_50      ; 256F: 00D0
        movf            mem_57, W   ; 2570: 0857
        movwf           mem_52      ; 2571: 00D2
        movf            mem_56, W   ; 2572: 0856
        movwf           mem_51      ; 2573: 00D1
        call            sub_249e    ; 2574: 249E

        movlp           0x22        ; 2575: 31A2
        movf            mem_50, W   ; 2576: 0850
        movwf           mem_59      ; 2577: 00D9
        movf            mem_4f, W   ; 2578: 084F
        movwf           mem_58      ; 2579: 00D8
        movlw           0x64        ; 257A: 3064
        call            sub_2799    ; 257B: 2799

        movlp           0x22        ; 257C: 31A2
        call            sub_2479    ; 257D: 2479

        movlp           0x22        ; 257E: 31A2
        movf            mem_4f, W   ; 257F: 084F
        movwf           mem_30      ; 2580: 00B0
        movlw           0x64        ; 2581: 3064
        call            sub_2784    ; 2582: 2784

        movlp           0x22        ; 2583: 31A2
        call            sub_249e    ; 2584: 249E

        movlp           0x22        ; 2585: 31A2
        movf            mem_50, W   ; 2586: 0850
        movwf           mem_59      ; 2587: 00D9
        movf            mem_4f, W   ; 2588: 084F
        movwf           mem_58      ; 2589: 00D8
        movlw           0x0a        ; 258A: 300A
        call            sub_2799    ; 258B: 2799

        movlp           0x22        ; 258C: 31A2
        call            sub_2479    ; 258D: 2479

        movlp           0x22        ; 258E: 31A2
        movf            mem_4f, W   ; 258F: 084F
        movwf           mem_2f      ; 2590: 00AF
        movlw           0x0a        ; 2591: 300A
        call            sub_2784    ; 2592: 2784

        movlp           0x22        ; 2593: 31A2
        call            sub_249e    ; 2594: 249E

        movf            mem_4f, W   ; 2595: 084F
        movwf           mem_2e      ; 2596: 00AE
        return                      ; 2597: 0008

;------------------------------------------------------------
; Subroutine: sub_2598
;
; called from: 1C29
; called from: 1E45
; called from: 2E23

sub_2598
        movlb           0x00        ; 2598: 0020
        movf            mem_21, W   ; 2599: 0821
        xorwf           mem_23, W   ; 259A: 0623
        movlb           0x01        ; 259B: 0021
        movwf           mem_bf      ; 259C: 00BF
        movlb           0x00        ; 259D: 0020
        btfss           mem_23, 7   ; 259E: 1FA3
        goto            loop_25a7   ; 259F: 2DA7

        movlw           0xff        ; 25A0: 30FF
        xorwf           mem_22, f   ; 25A1: 06A2
        incf            mem_22, f   ; 25A2: 0AA2
        btfsc           STATUS, Z   ; 25A3: 1903
        decf            mem_23, f   ; 25A4: 03A3
        movlw           0xff        ; 25A5: 30FF
        xorwf           mem_23, f   ; 25A6: 06A3

loop_25a7
; jump here from: 259F
        btfss           mem_21, 7   ; 25A7: 1FA1
        return                      ; 25A8: 0008
        movlp           0x2e        ; 25A9: 31AE
        goto            sub_2eb6    ; 25AA: 2EB6

;------------------------------------------------------------
; Subroutine: sub_25ab
;
; called from: 1E6E
; called from: 24D6
; called from: 32AA

sub_25ab
        movlb           0x01        ; 25AB: 0021
        clrf            mem_bf      ; 25AC: 01BF
        movlb           0x00        ; 25AD: 0020
        btfss           mem_23, 7   ; 25AE: 1FA3
        goto            loop_25b5   ; 25AF: 2DB5

        movlb           0x01        ; 25B0: 0021
        bsf             mem_bf, 7   ; 25B1: 17BF
        movlp           0x2e        ; 25B2: 31AE
        call            sub_2e07    ; 25B3: 2607

        movlp           0x22        ; 25B4: 31A2

loop_25b5
; jump here from: 25AF
        movlw           0x10        ; 25B5: 3010
        movlb           0x03        ; 25B6: 0023
        movwf           mem_1c2     ; 25B7: 00C2
        movlb           0x00        ; 25B8: 0020
        clrf            mem_24      ; 25B9: 01A4
        clrf            mem_25      ; 25BA: 01A5
        clrf            mem_27      ; 25BB: 01A7

label_25bc
; jump here from: 2605
        movf            mem_24, W   ; 25BC: 0824
        movwf           mem_4f      ; 25BD: 00CF
        movlw           0x80        ; 25BE: 3080
        andwf           mem_4f, f   ; 25BF: 05CF
        lslf            mem_25, W   ; 25C0: 3525
        movwf           mem_25      ; 25C1: 00A5
        rlf             mem_4f, f   ; 25C2: 0DCF
        clrf            mem_4f      ; 25C3: 01CF
        rlf             mem_4f, f   ; 25C4: 0DCF
        iorwf           mem_4f, W   ; 25C5: 044F
        movwf           mem_25      ; 25C6: 00A5
        movf            mem_27, W   ; 25C7: 0827
        movwf           mem_4f      ; 25C8: 00CF
        movlw           0x80        ; 25C9: 3080
        andwf           mem_4f, f   ; 25CA: 05CF
        lslf            mem_24, f   ; 25CB: 35A4
        rlf             mem_4f, f   ; 25CC: 0DCF
        clrf            mem_4f      ; 25CD: 01CF
        rlf             mem_4f, f   ; 25CE: 0DCF
        movf            mem_4f, W   ; 25CF: 084F
        iorwf           mem_24, f   ; 25D0: 04A4
        movf            mem_23, W   ; 25D1: 0823
        movwf           mem_4f      ; 25D2: 00CF
        movlw           0x80        ; 25D3: 3080
        andwf           mem_4f, f   ; 25D4: 05CF
        lslf            mem_27, W   ; 25D5: 3527
        movwf           mem_27      ; 25D6: 00A7
        rlf             mem_4f, f   ; 25D7: 0DCF
        clrf            mem_4f      ; 25D8: 01CF
        rlf             mem_4f, f   ; 25D9: 0DCF
        iorwf           mem_4f, W   ; 25DA: 044F
        movwf           mem_27      ; 25DB: 00A7
        movf            mem_22, W   ; 25DC: 0822
        movwf           mem_4f      ; 25DD: 00CF
        movlw           0x80        ; 25DE: 3080
        andwf           mem_4f, f   ; 25DF: 05CF
        lslf            mem_23, W   ; 25E0: 3523
        movwf           mem_23      ; 25E1: 00A3
        rlf             mem_4f, f   ; 25E2: 0DCF
        clrf            mem_4f      ; 25E3: 01CF
        rlf             mem_4f, f   ; 25E4: 0DCF
        iorwf           mem_4f, W   ; 25E5: 044F
        movwf           mem_23      ; 25E6: 00A3
        lslf            mem_22, f   ; 25E7: 35A2
        movlb           0x03        ; 25E8: 0023
        decf            mem_1c2, f  ; 25E9: 03C2
        btfsc           STATUS, Z   ; 25EA: 1903
        return                      ; 25EB: 0008
        movlb           0x00        ; 25EC: 0020
        movf            mem_27, W   ; 25ED: 0827
        movlb           0x01        ; 25EE: 0021
        movwf           mem_e0      ; 25EF: 00E0
        call            sub_2606    ; 25F0: 2606

        movlp           0x22        ; 25F1: 31A2
        movf            mem_e0, W   ; 25F2: 0860
        movlb           0x00        ; 25F3: 0020
        movwf           mem_27      ; 25F4: 00A7
        movf            mem_24, W   ; 25F5: 0824
        movlb           0x01        ; 25F6: 0021
        movwf           mem_e0      ; 25F7: 00E0
        call            sub_2606    ; 25F8: 2606

        movlp           0x22        ; 25F9: 31A2
        movf            mem_e0, W   ; 25FA: 0860
        movlb           0x00        ; 25FB: 0020
        movwf           mem_24      ; 25FC: 00A4
        movf            mem_25, W   ; 25FD: 0825
        movlb           0x01        ; 25FE: 0021
        movwf           mem_e0      ; 25FF: 00E0
        call            sub_2606    ; 2600: 2606

        movlp           0x22        ; 2601: 31A2
        movf            mem_e0, W   ; 2602: 0860
        movlb           0x00        ; 2603: 0020
        movwf           mem_25      ; 2604: 00A5
        goto            label_25bc  ; 2605: 2DBC

;------------------------------------------------------------
; Subroutine: sub_2606
;
; called from: 25F0
; called from: 25F8
; called from: 2600

sub_2606
        movf            mem_e0, W   ; 2606: 0860
        addlw           0x03        ; 2607: 3E03
        movwf           mem_df      ; 2608: 00DF
        btfsc           mem_df, 3   ; 2609: 19DF
        movwf           mem_e0      ; 260A: 00E0
        movf            mem_e0, W   ; 260B: 0860
        addlw           0x30        ; 260C: 3E30
        movwf           mem_df      ; 260D: 00DF
        btfsc           mem_df, 7   ; 260E: 1BDF
        movwf           mem_e0      ; 260F: 00E0
        return                      ; 2610: 0008

;------------------------------------------------------------
; Subroutine: sub_2611
;
; called from: 255D
; called from: 2729
; called from: 292D
; called from: 2931
; called from: 2935
; called from: 2939
; called from: 2943

sub_2611
; jump here from: 29AD
        movlb           0x00        ; 2611: 0020
        movf            mem_46, W   ; 2612: 0846
        call            sub_2627    ; 2613: 2627

        movwf           mem_58      ; 2614: 00D8
        swapf           mem_58, W   ; 2615: 0E58
        andlw           0x0f        ; 2616: 390F
        addlw           0xd8        ; 2617: 3ED8
        movlp           0x02        ; 2618: 3182
        callw                       ; 2619: 000A

        movlb           0x02        ; 261A: 0022
        movwf           mem_14f     ; 261B: 00CF
        movlb           0x00        ; 261C: 0020
        movf            mem_58, W   ; 261D: 0858
        andlw           0x0f        ; 261E: 390F
        addlw           0xd8        ; 261F: 3ED8
        movlp           0x02        ; 2620: 3182
        callw                       ; 2621: 000A

        movlb           0x02        ; 2622: 0022
        movwf           mem_150     ; 2623: 00D0
        movlb           0x01        ; 2624: 0021
        bsf             mem_bb, 6   ; 2625: 173B
        return                      ; 2626: 0008

;------------------------------------------------------------
; Subroutine: sub_2627
;
; called from: 0AF7
; called from: 0B0A
; called from: 0B15
; called from: 0B2C
; called from: 0B36
; called from: 107F
; called from: 1097
; called from: 2613
; called from: 26E5
; called from: 2990
; called from: 2B15
; called from: 2B41
; called from: 2C17
; called from: 30F0
; called from: 3194
; called from: 31A4
; called from: 31C7
; called from: 31D7
; called from: 3204
; called from: 3265
; called from: 3282
; called from: 35A0
; called from: 35B4

sub_2627
        movlb           0x00        ; 2627: 0020
        movwf           mem_57      ; 2628: 00D7
        movlw           0x0a        ; 2629: 300A
        movwf           mem_4f      ; 262A: 00CF
        movf            mem_57, W   ; 262B: 0857
        call            sub_2639    ; 262C: 2639

        movwf           mem_56      ; 262D: 00D6
        movlw           0x0a        ; 262E: 300A
        movwf           mem_4f      ; 262F: 00CF
        movf            mem_57, W   ; 2630: 0857
        movlp           0x3f        ; 2631: 31BF
        call            sub_3f9b    ; 2632: 279B

        movwf           mem_55      ; 2633: 00D5
        swapf           mem_56, W   ; 2634: 0E56
        andlw           0xf0        ; 2635: 39F0
        iorwf           mem_55, W   ; 2636: 0455
        movwf           mem_54      ; 2637: 00D4
        return                      ; 2638: 0008

;------------------------------------------------------------
; Subroutine: sub_2639
;
; called from: 262C

sub_2639
        movwf           mem_50      ; 2639: 00D0
        clrf            mem_52      ; 263A: 01D2
        movf            mem_4f, W   ; 263B: 084F
        btfsc           STATUS, Z   ; 263C: 1903
        goto            loop_264f   ; 263D: 2E4F

        clrf            mem_51      ; 263E: 01D1

label_263f
; jump here from: 2643
        incf            mem_51, f   ; 263F: 0AD1
        btfsc           mem_4f, 7   ; 2640: 1BCF
        goto            loop_2644   ; 2641: 2E44

        lslf            mem_4f, f   ; 2642: 35CF
        goto            label_263f  ; 2643: 2E3F

loop_2644
; jump here from: 2641
; jump here from: 264E
        lslf            mem_52, f   ; 2644: 35D2
        movf            mem_4f, W   ; 2645: 084F
        subwf           mem_50, W   ; 2646: 0250
        btfss           STATUS, C   ; 2647: 1C03
        goto            loop_264c   ; 2648: 2E4C

        movf            mem_4f, W   ; 2649: 084F
        subwf           mem_50, f   ; 264A: 02D0
        bsf             mem_52, 0   ; 264B: 1452

loop_264c
; jump here from: 2648
        lsrf            mem_4f, f   ; 264C: 36CF
        decfsz          mem_51, f   ; 264D: 0BD1
        goto            loop_2644   ; 264E: 2E44

loop_264f
; jump here from: 263D
        movf            mem_52, W   ; 264F: 0852
        return                      ; 2650: 0008

;------------------------------------------------------------
; Subroutine: sub_2651
;
; called from: 2F94

sub_2651
        movlb           0x02        ; 2651: 0022
        bsf             mem_149, 0  ; 2652: 1449
        movlb           0x01        ; 2653: 0021
        bsf             mem_bb, 0   ; 2654: 143B
        movlb           0x00        ; 2655: 0020
        movf            mem_29, W   ; 2656: 0829
        movwf           mem_57      ; 2657: 00D7
        movf            mem_28, W   ; 2658: 0828
        movwf           mem_56      ; 2659: 00D6
        lsrf            mem_57, f   ; 265A: 36D7
        rrf             mem_56, f   ; 265B: 0CD6
        lsrf            mem_57, f   ; 265C: 36D7
        rrf             mem_56, f   ; 265D: 0CD6
        call            sub_2560    ; 265E: 2560

        movlp           0x22        ; 265F: 31A2
        movlb           0x01        ; 2660: 0021
        decf            mem_bc, W   ; 2661: 033C
        btfsc           STATUS, Z   ; 2662: 1903
        goto            loop_2667   ; 2663: 2E67

        movf            mem_c4, W   ; 2664: 0844
        btfsc           STATUS, Z   ; 2665: 1903
        goto            loop_26ce   ; 2666: 2ECE

loop_2667
; jump here from: 2663
        movlb           0x00        ; 2667: 0020
        movf            mem_2f, f   ; 2668: 08AF
        btfss           STATUS, Z   ; 2669: 1D03
        goto            loop_266e   ; 266A: 2E6E

        movlb           0x02        ; 266B: 0022
        clrf            mem_153     ; 266C: 01D3
        goto            label_2674  ; 266D: 2E74

loop_266e
; jump here from: 266A
        movf            mem_2f, W   ; 266E: 082F
        addlw           0xd8        ; 266F: 3ED8
        movlp           0x02        ; 2670: 3182
        callw                       ; 2671: 000A

        movlb           0x02        ; 2672: 0022
        movwf           mem_153     ; 2673: 00D3

label_2674
; jump here from: 266D
        movlb           0x00        ; 2674: 0020
        movf            mem_2e, W   ; 2675: 082E
        addlw           0xd8        ; 2676: 3ED8
        movlp           0x02        ; 2677: 3182
        callw                       ; 2678: 000A

        movlp           0x26        ; 2679: 31A6
        movlb           0x02        ; 267A: 0022
        movwf           mem_154     ; 267B: 00D4
        movlp           0x26        ; 267C: 31A6
        goto            label_26ab  ; 267D: 2EAB

label_267e
; jump here from: 27FC
        movlw           0xd8        ; 267E: 30D8
        movlp           0x02        ; 267F: 3182
        callw                       ; 2680: 000A

        movlb           0x02        ; 2681: 0022
        movwf           mem_155     ; 2682: 00D5
        movlw           0xd8        ; 2683: 30D8
        movlp           0x02        ; 2684: 3182
        callw                       ; 2685: 000A

        movlp           0x26        ; 2686: 31A6

label_2687
; jump here from: 2693
; jump here from: 269E
        movlp           0x26        ; 2687: 31A6
        goto            label_26a8  ; 2688: 2EA8

label_2689
; jump here from: 27FD
        movlw           0xda        ; 2689: 30DA
        movlp           0x02        ; 268A: 3182
        callw                       ; 268B: 000A

        movlb           0x02        ; 268C: 0022
        movwf           mem_155     ; 268D: 00D5
        movlw           0xdd        ; 268E: 30DD
        movlp           0x02        ; 268F: 3182
        callw                       ; 2690: 000A

        movlp           0x26        ; 2691: 31A6
        movlp           0x26        ; 2692: 31A6
        goto            label_2687  ; 2693: 2E87

label_2694
; jump here from: 27FE
        movlw           0xdd        ; 2694: 30DD
        movlp           0x02        ; 2695: 3182
        callw                       ; 2696: 000A

        movlb           0x02        ; 2697: 0022
        movwf           mem_155     ; 2698: 00D5
        movlw           0xd8        ; 2699: 30D8
        movlp           0x02        ; 269A: 3182
        callw                       ; 269B: 000A

        movlp           0x26        ; 269C: 31A6
        movlp           0x26        ; 269D: 31A6
        goto            label_2687  ; 269E: 2E87

label_269f
; jump here from: 27FF
        movlw           0xdf        ; 269F: 30DF
        movlp           0x02        ; 26A0: 3182
        callw                       ; 26A1: 000A

        movlb           0x02        ; 26A2: 0022
        movwf           mem_155     ; 26A3: 00D5
        movlw           0xdd        ; 26A4: 30DD
        movlp           0x02        ; 26A5: 3182
        callw                       ; 26A6: 000A

        movlp           0x26        ; 26A7: 31A6

label_26a8
; jump here from: 2688
        movwf           mem_156     ; 26A8: 00D6

label_26a9
; jump here from: 26B7
; jump here from: 26CA
        movlp           0x26        ; 26A9: 31A6
        goto            label_26cb  ; 26AA: 2ECB

label_26ab
; jump here from: 267D
        movlw           0x03        ; 26AB: 3003
        movlb           0x00        ; 26AC: 0020
        andwf           mem_28, W   ; 26AD: 0528
        movwf           mem_5a      ; 26AE: 00DA
        clrf            mem_5b      ; 26AF: 01DB
        movf            mem_5b, W   ; 26B0: 085B
        xorlw           0x00        ; 26B1: 3A00
        movlp           0x27        ; 26B2: 31A7
        btfsc           STATUS, Z   ; 26B3: 1903
        goto            loop_27fb   ; 26B4: 2FFB

        movlp           0x22        ; 26B5: 31A2
        movlp           0x26        ; 26B6: 31A6
        goto            label_26a9  ; 26B7: 2EA9

label_26b8
; jump here from: 27FB
        movf            mem_5a, W   ; 26B8: 085A
        xorlw           0x00        ; 26B9: 3A00
        btfsc           STATUS, Z   ; 26BA: 1903
        goto            loop_27fc   ; 26BB: 2FFC

        movlp           0x22        ; 26BC: 31A2
        xorlw           0x01        ; 26BD: 3A01
        btfsc           STATUS, Z   ; 26BE: 1903
        goto            loop_27fd   ; 26BF: 2FFD

        movlp           0x22        ; 26C0: 31A2
        xorlw           0x03        ; 26C1: 3A03
        btfsc           STATUS, Z   ; 26C2: 1903
        goto            loop_27fe   ; 26C3: 2FFE

        movlp           0x22        ; 26C4: 31A2
        xorlw           0x01        ; 26C5: 3A01
        btfsc           STATUS, Z   ; 26C6: 1903
        goto            loop_27ff   ; 26C7: 2FFF

        movlp           0x22        ; 26C8: 31A2
        movlp           0x26        ; 26C9: 31A6
        goto            label_26a9  ; 26CA: 2EA9

label_26cb
; jump here from: 26AA
        movlb           0x01        ; 26CB: 0021
        bsf             mem_bb, 2   ; 26CC: 153B
        return                      ; 26CD: 0008

loop_26ce
; jump here from: 2666
        movlb           0x02        ; 26CE: 0022
        clrf            mem_153     ; 26CF: 01D3
        goto            label_277e  ; 26D0: 2F7E

;------------------------------------------------------------
; Subroutine: sub_26d1
;
; called from: 2FAD

sub_26d1
        movlb           0x01        ; 26D1: 0021
        decf            mem_bc, W   ; 26D2: 033C
        btfsc           STATUS, Z   ; 26D3: 1903
        goto            loop_26d8   ; 26D4: 2ED8

        movf            mem_c4, W   ; 26D5: 0844
        btfsc           STATUS, Z   ; 26D6: 1903
        goto            loop_26f9   ; 26D7: 2EF9

loop_26d8
; jump here from: 26D4
        movlw           0xda        ; 26D8: 30DA
        movlp           0x02        ; 26D9: 3182
        callw                       ; 26DA: 000A

        movlb           0x02        ; 26DB: 0022
        movwf           mem_14f     ; 26DC: 00CF
        movlw           0xd8        ; 26DD: 30D8
        movlp           0x02        ; 26DE: 3182
        callw                       ; 26DF: 000A

        movlp           0x26        ; 26E0: 31A6
        movwf           mem_150     ; 26E1: 00D0
        movlb           0x00        ; 26E2: 0020
        movf            mem_45, W   ; 26E3: 0845
        movlp           0x26        ; 26E4: 31A6
        call            sub_2627    ; 26E5: 2627

        movwf           mem_58      ; 26E6: 00D8
        swapf           mem_58, W   ; 26E7: 0E58
        andlw           0x0f        ; 26E8: 390F
        addlw           0xd8        ; 26E9: 3ED8
        movlp           0x02        ; 26EA: 3182
        callw                       ; 26EB: 000A

        movlb           0x02        ; 26EC: 0022
        movwf           mem_151     ; 26ED: 00D1
        movlb           0x00        ; 26EE: 0020
        movf            mem_58, W   ; 26EF: 0858
        andlw           0x0f        ; 26F0: 390F
        addlw           0xd8        ; 26F1: 3ED8
        movlp           0x02        ; 26F2: 3182
        callw                       ; 26F3: 000A

        movlp           0x26        ; 26F4: 31A6
        movlb           0x02        ; 26F5: 0022
        movwf           mem_152     ; 26F6: 00D2
        movlp           0x26        ; 26F7: 31A6
        goto            label_26fb  ; 26F8: 2EFB

loop_26f9
; jump here from: 26D7
        movlp           0x27        ; 26F9: 31A7
        call            sub_27a7    ; 26FA: 27A7

label_26fb
; jump here from: 26F8
        movlb           0x01        ; 26FB: 0021
        bcf             mem_bb, 6   ; 26FC: 133B
        movlb           0x02        ; 26FD: 0022
        bcf             mem_14c, 5  ; 26FE: 12CC
        bcf             mem_14b, 1  ; 26FF: 10CB
        bcf             mem_14b, 2  ; 2700: 114B
        return                      ; 2701: 0008

;------------------------------------------------------------
; Subroutine: sub_2702
;
; called from: 2F80

sub_2702
        movlw           0xda        ; 2702: 30DA
        movlp           0x02        ; 2703: 3182
        callw                       ; 2704: 000A

        movlb           0x02        ; 2705: 0022
        movwf           mem_157     ; 2706: 00D7
        movlp           0x25        ; 2707: 31A5
        goto            label_255b  ; 2708: 2D5B

;------------------------------------------------------------
; Subroutine: sub_2709
;
; called from: 2F85

sub_2709
        movlw           0xdb        ; 2709: 30DB
        movlp           0x02        ; 270A: 3182
        callw                       ; 270B: 000A

        movlb           0x02        ; 270C: 0022
        movwf           mem_157     ; 270D: 00D7
        movlp           0x25        ; 270E: 31A5
        goto            label_255b  ; 270F: 2D5B

;------------------------------------------------------------
; Subroutine: sub_2710
;
; called from: 2F8A

sub_2710
        movlw           0xdc        ; 2710: 30DC
        movlp           0x02        ; 2711: 3182
        callw                       ; 2712: 000A

        movlb           0x02        ; 2713: 0022
        movwf           mem_157     ; 2714: 00D7
        movlp           0x25        ; 2715: 31A5
        goto            label_255b  ; 2716: 2D5B

;------------------------------------------------------------
; Subroutine: sub_2717
;
; called from: 0882
; called from: 230D

sub_2717
        movlw           0x15        ; 2717: 3015
        movlb           0x00        ; 2718: 0020
        movwf           mem_52      ; 2719: 00D2
        movlw           0x88        ; 271A: 3088
        movlp           0x0d        ; 271B: 318D
        call            I2CRead    ; 271C: 25FD

        movlp           0x22        ; 271D: 31A2
        movlb           0x01        ; 271E: 0021
        movwf           mem_a3      ; 271F: 00A3
        movlw           0x16        ; 2720: 3016
        movlb           0x00        ; 2721: 0020
        movwf           mem_52      ; 2722: 00D2
        movlw           0x88        ; 2723: 3088
        movlp           0x0d        ; 2724: 318D
        call            I2CRead    ; 2725: 25FD

        movlb           0x01        ; 2726: 0021

loop_2727
; jump here from: 241D
; jump here from: 2420
        movwf           mem_a2      ; 2727: 00A2
        return                      ; 2728: 0008

;------------------------------------------------------------
; Subroutine: sub_2729
;
; called from: 2F4E

sub_2729
        call            sub_2611    ; 2729: 2611

        movlp           0x22        ; 272A: 31A2
        goto            label_255e  ; 272B: 2D5E

;------------------------------------------------------------
; Subroutine: sub_272c
;
; called from: 2D83
; called from: 2DB8

sub_272c
        movf            mem_d0, W   ; 272C: 0850
        movlb           0x02        ; 272D: 0022
        movwf           mem_15a     ; 272E: 00DA
        movlb           0x01        ; 272F: 0021
        movf            mem_d1, W   ; 2730: 0851
        movlb           0x02        ; 2731: 0022
        movwf           mem_15b     ; 2732: 00DB
        movlb           0x01        ; 2733: 0021
        movf            mem_cf, W   ; 2734: 084F
        movlb           0x02        ; 2735: 0022
        movwf           mem_159     ; 2736: 00D9
        movlb           0x00        ; 2737: 0020
        movf            mem_5d, W   ; 2738: 085D
        movwf           mem_55      ; 2739: 00D5
        movlb           0x01        ; 273A: 0021
        movf            mem_d0, W   ; 273B: 0850
        movlb           0x00        ; 273C: 0020
        movwf           mem_56      ; 273D: 00D6
        movf            mem_5c, W   ; 273E: 085C
        return                      ; 273F: 0008

;------------------------------------------------------------
; Subroutine: sub_2740
;
; called from: 23BD
; called from: 23D9

sub_2740
        addwf           mem_d2, W   ; 2740: 0752
        movlb           0x00        ; 2741: 0020
        movwf           mem_47      ; 2742: 00C7
        movlw           0x08        ; 2743: 3008
        subwf           mem_47, W   ; 2744: 0247
        btfss           STATUS, C   ; 2745: 1C03
        goto            loop_2749   ; 2746: 2F49

        movlw           0xf8        ; 2747: 30F8
        addwf           mem_47, f   ; 2748: 07C7

loop_2749
; jump here from: 2746
        movf            mem_47, W   ; 2749: 0847
        addwf           mem_47, W   ; 274A: 0747
        addwf           mem_47, W   ; 274B: 0747
        movlb           0x01        ; 274C: 0021
        movwf           mem_ef      ; 274D: 00EF
        movlb           0x00        ; 274E: 0020
        movwf           mem_52      ; 274F: 00D2
        return                      ; 2750: 0008

;------------------------------------------------------------
; Subroutine: sub_2751
;
; called from: 23C4
; called from: 23CB
; called from: 23E0
; called from: 23E7
; called from: 2402
; called from: 2409

sub_2751
        movlb           0x01        ; 2751: 0021
        incf            mem_ef, f   ; 2752: 0AEF
        movf            mem_ef, W   ; 2753: 086F
        movlb           0x00        ; 2754: 0020
        movwf           mem_52      ; 2755: 00D2
        return                      ; 2756: 0008

;------------------------------------------------------------
; Subroutine: sub_2757
;
; called from: 2D8F
; called from: 2DC4

sub_2757
        movf            mem_dd, W   ; 2757: 085D
        addlw           0x02        ; 2758: 3E02
        movwf           mem_d5      ; 2759: 00D5
        movlb           0x01        ; 275A: 0021
        movf            mem_cf, W   ; 275B: 084F
        movlb           0x00        ; 275C: 0020
        movwf           mem_56      ; 275D: 00D6
        movf            mem_5c, W   ; 275E: 085C
        return                      ; 275F: 0008

;------------------------------------------------------------
; Subroutine: sub_2760
;
; called from: 2D89
; called from: 2DBE

sub_2760
        incf            mem_dd, W   ; 2760: 0A5D
        movwf           mem_d5      ; 2761: 00D5
        movlb           0x01        ; 2762: 0021
        movf            mem_d1, W   ; 2763: 0851
        movlb           0x00        ; 2764: 0020
        movwf           mem_56      ; 2765: 00D6
        movf            mem_5c, W   ; 2766: 085C
        return                      ; 2767: 0008

;------------------------------------------------------------
; Subroutine: sub_2768
;
; called from: 2E3B
; called from: 2E4E

sub_2768
        sublw           0x00        ; 2768: 3C00
        movwf           mem_52      ; 2769: 00D2
        btfss           STATUS, C   ; 276A: 1C03
        decf            mem_53, f   ; 276B: 03D3
        movf            mem_53, W   ; 276C: 0853
        xorlw           0x80        ; 276D: 3A80
        sublw           0x80        ; 276E: 3C80
        return                      ; 276F: 0008

;------------------------------------------------------------
; Subroutine: sub_2770
;
; called from: 2D9B
; called from: 2DD0

sub_2770
        movf            mem_dd, W   ; 2770: 085D
        addlw           0x04        ; 2771: 3E04
        movwf           mem_d5      ; 2772: 00D5
        movf            mem_b6, W   ; 2773: 0836
        movwf           mem_d6      ; 2774: 00D6
        movf            mem_dc, W   ; 2775: 085C
        return                      ; 2776: 0008

;------------------------------------------------------------
; Subroutine: sub_2777
;
; called from: 2DA1
; called from: 2DD6

sub_2777
        movf            mem_dd, W   ; 2777: 085D
        addlw           0x05        ; 2778: 3E05
        movwf           mem_d5      ; 2779: 00D5
        movf            mem_b7, W   ; 277A: 0837
        movwf           mem_d6      ; 277B: 00D6
        movf            mem_dc, W   ; 277C: 085C
        return                      ; 277D: 0008

label_277e
; jump here from: 254B
; jump here from: 26D0
        clrf            mem_154     ; 277E: 01D4
        clrf            mem_155     ; 277F: 01D5
        clrf            mem_156     ; 2780: 01D6
        movlb           0x01        ; 2781: 0021
        bcf             mem_bb, 2   ; 2782: 113B
        return                      ; 2783: 0008

;------------------------------------------------------------
; Subroutine: sub_2784
;
; called from: 2582
; called from: 2592

sub_2784
        movwf           mem_14f     ; 2784: 00CF
        clrf            mem_150     ; 2785: 01D0
        movf            mem_159, W  ; 2786: 0859
        movwf           mem_152     ; 2787: 00D2
        movf            mem_158, W  ; 2788: 0858
        movwf           mem_151     ; 2789: 00D1
        return                      ; 278A: 0008

;------------------------------------------------------------
; Subroutine: sub_278b
;
; called from: 2D95
; called from: 2DCA

sub_278b
        movf            mem_dd, W   ; 278B: 085D
        addlw           0x03        ; 278C: 3E03
        movwf           mem_d5      ; 278D: 00D5
        movlw           0xaa        ; 278E: 30AA
        movwf           mem_d6      ; 278F: 00D6
        movf            mem_dc, W   ; 2790: 085C
        return                      ; 2791: 0008

;------------------------------------------------------------
; Subroutine: sub_2792
;
; called from: 2E59
; called from: 2E61

sub_2792
        movwf           mem_54      ; 2792: 00D4
        movlw           0x01        ; 2793: 3001
        andwf           mem_54, f   ; 2794: 05D4
        rrf             mem_54, f   ; 2795: 0CD4
        clrf            mem_54      ; 2796: 01D4
        rrf             mem_54, f   ; 2797: 0CD4
        return                      ; 2798: 0008

;------------------------------------------------------------
; Subroutine: sub_2799
;
; called from: 257B
; called from: 258B

sub_2799
        movwf           mem_14f     ; 2799: 00CF
        clrf            mem_150     ; 279A: 01D0
        movf            mem_159, W  ; 279B: 0859
        movwf           mem_152     ; 279C: 00D2
        movf            mem_158, W  ; 279D: 0858

loop_279e
; jump here from: 2411
        movwf           mem_d1      ; 279E: 00D1
        return                      ; 279F: 0008

;------------------------------------------------------------
; Subroutine: sub_27a0
;
; called from: 2EED
; called from: 2F0B

sub_27a0
        movwf           mem_4f      ; 27A0: 00CF
        btfss           STATUS, C   ; 27A1: 1C03
        decf            mem_50, f   ; 27A2: 03D0
        movf            mem_50, W   ; 27A3: 0850
        xorlw           0x80        ; 27A4: 3A80
        sublw           0x80        ; 27A5: 3C80
        return                      ; 27A6: 0008

;------------------------------------------------------------
; Subroutine: sub_27a7
;
; called from: 251C
; called from: 26FA

sub_27a7
        movlb           0x02        ; 27A7: 0022
        clrf            mem_14f     ; 27A8: 01CF
        clrf            mem_150     ; 27A9: 01D0
        clrf            mem_151     ; 27AA: 01D1
        clrf            mem_152     ; 27AB: 01D2
        return                      ; 27AC: 0008

;------------------------------------------------------------
; Subroutine: sub_27ad
;
; called from: 0885
; called from: 230F

sub_27ad
        movlw           0x17        ; 27AD: 3017
        movlb           0x00        ; 27AE: 0020
        movwf           mem_52      ; 27AF: 00D2
        movlw           0x88        ; 27B0: 3088
        movlp           0x0d        ; 27B1: 318D
        call            I2CRead    ; 27B2: 25FD

        movlb           0x01        ; 27B3: 0021
        movwf           mem_ea      ; 27B4: 00EA
        return                      ; 27B5: 0008

;------------------------------------------------------------
; Subroutine: sub_27b6
;
; called from: 0888
; called from: 2311

sub_27b6
        movlw           0x18        ; 27B6: 3018
        movlb           0x00        ; 27B7: 0020
        movwf           mem_52      ; 27B8: 00D2
        movlw           0x88        ; 27B9: 3088
        movlp           0x0d        ; 27BA: 318D
        call            I2CRead    ; 27BB: 25FD

loop_27bc
; jump here from: 2414
        movlb           0x01        ; 27BC: 0021
        movwf           mem_ca      ; 27BD: 00CA
        return                      ; 27BE: 0008

;------------------------------------------------------------
; Subroutine: sub_27bf
;
; called from: 088B
; called from: 2313

sub_27bf
        movlw           0x19        ; 27BF: 3019
        movlb           0x00        ; 27C0: 0020
        movwf           mem_52      ; 27C1: 00D2
        movlw           0x88        ; 27C2: 3088
        movlp           0x0d        ; 27C3: 318D
        call            I2CRead    ; 27C4: 25FD

        movlp           0x22        ; 27C5: 31A2
        movlb           0x01        ; 27C6: 0021
        movwf           mem_b6      ; 27C7: 00B6
        movlw           0x1a        ; 27C8: 301A
        movlb           0x00        ; 27C9: 0020
        movwf           mem_52      ; 27CA: 00D2
        movlw           0x88        ; 27CB: 3088
        movlp           0x0d        ; 27CC: 318D
        call            I2CRead    ; 27CD: 25FD

        movlp           0x22        ; 27CE: 31A2
        movlb           0x01        ; 27CF: 0021
        movwf           mem_b7      ; 27D0: 00B7
        movlw           0x1b        ; 27D1: 301B
        movlb           0x00        ; 27D2: 0020
        movwf           mem_52      ; 27D3: 00D2
        movlw           0x88        ; 27D4: 3088
        movlp           0x0d        ; 27D5: 318D
        call            I2CRead    ; 27D6: 25FD

        movlb           0x01        ; 27D7: 0021

loop_27d8
; jump here from: 2417
        movwf           mem_b5      ; 27D8: 00B5
        return                      ; 27D9: 0008

;------------------------------------------------------------
; Subroutine: sub_27da
;
; called from: 088E
; called from: 2315

sub_27da
        movlw           0x1c        ; 27DA: 301C
        movlb           0x00        ; 27DB: 0020
        movwf           mem_52      ; 27DC: 00D2
        movlw           0x88        ; 27DD: 3088
        movlp           0x0d        ; 27DE: 318D
        call            I2CRead    ; 27DF: 25FD

        movlp           0x22        ; 27E0: 31A2
        movlb           0x01        ; 27E1: 0021
        movwf           mem_ec      ; 27E2: 00EC
        movlw           0x1d        ; 27E3: 301D
        movlb           0x00        ; 27E4: 0020
        movwf           mem_52      ; 27E5: 00D2
        movlw           0x88        ; 27E6: 3088
        movlp           0x0d        ; 27E7: 318D
        call            I2CRead    ; 27E8: 25FD

        movlp           0x22        ; 27E9: 31A2
        movlb           0x01        ; 27EA: 0021

loop_27eb
; jump here from: 241A
        movwf           mem_ed      ; 27EB: 00ED
        movlw           0x1e        ; 27EC: 301E
        movlb           0x00        ; 27ED: 0020
        movwf           mem_52      ; 27EE: 00D2
        movlw           0x88        ; 27EF: 3088
        movlp           0x0d        ; 27F0: 318D
        call            I2CRead    ; 27F1: 25FD

        movlb           0x01        ; 27F2: 0021
        movwf           mem_eb      ; 27F3: 00EB
        return                      ; 27F4: 0008

;------------------------------------------------------------
; Subroutine: sub_27f5
;
; called from: 2FB2

sub_27f5
        movlp           0x19        ; 27F5: 3199
        call            sub_19ff    ; 27F6: 21FF

        movlb           0x02        ; 27F7: 0022
        bsf             mem_14c, 6  ; 27F8: 174C
        bsf             mem_14c, 4  ; 27F9: 164C
        return                      ; 27FA: 0008

loop_27fb
; jump here from: 26B4
        goto            label_26b8  ; 27FB: 2EB8

loop_27fc
; jump here from: 26BB
        goto            label_267e  ; 27FC: 2E7E

loop_27fd
; jump here from: 26BF
        goto            label_2689  ; 27FD: 2E89

loop_27fe
; jump here from: 26C3
        goto            label_2694  ; 27FE: 2E94

loop_27ff
; jump here from: 26C7
        goto            label_269f  ; 27FF: 2E9F
;
; end of loop_27ff
;------------------------------------------------------------

Bank2800_Vector org 0x2800

;------------------------------------------------------------
; Subroutine: sub_2800
;
; called from: 0879

sub_2800
        movf            mem_69, W   ; 2800: 0869
        addwf           mem_69, W   ; 2801: 0769
        addwf           mem_69, W   ; 2802: 0769
        movlb           0x00        ; 2803: 0020
        movwf           mem_55      ; 2804: 00D5
        movwf           mem_52      ; 2805: 00D2
        movlw           0x83        ; 2806: 3083
        movlp           0x0d        ; 2807: 318D
        call            I2CRead    ; 2808: 25FD

        movlp           0x28        ; 2809: 31A8
        movlb           0x02        ; 280A: 0022
        movwf           mem_163     ; 280B: 00E3
        movlb           0x00        ; 280C: 0020
        incf            mem_55, W   ; 280D: 0A55
        movwf           mem_52      ; 280E: 00D2
        movlw           0x83        ; 280F: 3083
        movlp           0x0d        ; 2810: 318D
        call            I2CRead    ; 2811: 25FD

        movlp           0x28        ; 2812: 31A8
        movlb           0x02        ; 2813: 0022
        movwf           mem_164     ; 2814: 00E4
        movlb           0x00        ; 2815: 0020
        movf            mem_55, W   ; 2816: 0855
        addlw           0x02        ; 2817: 3E02
        movwf           mem_52      ; 2818: 00D2
        movlw           0x83        ; 2819: 3083
        movlp           0x0d        ; 281A: 318D
        call            I2CRead    ; 281B: 25FD

        movlb           0x02        ; 281C: 0022
        movwf           mem_162     ; 281D: 00E2
        return                      ; 281E: 0008

;------------------------------------------------------------
; Subroutine: sub_281f
;
; called from: 0A60

sub_281f
        movf            mem_39, W   ; 281F: 0839
        movlb           0x00        ; 2820: 0020
        movwf           mem_23      ; 2821: 00A3
        movlb           0x02        ; 2822: 0022
        movf            mem_138, W  ; 2823: 0838
        movlb           0x00        ; 2824: 0020
        movwf           mem_22      ; 2825: 00A2
        movlb           0x02        ; 2826: 0022
        movf            mem_137, W  ; 2827: 0837
        movlb           0x00        ; 2828: 0020
        movwf           mem_33      ; 2829: 00B3
        movlp           0x2d        ; 282A: 31AD
        call            sub_2deb    ; 282B: 25EB

        movlp           0x28        ; 282C: 31A8
        movlw           0x01        ; 282D: 3001
        movlb           0x00        ; 282E: 0020
        subwf           mem_23, W   ; 282F: 0223
        movlw           0x87        ; 2830: 3087
        btfsc           STATUS, Z   ; 2831: 1903
        subwf           mem_22, W   ; 2832: 0222
        btfsc           STATUS, C   ; 2833: 1803
        return                      ; 2834: 0008
        movlb           0x03        ; 2835: 0023
        btfss           serial_outputd, 6  ; 2836: 1F2D
        goto            loop_283b   ; 2837: 283B

        clrf            mem_1d1     ; 2838: 01D1
        incf            mem_1d1, f  ; 2839: 0AD1
        goto            label_283c  ; 283A: 283C

loop_283b
; jump here from: 2837
        clrf            mem_1d1     ; 283B: 01D1

label_283c
; jump here from: 283A
        movlb           0x01        ; 283C: 0021
        decfsz          mem_b9, W   ; 283D: 0B39
        goto            loop_2851   ; 283E: 2851

        movlb           0x03        ; 283F: 0023
        btfss           serial_outputd, 7  ; 2840: 1FAD
        goto            loop_2851   ; 2841: 2851

        movlb           0x01        ; 2842: 0021
        clrf            mem_b9      ; 2843: 01B9
        movlb           0x03        ; 2844: 0023
        movf            serial_outputa, W  ; 2845: 082A
        movlb           0x02        ; 2846: 0022
        movwf           mem_168     ; 2847: 00E8
        movlb           0x03        ; 2848: 0023
        movf            serial_outputb, W  ; 2849: 082B
        movlb           0x01        ; 284A: 0021
        movwf           mem_e1      ; 284B: 00E1
        movlb           0x03        ; 284C: 0023
        movf            serial_outputc, W  ; 284D: 082C
        movlb           0x01        ; 284E: 0021
        movwf           mem_e2      ; 284F: 00E2
        call            sub_2880    ; 2850: 2080

loop_2851
; jump here from: 283E
; jump here from: 2841
        movlb           0x01        ; 2851: 0021
        movf            mem_b1, W   ; 2852: 0831
        movlb           0x00        ; 2853: 0020
        movwf           mem_23      ; 2854: 00A3
        movlb           0x01        ; 2855: 0021
        movf            mem_b0, W   ; 2856: 0830
        movlb           0x00        ; 2857: 0020
        movwf           mem_22      ; 2858: 00A2
        movlp           0x1b        ; 2859: 319B
        call            sub_1b5a    ; 285A: 235A

        movlp           0x28        ; 285B: 31A8
        movlb           0x03        ; 285C: 0023
        movf            serial_outpute, W  ; 285D: 082E
        movlb           0x00        ; 285E: 0020
        movwf           mem_21      ; 285F: 00A1
        movlb           0x03        ; 2860: 0023
        movf            serial_outputf, W  ; 2861: 082F
        movlb           0x00        ; 2862: 0020
        movwf           mem_20      ; 2863: 00A0
        movlb           0x03        ; 2864: 0023
        movf            serial_output10, W  ; 2865: 0830
        movlb           0x01        ; 2866: 0021
        movwf           mem_ba      ; 2867: 00BA
        movlp           0x1c        ; 2868: 319C
        call            sub_1c28    ; 2869: 2428

        movlp           0x28        ; 286A: 31A8
        call            sub_289d    ; 286B: 209D

        movlb           0x01        ; 286C: 0021
        movwf           mem_ba      ; 286D: 00BA
        movlp           0x2e        ; 286E: 31AE
        call            sub_2e22    ; 286F: 2622

        movf            mem_a3, W   ; 2870: 0823
        movlb           0x01        ; 2871: 0021
        movwf           mem_d0      ; 2872: 00D0
        movlb           0x00        ; 2873: 0020
        movf            mem_22, W   ; 2874: 0822
        movlb           0x01        ; 2875: 0021
        movwf           mem_d1      ; 2876: 00D1
        movlb           0x00        ; 2877: 0020
        movf            mem_33, W   ; 2878: 0833
        movlb           0x01        ; 2879: 0021
        movwf           mem_cf      ; 287A: 00CF
        movlb           0x02        ; 287B: 0022
        incf            mem_122, f  ; 287C: 0AA2
        btfsc           STATUS, Z   ; 287D: 1903
        incf            mem_123, f  ; 287E: 0AA3
        return                      ; 287F: 0008

;------------------------------------------------------------
; Subroutine: sub_2880
;
; called from: 22D8
; called from: 2850

sub_2880
        movlw           0x04        ; 2880: 3004
        movlb           0x00        ; 2881: 0020
        movwf           mem_55      ; 2882: 00D5
        movlb           0x02        ; 2883: 0022
        movf            mem_168, W  ; 2884: 0868
        movlb           0x00        ; 2885: 0020
        movwf           mem_56      ; 2886: 00D6
        movlw           0x88        ; 2887: 3088
        movlp           0x0c        ; 2888: 318C
        call            I2CWrite    ; 2889: 24B3

        movlp           0x28        ; 288A: 31A8
        movlw           0x03        ; 288B: 3003
        movwf           mem_55      ; 288C: 00D5
        movlb           0x01        ; 288D: 0021
        movf            mem_e1, W   ; 288E: 0861
        movlb           0x00        ; 288F: 0020
        movwf           mem_56      ; 2890: 00D6
        movlw           0x88        ; 2891: 3088
        movlp           0x0c        ; 2892: 318C
        call            I2CWrite    ; 2893: 24B3

        movlw           0x02        ; 2894: 3002
        movwf           mem_55      ; 2895: 00D5
        movlb           0x01        ; 2896: 0021
        movf            mem_e2, W   ; 2897: 0862
        movlb           0x00        ; 2898: 0020
        movwf           mem_56      ; 2899: 00D6
        movlw           0x88        ; 289A: 3088
        movlp           0x0c        ; 289B: 318C
        goto            I2CWrite    ; 289C: 2CB3

;------------------------------------------------------------
; Subroutine: sub_289d
;
; called from: 1A12
; called from: 1D55
; called from: 286B

sub_289d
        movlb           0x00        ; 289D: 0020
        movlw           0x7d        ; 289E: 307D
        clrf            mem_20      ; 289F: 01A0
        movwf           mem_21      ; 28A0: 00A1
        retlw           0x0a        ; 28A1: 340A

;------------------------------------------------------------
; Subroutine: sub_28a2
;
; called from: 0134

sub_28a2
        movlb           0x01        ; 28A2: 0021
        decfsz          mem_c8, W   ; 28A3: 0B48
        return                      ; 28A4: 0008
        movlb           0x02        ; 28A5: 0022
        decfsz          mem_radio_status, W  ; 28A6: 0B45
        return                      ; 28A7: 0008
        incf            mem_41, f   ; 28A8: 0AC1
        btfss           INTCON, INTE; 28A9: 1E0B
        goto            loop_28c4   ; 28AA: 28C4

        movf            mem_43, W   ; 28AB: 0843
        addlw           0x04        ; 28AC: 3E04
        movlb           0x00        ; 28AD: 0020
        movwf           mem_4c      ; 28AE: 00CC
        movlw           0x00        ; 28AF: 3000
        btfsc           STATUS, C   ; 28B0: 1803
        movlw           0x01        ; 28B1: 3001
        movwf           mem_4d      ; 28B2: 00CD
        xorlw           0x80        ; 28B3: 3A80
        movwf           mem_4e      ; 28B4: 00CE
        movlw           0x80        ; 28B5: 3080
        subwf           mem_4e, W   ; 28B6: 024E
        btfss           STATUS, Z   ; 28B7: 1D03
        goto            loop_28bd   ; 28B8: 28BD

        movlb           0x02        ; 28B9: 0022
        movf            mem_141, W  ; 28BA: 0841
        movlb           0x00        ; 28BB: 0020
        subwf           mem_4c, W   ; 28BC: 024C

loop_28bd
; jump here from: 28B8
        btfsc           STATUS, C   ; 28BD: 1803
        return                      ; 28BE: 0008
        call            radio_disable    ; 28BF: 20CA

        movlp           0x28        ; 28C0: 31A8
        call            radio_set    ; 28C1: 20DC

        bcf             INTCON, T0IE; 28C2: 128B
        return                      ; 28C3: 0008

loop_28c4
; jump here from: 28AA
        movf            mem_41, W   ; 28C4: 0841
        subwf           mem_43, W   ; 28C5: 0243
        btfsc           STATUS, C   ; 28C6: 1803
        return                      ; 28C7: 0008
        call            radio_enable    ; 28C8: 20D0

        return                      ; 28C9: 0008

;------------------------------------------------------------
; Subroutine: radio_disable
;
; called from: 0282
; called from: 28BF

radio_disable
        movlb           0x00        ; 28CA: 0020
        bcf             PORTB, RB1  ; 28CB: 108D
        movlb           0x02        ; 28CC: 0022
        clrf            mem_radio_status     ; 28CD: 01C5
        bcf             INTCON, INTE; 28CE: 120B
        return                      ; 28CF: 0008

;------------------------------------------------------------
; Subroutine: radio_enable
;
; called from: 017D
; called from: 28C8

radio_enable
        movlb           0x00        ; 28D0: 0020
        movf            mem_3b, W   ; 28D1: 083B
        xorlw           0x22        ; 28D2: 3A22
        btfsc           STATUS, Z   ; 28D3: 1903
        return                      ; 28D4: 0008
        movlb           0x02        ; 28D5: 0022
        clrf            mem_radio_status     ; 28D6: 01C5
        incf            mem_radio_status, f  ; 28D7: 0AC5
        movlb           0x00        ; 28D8: 0020
        bsf             PORTB, RB1  ; 28D9: 148D
        bsf             INTCON, INTE; 28DA: 160B
        return                      ; 28DB: 0008

;------------------------------------------------------------
; Subroutine: radio_set
;
; called from: 28C1

radio_set
        movf            mem_24, W   ; 28DC: 0824
        movlb           0x00        ; 28DD: 0020
        movwf           mem_48      ; 28DE: 00C8
        movlb           0x02        ; 28DF: 0022
        movf            mem_125, W  ; 28E0: 0825
        movlb           0x00        ; 28E1: 0020
        movwf           mem_49      ; 28E2: 00C9
        movlw           0x7d        ; 28E3: 307D
        clrf            mem_4a      ; 28E4: 01CA
        clrf            mem_4b      ; 28E5: 01CB
        movwf           mem_70      ; 28E6: 00F0
        clrf            mem_71      ; 28E7: 01F1
        clrf            mem_72      ; 28E8: 01F2
        clrf            mem_73      ; 28E9: 01F3
        movf            mem_4b, W   ; 28EA: 084B
        movwf           mem_77      ; 28EB: 00F7
        movf            mem_4a, W   ; 28EC: 084A
        movwf           mem_76      ; 28ED: 00F6
        movf            mem_49, W   ; 28EE: 0849
        movwf           mem_75      ; 28EF: 00F5
        movf            mem_48, W   ; 28F0: 0848
        movwf           mem_74      ; 28F1: 00F4
        call            radio_push    ; 28F2: 2107

        movlp           0x28        ; 28F3: 31A8
        movf            mem_73, W   ; 28F4: 0873
        movwf           mem_4b      ; 28F5: 00CB
        movf            mem_72, W   ; 28F6: 0872
        movwf           mem_4a      ; 28F7: 00CA
        movf            mem_71, W   ; 28F8: 0871
        movwf           mem_49      ; 28F9: 00C9
        movf            mem_70, W   ; 28FA: 0870
        movwf           mem_48      ; 28FB: 00C8
        movlw           0x0f        ; 28FC: 300F

loop_28fd
; jump here from: 2902
        lsrf            mem_4b, f   ; 28FD: 36CB
        rrf             mem_4a, f   ; 28FE: 0CCA
        rrf             mem_49, f   ; 28FF: 0CC9
        rrf             mem_48, f   ; 2900: 0CC8
        decfsz          WREG, f     ; 2901: 0B89
        goto            loop_28fd   ; 2902: 28FD

        movf            mem_48, W   ; 2903: 0848
        movlb           0x02        ; 2904: 0022
        movwf           mem_143     ; 2905: 00C3
        return                      ; 2906: 0008

;------------------------------------------------------------
; Subroutine: radio_push
;
; called from: 28F2

radio_push
        clrf            mem_78      ; 2907: 01F8
        clrf            mem_79      ; 2908: 01F9
        clrf            mem_7a      ; 2909: 01FA
        clrf            mem_7b      ; 290A: 01FB

loop_290b
; jump here from: 2922
        btfss           mem_70, 0   ; 290B: 1C70
        goto            loop_2915   ; 290C: 2915

        movf            mem_74, W   ; 290D: 0874
        addwf           mem_78, f   ; 290E: 07F8
        movf            mem_75, W   ; 290F: 0875
        addwfc          mem_79, f   ; 2910: 3DF9
        movf            mem_76, W   ; 2911: 0876
        addwfc          mem_7a, f   ; 2912: 3DFA
        movf            mem_77, W   ; 2913: 0877
        addwfc          mem_7b, f   ; 2914: 3DFB

loop_2915
; jump here from: 290C
        lslf            mem_74, f   ; 2915: 35F4
        rlf             mem_75, f   ; 2916: 0DF5
        rlf             mem_76, f   ; 2917: 0DF6
        rlf             mem_77, f   ; 2918: 0DF7
        lsrf            mem_73, f   ; 2919: 36F3
        rrf             mem_72, f   ; 291A: 0CF2
        rrf             mem_71, f   ; 291B: 0CF1
        rrf             mem_70, f   ; 291C: 0CF0
        movf            mem_73, W   ; 291D: 0873
        iorwf           mem_72, W   ; 291E: 0472
        iorwf           mem_71, W   ; 291F: 0471
        iorwf           mem_70, W   ; 2920: 0470
        btfss           STATUS, Z   ; 2921: 1D03
        goto            loop_290b   ; 2922: 290B

        movf            mem_7b, W   ; 2923: 087B
        movwf           mem_73      ; 2924: 00F3
        movf            mem_7a, W   ; 2925: 087A
        movwf           mem_72      ; 2926: 00F2
        movf            mem_79, W   ; 2927: 0879
        movwf           mem_71      ; 2928: 00F1
        movf            mem_78, W   ; 2929: 0878
        movwf           mem_70      ; 292A: 00F0
        return                      ; 292B: 0008

;------------------------------------------------------------
; Subroutine: sub_292c
;
; called from: 2F76

sub_292c
        movlp           0x26        ; 292C: 31A6
        call            sub_2611    ; 292D: 2611

        movlp           0x29        ; 292E: 31A9
        goto            label_294c  ; 292F: 294C

;------------------------------------------------------------
; Subroutine: sub_2930
;
; called from: 2F6C

sub_2930
        movlp           0x26        ; 2930: 31A6
        call            sub_2611    ; 2931: 2611

        movlp           0x29        ; 2932: 31A9
        goto            label_294c  ; 2933: 294C

;------------------------------------------------------------
; Subroutine: sub_2934
;
; called from: 2F62

sub_2934
        movlp           0x26        ; 2934: 31A6
        call            sub_2611    ; 2935: 2611

        movlp           0x29        ; 2936: 31A9
        goto            label_294c  ; 2937: 294C

;------------------------------------------------------------
; Subroutine: sub_2938
;
; called from: 2F58

sub_2938
        movlp           0x26        ; 2938: 31A6
        call            sub_2611    ; 2939: 2611

        movlp           0x29        ; 293A: 31A9
        goto            label_294c  ; 293B: 294C

;------------------------------------------------------------
; Subroutine: sub_293c
;
; called from: 2FA8

sub_293c
        call            sub_2942    ; 293C: 2142

        movlb           0x02        ; 293D: 0022
        bsf             mem_14c, 5  ; 293E: 16CC
        bcf             mem_14b, 1  ; 293F: 10CB
        bcf             mem_14b, 2  ; 2940: 114B
        return                      ; 2941: 0008

;------------------------------------------------------------
; Subroutine: sub_2942
;
; called from: 293C
; called from: 2F9E

sub_2942
        movlp           0x26        ; 2942: 31A6
        call            sub_2611    ; 2943: 2611

        movlp           0x29        ; 2944: 31A9
        goto            label_294c  ; 2945: 294C

;------------------------------------------------------------
; Subroutine: sub_2946
;
; called from: 2FA3

sub_2946
        call            sub_2957    ; 2946: 2157

        movlb           0x02        ; 2947: 0022
        bsf             mem_14b, 2  ; 2948: 154B
        bcf             mem_14b, 1  ; 2949: 10CB
        bcf             mem_14c, 5  ; 294A: 12CC
        return                      ; 294B: 0008

label_294c
; jump here from: 255F
; jump here from: 292F
; jump here from: 2933
; jump here from: 2937
; jump here from: 293B
; jump here from: 2945
        decf            mem_3c, W   ; 294C: 033C
        btfsc           STATUS, Z   ; 294D: 1903
        goto            loop_2952   ; 294E: 2952

        movf            mem_44, W   ; 294F: 0844
        btfsc           STATUS, Z   ; 2950: 1903
        goto            loop_2953   ; 2951: 2953

loop_2952
; jump here from: 294E
        goto            sub_298d    ; 2952: 298D
;
; end of loop_2952
;------------------------------------------------------------


loop_2953
; jump here from: 2951
        movlb           0x02        ; 2953: 0022
        clrf            mem_151     ; 2954: 01D1
        clrf            mem_152     ; 2955: 01D2
        return                      ; 2956: 0008

;------------------------------------------------------------
; Subroutine: sub_2957
;
; called from: 2946
; called from: 2F99

sub_2957
        call            sub_29a5    ; 2957: 21A5

        movlp           0x29        ; 2958: 31A9
        goto            sub_298d    ; 2959: 298D

;------------------------------------------------------------
; Subroutine: sub_295a
;
; called from: 2F71

sub_295a
        call            sub_29a5    ; 295A: 21A5

        movlp           0x29        ; 295B: 31A9
        call            sub_298d    ; 295C: 218D

        movlp           0x29        ; 295D: 31A9
        goto            label_29b6  ; 295E: 29B6

;------------------------------------------------------------
; Subroutine: sub_295f
;
; called from: 2F5D

sub_295f
        call            sub_29a5    ; 295F: 21A5

        movlp           0x29        ; 2960: 31A9
        call            sub_298d    ; 2961: 218D

        movlp           0x29        ; 2962: 31A9
        goto            label_29b6  ; 2963: 29B6

;------------------------------------------------------------
; Subroutine: sub_2964
;
; called from: 2F49

sub_2964
        call            sub_29a5    ; 2964: 21A5

        movlp           0x29        ; 2965: 31A9
        call            sub_298d    ; 2966: 218D

        movlp           0x29        ; 2967: 31A9
        goto            label_29b6  ; 2968: 29B6

;------------------------------------------------------------
; Subroutine: sub_2969
;
; called from: 2F67

sub_2969
        call            sub_29a5    ; 2969: 21A5

        movlp           0x29        ; 296A: 31A9
        call            sub_298d    ; 296B: 218D

        movlw           0xc0        ; 296C: 30C0
        movlb           0x02        ; 296D: 0022
        movwf           mem_14b     ; 296E: 00CB
        movlw           0xdb        ; 296F: 30DB
        movlp           0x02        ; 2970: 3182
        callw                       ; 2971: 000A

        movlp           0x29        ; 2972: 31A9
        movwf           mem_157     ; 2973: 00D7
        goto            label_29b2  ; 2974: 29B2

;------------------------------------------------------------
; Subroutine: sub_2975
;
; called from: 2F53

sub_2975
        call            sub_29a5    ; 2975: 21A5

        movlp           0x29        ; 2976: 31A9
        call            sub_298d    ; 2977: 218D

        movlw           0xc0        ; 2978: 30C0
        movlb           0x02        ; 2979: 0022
        movwf           mem_14b     ; 297A: 00CB
        movlw           0xda        ; 297B: 30DA
        movlp           0x02        ; 297C: 3182
        callw                       ; 297D: 000A

        movlp           0x29        ; 297E: 31A9
        movwf           mem_157     ; 297F: 00D7
        goto            label_29b2  ; 2980: 29B2

;------------------------------------------------------------
; Subroutine: sub_2981
;
; called from: 2F3F

sub_2981
        call            sub_29a5    ; 2981: 21A5

        movlp           0x29        ; 2982: 31A9
        call            sub_298d    ; 2983: 218D

        movlw           0xc0        ; 2984: 30C0
        movlb           0x02        ; 2985: 0022
        movwf           mem_14b     ; 2986: 00CB
        movlw           0xd9        ; 2987: 30D9
        movlp           0x02        ; 2988: 3182
        callw                       ; 2989: 000A

        movlp           0x29        ; 298A: 31A9
        movwf           mem_157     ; 298B: 00D7
        goto            label_29b2  ; 298C: 29B2

;------------------------------------------------------------
; Subroutine: sub_298d
;
; called from: 295C
; called from: 2961
; called from: 2966
; called from: 296B
; called from: 2977
; called from: 2983

sub_298d
; jump here from: 2952
; jump here from: 2959
        movlb           0x00        ; 298D: 0020
        movf            mem_45, W   ; 298E: 0845
        movlp           0x26        ; 298F: 31A6
        call            sub_2627    ; 2990: 2627

        movlp           0x29        ; 2991: 31A9
        movwf           mem_58      ; 2992: 00D8
        swapf           mem_58, W   ; 2993: 0E58
        andlw           0x0f        ; 2994: 390F
        addlw           0xd8        ; 2995: 3ED8
        movlp           0x02        ; 2996: 3182
        callw                       ; 2997: 000A

        movlb           0x02        ; 2998: 0022
        movwf           mem_151     ; 2999: 00D1
        movlb           0x00        ; 299A: 0020
        movf            mem_58, W   ; 299B: 0858
        andlw           0x0f        ; 299C: 390F
        addlw           0xd8        ; 299D: 3ED8
        movlp           0x02        ; 299E: 3182
        callw                       ; 299F: 000A

        movlb           0x02        ; 29A0: 0022
        movwf           mem_152     ; 29A1: 00D2
        movlb           0x01        ; 29A2: 0021
        bsf             mem_bb, 6   ; 29A3: 173B
        return                      ; 29A4: 0008

;------------------------------------------------------------
; Subroutine: sub_29a5
;
; called from: 2957
; called from: 295A
; called from: 295F
; called from: 2964
; called from: 2969
; called from: 2975
; called from: 2981

sub_29a5
        movlb           0x01        ; 29A5: 0021
        decf            mem_bc, W   ; 29A6: 033C
        btfsc           STATUS, Z   ; 29A7: 1903
        goto            loop_29ac   ; 29A8: 29AC

        movf            mem_c4, W   ; 29A9: 0844
        btfsc           STATUS, Z   ; 29AA: 1903
        goto            loop_29ae   ; 29AB: 29AE

loop_29ac
; jump here from: 29A8
        movlp           0x26        ; 29AC: 31A6
        goto            sub_2611    ; 29AD: 2E11

loop_29ae
; jump here from: 29AB
        movlb           0x02        ; 29AE: 0022
        clrf            mem_14f     ; 29AF: 01CF
        clrf            mem_150     ; 29B0: 01D0
        return                      ; 29B1: 0008

label_29b2
; jump here from: 2974
; jump here from: 2980
; jump here from: 298C
        movlb           0x01        ; 29B2: 0021
        bsf             mem_bb, 5   ; 29B3: 16BB
        bcf             mem_bb, 7   ; 29B4: 13BB
        return                      ; 29B5: 0008

label_29b6
; jump here from: 295E
; jump here from: 2963
; jump here from: 2968
        bcf             mem_3b, 5   ; 29B6: 12BB
        bsf             mem_3b, 7   ; 29B7: 17BB
        return                      ; 29B8: 0008

;------------------------------------------------------------
; Subroutine: sub_29b9
;
; called from: 0A1A

sub_29b9
        movlb           0x01        ; 29B9: 0021
        movf            mem_e3, W   ; 29BA: 0863
        xorlw           0x00        ; 29BB: 3A00
        btfsc           STATUS, Z   ; 29BC: 1903
        goto            loop_29c8   ; 29BD: 29C8

        xorlw           0x01        ; 29BE: 3A01
        btfsc           STATUS, Z   ; 29BF: 1903
        goto            loop_29c9   ; 29C0: 29C9

        xorlw           0x03        ; 29C1: 3A03
        btfsc           STATUS, Z   ; 29C2: 1903
        goto            loop_29d2   ; 29C3: 29D2

        xorlw           0x01        ; 29C4: 3A01
        btfsc           STATUS, Z   ; 29C5: 1903
        goto            loop_29e3   ; 29C6: 29E3
        goto            label_2a05  ; 29C7: 2A05

loop_29c8
; jump here from: 29BD
; jump here from: 29D0
; jump here from: 29D9
; jump here from: 29EA
        goto            label_2a4b  ; 29C8: 2A4B
;
; end of loop_29c8
;------------------------------------------------------------


loop_29c9
; jump here from: 29C0
        call            sub_2a7a    ; 29C9: 227A

        movlp           0x29        ; 29CA: 31A9
        call            sub_2a06    ; 29CB: 2206

        movlp           0x29        ; 29CC: 31A9
        movwf           mem_d3      ; 29CD: 00D3
        decfsz          mem_d3, W   ; 29CE: 0B53
        goto            loop_29d1   ; 29CF: 29D1
        goto            loop_29c8   ; 29D0: 29C8

loop_29d1
; jump here from: 29CF
; jump here from: 29E1
; jump here from: 29F2
        goto            label_2a56  ; 29D1: 2A56
;
; end of loop_29d1
;------------------------------------------------------------


loop_29d2
; jump here from: 29C3
        call            sub_2a7a    ; 29D2: 227A

        movlp           0x29        ; 29D3: 31A9
        call            sub_2a06    ; 29D4: 2206

        movlp           0x29        ; 29D5: 31A9
        movwf           mem_d3      ; 29D6: 00D3
        decfsz          mem_d3, W   ; 29D7: 0B53
        goto            loop_29da   ; 29D8: 29DA
        goto            loop_29c8   ; 29D9: 29C8
;
; end of loop_29d2
;------------------------------------------------------------


loop_29da
; jump here from: 29D8
        call            sub_2a83    ; 29DA: 2283

        movlp           0x29        ; 29DB: 31A9
        call            sub_2a06    ; 29DC: 2206

        movlp           0x29        ; 29DD: 31A9
        movwf           mem_d3      ; 29DE: 00D3
        decfsz          mem_d3, W   ; 29DF: 0B53
        goto            loop_29e2   ; 29E0: 29E2
        goto            loop_29d1   ; 29E1: 29D1

loop_29e2
; jump here from: 29E0
; jump here from: 2A03
        goto            label_2a62  ; 29E2: 2A62
;
; end of loop_29e2
;------------------------------------------------------------


loop_29e3
; jump here from: 29C6
        call            sub_2a7a    ; 29E3: 227A

        movlp           0x29        ; 29E4: 31A9
        call            sub_2a06    ; 29E5: 2206

        movlp           0x29        ; 29E6: 31A9
        movwf           mem_d3      ; 29E7: 00D3
        decfsz          mem_d3, W   ; 29E8: 0B53
        goto            loop_29eb   ; 29E9: 29EB
        goto            loop_29c8   ; 29EA: 29C8
;
; end of loop_29e3
;------------------------------------------------------------


loop_29eb
; jump here from: 29E9
        call            sub_2a83    ; 29EB: 2283

        movlp           0x29        ; 29EC: 31A9
        call            sub_2a06    ; 29ED: 2206

        movlp           0x29        ; 29EE: 31A9
        movwf           mem_d3      ; 29EF: 00D3
        decfsz          mem_d3, W   ; 29F0: 0B53
        goto            loop_29f3   ; 29F1: 29F3
        goto            loop_29d1   ; 29F2: 29D1
;
; end of loop_29eb
;------------------------------------------------------------


loop_29f3
; jump here from: 29F1
        movlb           0x01        ; 29F3: 0021
        movf            mem_db, W   ; 29F4: 085B
        movlb           0x00        ; 29F5: 0020
        movwf           mem_4f      ; 29F6: 00CF
        movf            mem_43, W   ; 29F7: 0843
        movwf           mem_50      ; 29F8: 00D0
        movlb           0x01        ; 29F9: 0021
        movf            mem_da, W   ; 29FA: 085A
        movlb           0x00        ; 29FB: 0020
        movwf           mem_51      ; 29FC: 00D1
        movf            mem_44, W   ; 29FD: 0844
        call            sub_2a06    ; 29FE: 2206

        movlp           0x29        ; 29FF: 31A9
        movwf           mem_53      ; 2A00: 00D3
        decfsz          mem_53, W   ; 2A01: 0B53
        goto            loop_2a04   ; 2A02: 2A04
        goto            loop_29e2   ; 2A03: 29E2

loop_2a04
; jump here from: 2A02
        goto            label_2a6e  ; 2A04: 2A6E
;
; end of loop_2a04
;------------------------------------------------------------


label_2a05
; jump here from: 29C7
        return                      ; 2A05: 0008

;------------------------------------------------------------
; Subroutine: sub_2a06
;
; called from: 29CB
; called from: 29D4
; called from: 29DC
; called from: 29E5
; called from: 29ED
; called from: 29FE

sub_2a06
        movwf           mem_52      ; 2A06: 00D2
        movf            mem_50, W   ; 2A07: 0850
        subwf           mem_52, W   ; 2A08: 0252
        movf            mem_52, W   ; 2A09: 0852
        btfsc           STATUS, C   ; 2A0A: 1803
        goto            loop_2a21   ; 2A0B: 2A21

        subwf           mem_36, W   ; 2A0C: 0236
        btfss           STATUS, C   ; 2A0D: 1C03
        retlw           0x00        ; 2A0E: 3400
        movf            mem_36, W   ; 2A0F: 0836
        xorwf           mem_52, W   ; 2A10: 0652
        btfss           STATUS, Z   ; 2A11: 1D03
        goto            loop_2a18   ; 2A12: 2A18

label_2a13
; jump here from: 2A4A
        movf            mem_4f, W   ; 2A13: 084F
        subwf           mem_37, W   ; 2A14: 0237
        btfss           STATUS, C   ; 2A15: 1C03
        retlw           0x00        ; 2A16: 3400
        retlw           0x01        ; 2A17: 3401

loop_2a18
; jump here from: 2A12
        movf            mem_50, W   ; 2A18: 0850
        subwf           mem_36, W   ; 2A19: 0236
        btfss           STATUS, C   ; 2A1A: 1C03
        retlw           0x01        ; 2A1B: 3401
        movf            mem_36, W   ; 2A1C: 0836
        xorwf           mem_50, W   ; 2A1D: 0650
        btfss           STATUS, Z   ; 2A1E: 1D03
        retlw           0x00        ; 2A1F: 3400
        goto            label_2a3d  ; 2A20: 2A3D

loop_2a21
; jump here from: 2A0B
        xorwf           mem_50, W   ; 2A21: 0650
        btfss           STATUS, Z   ; 2A22: 1D03
        goto            loop_2a35   ; 2A23: 2A35

        movf            mem_36, W   ; 2A24: 0836
        xorwf           mem_52, W   ; 2A25: 0652
        btfss           STATUS, Z   ; 2A26: 1D03
        retlw           0x00        ; 2A27: 3400
        movf            mem_51, W   ; 2A28: 0851
        subwf           mem_4f, W   ; 2A29: 024F
        movf            mem_4f, W   ; 2A2A: 084F
        btfsc           STATUS, C   ; 2A2B: 1803
        goto            loop_2a31   ; 2A2C: 2A31

        subwf           mem_37, W   ; 2A2D: 0237
        btfss           STATUS, C   ; 2A2E: 1C03
        retlw           0x00        ; 2A2F: 3400
        goto            label_2a3d  ; 2A30: 2A3D

loop_2a31
; jump here from: 2A2C
        subwf           mem_37, W   ; 2A31: 0237
        btfsc           STATUS, C   ; 2A32: 1803
        retlw           0x01        ; 2A33: 3401
        goto            label_2a3d  ; 2A34: 2A3D

loop_2a35
; jump here from: 2A23
        movf            mem_50, W   ; 2A35: 0850
        subwf           mem_36, W   ; 2A36: 0236
        btfss           STATUS, C   ; 2A37: 1C03
        retlw           0x01        ; 2A38: 3401
        movf            mem_36, W   ; 2A39: 0836
        xorwf           mem_50, W   ; 2A3A: 0650
        btfss           STATUS, Z   ; 2A3B: 1D03
        goto            loop_2a42   ; 2A3C: 2A42

label_2a3d
; jump here from: 2A20
; jump here from: 2A30
; jump here from: 2A34
        movf            mem_51, W   ; 2A3D: 0851
        subwf           mem_37, W   ; 2A3E: 0237
        btfss           STATUS, C   ; 2A3F: 1C03
        retlw           0x01        ; 2A40: 3401
        retlw           0x00        ; 2A41: 3400

loop_2a42
; jump here from: 2A3C
        movf            mem_52, W   ; 2A42: 0852
        subwf           mem_36, W   ; 2A43: 0236
        btfss           STATUS, C   ; 2A44: 1C03
        retlw           0x00        ; 2A45: 3400
        movf            mem_36, W   ; 2A46: 0836
        xorwf           mem_52, W   ; 2A47: 0652
        btfss           STATUS, Z   ; 2A48: 1D03
        retlw           0x01        ; 2A49: 3401
        goto            label_2a13  ; 2A4A: 2A13

label_2a4b
; jump here from: 29C8
        movlb           0x02        ; 2A4B: 0022
        clrf            mem_169     ; 2A4C: 01E9
        movlb           0x00        ; 2A4D: 0020
        movf            mem_2b, W   ; 2A4E: 082B
        movlb           0x02        ; 2A4F: 0022
        movwf           mem_121     ; 2A50: 00A1
        movlb           0x00        ; 2A51: 0020
        movf            mem_2a, W   ; 2A52: 082A
        movlb           0x02        ; 2A53: 0022
        movwf           mem_120     ; 2A54: 00A0
        return                      ; 2A55: 0008

label_2a56
; jump here from: 29D1
        movlb           0x02        ; 2A56: 0022
        clrf            mem_169     ; 2A57: 01E9
        incf            mem_169, f  ; 2A58: 0AE9
        movlb           0x00        ; 2A59: 0020
        movf            mem_2d, W   ; 2A5A: 082D
        movlb           0x02        ; 2A5B: 0022
        movwf           mem_121     ; 2A5C: 00A1
        movlb           0x00        ; 2A5D: 0020
        movf            mem_2c, W   ; 2A5E: 082C
        movlb           0x02        ; 2A5F: 0022
        movwf           mem_120     ; 2A60: 00A0
        return                      ; 2A61: 0008

label_2a62
; jump here from: 29E2
        movlw           0x02        ; 2A62: 3002
        movlb           0x02        ; 2A63: 0022
        movwf           mem_169     ; 2A64: 00E9
        movlb           0x01        ; 2A65: 0021
        movf            mem_ab, W   ; 2A66: 082B
        movlb           0x02        ; 2A67: 0022
        movwf           mem_121     ; 2A68: 00A1
        movlb           0x01        ; 2A69: 0021
        movf            mem_aa, W   ; 2A6A: 082A
        movlb           0x02        ; 2A6B: 0022
        movwf           mem_120     ; 2A6C: 00A0
        return                      ; 2A6D: 0008

label_2a6e
; jump here from: 2A04
        movlw           0x03        ; 2A6E: 3003
        movlb           0x02        ; 2A6F: 0022
        movwf           mem_169     ; 2A70: 00E9
        movlb           0x01        ; 2A71: 0021
        movf            mem_ad, W   ; 2A72: 082D
        movlb           0x02        ; 2A73: 0022
        movwf           mem_121     ; 2A74: 00A1
        movlb           0x01        ; 2A75: 0021
        movf            mem_ac, W   ; 2A76: 082C
        movlb           0x02        ; 2A77: 0022
        movwf           mem_120     ; 2A78: 00A0
        return                      ; 2A79: 0008

;------------------------------------------------------------
; Subroutine: sub_2a7a
;
; called from: 29C9
; called from: 29D2
; called from: 29E3

sub_2a7a
        movlb           0x00        ; 2A7A: 0020
        movf            mem_3f, W   ; 2A7B: 083F
        movwf           mem_4f      ; 2A7C: 00CF
        movf            mem_3c, W   ; 2A7D: 083C
        movwf           mem_50      ; 2A7E: 00D0
        movf            mem_3d, W   ; 2A7F: 083D
        movwf           mem_51      ; 2A80: 00D1
        movf            mem_3e, W   ; 2A81: 083E
        return                      ; 2A82: 0008

;------------------------------------------------------------
; Subroutine: sub_2a83
;
; called from: 29DA
; called from: 29EB

sub_2a83
        movf            mem_c2, W   ; 2A83: 0842
        movwf           mem_cf      ; 2A84: 00CF
        movf            mem_c0, W   ; 2A85: 0840
        movwf           mem_d0      ; 2A86: 00D0
        movlb           0x01        ; 2A87: 0021
        movf            mem_d9, W   ; 2A88: 0859
        movlb           0x00        ; 2A89: 0020
        movwf           mem_51      ; 2A8A: 00D1
        movf            mem_41, W   ; 2A8B: 0841
        return                      ; 2A8C: 0008

;------------------------------------------------------------
; Subroutine: sub_2a8d
;
; called from: 111B

sub_2a8d
        movlb           0x00        ; 2A8D: 0020
        movf            mem_39, W   ; 2A8E: 0839
        movlb           0x01        ; 2A8F: 0021
        movwf           mem_c2      ; 2A90: 00C2
        movlb           0x00        ; 2A91: 0020
        movf            mem_38, W   ; 2A92: 0838
        movlb           0x01        ; 2A93: 0021
        movwf           mem_c1      ; 2A94: 00C1
        movlb           0x00        ; 2A95: 0020
        movf            mem_35, W   ; 2A96: 0835
        subwf           mem_45, W   ; 2A97: 0245
        btfsc           STATUS, C   ; 2A98: 1803
        goto            loop_2a9f   ; 2A99: 2A9F

        movf            mem_45, W   ; 2A9A: 0845
        subwf           mem_35, W   ; 2A9B: 0235
        movlb           0x02        ; 2A9C: 0022
        movwf           mem_13a     ; 2A9D: 00BA
        return                      ; 2A9E: 0008

loop_2a9f
; jump here from: 2A99
        movlb           0x01        ; 2A9F: 0021
        decfsz          mem_c1, f   ; 2AA0: 0BC1
        goto            loop_2aab   ; 2AA1: 2AAB

        movlw           0x64        ; 2AA2: 3064
        decf            mem_c2, f   ; 2AA3: 03C2
        subwf           mem_c2, W   ; 2AA4: 0242
        btfss           STATUS, C   ; 2AA5: 1C03
        goto            loop_2aa9   ; 2AA6: 2AA9

        movlw           0x63        ; 2AA7: 3063
        movwf           mem_c2      ; 2AA8: 00C2

loop_2aa9
; jump here from: 2AA6
        movlw           0x0c        ; 2AA9: 300C
        movwf           mem_c1      ; 2AAA: 00C1

loop_2aab
; jump here from: 2AA1
        movf            mem_c1, W   ; 2AAB: 0841
        movlb           0x00        ; 2AAC: 0020
        movwf           mem_55      ; 2AAD: 00D5
        movlw           0x14        ; 2AAE: 3014
        movwf           mem_56      ; 2AAF: 00D6
        movlb           0x01        ; 2AB0: 0021
        movf            mem_c2, W   ; 2AB1: 0842
        call            sub_2b5b    ; 2AB2: 235B

        movlb           0x00        ; 2AB3: 0020
        movf            mem_45, W   ; 2AB4: 0845
        movlb           0x01        ; 2AB5: 0021
        subwf           mem_cb, W   ; 2AB6: 024B
        movlb           0x00        ; 2AB7: 0020
        addwf           mem_35, W   ; 2AB8: 0735
        movlb           0x02        ; 2AB9: 0022
        movwf           mem_13a     ; 2ABA: 00BA
        return                      ; 2ABB: 0008

;------------------------------------------------------------
; Subroutine: sub_2abc
;
; called from: 113A

sub_2abc
        movlb           0x00        ; 2ABC: 0020
        clrf            mem_55      ; 2ABD: 01D5
        incf            mem_55, f   ; 2ABE: 0AD5
        clrf            mem_56      ; 2ABF: 01D6
        incf            mem_56, f   ; 2AC0: 0AD6
        movf            mem_39, W   ; 2AC1: 0839
        call            sub_2b5b    ; 2AC2: 235B

        movlp           0x2a        ; 2AC3: 31AA
        call            sub_2ad6    ; 2AC4: 22D6

        movlp           0x2a        ; 2AC5: 31AA
        movf            mem_35, W   ; 2AC6: 0835
        movlb           0x02        ; 2AC7: 0022
        addwf           mem_131, W  ; 2AC8: 0731
        addlw           0xff        ; 2AC9: 3EFF
        movlb           0x00        ; 2ACA: 0020
        movwf           mem_60      ; 2ACB: 00E0
        addwf           mem_22, f   ; 2ACC: 07A2
        btfsc           STATUS, C   ; 2ACD: 1803
        incf            mem_23, f   ; 2ACE: 0AA3
        movlw           0x07        ; 2ACF: 3007
        movwf           mem_20      ; 2AD0: 00A0
        clrf            mem_21      ; 2AD1: 01A1
        call            sub_2bdb    ; 2AD2: 23DB

        incf            mem_22, f   ; 2AD3: 0AA2
        movf            mem_22, W   ; 2AD4: 0822
        return                      ; 2AD5: 0008

;------------------------------------------------------------
; Subroutine: sub_2ad6
;
; called from: 2AC4

sub_2ad6
        movlb           0x00        ; 2AD6: 0020
        movf            mem_39, W   ; 2AD7: 0839
        andlw           0x03        ; 2AD8: 3903
        btfss           STATUS, Z   ; 2AD9: 1D03
        goto            loop_2add   ; 2ADA: 2ADD

        clrf            mem_4f      ; 2ADB: 01CF
        goto            label_2b03  ; 2ADC: 2B03

loop_2add
; jump here from: 2ADA
        movlw           0xff        ; 2ADD: 30FF
        movwf           mem_4f      ; 2ADE: 00CF
        goto            label_2b03  ; 2ADF: 2B03

label_2ae0
; jump here from: 0363
        clrf            mem_22      ; 2AE0: 01A2
        clrf            mem_23      ; 2AE1: 01A3
        return                      ; 2AE2: 0008

label_2ae3
; jump here from: 0365
        movlw           0x1f        ; 2AE3: 301F
        movwf           mem_22      ; 2AE4: 00A2
        clrf            mem_23      ; 2AE5: 01A3
        return                      ; 2AE6: 0008

label_2ae7
; jump here from: 0367
        movlw           0x3b        ; 2AE7: 303B

label_2ae8
; jump here from: 2AEF
; jump here from: 2AF1
; jump here from: 2AF3
; jump here from: 2AF5
; jump here from: 2AF7
; jump here from: 2AF9
        movwf           mem_22      ; 2AE8: 00A2
        clrf            mem_23      ; 2AE9: 01A3

label_2aea
; jump here from: 2B02
        movf            mem_4f, f   ; 2AEA: 08CF
        btfsc           STATUS, Z   ; 2AEB: 1903
        incf            mem_22, f   ; 2AEC: 0AA2
        return                      ; 2AED: 0008

label_2aee
; jump here from: 0369
        movlw           0x5a        ; 2AEE: 305A
        goto            label_2ae8  ; 2AEF: 2AE8

label_2af0
; jump here from: 036B
        movlw           0x78        ; 2AF0: 3078
        goto            label_2ae8  ; 2AF1: 2AE8

label_2af2
; jump here from: 036D
        movlw           0x97        ; 2AF2: 3097
        goto            label_2ae8  ; 2AF3: 2AE8

label_2af4
; jump here from: 036F
        movlw           0xb5        ; 2AF4: 30B5
        goto            label_2ae8  ; 2AF5: 2AE8

label_2af6
; jump here from: 0371
        movlw           0xd4        ; 2AF6: 30D4
        goto            label_2ae8  ; 2AF7: 2AE8

label_2af8
; jump here from: 0373
        movlw           0xf3        ; 2AF8: 30F3
        goto            label_2ae8  ; 2AF9: 2AE8

label_2afa
; jump here from: 0375
        movlw           0x0b        ; 2AFA: 300B
        goto            label_2aff  ; 2AFB: 2AFF

label_2afc
; jump here from: 0377
        movlw           0x30        ; 2AFC: 3030
        goto            label_2aff  ; 2AFD: 2AFF

loop_2afe
; jump here from: 2B06
; jump here from: 2B0B
        movlw           0x4e        ; 2AFE: 304E

label_2aff
; jump here from: 2AFB
; jump here from: 2AFD
        movwf           mem_22      ; 2AFF: 00A2
        movlw           0x01        ; 2B00: 3001
        movwf           mem_23      ; 2B01: 00A3
        goto            label_2aea  ; 2B02: 2AEA

label_2b03
; jump here from: 2ADC
; jump here from: 2ADF
        movf            mem_38, W   ; 2B03: 0838
        addlw           0xff        ; 2B04: 3EFF
        btfss           STATUS, C   ; 2B05: 1C03
        goto            loop_2afe   ; 2B06: 2AFE

        movwf           FSR0L       ; 2B07: 0084
        movlw           0x0b        ; 2B08: 300B
        subwf           FSR0L, W    ; 2B09: 0204
        btfsc           STATUS, C   ; 2B0A: 1803
        goto            loop_2afe   ; 2B0B: 2AFE

        movlp           0x03        ; 2B0C: 3183
        lslf            FSR0L, W    ; 2B0D: 3504
        addlw           0x62        ; 2B0E: 3E62
        movwf           PCL         ; 2B0F: 0082
        return                      ; 2B10: 0008

label_2b11
; jump here from: 2FA6
        goto            label_2b4b  ; 2B11: 2B4B

loop_2b12
; jump here from: 2B4F
        movf            mem_46, W   ; 2B12: 0846
        movwf           mem_35      ; 2B13: 00B5
        movlp           0x26        ; 2B14: 31A6
        call            sub_2627    ; 2B15: 2627

        movlp           0x2a        ; 2B16: 31AA
        movlb           0x01        ; 2B17: 0021
        movwf           mem_d4      ; 2B18: 00D4
        call            sub_2d29    ; 2B19: 2529

        movlp           0x0c        ; 2B1A: 318C
        call            I2CWrite    ; 2B1B: 24B3

        movlw           0x1a        ; 2B1C: 301A
        movwf           mem_bb      ; 2B1D: 00BB

loop_2b1e
; jump here from: 2B2C
; jump here from: 2B30
; jump here from: 2B38
; jump here from: 2B3D
; jump here from: 2B4A
; jump here from: 2B59
        movlb           0x00        ; 2B1E: 0020
        clrf            mem_3a      ; 2B1F: 01BA
        return                      ; 2B20: 0008

loop_2b21
; jump here from: 2B52
        movlp           0x0f        ; 2B21: 318F
        call            sub_0f7b    ; 2B22: 277B

        movlp           0x2a        ; 2B23: 31AA
        call            sub_2b5b    ; 2B24: 235B

        movlp           0x2a        ; 2B25: 31AA
        movlb           0x00        ; 2B26: 0020
        incf            mem_46, f   ; 2B27: 0AC6
        movf            mem_46, W   ; 2B28: 0846
        movlb           0x01        ; 2B29: 0021
        subwf           mem_cb, W   ; 2B2A: 024B
        btfsc           STATUS, C   ; 2B2B: 1803
        goto            loop_2b1e   ; 2B2C: 2B1E

        movlb           0x00        ; 2B2D: 0020
        clrf            mem_46      ; 2B2E: 01C6
        incf            mem_46, f   ; 2B2F: 0AC6
        goto            loop_2b1e   ; 2B30: 2B1E

loop_2b31
; jump here from: 2B55
        movlp           0x0f        ; 2B31: 318F
        call            sub_0f7b    ; 2B32: 277B

        movlp           0x2a        ; 2B33: 31AA
        call            sub_2b5b    ; 2B34: 235B

        movlp           0x2a        ; 2B35: 31AA
        movlb           0x00        ; 2B36: 0020
        decfsz          mem_46, f   ; 2B37: 0BC6
        goto            loop_2b1e   ; 2B38: 2B1E

        movlb           0x01        ; 2B39: 0021
        movf            mem_cb, W   ; 2B3A: 084B
        movlb           0x00        ; 2B3B: 0020
        movwf           mem_46      ; 2B3C: 00C6
        goto            loop_2b1e   ; 2B3D: 2B1E

loop_2b3e
; jump here from: 2B58
        movf            mem_46, W   ; 2B3E: 0846
        movwf           mem_35      ; 2B3F: 00B5
        movlp           0x26        ; 2B40: 31A6
        call            sub_2627    ; 2B41: 2627

        movlp           0x2a        ; 2B42: 31AA
        movlb           0x01        ; 2B43: 0021
        movwf           mem_d4      ; 2B44: 00D4
        call            sub_2d29    ; 2B45: 2529

        movlp           0x0c        ; 2B46: 318C
        call            I2CWrite    ; 2B47: 24B3

        movlp           0x2a        ; 2B48: 31AA
        clrf            mem_bb      ; 2B49: 01BB
        goto            loop_2b1e   ; 2B4A: 2B1E

label_2b4b
; jump here from: 2B11
        movlb           0x00        ; 2B4B: 0020
        movf            mem_3a, W   ; 2B4C: 083A
        xorlw           0x01        ; 2B4D: 3A01
        btfsc           STATUS, Z   ; 2B4E: 1903
        goto            loop_2b12   ; 2B4F: 2B12

        xorlw           0x03        ; 2B50: 3A03
        btfsc           STATUS, Z   ; 2B51: 1903
        goto            loop_2b21   ; 2B52: 2B21

        xorlw           0x01        ; 2B53: 3A01
        btfsc           STATUS, Z   ; 2B54: 1903
        goto            loop_2b31   ; 2B55: 2B31

        xorlw           0x07        ; 2B56: 3A07
        btfsc           STATUS, Z   ; 2B57: 1903
        goto            loop_2b3e   ; 2B58: 2B3E
        goto            loop_2b1e   ; 2B59: 2B1E
;
; end of label_2b4b
;------------------------------------------------------------

        return                      ; 2B5A: 0008

;------------------------------------------------------------
; Subroutine: sub_2b5b
;
; called from: 0ADC
; called from: 0B20
; called from: 2AB2
; called from: 2AC2
; called from: 2B24
; called from: 2B34

sub_2b5b
        movlb           0x00        ; 2B5B: 0020
        movwf           mem_5f      ; 2B5C: 00DF
        movf            mem_55, W   ; 2B5D: 0855
        addlw           0xee        ; 2B5E: 3EEE
        movlp           0x02        ; 2B5F: 3182
        callw                       ; 2B60: 000A

        movlp           0x2b        ; 2B61: 31AB
        movwf           mem_5e      ; 2B62: 00DE
        movf            mem_5e, W   ; 2B63: 085E
        movwf           mem_57      ; 2B64: 00D7
        movlw           0x05        ; 2B65: 3005

loop_2b66
; jump here from: 2B68
        lsrf            mem_57, f   ; 2B66: 36D7
        decfsz          WREG, f     ; 2B67: 0B89
        goto            loop_2b66   ; 2B68: 2B66

        movf            mem_57, W   ; 2B69: 0857
        movwf           mem_5d      ; 2B6A: 00DD
        movlw           0x1f        ; 2B6B: 301F
        andwf           mem_5e, f   ; 2B6C: 05DE
        movlw           0x03        ; 2B6D: 3003
        subwf           mem_55, W   ; 2B6E: 0255
        movf            mem_5f, W   ; 2B6F: 085F
        btfsc           STATUS, C   ; 2B70: 1803
        goto            loop_2b7c   ; 2B71: 2B7C

        andlw           0x03        ; 2B72: 3903
        btfsc           STATUS, Z   ; 2B73: 1903
        goto            loop_2b7b   ; 2B74: 2B7B

        movf            mem_55, W   ; 2B75: 0855
        xorlw           0x02        ; 2B76: 3A02
        btfss           STATUS, Z   ; 2B77: 1D03
        goto            loop_2b7a   ; 2B78: 2B7A

        decf            mem_5e, f   ; 2B79: 03DE

loop_2b7a
; jump here from: 2B78
        incf            mem_5d, f   ; 2B7A: 0ADD

loop_2b7b
; jump here from: 2B74
        movf            mem_5f, W   ; 2B7B: 085F

loop_2b7c
; jump here from: 2B71
        movwf           mem_57      ; 2B7C: 00D7
        lsrf            mem_57, f   ; 2B7D: 36D7
        lsrf            mem_57, f   ; 2B7E: 36D7
        movf            mem_57, W   ; 2B7F: 0857
        addwf           mem_5f, W   ; 2B80: 075F
        movwf           mem_5f      ; 2B81: 00DF
        movlw           0x07        ; 2B82: 3007
        movwf           mem_4f      ; 2B83: 00CF
        clrf            mem_50      ; 2B84: 01D0
        movf            mem_56, W   ; 2B85: 0856
        movwf           mem_57      ; 2B86: 00D7
        clrf            mem_58      ; 2B87: 01D8
        movf            mem_5d, W   ; 2B88: 085D
        addwf           mem_5f, W   ; 2B89: 075F
        movwf           mem_59      ; 2B8A: 00D9
        clrf            mem_5a      ; 2B8B: 01DA
        rlf             mem_5a, f   ; 2B8C: 0DDA
        movf            mem_57, W   ; 2B8D: 0857
        addwf           mem_59, W   ; 2B8E: 0759
        movwf           mem_5b      ; 2B8F: 00DB
        movf            mem_58, W   ; 2B90: 0858
        addwfc          mem_5a, W   ; 2B91: 3D5A
        movwf           mem_5c      ; 2B92: 00DC
        movf            mem_5b, W   ; 2B93: 085B
        addlw           0x02        ; 2B94: 3E02
        movwf           mem_51      ; 2B95: 00D1
        movlw           0x00        ; 2B96: 3000
        addwfc          mem_5c, W   ; 2B97: 3D5C
        movwf           mem_52      ; 2B98: 00D2
        call            sub_2ba2    ; 2B99: 23A2

        movf            mem_4f, W   ; 2B9A: 084F
        movlb           0x02        ; 2B9B: 0022
        movwf           mem_131     ; 2B9C: 00B1
        movlb           0x00        ; 2B9D: 0020
        movf            mem_5e, W   ; 2B9E: 085E
        movlb           0x01        ; 2B9F: 0021
        movwf           mem_cb      ; 2BA0: 00CB
        return                      ; 2BA1: 0008

;------------------------------------------------------------
; Subroutine: sub_2ba2
;
; called from: 2B99

sub_2ba2
        clrf            mem_54      ; 2BA2: 01D4
        btfss           mem_52, 7   ; 2BA3: 1FD2
        goto            loop_2bac   ; 2BA4: 2BAC

        comf            mem_51, f   ; 2BA5: 09D1
        comf            mem_52, f   ; 2BA6: 09D2
        incf            mem_51, f   ; 2BA7: 0AD1
        btfsc           STATUS, Z   ; 2BA8: 1903
        incf            mem_52, f   ; 2BA9: 0AD2
        clrf            mem_54      ; 2BAA: 01D4
        incf            mem_54, f   ; 2BAB: 0AD4

loop_2bac
; jump here from: 2BA4
        btfss           mem_50, 7   ; 2BAC: 1FD0
        goto            loop_2bb3   ; 2BAD: 2BB3

        comf            mem_4f, f   ; 2BAE: 09CF
        comf            mem_50, f   ; 2BAF: 09D0
        incf            mem_4f, f   ; 2BB0: 0ACF
        btfsc           STATUS, Z   ; 2BB1: 1903
        incf            mem_50, f   ; 2BB2: 0AD0

loop_2bb3
; jump here from: 2BAD
        movf            mem_50, W   ; 2BB3: 0850
        iorwf           mem_4f, W   ; 2BB4: 044F
        btfsc           STATUS, Z   ; 2BB5: 1903
        goto            loop_2bce   ; 2BB6: 2BCE

        clrf            mem_53      ; 2BB7: 01D3

label_2bb8
; jump here from: 2BBD
        incf            mem_53, f   ; 2BB8: 0AD3
        btfsc           mem_50, 7   ; 2BB9: 1BD0
        goto            loop_2bbe   ; 2BBA: 2BBE

        lslf            mem_4f, f   ; 2BBB: 35CF
        rlf             mem_50, f   ; 2BBC: 0DD0
        goto            label_2bb8  ; 2BBD: 2BB8

loop_2bbe
; jump here from: 2BBA
; jump here from: 2BCD
        movf            mem_50, W   ; 2BBE: 0850
        subwf           mem_52, W   ; 2BBF: 0252
        btfss           STATUS, Z   ; 2BC0: 1D03
        goto            loop_2bc4   ; 2BC1: 2BC4

        movf            mem_4f, W   ; 2BC2: 084F
        subwf           mem_51, W   ; 2BC3: 0251

loop_2bc4
; jump here from: 2BC1
        btfss           STATUS, C   ; 2BC4: 1C03
        goto            loop_2bca   ; 2BC5: 2BCA

        movf            mem_4f, W   ; 2BC6: 084F
        subwf           mem_51, f   ; 2BC7: 02D1
        movf            mem_50, W   ; 2BC8: 0850
        subwfb          mem_52, f   ; 2BC9: 3BD2

loop_2bca
; jump here from: 2BC5
        lsrf            mem_50, f   ; 2BCA: 36D0
        rrf             mem_4f, f   ; 2BCB: 0CCF
        decfsz          mem_53, f   ; 2BCC: 0BD3
        goto            loop_2bbe   ; 2BCD: 2BBE

loop_2bce
; jump here from: 2BB6
        movf            mem_54, W   ; 2BCE: 0854
        btfsc           STATUS, Z   ; 2BCF: 1903
        goto            loop_2bd6   ; 2BD0: 2BD6

        comf            mem_51, f   ; 2BD1: 09D1
        comf            mem_52, f   ; 2BD2: 09D2
        incf            mem_51, f   ; 2BD3: 0AD1
        btfsc           STATUS, Z   ; 2BD4: 1903
        incf            mem_52, f   ; 2BD5: 0AD2

loop_2bd6
; jump here from: 2BD0
        movf            mem_52, W   ; 2BD6: 0852
        movwf           mem_50      ; 2BD7: 00D0
        movf            mem_51, W   ; 2BD8: 0851
        movwf           mem_4f      ; 2BD9: 00CF
        return                      ; 2BDA: 0008

;------------------------------------------------------------
; Subroutine: sub_2bdb
;
; called from: 2AD2

sub_2bdb
        movf            mem_21, W   ; 2BDB: 0821
        xorwf           mem_23, W   ; 2BDC: 0623
        movlb           0x01        ; 2BDD: 0021
        movwf           mem_bf      ; 2BDE: 00BF
        movlb           0x00        ; 2BDF: 0020
        movf            mem_21, W   ; 2BE0: 0821
        movwf           mem_50      ; 2BE1: 00D0
        movf            mem_20, W   ; 2BE2: 0820
        movwf           mem_4f      ; 2BE3: 00CF
        movf            mem_23, W   ; 2BE4: 0823
        movwf           mem_52      ; 2BE5: 00D2
        movf            mem_22, W   ; 2BE6: 0822
        movwf           mem_51      ; 2BE7: 00D1
        movlp           0x24        ; 2BE8: 31A4
        call            sub_249e    ; 2BE9: 249E

        movlp           0x2a        ; 2BEA: 31AA
        movf            mem_50, W   ; 2BEB: 0850
        movwf           mem_25      ; 2BEC: 00A5
        movf            mem_4f, W   ; 2BED: 084F
        movwf           mem_24      ; 2BEE: 00A4
        movf            mem_21, W   ; 2BEF: 0821
        movwf           mem_50      ; 2BF0: 00D0
        movf            mem_20, W   ; 2BF1: 0820
        movwf           mem_4f      ; 2BF2: 00CF
        movf            mem_23, W   ; 2BF3: 0823
        movwf           mem_52      ; 2BF4: 00D2
        movf            mem_22, W   ; 2BF5: 0822
        movwf           mem_51      ; 2BF6: 00D1
        movlp           0x24        ; 2BF7: 31A4
        call            sub_2479    ; 2BF8: 2479

        movf            mem_50, W   ; 2BF9: 0850
        movwf           mem_23      ; 2BFA: 00A3
        movf            mem_4f, W   ; 2BFB: 084F
        movwf           mem_22      ; 2BFC: 00A2
        return                      ; 2BFD: 0008

;------------------------------------------------------------
; Subroutine: sub_2bfe
;
; called from: 2FBC

sub_2bfe
        movlb           0x02        ; 2BFE: 0022
        bsf             mem_14c, 6  ; 2BFF: 174C
        bsf             mem_14c, 5  ; 2C00: 16CC
        movlp           0x19        ; 2C01: 3199
        call            sub_19ff    ; 2C02: 21FF

        movlp           0x2a        ; 2C03: 31AA
        movlb           0x01        ; 2C04: 0021
        movf            mem_ca, f   ; 2C05: 08CA
        btfss           STATUS, Z   ; 2C06: 1D03
        return                      ; 2C07: 0008
        goto            sub_2d0a    ; 2C08: 2D0A

;------------------------------------------------------------
; Subroutine: sub_2c09
;
; called from: 2F26

sub_2c09
        movlb           0x00        ; 2C09: 0020
        movf            mem_38, W   ; 2C0A: 0838
        movwf           mem_4f      ; 2C0B: 00CF
        movf            mem_39, W   ; 2C0C: 0839
        call            sub_2cd6    ; 2C0D: 24D6

        movlp           0x2a        ; 2C0E: 31AA
        movwf           mem_58      ; 2C0F: 00D8
        movf            mem_35, W   ; 2C10: 0835
        subwf           mem_58, W   ; 2C11: 0258
        btfsc           STATUS, C   ; 2C12: 1803
        goto            loop_2c1f   ; 2C13: 2C1F

        movf            mem_58, W   ; 2C14: 0858
        movwf           mem_35      ; 2C15: 00B5
        movlp           0x26        ; 2C16: 31A6
        call            sub_2627    ; 2C17: 2627

        movlp           0x2a        ; 2C18: 31AA
        movlb           0x01        ; 2C19: 0021
        movwf           mem_d4      ; 2C1A: 00D4
        call            sub_2d29    ; 2C1B: 2529

        movlp           0x0c        ; 2C1C: 318C
        call            I2CWrite    ; 2C1D: 24B3

        movlp           0x2a        ; 2C1E: 31AA

loop_2c1f
; jump here from: 2C13
        movlb           0x02        ; 2C1F: 0022
        movlw           0xf0        ; 2C20: 30F0
        clrf            mem_14b     ; 2C21: 01CB
        clrf            mem_157     ; 2C22: 01D7
        clrf            mem_158     ; 2C23: 01D8
        bcf             mem_14e, 0  ; 2C24: 104E
        andwf           mem_149, f  ; 2C25: 05C9
        movlw           0x8f        ; 2C26: 308F
        andwf           mem_14c, f  ; 2C27: 05CC
        movlw           0x5f        ; 2C28: 305F
        bsf             mem_14c, 7  ; 2C29: 17CC
        movlb           0x01        ; 2C2A: 0021
        andwf           mem_bb, f   ; 2C2B: 05BB
        swapf           mem_d5, W   ; 2C2C: 0E55
        andlw           0x0f        ; 2C2D: 390F
        addlw           0xd8        ; 2C2E: 3ED8
        movlp           0x02        ; 2C2F: 3182
        callw                       ; 2C30: 000A

        movlb           0x02        ; 2C31: 0022
        movwf           mem_14f     ; 2C32: 00CF
        movlb           0x01        ; 2C33: 0021
        movf            mem_d5, W   ; 2C34: 0855
        andlw           0x0f        ; 2C35: 390F
        addlw           0xd8        ; 2C36: 3ED8
        movlp           0x02        ; 2C37: 3182
        callw                       ; 2C38: 000A

        movlb           0x02        ; 2C39: 0022
        movwf           mem_150     ; 2C3A: 00D0
        movlb           0x01        ; 2C3B: 0021
        swapf           mem_d6, W   ; 2C3C: 0E56
        andlw           0x0f        ; 2C3D: 390F
        addlw           0xd8        ; 2C3E: 3ED8
        movlp           0x02        ; 2C3F: 3182
        callw                       ; 2C40: 000A

        movlb           0x02        ; 2C41: 0022
        movwf           mem_151     ; 2C42: 00D1
        movlb           0x01        ; 2C43: 0021
        movf            mem_d6, W   ; 2C44: 0856
        andlw           0x0f        ; 2C45: 390F
        addlw           0xd8        ; 2C46: 3ED8
        movlp           0x02        ; 2C47: 3182
        callw                       ; 2C48: 000A

        movlp           0x2c        ; 2C49: 31AC
        movlb           0x02        ; 2C4A: 0022
        movwf           mem_152     ; 2C4B: 00D2
        movlb           0x01        ; 2C4C: 0021
        movf            mem_bc, W   ; 2C4D: 083C
        movlp           0x2c        ; 2C4E: 31AC
        btfsc           STATUS, Z   ; 2C4F: 1903
        goto            loop_2c55   ; 2C50: 2C55

        movlp           0x2a        ; 2C51: 31AA
        bsf             mem_bb, 6   ; 2C52: 173B
        movlp           0x2c        ; 2C53: 31AC
        goto            label_2c56  ; 2C54: 2C56

loop_2c55
; jump here from: 2C50
        bcf             mem_bb, 6   ; 2C55: 133B

label_2c56
; jump here from: 2C54
        movf            mem_c8, W   ; 2C56: 0848
        btfsc           STATUS, Z   ; 2C57: 1903
        goto            loop_2c60   ; 2C58: 2C60

        movlw           0xf0        ; 2C59: 30F0
        movlb           0x02        ; 2C5A: 0022
        iorwf           mem_14d, f  ; 2C5B: 04CD
        movlp           0x1d        ; 2C5C: 319D
        call            sub_1d44    ; 2C5D: 2544

        movlp           0x2a        ; 2C5E: 31AA
        goto            label_2c9e  ; 2C5F: 2C9E

loop_2c60
; jump here from: 2C58
        movlw           0x0f        ; 2C60: 300F
        movlb           0x02        ; 2C61: 0022
        andwf           mem_14d, f  ; 2C62: 05CD
        movlb           0x01        ; 2C63: 0021
        movf            mem_c7, W   ; 2C64: 0847
        btfsc           STATUS, Z   ; 2C65: 1903
        goto            loop_2c80   ; 2C66: 2C80
        goto            label_2c71  ; 2C67: 2C71
;
; end of loop_2c60
;------------------------------------------------------------


loop_2c68
; jump here from: 2C75
        bsf             mem_14d, 4  ; 2C68: 164D
        goto            loop_2c80   ; 2C69: 2C80

loop_2c6a
; jump here from: 2C78
        movlw           0x30        ; 2C6A: 3030
        goto            label_2c6f  ; 2C6B: 2C6F

loop_2c6c
; jump here from: 2C7B
        movlw           0x70        ; 2C6C: 3070
        goto            label_2c6f  ; 2C6D: 2C6F

loop_2c6e
; jump here from: 2C7E
        movlw           0xf0        ; 2C6E: 30F0

label_2c6f
; jump here from: 2C6B
; jump here from: 2C6D
        iorwf           mem_cd, f   ; 2C6F: 04CD
        goto            loop_2c80   ; 2C70: 2C80

label_2c71
; jump here from: 2C67
        movlb           0x02        ; 2C71: 0022
        movf            mem_127, W  ; 2C72: 0827
        xorlw           0x01        ; 2C73: 3A01
        btfsc           STATUS, Z   ; 2C74: 1903
        goto            loop_2c68   ; 2C75: 2C68

        xorlw           0x03        ; 2C76: 3A03
        btfsc           STATUS, Z   ; 2C77: 1903
        goto            loop_2c6a   ; 2C78: 2C6A

        xorlw           0x01        ; 2C79: 3A01
        btfsc           STATUS, Z   ; 2C7A: 1903
        goto            loop_2c6c   ; 2C7B: 2C6C

        xorlw           0x07        ; 2C7C: 3A07
        btfsc           STATUS, Z   ; 2C7D: 1903
        goto            loop_2c6e   ; 2C7E: 2C6E
        goto            loop_2c80   ; 2C7F: 2C80
;
; end of label_2c71
;------------------------------------------------------------


loop_2c80
; jump here from: 2C66
; jump here from: 2C69
; jump here from: 2C70
; jump here from: 2C7F
        movlb           0x01        ; 2C80: 0021
        decfsz          mem_c7, W   ; 2C81: 0B47
        goto            loop_2c86   ; 2C82: 2C86

        movf            mem_b9, f   ; 2C83: 08B9
        btfss           STATUS, Z   ; 2C84: 1D03
        goto            loop_2c89   ; 2C85: 2C89

loop_2c86
; jump here from: 2C82
; jump here from: 2C8B
        call            sub_2d0a    ; 2C86: 250A

        movlp           0x2a        ; 2C87: 31AA
        goto            label_2c9e  ; 2C88: 2C9E

loop_2c89
; jump here from: 2C85
        movf            mem_bd, W   ; 2C89: 083D
        btfss           STATUS, Z   ; 2C8A: 1D03
        goto            loop_2c86   ; 2C8B: 2C86

        movlb           0x02        ; 2C8C: 0022
        movlw           0xf1        ; 2C8D: 30F1
        clrf            mem_153     ; 2C8E: 01D3
        clrf            mem_154     ; 2C8F: 01D4
        clrf            mem_155     ; 2C90: 01D5
        clrf            mem_156     ; 2C91: 01D6
        movlb           0x01        ; 2C92: 0021
        andwf           mem_bb, f   ; 2C93: 05BB
        goto            label_2c9e  ; 2C94: 2C9E

loop_2c95
; jump here from: 2CA2
        call            sub_2cf8    ; 2C95: 24F8

        movlp           0x2a        ; 2C96: 31AA
        goto            label_2caa  ; 2C97: 2CAA

loop_2c98
; jump here from: 2CA5
        call            sub_2d1f    ; 2C98: 251F

        movlp           0x2a        ; 2C99: 31AA
        goto            label_2caa  ; 2C9A: 2CAA

loop_2c9b
; jump here from: 2CA8
        call            sub_2cff    ; 2C9B: 24FF

        movlp           0x2a        ; 2C9C: 31AA
        goto            label_2caa  ; 2C9D: 2CAA

label_2c9e
; jump here from: 2C5F
; jump here from: 2C88
; jump here from: 2C94
        movlb           0x01        ; 2C9E: 0021
        movf            mem_e5, W   ; 2C9F: 0865
        xorlw           0x00        ; 2CA0: 3A00
        btfsc           STATUS, Z   ; 2CA1: 1903
        goto            loop_2c95   ; 2CA2: 2C95

        xorlw           0x01        ; 2CA3: 3A01
        btfsc           STATUS, Z   ; 2CA4: 1903
        goto            loop_2c98   ; 2CA5: 2C98

        xorlw           0x03        ; 2CA6: 3A03
        btfsc           STATUS, Z   ; 2CA7: 1903
        goto            loop_2c9b   ; 2CA8: 2C9B
        goto            label_2caa  ; 2CA9: 2CAA
;
; end of label_2c9e
;------------------------------------------------------------


label_2caa
; jump here from: 2C97
; jump here from: 2C9A
; jump here from: 2C9D
; jump here from: 2CA9
        movlb           0x01        ; 2CAA: 0021
        movf            mem_b2, f   ; 2CAB: 08B2
        btfss           STATUS, Z   ; 2CAC: 1D03
        goto            loop_2cb1   ; 2CAD: 2CB1

        movlb           0x02        ; 2CAE: 0022
        bcf             mem_14d, 1  ; 2CAF: 10CD
        goto            label_2cb3  ; 2CB0: 2CB3

loop_2cb1
; jump here from: 2CAD
        movlb           0x02        ; 2CB1: 0022
        bsf             mem_14d, 1  ; 2CB2: 14CD

label_2cb3
; jump here from: 2CB0
        movf            mem_136, W  ; 2CB3: 0836
        btfsc           STATUS, Z   ; 2CB4: 1903
        goto            loop_2cb8   ; 2CB5: 2CB8

        bsf             mem_14c, 3  ; 2CB6: 15CC
        goto            label_2cb9  ; 2CB7: 2CB9

loop_2cb8
; jump here from: 2CB5
        bcf             mem_14c, 3  ; 2CB8: 11CC

label_2cb9
; jump here from: 2CB7
        movlb           0x01        ; 2CB9: 0021
        movf            mem_c8, W   ; 2CBA: 0848
        btfsc           STATUS, Z   ; 2CBB: 1903
        goto            loop_2cc1   ; 2CBC: 2CC1

        movlb           0x03        ; 2CBD: 0023
        movf            mem_1d1, W  ; 2CBE: 0851
        btfsc           STATUS, Z   ; 2CBF: 1903
        goto            loop_2cc4   ; 2CC0: 2CC4

loop_2cc1
; jump here from: 2CBC
; jump here from: 2CC7
        movlb           0x02        ; 2CC1: 0022
        bcf             mem_14d, 0  ; 2CC2: 104D
        goto            label_2cca  ; 2CC3: 2CCA

loop_2cc4
; jump here from: 2CC0
        movlb           0x01        ; 2CC4: 0021
        movf            mem_bd, W   ; 2CC5: 083D
        btfsc           STATUS, Z   ; 2CC6: 1903
        goto            loop_2cc1   ; 2CC7: 2CC1

        movlb           0x02        ; 2CC8: 0022
        bsf             mem_14d, 0  ; 2CC9: 144D

label_2cca
; jump here from: 2CC3
        movlb           0x03        ; 2CCA: 0023
        decfsz          mem_1cd, W  ; 2CCB: 0B4D
        goto            loop_2cd0   ; 2CCC: 2CD0

loop_2ccd
; jump here from: 2CD2
        movlb           0x02        ; 2CCD: 0022
        bcf             mem_14d, 2  ; 2CCE: 114D
        return                      ; 2CCF: 0008

loop_2cd0
; jump here from: 2CCC
        movlb           0x01        ; 2CD0: 0021
        decfsz          mem_bd, W   ; 2CD1: 0B3D
        goto            loop_2ccd   ; 2CD2: 2CCD

        movlb           0x02        ; 2CD3: 0022
        bsf             mem_14d, 2  ; 2CD4: 154D
        return                      ; 2CD5: 0008

;------------------------------------------------------------
; Subroutine: sub_2cd6
;
; called from: 2C0D

sub_2cd6
        movwf           mem_50      ; 2CD6: 00D0
        goto            label_2ce9  ; 2CD7: 2CE9

label_2cd8
; jump here from: 034B
; jump here from: 034F
; jump here from: 0353
; jump here from: 0357
; jump here from: 0359
; jump here from: 035D
; jump here from: 0361
        movlw           0x1f        ; 2CD8: 301F
        goto            label_2ce7  ; 2CD9: 2CE7

label_2cda
; jump here from: 034D
        movf            mem_50, f   ; 2CDA: 08D0
        btfss           STATUS, Z   ; 2CDB: 1D03
        goto            loop_2cdf   ; 2CDC: 2CDF

loop_2cdd
; jump here from: 2CE3
        movlw           0x1d        ; 2CDD: 301D
        goto            label_2ce7  ; 2CDE: 2CE7

loop_2cdf
; jump here from: 2CDC
        movlw           0x03        ; 2CDF: 3003
        andwf           mem_50, f   ; 2CE0: 05D0
        movf            mem_50, f   ; 2CE1: 08D0
        btfsc           STATUS, Z   ; 2CE2: 1903
        goto            loop_2cdd   ; 2CE3: 2CDD

        movlw           0x1c        ; 2CE4: 301C
        goto            label_2ce7  ; 2CE5: 2CE7

label_2ce6
; jump here from: 0351
; jump here from: 0355
; jump here from: 035B
; jump here from: 035F
        movlw           0x1e        ; 2CE6: 301E

label_2ce7
; jump here from: 2CD9
; jump here from: 2CDE
; jump here from: 2CE5
        movwf           mem_51      ; 2CE7: 00D1
        goto            loop_2cf6   ; 2CE8: 2CF6

label_2ce9
; jump here from: 2CD7
        movf            mem_4f, W   ; 2CE9: 084F
        addlw           0xff        ; 2CEA: 3EFF
        btfss           STATUS, C   ; 2CEB: 1C03
        goto            loop_2cf6   ; 2CEC: 2CF6

        movwf           FSR0L       ; 2CED: 0084
        movlw           0x0c        ; 2CEE: 300C
        subwf           FSR0L, W    ; 2CEF: 0204
        btfsc           STATUS, C   ; 2CF0: 1803
        goto            loop_2cf6   ; 2CF1: 2CF6

        movlp           0x03        ; 2CF2: 3183
        lslf            FSR0L, W    ; 2CF3: 3504
        addlw           0x4a        ; 2CF4: 3E4A
        movwf           PCL         ; 2CF5: 0082

loop_2cf6
; jump here from: 2CE8
; jump here from: 2CEC
; jump here from: 2CF1
        movf            mem_51, W   ; 2CF6: 0851
        return                      ; 2CF7: 0008

;------------------------------------------------------------
; Subroutine: sub_2cf8
;
; called from: 2C95

sub_2cf8
        movlb           0x01        ; 2CF8: 0021
        movlw           0xf0        ; 2CF9: 30F0
        bsf             mem_bb, 0   ; 2CFA: 143B
        call            sub_2d31    ; 2CFB: 2531

        bcf             mem_ce, 5   ; 2CFC: 12CE
        andwf           mem_ce, f   ; 2CFD: 05CE
        return                      ; 2CFE: 0008

;------------------------------------------------------------
; Subroutine: sub_2cff
;
; called from: 2C9B

sub_2cff
        movlb           0x01        ; 2CFF: 0021
        movlw           0xf0        ; 2D00: 30F0
        bcf             mem_bb, 0   ; 2D01: 103B
        movlb           0x02        ; 2D02: 0022
        andwf           mem_14a, f  ; 2D03: 05CA
        movlw           0x0f        ; 2D04: 300F
        andwf           mem_149, f  ; 2D05: 05C9
        movlw           0x06        ; 2D06: 3006
        bsf             mem_14e, 5  ; 2D07: 16CE
        iorwf           mem_14e, f  ; 2D08: 04CE
        return                      ; 2D09: 0008

;------------------------------------------------------------
; Subroutine: sub_2d0a
;
; called from: 2C86

sub_2d0a
; jump here from: 185F
; jump here from: 2C08
        movlw           0xe9        ; 2D0A: 30E9
        movlp           0x02        ; 2D0B: 3182
        callw                       ; 2D0C: 000A

        movlb           0x02        ; 2D0D: 0022
        movwf           mem_153     ; 2D0E: 00D3
        movlw           0xe9        ; 2D0F: 30E9
        movlp           0x02        ; 2D10: 3182
        callw                       ; 2D11: 000A

        movwf           mem_154     ; 2D12: 00D4
        movlw           0xe9        ; 2D13: 30E9
        movlp           0x02        ; 2D14: 3182
        callw                       ; 2D15: 000A

        movwf           mem_155     ; 2D16: 00D5
        movlw           0xe9        ; 2D17: 30E9
        movlp           0x02        ; 2D18: 3182
        callw                       ; 2D19: 000A

        movwf           mem_156     ; 2D1A: 00D6
        movlw           0xf1        ; 2D1B: 30F1
        movlb           0x01        ; 2D1C: 0021
        andwf           mem_bb, f   ; 2D1D: 05BB
        return                      ; 2D1E: 0008

;------------------------------------------------------------
; Subroutine: sub_2d1f
;
; called from: 2C98

sub_2d1f
        movlb           0x01        ; 2D1F: 0021
        bcf             mem_bb, 0   ; 2D20: 103B
        movf            mem_b4, W   ; 2D21: 0834
        movlp           0x1d        ; 2D22: 319D
        call            sub_1d1e    ; 2D23: 251E

        movlb           0x02        ; 2D24: 0022
        movlw           0x06        ; 2D25: 3006
        bcf             mem_14e, 5  ; 2D26: 12CE
        iorwf           mem_14e, f  ; 2D27: 04CE
        return                      ; 2D28: 0008

;------------------------------------------------------------
; Subroutine: sub_2d29
;
; called from: 0B1A
; called from: 2B19
; called from: 2B45
; called from: 2C1B

sub_2d29
        movlw           0x12        ; 2D29: 3012
        movlb           0x00        ; 2D2A: 0020
        movwf           mem_55      ; 2D2B: 00D5
        movlb           0x01        ; 2D2C: 0021
        movf            mem_d4, W   ; 2D2D: 0854
        movlb           0x00        ; 2D2E: 0020
        movwf           mem_56      ; 2D2F: 00D6
        retlw           0x88        ; 2D30: 3488

;------------------------------------------------------------
; Subroutine: sub_2d31
;
; called from: 1D06
; called from: 1D0F
; called from: 2CFB

sub_2d31
        movlb           0x02        ; 2D31: 0022
        andwf           mem_14a, f  ; 2D32: 05CA
        movlw           0x0f        ; 2D33: 300F
        andwf           mem_149, f  ; 2D34: 05C9
        retlw           0xf9        ; 2D35: 34F9

;------------------------------------------------------------
; Subroutine: sub_2d36
;
; called from: 0A63

sub_2d36
        movlw           0x2a        ; 2D36: 302A
        movlb           0x00        ; 2D37: 0020
        movwf           mem_4f      ; 2D38: 00CF
        clrf            mem_50      ; 2D39: 01D0
        movlb           0x01        ; 2D3A: 0021
        movf            mem_a5, W   ; 2D3B: 0825
        movlb           0x00        ; 2D3C: 0020
        movwf           mem_52      ; 2D3D: 00D2
        movlb           0x01        ; 2D3E: 0021
        movf            mem_a4, W   ; 2D3F: 0824
        movlb           0x00        ; 2D40: 0020
        movwf           mem_51      ; 2D41: 00D1
        movlp           0x24        ; 2D42: 31A4
        call            sub_2479    ; 2D43: 2479

        movlp           0x2d        ; 2D44: 31AD
        movf            mem_50, W   ; 2D45: 0850
        movwf           mem_5b      ; 2D46: 00DB
        movf            mem_4f, W   ; 2D47: 084F
        movwf           mem_5a      ; 2D48: 00DA
        movwf           mem_5c      ; 2D49: 00DC
        movlw           0x79        ; 2D4A: 3079
        addwf           mem_5c, f   ; 2D4B: 07DC
        movlw           0x2a        ; 2D4C: 302A
        movwf           mem_4f      ; 2D4D: 00CF
        clrf            mem_50      ; 2D4E: 01D0
        movlb           0x01        ; 2D4F: 0021
        movf            mem_a5, W   ; 2D50: 0825
        movlb           0x00        ; 2D51: 0020
        movwf           mem_52      ; 2D52: 00D2
        movlb           0x01        ; 2D53: 0021
        movf            mem_a4, W   ; 2D54: 0824
        movlb           0x00        ; 2D55: 0020
        movwf           mem_51      ; 2D56: 00D1
        movlp           0x24        ; 2D57: 31A4
        call            sub_249e    ; 2D58: 249E

        movlp           0x2d        ; 2D59: 31AD
        movf            mem_50, W   ; 2D5A: 0850
        movwf           mem_5b      ; 2D5B: 00DB
        movf            mem_4f, W   ; 2D5C: 084F
        movwf           mem_5a      ; 2D5D: 00DA
        movwf           mem_5d      ; 2D5E: 00DD
        movwf           mem_4f      ; 2D5F: 00CF
        movlw           0x06        ; 2D60: 3006
        call            sub_2ddf    ; 2D61: 25DF

        movlp           0x2d        ; 2D62: 31AD
        movwf           mem_5d      ; 2D63: 00DD
        movlb           0x01        ; 2D64: 0021
        movf            mem_d0, W   ; 2D65: 0850
        movlb           0x00        ; 2D66: 0020
        movwf           mem_23      ; 2D67: 00A3
        movlb           0x01        ; 2D68: 0021
        movf            mem_d1, W   ; 2D69: 0851
        movlb           0x00        ; 2D6A: 0020
        movwf           mem_22      ; 2D6B: 00A2
        movlb           0x01        ; 2D6C: 0021
        movf            mem_cf, W   ; 2D6D: 084F
        movlb           0x00        ; 2D6E: 0020
        movwf           mem_33      ; 2D6F: 00B3
        movlb           0x02        ; 2D70: 0022
        movf            mem_15a, W  ; 2D71: 085A
        movlb           0x00        ; 2D72: 0020
        movwf           mem_21      ; 2D73: 00A1
        movlb           0x02        ; 2D74: 0022
        movf            mem_15b, W  ; 2D75: 085B
        movlb           0x00        ; 2D76: 0020
        movwf           mem_20      ; 2D77: 00A0
        movlb           0x02        ; 2D78: 0022
        movf            mem_159, W  ; 2D79: 0859
        movlb           0x01        ; 2D7A: 0021
        movwf           mem_ba      ; 2D7B: 00BA
        movlb           0x00        ; 2D7C: 0020
        movf            mem_21, W   ; 2D7D: 0821
        iorwf           mem_20, W   ; 2D7E: 0420
        btfss           STATUS, Z   ; 2D7F: 1D03
        goto            loop_2da5   ; 2D80: 2DA5

        movlb           0x01        ; 2D81: 0021
        movlp           0x27        ; 2D82: 31A7
        call            sub_272c    ; 2D83: 272C

        movlp           0x2d        ; 2D84: 31AD
        movlp           0x0c        ; 2D85: 318C
        call            I2CWrite    ; 2D86: 24B3

        movlp           0x2d        ; 2D87: 31AD
        movlp           0x27        ; 2D88: 31A7
        call            sub_2760    ; 2D89: 2760

        movlp           0x2d        ; 2D8A: 31AD
        movlp           0x0c        ; 2D8B: 318C
        call            I2CWrite    ; 2D8C: 24B3

        movlp           0x2d        ; 2D8D: 31AD
        movlp           0x27        ; 2D8E: 31A7
        call            sub_2757    ; 2D8F: 2757

        movlp           0x2d        ; 2D90: 31AD
        movlp           0x0c        ; 2D91: 318C
        call            I2CWrite    ; 2D92: 24B3

        movlp           0x2d        ; 2D93: 31AD
        movlp           0x27        ; 2D94: 31A7
        call            sub_278b    ; 2D95: 278B

        movlp           0x2d        ; 2D96: 31AD
        movlp           0x0c        ; 2D97: 318C
        call            I2CWrite    ; 2D98: 24B3

        movlp           0x2d        ; 2D99: 31AD
        movlp           0x27        ; 2D9A: 31A7
        call            sub_2770    ; 2D9B: 2770

        movlp           0x2d        ; 2D9C: 31AD
        movlp           0x0c        ; 2D9D: 318C
        call            I2CWrite    ; 2D9E: 24B3

        movlp           0x2d        ; 2D9F: 31AD
        movlp           0x27        ; 2DA0: 31A7
        call            sub_2777    ; 2DA1: 2777

        movlp           0x2d        ; 2DA2: 31AD

label_2da3
; jump here from: 2DD8
        movlp           0x0c        ; 2DA3: 318C
        goto            I2CWrite    ; 2DA4: 2CB3

loop_2da5
; jump here from: 2D80
        call            sub_2e22    ; 2DA5: 2622

        movlp           0x2d        ; 2DA6: 31AD
        call            sub_2deb    ; 2DA7: 25EB

        movlp           0x2d        ; 2DA8: 31AD
        movlb           0x00        ; 2DA9: 0020
        movf            mem_22, W   ; 2DAA: 0822
        movwf           mem_58      ; 2DAB: 00D8
        movlw           0x07        ; 2DAC: 3007
        andwf           mem_23, W   ; 2DAD: 0523
        movwf           mem_59      ; 2DAE: 00D9
        iorwf           mem_58, W   ; 2DAF: 0458
        btfsc           STATUS, Z   ; 2DB0: 1903
        goto            loop_2ddc   ; 2DB1: 2DDC

        movlb           0x03        ; 2DB2: 0023
        decfsz          mem_1c3, W  ; 2DB3: 0B43
        goto            loop_2dd9   ; 2DB4: 2DD9

        clrf            mem_1c3     ; 2DB5: 01C3
        movlb           0x01        ; 2DB6: 0021
        movlp           0x27        ; 2DB7: 31A7
        call            sub_272c    ; 2DB8: 272C

        movlp           0x2d        ; 2DB9: 31AD
        movlp           0x0c        ; 2DBA: 318C
        call            I2CWrite    ; 2DBB: 24B3

        movlp           0x2d        ; 2DBC: 31AD
        movlp           0x27        ; 2DBD: 31A7
        call            sub_2760    ; 2DBE: 2760

        movlp           0x2d        ; 2DBF: 31AD
        movlp           0x0c        ; 2DC0: 318C
        call            I2CWrite    ; 2DC1: 24B3

        movlp           0x2d        ; 2DC2: 31AD
        movlp           0x27        ; 2DC3: 31A7
        call            sub_2757    ; 2DC4: 2757

        movlp           0x2d        ; 2DC5: 31AD
        movlp           0x0c        ; 2DC6: 318C
        call            I2CWrite    ; 2DC7: 24B3

        movlp           0x2d        ; 2DC8: 31AD
        movlp           0x27        ; 2DC9: 31A7
        call            sub_278b    ; 2DCA: 278B

        movlp           0x2d        ; 2DCB: 31AD
        movlp           0x0c        ; 2DCC: 318C
        call            I2CWrite    ; 2DCD: 24B3

        movlp           0x2d        ; 2DCE: 31AD
        movlp           0x27        ; 2DCF: 31A7
        call            sub_2770    ; 2DD0: 2770

        movlp           0x2d        ; 2DD1: 31AD
        movlp           0x0c        ; 2DD2: 318C
        call            I2CWrite    ; 2DD3: 24B3

        movlp           0x2d        ; 2DD4: 31AD
        movlp           0x27        ; 2DD5: 31A7
        call            sub_2777    ; 2DD6: 2777

        movlp           0x2d        ; 2DD7: 31AD
        goto            label_2da3  ; 2DD8: 2DA3

loop_2dd9
; jump here from: 2DB4
        clrf            mem_1c3     ; 2DD9: 01C3
        incf            mem_1c3, f  ; 2DDA: 0AC3
        return                      ; 2DDB: 0008

loop_2ddc
; jump here from: 2DB1
        movlb           0x03        ; 2DDC: 0023
        clrf            mem_1c3     ; 2DDD: 01C3
        return                      ; 2DDE: 0008

;------------------------------------------------------------
; Subroutine: sub_2ddf
;
; called from: 2D61
; called from: 3318
; called from: 3477
; called from: 352D

sub_2ddf
        movwf           mem_51      ; 2DDF: 00D1
        clrf            mem_50      ; 2DE0: 01D0

loop_2de1
; jump here from: 2DE8
        movf            mem_4f, W   ; 2DE1: 084F
        btfsc           mem_51, 0   ; 2DE2: 1851
        addwf           mem_50, f   ; 2DE3: 07D0
        lslf            mem_4f, f   ; 2DE4: 35CF
        lsrf            mem_51, f   ; 2DE5: 36D1
        movf            mem_51, f   ; 2DE6: 08D1
        btfss           STATUS, Z   ; 2DE7: 1D03
        goto            loop_2de1   ; 2DE8: 2DE1

        movf            mem_50, W   ; 2DE9: 0850
        return                      ; 2DEA: 0008

;------------------------------------------------------------
; Subroutine: sub_2deb
;
; called from: 03B9
; called from: 282B
; called from: 2DA7
; called from: 349C

sub_2deb
        movlb           0x01        ; 2DEB: 0021
        clrf            mem_bf      ; 2DEC: 01BF
        movlb           0x00        ; 2DED: 0020
        btfss           mem_23, 7   ; 2DEE: 1FA3
        goto            loop_2df4   ; 2DEF: 2DF4

        movlb           0x01        ; 2DF0: 0021
        bsf             mem_bf, 7   ; 2DF1: 17BF
        call            sub_2e07    ; 2DF2: 2607

        movlp           0x2d        ; 2DF3: 31AD

loop_2df4
; jump here from: 2DEF
        btfss           mem_33, 7   ; 2DF4: 1FB3
        goto            loop_2df9   ; 2DF5: 2DF9

        clrf            mem_23      ; 2DF6: 01A3
        clrf            mem_22      ; 2DF7: 01A2
        return                      ; 2DF8: 0008

loop_2df9
; jump here from: 2DF5
        movlw           0x10        ; 2DF9: 3010
        subwf           mem_b3, W   ; 2DFA: 0233
        btfss           STATUS, C   ; 2DFB: 1C03
        goto            loop_2e01   ; 2DFC: 2E01

        movlw           0xff        ; 2DFD: 30FF
        movwf           mem_a3      ; 2DFE: 00A3
        movwf           mem_a2      ; 2DFF: 00A2
        return                      ; 2E00: 0008

loop_2e01
; jump here from: 2DFC
        call            sub_2e10    ; 2E01: 2610

        movlp           0x2d        ; 2E02: 31AD
        movlb           0x01        ; 2E03: 0021
        btfss           mem_bf, 7   ; 2E04: 1FBF
        return                      ; 2E05: 0008
        goto            sub_2e07    ; 2E06: 2E07

;------------------------------------------------------------
; Subroutine: sub_2e07
;
; called from: 1B62
; called from: 25B3
; called from: 2DF2
; called from: 2E7A

sub_2e07
; jump here from: 1B6F
; jump here from: 2E06
        movlb           0x00        ; 2E07: 0020
        movlw           0xff        ; 2E08: 30FF
        decf            mem_22, f   ; 2E09: 03A2
        xorwf           mem_22, f   ; 2E0A: 06A2
        movf            mem_22, f   ; 2E0B: 08A2
        btfsc           STATUS, Z   ; 2E0C: 1903
        decf            mem_23, f   ; 2E0D: 03A3
        xorwf           mem_23, f   ; 2E0E: 06A3
        return                      ; 2E0F: 0008

;------------------------------------------------------------
; Subroutine: sub_2e10
;
; called from: 1E6B
; called from: 2E01

sub_2e10
; jump here from: 2E21
        movf            mem_33, W   ; 2E10: 0833
        xorlw           0x0f        ; 2E11: 3A0F
        btfsc           STATUS, Z   ; 2E12: 1903
        return                      ; 2E13: 0008
        movf            mem_23, W   ; 2E14: 0823
        movwf           mem_4f      ; 2E15: 00CF
        movlw           0x01        ; 2E16: 3001
        andwf           mem_4f, f   ; 2E17: 05CF
        lsrf            mem_23, W   ; 2E18: 3623
        movwf           mem_23      ; 2E19: 00A3
        rrf             mem_4f, f   ; 2E1A: 0CCF
        clrf            mem_4f      ; 2E1B: 01CF
        rrf             mem_4f, f   ; 2E1C: 0CCF
        lsrf            mem_22, f   ; 2E1D: 36A2
        movf            mem_4f, W   ; 2E1E: 084F
        iorwf           mem_22, f   ; 2E1F: 04A2
        incf            mem_33, f   ; 2E20: 0AB3
        goto            sub_2e10    ; 2E21: 2E10

;------------------------------------------------------------
; Subroutine: sub_2e22
;
; called from: 061B
; called from: 062C
; called from: 1A17
; called from: 1A28
; called from: 1A52
; called from: 1A69
; called from: 1AD9
; called from: 1AE7
; called from: 1D5A
; called from: 1E65
; called from: 1F62
; called from: 1F79
; called from: 286F
; called from: 2DA5

sub_2e22
; jump here from: 3012
        movlp           0x25        ; 2E22: 31A5
        call            sub_2598    ; 2E23: 2598

        movlp           0x2d        ; 2E24: 31AD
        clrf            mem_a5      ; 2E25: 01A5
        clrf            mem_a4      ; 2E26: 01A4
        call            sub_2e7d    ; 2E27: 267D

        movlp           0x2d        ; 2E28: 31AD
        clrf            mem_a4      ; 2E29: 01A4
        clrf            mem_a5      ; 2E2A: 01A5
        movlb           0x02        ; 2E2B: 0022
        clrf            mem_166     ; 2E2C: 01E6
        movlb           0x00        ; 2E2D: 0020
        movf            mem_21, W   ; 2E2E: 0821
        btfsc           STATUS, Z   ; 2E2F: 1903
        movf            mem_20, f   ; 2E30: 08A0
        btfsc           STATUS, Z   ; 2E31: 1903
        return                      ; 2E32: 0008
        call            sub_2eb6    ; 2E33: 26B6

label_2e34
; jump here from: 2E6A
        movlb           0x00        ; 2E34: 0020
        movf            mem_23, W   ; 2E35: 0823
        movwf           mem_26      ; 2E36: 00A6
        movlw           0x01        ; 2E37: 3001
        movwf           mem_53      ; 2E38: 00D3
        movf            mem_22, W   ; 2E39: 0822
        movlp           0x27        ; 2E3A: 31A7
        call            sub_2768    ; 2E3B: 2768

        movlp           0x2d        ; 2E3C: 31AD
        btfss           STATUS, Z   ; 2E3D: 1D03
        goto            loop_2e41   ; 2E3E: 2E41

        movf            mem_52, W   ; 2E3F: 0852
        subwf           mem_20, W   ; 2E40: 0220

loop_2e41
; jump here from: 2E3E
        btfss           STATUS, C   ; 2E41: 1C03
        goto            loop_2e45   ; 2E42: 2E45

        movlb           0x00        ; 2E43: 0020
        incf            mem_26, f   ; 2E44: 0AA6

loop_2e45
; jump here from: 2E42
        movlb           0x00        ; 2E45: 0020
        movf            mem_26, W   ; 2E46: 0826
        movwf           mem_54      ; 2E47: 00D4
        movf            mem_21, W   ; 2E48: 0821
        addwf           mem_26, f   ; 2E49: 07A6
        movlw           0x01        ; 2E4A: 3001
        movwf           mem_53      ; 2E4B: 00D3
        movf            mem_21, W   ; 2E4C: 0821
        movlp           0x27        ; 2E4D: 31A7
        call            sub_2768    ; 2E4E: 2768

        movlp           0x2d        ; 2E4F: 31AD
        btfss           STATUS, Z   ; 2E50: 1D03
        goto            loop_2e54   ; 2E51: 2E54

        movf            mem_52, W   ; 2E52: 0852
        subwf           mem_54, W   ; 2E53: 0254

loop_2e54
; jump here from: 2E51
        btfss           STATUS, C   ; 2E54: 1C03
        goto            loop_2e6b   ; 2E55: 2E6B

        movlb           0x00        ; 2E56: 0020
        movf            mem_22, W   ; 2E57: 0822
        movlp           0x27        ; 2E58: 31A7
        call            sub_2792    ; 2E59: 2792

        movlp           0x2d        ; 2E5A: 31AD
        lsrf            mem_25, W   ; 2E5B: 3625
        movwf           mem_25      ; 2E5C: 00A5
        iorwf           mem_54, W   ; 2E5D: 0454
        movwf           mem_25      ; 2E5E: 00A5
        movf            mem_23, W   ; 2E5F: 0823
        movlp           0x27        ; 2E60: 31A7
        call            sub_2792    ; 2E61: 2792

        movlp           0x2d        ; 2E62: 31AD
        lsrf            mem_22, f   ; 2E63: 36A2
        movf            mem_54, W   ; 2E64: 0854
        iorwf           mem_22, f   ; 2E65: 04A2
        lsrf            mem_23, W   ; 2E66: 3623
        movwf           mem_23      ; 2E67: 00A3
        movlb           0x02        ; 2E68: 0022
        incf            mem_166, f  ; 2E69: 0AE6
        goto            label_2e34  ; 2E6A: 2E34

loop_2e6b
; jump here from: 2E55
        call            sub_2ebe    ; 2E6B: 26BE

        movlp           0x2d        ; 2E6C: 31AD
        movlb           0x02        ; 2E6D: 0022
        movf            mem_166, W  ; 2E6E: 0866
        movlb           0x00        ; 2E6F: 0020
        addwf           mem_33, f   ; 2E70: 07B3
        movlb           0x01        ; 2E71: 0021
        movf            mem_ba, W   ; 2E72: 083A
        movlb           0x00        ; 2E73: 0020
        subwf           mem_33, f   ; 2E74: 02B3
        call            sub_2e7d    ; 2E75: 267D

        movlp           0x2d        ; 2E76: 31AD
        movlb           0x01        ; 2E77: 0021
        btfss           mem_bf, 7   ; 2E78: 1FBF
        goto            loop_2e7c   ; 2E79: 2E7C

        call            sub_2e07    ; 2E7A: 2607

        movlp           0x2d        ; 2E7B: 31AD

loop_2e7c
; jump here from: 2E79
        goto            sub_2eb6    ; 2E7C: 2EB6

;------------------------------------------------------------
; Subroutine: sub_2e7d
;
; called from: 1B69
; called from: 1C74
; called from: 2E27
; called from: 2E75

sub_2e7d
; jump here from: 1BAE
        movf            mem_23, W   ; 2E7D: 0823
        iorwf           mem_22, W   ; 2E7E: 0422
        btfsc           STATUS, Z   ; 2E7F: 1903
        return                      ; 2E80: 0008
        btfsc           mem_23, 7   ; 2E81: 1BA3
        goto            loop_2e8b   ; 2E82: 2E8B

label_2e83
; jump here from: 2E8A
        btfsc           mem_23, 6   ; 2E83: 1B23
        return                      ; 2E84: 0008
        call            sub_2e94    ; 2E85: 2694

        movlp           0x2d        ; 2E86: 31AD
        decf            mem_33, f   ; 2E87: 03B3
        btfsc           STATUS, Z   ; 2E88: 1903
        return                      ; 2E89: 0008
        goto            label_2e83  ; 2E8A: 2E83

loop_2e8b
; jump here from: 2E82
; jump here from: 2E93
        btfsc           mem_23, 6   ; 2E8B: 1B23
        return                      ; 2E8C: 0008
        call            sub_2e94    ; 2E8D: 2694

        movlp           0x2d        ; 2E8E: 31AD
        bsf             mem_23, 7   ; 2E8F: 17A3
        decf            mem_33, f   ; 2E90: 03B3
        btfsc           STATUS, Z   ; 2E91: 1903
        return                      ; 2E92: 0008
        goto            loop_2e8b   ; 2E93: 2E8B

;------------------------------------------------------------
; Subroutine: sub_2e94
;
; called from: 2E85
; called from: 2E8D

sub_2e94
        movf            mem_22, W   ; 2E94: 0822
        movwf           mem_4f      ; 2E95: 00CF
        movlw           0x80        ; 2E96: 3080
        andwf           mem_4f, f   ; 2E97: 05CF
        lslf            mem_23, W   ; 2E98: 3523
        movwf           mem_23      ; 2E99: 00A3
        rlf             mem_4f, f   ; 2E9A: 0DCF
        clrf            mem_4f      ; 2E9B: 01CF
        rlf             mem_4f, f   ; 2E9C: 0DCF
        iorwf           mem_4f, W   ; 2E9D: 044F
        movwf           mem_23      ; 2E9E: 00A3
        movf            mem_25, W   ; 2E9F: 0825
        movwf           mem_4f      ; 2EA0: 00CF
        movlw           0x80        ; 2EA1: 3080
        andwf           mem_4f, f   ; 2EA2: 05CF
        lslf            mem_22, f   ; 2EA3: 35A2
        rlf             mem_4f, f   ; 2EA4: 0DCF
        clrf            mem_4f      ; 2EA5: 01CF
        rlf             mem_4f, f   ; 2EA6: 0DCF
        movf            mem_4f, W   ; 2EA7: 084F
        iorwf           mem_22, f   ; 2EA8: 04A2
        movf            mem_24, W   ; 2EA9: 0824
        movwf           mem_4f      ; 2EAA: 00CF
        movlw           0x80        ; 2EAB: 3080
        andwf           mem_4f, f   ; 2EAC: 05CF
        lslf            mem_25, W   ; 2EAD: 3525
        movwf           mem_25      ; 2EAE: 00A5
        rlf             mem_4f, f   ; 2EAF: 0DCF
        clrf            mem_4f      ; 2EB0: 01CF
        rlf             mem_4f, f   ; 2EB1: 0DCF
        iorwf           mem_4f, W   ; 2EB2: 044F
        movwf           mem_25      ; 2EB3: 00A5
        lslf            mem_24, f   ; 2EB4: 35A4
        return                      ; 2EB5: 0008

;------------------------------------------------------------
; Subroutine: sub_2eb6
;
; called from: 2E33

sub_2eb6
; jump here from: 25AA
; jump here from: 2E7C
        movlw           0xff        ; 2EB6: 30FF
        movlb           0x00        ; 2EB7: 0020
        xorwf           mem_20, f   ; 2EB8: 06A0
        incf            mem_20, f   ; 2EB9: 0AA0
        btfsc           STATUS, Z   ; 2EBA: 1903
        decf            mem_21, f   ; 2EBB: 03A1
        xorwf           mem_21, f   ; 2EBC: 06A1
        return                      ; 2EBD: 0008

;------------------------------------------------------------
; Subroutine: sub_2ebe
;
; called from: 2E6B

sub_2ebe
        movlw           0x0f        ; 2EBE: 300F
        movlb           0x00        ; 2EBF: 0020
        movwf           mem_27      ; 2EC0: 00A7

loop_2ec1
; jump here from: 2F1D
        movf            mem_23, W   ; 2EC1: 0823
        movwf           mem_26      ; 2EC2: 00A6
        movf            mem_22, W   ; 2EC3: 0822
        movwf           mem_51      ; 2EC4: 00D1
        movlw           0x80        ; 2EC5: 3080
        andwf           mem_51, f   ; 2EC6: 05D1
        lslf            mem_23, W   ; 2EC7: 3523
        movwf           mem_23      ; 2EC8: 00A3
        rlf             mem_51, f   ; 2EC9: 0DD1
        clrf            mem_51      ; 2ECA: 01D1
        rlf             mem_51, f   ; 2ECB: 0DD1
        iorwf           mem_51, W   ; 2ECC: 0451
        movwf           mem_23      ; 2ECD: 00A3
        movf            mem_25, W   ; 2ECE: 0825
        movwf           mem_51      ; 2ECF: 00D1
        movlw           0x80        ; 2ED0: 3080
        andwf           mem_51, f   ; 2ED1: 05D1
        lslf            mem_22, f   ; 2ED2: 35A2
        rlf             mem_51, f   ; 2ED3: 0DD1
        clrf            mem_51      ; 2ED4: 01D1
        rlf             mem_51, f   ; 2ED5: 0DD1
        movf            mem_51, W   ; 2ED6: 0851
        iorwf           mem_22, f   ; 2ED7: 04A2
        movf            mem_24, W   ; 2ED8: 0824
        movwf           mem_51      ; 2ED9: 00D1
        movlw           0x80        ; 2EDA: 3080
        andwf           mem_51, f   ; 2EDB: 05D1
        lslf            mem_25, W   ; 2EDC: 3525
        movwf           mem_25      ; 2EDD: 00A5
        rlf             mem_51, f   ; 2EDE: 0DD1
        clrf            mem_51      ; 2EDF: 01D1
        rlf             mem_51, f   ; 2EE0: 0DD1
        iorwf           mem_51, W   ; 2EE1: 0451
        movwf           mem_25      ; 2EE2: 00A5
        lslf            mem_24, f   ; 2EE3: 35A4
        movf            mem_23, W   ; 2EE4: 0823
        movlb           0x02        ; 2EE5: 0022
        movwf           mem_167     ; 2EE6: 00E7
        movlw           0x01        ; 2EE7: 3001
        movlb           0x00        ; 2EE8: 0020
        movwf           mem_50      ; 2EE9: 00D0
        movf            mem_22, W   ; 2EEA: 0822
        sublw           0x00        ; 2EEB: 3C00
        movlp           0x27        ; 2EEC: 31A7
        call            sub_27a0    ; 2EED: 27A0

        movlp           0x2d        ; 2EEE: 31AD
        btfss           STATUS, Z   ; 2EEF: 1D03
        goto            loop_2ef3   ; 2EF0: 2EF3

        movf            mem_4f, W   ; 2EF1: 084F
        subwf           mem_20, W   ; 2EF2: 0220

loop_2ef3
; jump here from: 2EF0
        btfss           STATUS, C   ; 2EF3: 1C03
        goto            loop_2ef7   ; 2EF4: 2EF7

        movlb           0x02        ; 2EF5: 0022
        incf            mem_167, f  ; 2EF6: 0AE7

loop_2ef7
; jump here from: 2EF4
        movlb           0x00        ; 2EF7: 0020
        movf            mem_20, W   ; 2EF8: 0820
        addwf           mem_22, W   ; 2EF9: 0722
        movlb           0x01        ; 2EFA: 0021
        movwf           mem_df      ; 2EFB: 00DF
        movlb           0x00        ; 2EFC: 0020
        movf            mem_21, W   ; 2EFD: 0821
        movlb           0x02        ; 2EFE: 0022
        addwf           mem_167, W  ; 2EFF: 0767
        movlb           0x00        ; 2F00: 0020
        movwf           mem_51      ; 2F01: 00D1
        btfsc           mem_26, 7   ; 2F02: 1BA6
        goto            loop_2f13   ; 2F03: 2F13

        movlw           0x01        ; 2F04: 3001
        movwf           mem_50      ; 2F05: 00D0
        movlb           0x02        ; 2F06: 0022
        movf            mem_167, W  ; 2F07: 0867
        sublw           0x00        ; 2F08: 3C00
        movlb           0x00        ; 2F09: 0020
        movlp           0x27        ; 2F0A: 31A7
        call            sub_27a0    ; 2F0B: 27A0

        movlp           0x2d        ; 2F0C: 31AD
        btfss           STATUS, Z   ; 2F0D: 1D03
        goto            loop_2f11   ; 2F0E: 2F11

        movf            mem_4f, W   ; 2F0F: 084F
        subwf           mem_21, W   ; 2F10: 0221

loop_2f11
; jump here from: 2F0E
        btfss           STATUS, C   ; 2F11: 1C03
        goto            loop_2f1b   ; 2F12: 2F1B

loop_2f13
; jump here from: 2F03
        movlb           0x00        ; 2F13: 0020
        movf            mem_51, W   ; 2F14: 0851
        movwf           mem_23      ; 2F15: 00A3
        movlb           0x01        ; 2F16: 0021
        movf            mem_df, W   ; 2F17: 085F
        movlb           0x00        ; 2F18: 0020
        movwf           mem_22      ; 2F19: 00A2
        incf            mem_24, f   ; 2F1A: 0AA4

loop_2f1b
; jump here from: 2F12
        movlb           0x00        ; 2F1B: 0020
        decfsz          mem_27, f   ; 2F1C: 0BA7
        goto            loop_2ec1   ; 2F1D: 2EC1

        movf            mem_25, W   ; 2F1E: 0825
        movwf           mem_23      ; 2F1F: 00A3
        movf            mem_24, W   ; 2F20: 0824
        movwf           mem_22      ; 2F21: 00A2
        return                      ; 2F22: 0008

;------------------------------------------------------------
; Subroutine: sub_2f23
;
; called from: 0A43

sub_2f23
        movlp           0x24        ; 2F23: 31A4
        goto            label_2422  ; 2F24: 2C22

label_2f25
; jump here from: 0301
        movlp           0x2c        ; 2F25: 31AC
        call            sub_2c09    ; 2F26: 2409

        movlp           0x2d        ; 2F27: 31AD
        movlp           0x05        ; 2F28: 3185
        goto            label_0590  ; 2F29: 2D90

label_2f2a
; jump here from: 0303
        movlp           0x25        ; 2F2A: 31A5
        call            sub_254c    ; 2F2B: 254C

        movlp           0x2d        ; 2F2C: 31AD
        movlp           0x11        ; 2F2D: 3191
        goto            label_11a1  ; 2F2E: 29A1

label_2f2f
; jump here from: 0305
        movlp           0x24        ; 2F2F: 31A4
        call            sub_24cb    ; 2F30: 24CB

        movlp           0x2d        ; 2F31: 31AD
        movlp           0x11        ; 2F32: 3191
        goto            label_11eb  ; 2F33: 29EB

label_2f34
; jump here from: 0307
        movlp           0x24        ; 2F34: 31A4
        call            sub_24be    ; 2F35: 24BE

        movlp           0x2d        ; 2F36: 31AD
        movlp           0x10        ; 2F37: 3190
        goto            label_103b  ; 2F38: 283B

label_2f39
; jump here from: 0309
        movlp           0x24        ; 2F39: 31A4
        call            sub_244d    ; 2F3A: 244D

        movlp           0x2d        ; 2F3B: 31AD
        movlp           0x10        ; 2F3C: 3190
        goto            label_10bd  ; 2F3D: 28BD

label_2f3e
; jump here from: 030B
        movlp           0x29        ; 2F3E: 31A9
        call            sub_2981    ; 2F3F: 2181

        movlp           0x2d        ; 2F40: 31AD
        movlp           0x35        ; 2F41: 31B5
        goto            label_357c  ; 2F42: 2D7C

label_2f43
; jump here from: 030D
        movlp           0x25        ; 2F43: 31A5
        call            sub_255d    ; 2F44: 255D

        movlp           0x2d        ; 2F45: 31AD
        movlp           0x10        ; 2F46: 3190
        goto            label_1010  ; 2F47: 2810

label_2f48
; jump here from: 030F
        movlp           0x29        ; 2F48: 31A9
        call            sub_2964    ; 2F49: 2164

        movlp           0x2d        ; 2F4A: 31AD
        movlp           0x35        ; 2F4B: 31B5
        goto            label_355c  ; 2F4C: 2D5C

label_2f4d
; jump here from: 0311
        movlp           0x27        ; 2F4D: 31A7
        call            sub_2729    ; 2F4E: 2729

        movlp           0x2d        ; 2F4F: 31AD
        movlp           0x11        ; 2F50: 3191
        goto            label_115b  ; 2F51: 295B

label_2f52
; jump here from: 0313
        movlp           0x29        ; 2F52: 31A9
        call            sub_2975    ; 2F53: 2175

        movlp           0x2d        ; 2F54: 31AD
        movlp           0x35        ; 2F55: 31B5
        goto            label_35d2  ; 2F56: 2DD2

label_2f57
; jump here from: 0315
        movlp           0x29        ; 2F57: 31A9
        call            sub_2938    ; 2F58: 2138

        movlp           0x2d        ; 2F59: 31AD
        movlp           0x13        ; 2F5A: 3193
        goto            label_13dc  ; 2F5B: 2BDC

label_2f5c
; jump here from: 0317
        movlp           0x29        ; 2F5C: 31A9
        call            sub_295f    ; 2F5D: 215F

        movlp           0x2d        ; 2F5E: 31AD
        movlp           0x36        ; 2F5F: 31B6
        goto            label_3658  ; 2F60: 2E58

label_2f61
; jump here from: 0319
        movlp           0x29        ; 2F61: 31A9
        call            sub_2934    ; 2F62: 2134

        movlp           0x2d        ; 2F63: 31AD
        movlp           0x14        ; 2F64: 3194
        goto            label_149c  ; 2F65: 2C9C

label_2f66
; jump here from: 031B
        movlp           0x29        ; 2F66: 31A9
        call            sub_2969    ; 2F67: 2169

        movlp           0x2d        ; 2F68: 31AD
        movlp           0x36        ; 2F69: 31B6
        goto            label_360c  ; 2F6A: 2E0C

label_2f6b
; jump here from: 031D
        movlp           0x29        ; 2F6B: 31A9
        call            sub_2930    ; 2F6C: 2130

        movlp           0x2d        ; 2F6D: 31AD
        movlp           0x14        ; 2F6E: 3194
        goto            label_143c  ; 2F6F: 2C3C

label_2f70
; jump here from: 031F
        movlp           0x29        ; 2F70: 31A9
        call            sub_295a    ; 2F71: 215A

        movlp           0x2d        ; 2F72: 31AD
        movlp           0x36        ; 2F73: 31B6
        goto            label_36b8  ; 2F74: 2EB8

label_2f75
; jump here from: 0321
        movlp           0x29        ; 2F75: 31A9
        call            sub_292c    ; 2F76: 212C

        movlp           0x2d        ; 2F77: 31AD
        movlp           0x15        ; 2F78: 3195
        goto            label_153a  ; 2F79: 2D3A

label_2f7a
; jump here from: 0323
        movlp           0x25        ; 2F7A: 31A5
        call            sub_2556    ; 2F7B: 2556

        movlp           0x2d        ; 2F7C: 31AD
        movlp           0x12        ; 2F7D: 3192
        goto            label_123b  ; 2F7E: 2A3B

label_2f7f
; jump here from: 0325
        movlp           0x27        ; 2F7F: 31A7
        call            sub_2702    ; 2F80: 2702

        movlp           0x2d        ; 2F81: 31AD
        movlp           0x12        ; 2F82: 3192
        goto            label_12a8  ; 2F83: 2AA8

label_2f84
; jump here from: 0327
        movlp           0x27        ; 2F84: 31A7
        call            sub_2709    ; 2F85: 2709

        movlp           0x2d        ; 2F86: 31AD
        movlp           0x12        ; 2F87: 3192
        goto            label_12e8  ; 2F88: 2AE8

label_2f89
; jump here from: 0329
        movlp           0x27        ; 2F89: 31A7
        call            sub_2710    ; 2F8A: 2710

        movlp           0x2d        ; 2F8B: 31AD
        movlp           0x12        ; 2F8C: 3192
        goto            label_1278  ; 2F8D: 2A78

label_2f8e
; jump here from: 032B
        movlp           0x25        ; 2F8E: 31A5
        call            sub_2522    ; 2F8F: 2522

        movlp           0x2d        ; 2F90: 31AD
        movlp           0x22        ; 2F91: 31A2
        goto            label_2244  ; 2F92: 2A44

label_2f93
; jump here from: 032D
        movlp           0x26        ; 2F93: 31A6
        call            sub_2651    ; 2F94: 2651

        movlp           0x2d        ; 2F95: 31AD
        movlp           0x33        ; 2F96: 31B3
        goto            label_33d0  ; 2F97: 2BD0

label_2f98
; jump here from: 032F
        movlp           0x29        ; 2F98: 31A9
        call            sub_2957    ; 2F99: 2157

        movlp           0x2d        ; 2F9A: 31AD
        movlp           0x35        ; 2F9B: 31B5
        goto            label_359c  ; 2F9C: 2D9C

label_2f9d
; jump here from: 0331
        movlp           0x29        ; 2F9D: 31A9
        call            sub_2942    ; 2F9E: 2142

        movlp           0x2d        ; 2F9F: 31AD
        movlp           0x10        ; 2FA0: 3190
        goto            label_107b  ; 2FA1: 287B

label_2fa2
; jump here from: 0333
        movlp           0x29        ; 2FA2: 31A9
        call            sub_2946    ; 2FA3: 2146

        movlp           0x2d        ; 2FA4: 31AD
        movlp           0x2b        ; 2FA5: 31AB
        goto            label_2b11  ; 2FA6: 2B11

label_2fa7
; jump here from: 0335
        movlp           0x29        ; 2FA7: 31A9
        call            sub_293c    ; 2FA8: 213C

        movlp           0x2d        ; 2FA9: 31AD
        movlp           0x32        ; 2FAA: 31B2
        goto            label_3261  ; 2FAB: 2A61

label_2fac
; jump here from: 0337
        movlp           0x26        ; 2FAC: 31A6
        call            sub_26d1    ; 2FAD: 26D1

        movlp           0x2d        ; 2FAE: 31AD
        movlp           0x31        ; 2FAF: 31B1
        goto            label_31f1  ; 2FB0: 29F1

label_2fb1
; jump here from: 0339
        movlp           0x27        ; 2FB1: 31A7
        call            sub_27f5    ; 2FB2: 27F5

        movlp           0x2d        ; 2FB3: 31AD
        movlp           0x18        ; 2FB4: 3198
        goto            label_188e  ; 2FB5: 288E

label_2fb6
; jump here from: 033B
        movlp           0x18        ; 2FB6: 3198
        call            sub_1855    ; 2FB7: 2055

        movlp           0x2d        ; 2FB8: 31AD
        movlp           0x18        ; 2FB9: 3198
        goto            label_1860  ; 2FBA: 2860

label_2fbb
; jump here from: 033D
        movlp           0x2b        ; 2FBB: 31AB
        call            sub_2bfe    ; 2FBC: 23FE

        movlp           0x2d        ; 2FBD: 31AD
        movlp           0x05        ; 2FBE: 3185
        goto            label_0563  ; 2FBF: 2D63

label_2fc0
; jump here from: 033F
        movlp           0x31        ; 2FC0: 31B1
        call            sub_318b    ; 2FC1: 218B

        movlp           0x2d        ; 2FC2: 31AD
        movlp           0x11        ; 2FC3: 3191
        goto            label_1104  ; 2FC4: 2904

label_2fc5
; jump here from: 0341
        movlp           0x30        ; 2FC5: 31B0
        call            sub_30e6    ; 2FC6: 20E6

        movlp           0x2d        ; 2FC7: 31AD
        movlp           0x18        ; 2FC8: 3198
        goto            label_18bc  ; 2FC9: 28BC

label_2fca
; jump here from: 0343
        movlp           0x31        ; 2FCA: 31B1
        call            sub_31be    ; 2FCB: 21BE

        movlp           0x2d        ; 2FCC: 31AD
        movlp           0x19        ; 2FCD: 3199
        goto            label_194e  ; 2FCE: 294E

label_2fcf
; jump here from: 0349
        movlb           0x02        ; 2FCF: 0022
        movf            mem_122, W  ; 2FD0: 0822
        andlw           0x0f        ; 2FD1: 390F
        addlw           0xd8        ; 2FD2: 3ED8
        movlp           0x02        ; 2FD3: 3182
        callw                       ; 2FD4: 000A

        movwf           mem_152     ; 2FD5: 00D2
        swapf           mem_122, W  ; 2FD6: 0E22
        andlw           0x0f        ; 2FD7: 390F
        addlw           0xd8        ; 2FD8: 3ED8
        movlp           0x02        ; 2FD9: 3182
        callw                       ; 2FDA: 000A

        movwf           mem_151     ; 2FDB: 00D1
        movf            mem_123, W  ; 2FDC: 0823
        andlw           0x0f        ; 2FDD: 390F
        addlw           0xd8        ; 2FDE: 3ED8
        movlp           0x02        ; 2FDF: 3182
        callw                       ; 2FE0: 000A

        movwf           mem_150     ; 2FE1: 00D0
        swapf           mem_123, W  ; 2FE2: 0E23
        andlw           0x0f        ; 2FE3: 390F
        addlw           0xd8        ; 2FE4: 3ED8
        movlp           0x02        ; 2FE5: 3182
        callw                       ; 2FE6: 000A

        movwf           mem_14f     ; 2FE7: 00CF
        movlw           0xe4        ; 2FE8: 30E4
        movlp           0x02        ; 2FE9: 3182
        callw                       ; 2FEA: 000A

        movwf           mem_154     ; 2FEB: 00D4
        movlw           0xed        ; 2FEC: 30ED
        movlp           0x02        ; 2FED: 3182
        callw                       ; 2FEE: 000A

        movwf           mem_155     ; 2FEF: 00D5
        movlw           0xee        ; 2FF0: 30EE
        movlp           0x02        ; 2FF1: 3182
        callw                       ; 2FF2: 000A

        movwf           mem_156     ; 2FF3: 00D6
        movlp           0x0e        ; 2FF4: 318E
        call            sub_0e47    ; 2FF5: 2647

        movlp           0x2d        ; 2FF6: 31AD
        movlb           0x01        ; 2FF7: 0021
        movf            mem_c5, W   ; 2FF8: 0845
        xorlw           0x09        ; 2FF9: 3A09
        btfsc           STATUS, Z   ; 2FFA: 1903
        return                      ; 2FFB: 0008
        movlb           0x00        ; 2FFC: 0020
        clrf            mem_3b      ; 2FFD: 01BB
        clrf            mem_3a      ; 2FFE: 01BA
        return                      ; 2FFF: 0008
Bank3000_Vector org 0x3000

;------------------------------------------------------------
; Subroutine: sub_3000
;
; called from: 0A75

sub_3000
        movf            mem_d0, W   ; 3000: 0850
        movlb           0x00        ; 3001: 0020
        movwf           mem_23      ; 3002: 00A3
        movlb           0x01        ; 3003: 0021
        movf            mem_d1, W   ; 3004: 0851
        movlb           0x00        ; 3005: 0020
        movwf           mem_22      ; 3006: 00A2
        movlb           0x01        ; 3007: 0021
        movf            mem_cf, W   ; 3008: 084F
        movlb           0x00        ; 3009: 0020
        movwf           mem_33      ; 300A: 00B3
        movlw           0x4b        ; 300B: 304B
        clrf            mem_20      ; 300C: 01A0
        movwf           mem_21      ; 300D: 00A1
        movlw           0x0a        ; 300E: 300A
        movlb           0x01        ; 300F: 0021
        movwf           mem_ba      ; 3010: 00BA
        movlp           0x2e        ; 3011: 31AE
        goto            sub_2e22    ; 3012: 2E22

;------------------------------------------------------------
; Subroutine: sub_3013
;
; called from: 084B

sub_3013
        movlw           0x04        ; 3013: 3004
        movlb           0x00        ; 3014: 0020
        movwf           mem_52      ; 3015: 00D2
        movlw           0x88        ; 3016: 3088
        movlp           0x0d        ; 3017: 318D
        call            I2CRead    ; 3018: 25FD

        movlp           0x30        ; 3019: 31B0
        movlb           0x02        ; 301A: 0022
        movwf           mem_168     ; 301B: 00E8
        movlw           0x03        ; 301C: 3003
        movlb           0x00        ; 301D: 0020
        movwf           mem_52      ; 301E: 00D2
        movlw           0x88        ; 301F: 3088
        movlp           0x0d        ; 3020: 318D
        call            I2CRead    ; 3021: 25FD

        movlp           0x30        ; 3022: 31B0
        movlb           0x01        ; 3023: 0021
        movwf           mem_e1      ; 3024: 00E1
        movlw           0x02        ; 3025: 3002
        movlb           0x00        ; 3026: 0020
        movwf           mem_52      ; 3027: 00D2
        movlw           0x88        ; 3028: 3088
        movlp           0x0d        ; 3029: 318D
        call            I2CRead    ; 302A: 25FD

        movlb           0x01        ; 302B: 0021
        movwf           mem_e2      ; 302C: 00E2
        return                      ; 302D: 0008

;------------------------------------------------------------
; Subroutine: sub_302e
;
; called from: 0891
; called from: 2317

sub_302e
        movlw           0x1f        ; 302E: 301F
        movlb           0x00        ; 302F: 0020
        movwf           mem_52      ; 3030: 00D2
        movlw           0x88        ; 3031: 3088
        movlp           0x0d        ; 3032: 318D
        call            I2CRead    ; 3033: 25FD

        movlp           0x30        ; 3034: 31B0
        movlb           0x01        ; 3035: 0021
        movwf           mem_cd      ; 3036: 00CD
        movlw           0x20        ; 3037: 3020
        movlb           0x00        ; 3038: 0020
        movwf           mem_52      ; 3039: 00D2
        movlw           0x88        ; 303A: 3088
        movlp           0x0d        ; 303B: 318D
        call            I2CRead    ; 303C: 25FD

        movlp           0x30        ; 303D: 31B0
        movlb           0x01        ; 303E: 0021
        movwf           mem_ce      ; 303F: 00CE
        movlw           0x21        ; 3040: 3021
        movlb           0x00        ; 3041: 0020
        movwf           mem_52      ; 3042: 00D2
        movlw           0x88        ; 3043: 3088
        movlp           0x0d        ; 3044: 318D
        call            I2CRead    ; 3045: 25FD

        movlb           0x01        ; 3046: 0021
        movwf           mem_cc      ; 3047: 00CC
        return                      ; 3048: 0008

;------------------------------------------------------------
; Subroutine: sub_3049
;
; called from: 0C3B
; called from: 0C53
; called from: 0C7C

sub_3049
        movlw           0x68        ; 3049: 3068
        call            sub_305c    ; 304A: 205C

        movlp           0x0c        ; 304B: 318C
        call            I2CWrite    ; 304C: 24B3

        movlp           0x30        ; 304D: 31B0
        movlw           0x69        ; 304E: 3069
        call            sub_305c    ; 304F: 205C

        movlp           0x0c        ; 3050: 318C
        call            I2CWrite    ; 3051: 24B3

        movlp           0x30        ; 3052: 31B0
        movlw           0x6a        ; 3053: 306A
        call            sub_3060    ; 3054: 2060

        movlp           0x0c        ; 3055: 318C
        call            I2CWrite    ; 3056: 24B3

        movlp           0x30        ; 3057: 31B0
        movlw           0x6b        ; 3058: 306B
        call            sub_3060    ; 3059: 2060

        movlp           0x0c        ; 305A: 318C
        goto            I2CWrite    ; 305B: 2CB3

;------------------------------------------------------------
; Subroutine: sub_305c
;
; called from: 304A
; called from: 304F

sub_305c
        movwf           mem_55      ; 305C: 00D5
        movf            mem_3e, W   ; 305D: 083E
        movwf           mem_56      ; 305E: 00D6
        retlw           0x88        ; 305F: 3488

;------------------------------------------------------------
; Subroutine: sub_3060
;
; called from: 3054
; called from: 3059

sub_3060
        movwf           mem_55      ; 3060: 00D5
        movf            mem_3c, W   ; 3061: 083C
        movwf           mem_56      ; 3062: 00D6
        retlw           0x88        ; 3063: 3488

;------------------------------------------------------------
; Subroutine: set_baud_rate
;
; called from: 0933

set_baud_rate
        movlb           0x00        ; 3064: 0020
        clrf            CPSCON0     ; 3065: 019E
        movlw           0x85        ; 3066: 3085
        movlb           0x01        ; 3067: 0021
        movwf           OPTION_REG  ; 3068: 0095
        movlw           0x8d        ; 3069: 308D
        movlb           0x00        ; 306A: 0020
        movwf           T1CON       ; 306B: 0098
        clrf            T1GCON      ; 306C: 0199
        movlw           0x90        ; 306D: 3090
        movlb           0x03        ; 306E: 0023
        movwf           RCSTA       ; 306F: 009D
        movlw           0x04        ; 3070: 3004
        movwf           TXSTA       ; 3071: 009E
        bcf             BAUDCON, BRG16; 3072: 119F
        clrf            SPBRGH      ; 3073: 019C
        movlw           0x0c        ; 3074: 300C
        movwf           SPBRGL      ; 3075: 009B
        movlw           0xf0        ; 3076: 30F0
        movwf           INTCON      ; 3077: 008B
        movlw           0x20        ; 3078: 3020
        movlb           0x01        ; 3079: 0021
        movwf           PIE1        ; 307A: 0091
        clrf            PIE2        ; 307B: 0192
        clrf            ADCON0      ; 307C: 019D
        movlw           0x40        ; 307D: 3040
        movwf           ADCON1      ; 307E: 009E
        movlw           0x21        ; 307F: 3021
        movwf           PIE1        ; 3080: 0091
        movlw           0xd0        ; 3081: 30D0
        movwf           INTCON      ; 3082: 008B
        return                      ; 3083: 0008

;------------------------------------------------------------
; Subroutine: sub_3084
;
; called from: 0876

sub_3084
        movlb           0x01        ; 3084: 0021
        movf            mem_b8, W   ; 3085: 0838
        addwf           mem_b8, W   ; 3086: 0738
        addwf           mem_b8, W   ; 3087: 0738
        movlb           0x00        ; 3088: 0020
        movwf           mem_55      ; 3089: 00D5
        movwf           mem_52      ; 308A: 00D2
        movlw           0x87        ; 308B: 3087
        movlp           0x0d        ; 308C: 318D
        call            I2CRead    ; 308D: 25FD

        movlp           0x30        ; 308E: 31B0
        movlb           0x01        ; 308F: 0021
        movwf           mem_dd      ; 3090: 00DD
        movlb           0x00        ; 3091: 0020
        incf            mem_55, W   ; 3092: 0A55
        movwf           mem_52      ; 3093: 00D2
        movlw           0x87        ; 3094: 3087
        movlp           0x0d        ; 3095: 318D
        call            I2CRead    ; 3096: 25FD

        movlp           0x30        ; 3097: 31B0
        movlb           0x01        ; 3098: 0021
        movwf           mem_de      ; 3099: 00DE
        movlb           0x00        ; 309A: 0020
        movf            mem_55, W   ; 309B: 0855
        addlw           0x02        ; 309C: 3E02
        movwf           mem_52      ; 309D: 00D2
        movlw           0x87        ; 309E: 3087
        movlp           0x0d        ; 309F: 318D
        call            I2CRead    ; 30A0: 25FD

        movlb           0x01        ; 30A1: 0021
        movwf           mem_dc      ; 30A2: 00DC
        return                      ; 30A3: 0008

;------------------------------------------------------------
; Subroutine: sub_30a4
;
; called from: 087C

sub_30a4
        movlb           0x01        ; 30A4: 0021
        movf            mem_c9, W   ; 30A5: 0849
        addwf           mem_c9, W   ; 30A6: 0749
        addwf           mem_c9, W   ; 30A7: 0749
        movlb           0x00        ; 30A8: 0020
        movwf           mem_55      ; 30A9: 00D5
        movwf           mem_52      ; 30AA: 00D2
        movlw           0x86        ; 30AB: 3086
        movlp           0x0d        ; 30AC: 318D
        call            I2CRead    ; 30AD: 25FD

        movlp           0x30        ; 30AE: 31B0
        movlb           0x02        ; 30AF: 0022
        movwf           mem_160     ; 30B0: 00E0
        movlb           0x00        ; 30B1: 0020
        incf            mem_55, W   ; 30B2: 0A55
        movwf           mem_52      ; 30B3: 00D2
        movlw           0x86        ; 30B4: 3086
        movlp           0x0d        ; 30B5: 318D
        call            I2CRead    ; 30B6: 25FD

        movlp           0x30        ; 30B7: 31B0
        movlb           0x02        ; 30B8: 0022
        movwf           mem_161     ; 30B9: 00E1
        movlb           0x00        ; 30BA: 0020
        movf            mem_55, W   ; 30BB: 0855
        addlw           0x02        ; 30BC: 3E02
        movwf           mem_52      ; 30BD: 00D2
        movlw           0x86        ; 30BE: 3086
        movlp           0x0d        ; 30BF: 318D
        call            I2CRead    ; 30C0: 25FD

        movlb           0x02        ; 30C1: 0022
        movwf           mem_15f     ; 30C2: 00DF
        return                      ; 30C3: 0008

label_30c4
; jump here from: 02D6
        movlw           0x20        ; 30C4: 3020
        movwf           FSR0L       ; 30C5: 0084
        movlw           0x00        ; 30C6: 3000
        movwf           FSR0H       ; 30C7: 0085
        movlw           0x28        ; 30C8: 3028
        movlp           0x08        ; 30C9: 3188
        call            sub_0801    ; 30CA: 2001

        movlp           0x30        ; 30CB: 31B0
        movlw           0xa0        ; 30CC: 30A0
        movwf           FSR0L       ; 30CD: 0084
        movlw           0x00        ; 30CE: 3000
        movwf           FSR0H       ; 30CF: 0085
        movlw           0x50        ; 30D0: 3050
        movlp           0x08        ; 30D1: 3188
        call            sub_0801    ; 30D2: 2001

        movlp           0x30        ; 30D3: 31B0
        movlw           0x20        ; 30D4: 3020
        movwf           FSR0L       ; 30D5: 0084
        movlw           0x01        ; 30D6: 3001
        movwf           FSR0H       ; 30D7: 0085
        movlw           0x50        ; 30D8: 3050
        movlp           0x08        ; 30D9: 3188
        call            sub_0801    ; 30DA: 2001

        movlp           0x30        ; 30DB: 31B0
        movlw           0xa0        ; 30DC: 30A0
        movwf           FSR0L       ; 30DD: 0084
        movlw           0x01        ; 30DE: 3001
        movwf           FSR0H       ; 30DF: 0085
        movlw           0x32        ; 30E0: 3032
        movlp           0x08        ; 30E1: 3188
        call            sub_0801    ; 30E2: 2001

        movlb           0x00        ; 30E3: 0020
        movlp           0x08        ; 30E4: 3188
        goto            label_0807  ; 30E5: 2807

;------------------------------------------------------------
; Subroutine: sub_30e6
;
; called from: 2FC6

sub_30e6
        movlb           0x02        ; 30E6: 0022
        bsf             mem_14b, 3  ; 30E7: 15CB
        bsf             mem_14b, 1  ; 30E8: 14CB
        bsf             mem_14b, 0  ; 30E9: 144B
        movlp           0x19        ; 30EA: 3199
        call            sub_19ff    ; 30EB: 21FF

        movlp           0x30        ; 30EC: 31B0
        movlb           0x01        ; 30ED: 0021
        movf            mem_c1, W   ; 30EE: 0841
        movlp           0x26        ; 30EF: 31A6
        call            sub_2627    ; 30F0: 2627

        movlp           0x30        ; 30F1: 31B0
        movwf           mem_d8      ; 30F2: 00D8
        swapf           mem_d8, W   ; 30F3: 0E58
        andlw           0x0f        ; 30F4: 390F
        addlw           0xd8        ; 30F5: 3ED8
        movlp           0x02        ; 30F6: 3182
        callw                       ; 30F7: 000A

        movlb           0x02        ; 30F8: 0022
        movwf           mem_14f     ; 30F9: 00CF
        movlb           0x00        ; 30FA: 0020
        movf            mem_58, W   ; 30FB: 0858
        andlw           0x0f        ; 30FC: 390F
        addlw           0xd8        ; 30FD: 3ED8
        movlp           0x02        ; 30FE: 3182
        callw                       ; 30FF: 000A

        movlb           0x02        ; 3100: 0022
        movwf           mem_150     ; 3101: 00D0
        movlw           0xe8        ; 3102: 30E8
        movlp           0x02        ; 3103: 3182
        callw                       ; 3104: 000A

        movwf           mem_151     ; 3105: 00D1
        movlw           0xe8        ; 3106: 30E8
        movlp           0x02        ; 3107: 3182
        callw                       ; 3108: 000A

        movwf           mem_152     ; 3109: 00D2
        return                      ; 310A: 0008

;------------------------------------------------------------
; Subroutine: sub_310b
;
; called from: 0857
; called from: 22FC

sub_310b
        movlw           0x74        ; 310B: 3074
        movlb           0x00        ; 310C: 0020
        movwf           mem_52      ; 310D: 00D2
        movlw           0x88        ; 310E: 3088
        movlp           0x0d        ; 310F: 318D
        call            I2CRead    ; 3110: 25FD

        movlp           0x31        ; 3111: 31B1
        movlb           0x01        ; 3112: 0021
        movwf           mem_a5      ; 3113: 00A5
        movlw           0x75        ; 3114: 3075
        movlb           0x00        ; 3115: 0020
        movwf           mem_52      ; 3116: 00D2
        movlw           0x88        ; 3117: 3088
        movlp           0x0d        ; 3118: 318D
        call            I2CRead    ; 3119: 25FD

        movlp           0x31        ; 311A: 31B1
        movlb           0x01        ; 311B: 0021
        movwf           mem_a4      ; 311C: 00A4
        movlw           0x01        ; 311D: 3001
        subwf           mem_a5, W   ; 311E: 0225
        movlw           0xa4        ; 311F: 30A4
        btfsc           STATUS, Z   ; 3120: 1903
        subwf           mem_a4, W   ; 3121: 0224
        btfss           STATUS, C   ; 3122: 1C03
        return                      ; 3123: 0008
        movlw           0x74        ; 3124: 3074
        clrf            mem_24      ; 3125: 01A4
        clrf            mem_25      ; 3126: 01A5
        movlb           0x00        ; 3127: 0020
        movwf           mem_55      ; 3128: 00D5
        movlw           0x88        ; 3129: 3088
        clrf            mem_56      ; 312A: 01D6
        movlp           0x0c        ; 312B: 318C
        call            I2CWrite    ; 312C: 24B3

        movlw           0x75        ; 312D: 3075
        movwf           mem_55      ; 312E: 00D5
        movlw           0x88        ; 312F: 3088
        clrf            mem_56      ; 3130: 01D6
        movlp           0x0c        ; 3131: 318C
        goto            I2CWrite    ; 3132: 2CB3

;------------------------------------------------------------
; Subroutine: sub_3133
;
; called from: 0873

sub_3133
        movlb           0x00        ; 3133: 0020
        movf            mem_36, W   ; 3134: 0836
        addwf           mem_36, W   ; 3135: 0736
        addwf           mem_36, W   ; 3136: 0736
        movwf           mem_56      ; 3137: 00D6
        movlb           0x01        ; 3138: 0021
        lsrf            mem_c0, W   ; 3139: 3640
        movlb           0x00        ; 313A: 0020
        movwf           mem_55      ; 313B: 00D5
        movlb           0x01        ; 313C: 0021
        btfss           mem_c0, 0   ; 313D: 1C40
        goto            loop_3141   ; 313E: 2941

        movlb           0x00        ; 313F: 0020
        bsf             mem_56, 7   ; 3140: 17D6

loop_3141
; jump here from: 313E
        movlb           0x00        ; 3141: 0020
        movf            mem_56, W   ; 3142: 0856
        movwf           mem_52      ; 3143: 00D2
        movf            mem_55, W   ; 3144: 0855
        movlp           0x0d        ; 3145: 318D
        call            I2CRead    ; 3146: 25FD

        movlp           0x31        ; 3147: 31B1
        movlb           0x02        ; 3148: 0022
        movwf           mem_15d     ; 3149: 00DD
        movlb           0x00        ; 314A: 0020
        incf            mem_56, W   ; 314B: 0A56
        movwf           mem_52      ; 314C: 00D2
        movf            mem_55, W   ; 314D: 0855
        movlp           0x0d        ; 314E: 318D
        call            I2CRead    ; 314F: 25FD

        movlp           0x31        ; 3150: 31B1
        movlb           0x02        ; 3151: 0022
        movwf           mem_15e     ; 3152: 00DE
        movlb           0x00        ; 3153: 0020
        movf            mem_56, W   ; 3154: 0856
        addlw           0x02        ; 3155: 3E02
        movwf           mem_52      ; 3156: 00D2
        movf            mem_55, W   ; 3157: 0855
        movlp           0x0d        ; 3158: 318D
        call            I2CRead    ; 3159: 25FD

        movlb           0x02        ; 315A: 0022
        movwf           mem_15c     ; 315B: 00DC
        return                      ; 315C: 0008

;------------------------------------------------------------
; Subroutine: sub_315d
;
; called from: 09D5

sub_315d
        movlw           0x06        ; 315D: 3006
        movlb           0x00        ; 315E: 0020
        movwf           mem_51      ; 315F: 00D1

loop_3160
; jump here from: 3189
        clrf            mem_52      ; 3160: 01D2

label_3161
; jump here from: 3187
        movf            mem_51, W   ; 3161: 0851
        subwf           mem_52, W   ; 3162: 0252
        btfsc           STATUS, C   ; 3163: 1803
        goto            loop_3188   ; 3164: 2988

        movf            mem_52, W   ; 3165: 0852
        addlw           0xb3        ; 3166: 3EB3
        movwf           FSR1L       ; 3167: 0086
        movlw           0x01        ; 3168: 3001
        movwf           FSR1H       ; 3169: 0087
        movf            mem_52, W   ; 316A: 0852
        addlw           0xb4        ; 316B: 3EB4
        movwf           FSR0L       ; 316C: 0084
        movlw           0x01        ; 316D: 3001
        movwf           FSR0H       ; 316E: 0085
        movf            0, W        ; 316F: 0800
        subwf           INDF1, W    ; 3170: 0201
        btfsc           STATUS, C   ; 3171: 1803
        goto            loop_3186   ; 3172: 2986

        movf            mem_52, W   ; 3173: 0852
        addlw           0xb3        ; 3174: 3EB3
        movwf           FSR1L       ; 3175: 0086
        movf            INDF1, W    ; 3176: 0801
        movwf           mem_4f      ; 3177: 00CF
        clrf            mem_50      ; 3178: 01D0
        movf            mem_52, W   ; 3179: 0852
        addlw           0xb3        ; 317A: 3EB3
        movwf           FSR1L       ; 317B: 0086
        movf            mem_52, W   ; 317C: 0852
        addlw           0xb4        ; 317D: 3EB4
        movwf           FSR0L       ; 317E: 0084
        movf            0, W        ; 317F: 0800
        movwf           INDF1       ; 3180: 0081
        movf            mem_52, W   ; 3181: 0852
        addlw           0xb4        ; 3182: 3EB4
        movwf           FSR1L       ; 3183: 0086
        movf            mem_4f, W   ; 3184: 084F
        movwf           INDF1       ; 3185: 0081

loop_3186
; jump here from: 3172
        incf            mem_52, f   ; 3186: 0AD2
        goto            label_3161  ; 3187: 2961

loop_3188
; jump here from: 3164
        decfsz          mem_51, f   ; 3188: 0BD1
        goto            loop_3160   ; 3189: 2960

        return                      ; 318A: 0008

;------------------------------------------------------------
; Subroutine: sub_318b
;
; called from: 2FC1

sub_318b
        movlb           0x02        ; 318B: 0022
        bsf             mem_14b, 3  ; 318C: 15CB
        bsf             mem_14c, 4  ; 318D: 164C
        movlp           0x19        ; 318E: 3199
        call            sub_19ff    ; 318F: 21FF

        movlp           0x31        ; 3190: 31B1
        movlb           0x02        ; 3191: 0022
        movf            mem_13a, W  ; 3192: 083A
        movlp           0x26        ; 3193: 31A6
        call            sub_2627    ; 3194: 2627

        movlp           0x31        ; 3195: 31B1
        call            sub_31b4    ; 3196: 21B4

        movlp           0x02        ; 3197: 3182
        callw                       ; 3198: 000A

        movlp           0x31        ; 3199: 31B1
        movlb           0x02        ; 319A: 0022
        movwf           mem_14f     ; 319B: 00CF
        call            sub_31b9    ; 319C: 21B9

        movlp           0x02        ; 319D: 3182
        callw                       ; 319E: 000A

        movlb           0x02        ; 319F: 0022
        movwf           mem_150     ; 31A0: 00D0
        movlb           0x01        ; 31A1: 0021
        movf            mem_c1, W   ; 31A2: 0841
        movlp           0x26        ; 31A3: 31A6
        call            sub_2627    ; 31A4: 2627

        movlp           0x31        ; 31A5: 31B1
        call            sub_31b4    ; 31A6: 21B4

        movlp           0x02        ; 31A7: 3182
        callw                       ; 31A8: 000A

        movlp           0x31        ; 31A9: 31B1
        movlb           0x02        ; 31AA: 0022
        movwf           mem_151     ; 31AB: 00D1
        call            sub_31b9    ; 31AC: 21B9

        movlp           0x02        ; 31AD: 3182
        callw                       ; 31AE: 000A

        movlb           0x02        ; 31AF: 0022
        movwf           mem_152     ; 31B0: 00D2
        movlb           0x01        ; 31B1: 0021
        bsf             mem_bb, 6   ; 31B2: 173B
        return                      ; 31B3: 0008

;------------------------------------------------------------
; Subroutine: sub_31b4
;
; called from: 3196
; called from: 31A6

sub_31b4
return (arg0 >> 4) & 0xf + 0xd8
        movwf           mem_d8      ; 31B4: 00D8
        swapf           mem_d8, W   ; 31B5: 0E58
        andlw           0x0f        ; 31B6: 390F
        addlw           0xd8        ; 31B7: 3ED8
        return                      ; 31B8: 0008

;------------------------------------------------------------
; Subroutine: sub_31b9
;
; called from: 319C
; called from: 31AC

sub_31b9
        movlb           0x00        ; 31B9: 0020
        movf            mem_58, W   ; 31BA: 0858
        andlw           0x0f        ; 31BB: 390F
        addlw           0xd8        ; 31BC: 3ED8
        return                      ; 31BD: 0008

;------------------------------------------------------------
; Subroutine: sub_31be
;
; called from: 2FCB

sub_31be
        movlb           0x02        ; 31BE: 0022
        bsf             mem_14b, 3  ; 31BF: 15CB
        bsf             mem_14c, 5  ; 31C0: 16CC
        movlp           0x19        ; 31C1: 3199
        call            sub_19ff    ; 31C2: 21FF

        movlp           0x31        ; 31C3: 31B1
        movlb           0x01        ; 31C4: 0021
        movf            mem_c1, W   ; 31C5: 0841
        movlp           0x26        ; 31C6: 31A6
        call            sub_2627    ; 31C7: 2627

        movlp           0x31        ; 31C8: 31B1
        call            sub_31ec    ; 31C9: 21EC

        movlp           0x02        ; 31CA: 3182
        callw                       ; 31CB: 000A

        movlp           0x31        ; 31CC: 31B1
        movlb           0x02        ; 31CD: 0022
        movwf           mem_14f     ; 31CE: 00CF
        call            sub_31e7    ; 31CF: 21E7

        movlp           0x02        ; 31D0: 3182
        callw                       ; 31D1: 000A

        movlb           0x02        ; 31D2: 0022
        movwf           mem_150     ; 31D3: 00D0
        movlb           0x01        ; 31D4: 0021
        movf            mem_c2, W   ; 31D5: 0842
        movlp           0x26        ; 31D6: 31A6
        call            sub_2627    ; 31D7: 2627

        movlp           0x31        ; 31D8: 31B1
        call            sub_31ec    ; 31D9: 21EC

        movlp           0x02        ; 31DA: 3182
        callw                       ; 31DB: 000A

        movlp           0x31        ; 31DC: 31B1
        movlb           0x02        ; 31DD: 0022
        movwf           mem_151     ; 31DE: 00D1
        call            sub_31e7    ; 31DF: 21E7

        movlp           0x02        ; 31E0: 3182
        callw                       ; 31E1: 000A

        movlb           0x02        ; 31E2: 0022
        movwf           mem_152     ; 31E3: 00D2
        movlb           0x01        ; 31E4: 0021
        bsf             mem_bb, 6   ; 31E5: 173B
        return                      ; 31E6: 0008

;------------------------------------------------------------
; Subroutine: sub_31e7
;
; called from: 31CF
; called from: 31DF

sub_31e7
        movlb           0x00        ; 31E7: 0020
        movf            mem_58, W   ; 31E8: 0858
        andlw           0x0f        ; 31E9: 390F
        addlw           0xd8        ; 31EA: 3ED8
        return                      ; 31EB: 0008

;------------------------------------------------------------
; Subroutine: sub_31ec
;
; called from: 31C9
; called from: 31D9

sub_31ec
        movwf           mem_d8      ; 31EC: 00D8
        swapf           mem_d8, W   ; 31ED: 0E58
        andlw           0x0f        ; 31EE: 390F
        addlw           0xd8        ; 31EF: 3ED8
        return                      ; 31F0: 0008

label_31f1
; jump here from: 2FB0
        goto            label_3215  ; 31F1: 2A15

loop_31f2
; jump here from: 321C
        movlw           0x64        ; 31F2: 3064
        incf            mem_45, f   ; 31F3: 0AC5
        subwf           mem_45, W   ; 31F4: 0245
        btfsc           STATUS, C   ; 31F5: 1803
        clrf            mem_45      ; 31F6: 01C5

loop_31f7
; jump here from: 31FD
; jump here from: 3200
; jump here from: 3214
; jump here from: 3223
        clrf            mem_3a      ; 31F7: 01BA
        return                      ; 31F8: 0008

loop_31f9
; jump here from: 321F
        movlw           0x64        ; 31F9: 3064
        decf            mem_45, f   ; 31FA: 03C5
        subwf           mem_45, W   ; 31FB: 0245
        btfss           STATUS, C   ; 31FC: 1C03
        goto            loop_31f7   ; 31FD: 29F7

        movlw           0x63        ; 31FE: 3063
        movwf           mem_45      ; 31FF: 00C5
        goto            loop_31f7   ; 3200: 29F7

loop_3201
; jump here from: 3219
; jump here from: 3222
        movf            mem_45, W   ; 3201: 0845
        movwf           mem_39      ; 3202: 00B9
        movlp           0x26        ; 3203: 31A6
        call            sub_2627    ; 3204: 2627

        movlp           0x31        ; 3205: 31B1
        movlb           0x01        ; 3206: 0021
        movwf           mem_d8      ; 3207: 00D8
        movlw           0x10        ; 3208: 3010
        movlb           0x00        ; 3209: 0020
        movwf           mem_55      ; 320A: 00D5
        movlb           0x01        ; 320B: 0021
        movf            mem_d8, W   ; 320C: 0858
        movlb           0x00        ; 320D: 0020
        movwf           mem_56      ; 320E: 00D6
        movlw           0x88        ; 320F: 3088
        movlp           0x0c        ; 3210: 318C
        call            I2CWrite    ; 3211: 24B3

        movlp           0x31        ; 3212: 31B1
        clrf            mem_3b      ; 3213: 01BB
        goto            loop_31f7   ; 3214: 29F7

label_3215
; jump here from: 31F1
        movlb           0x00        ; 3215: 0020
        movf            mem_3a, W   ; 3216: 083A
        xorlw           0x01        ; 3217: 3A01
        btfsc           STATUS, Z   ; 3218: 1903
        goto            loop_3201   ; 3219: 2A01

        xorlw           0x03        ; 321A: 3A03
        btfsc           STATUS, Z   ; 321B: 1903
        goto            loop_31f2   ; 321C: 29F2

        xorlw           0x01        ; 321D: 3A01
        btfsc           STATUS, Z   ; 321E: 1903
        goto            loop_31f9   ; 321F: 29F9

        xorlw           0x07        ; 3220: 3A07
        btfsc           STATUS, Z   ; 3221: 1903
        goto            loop_3201   ; 3222: 2A01
        goto            loop_31f7   ; 3223: 29F7
;
; end of label_3215
;------------------------------------------------------------

        return                      ; 3224: 0008

;------------------------------------------------------------
; Subroutine: sub_3225
;
; called from: 080B

sub_3225
        clrf            INTCON      ; 3225: 018B
        movlb           0x01        ; 3226: 0021
        clrf            PIE1        ; 3227: 0191
        clrf            PIE2        ; 3228: 0192
        clrf            PIE3        ; 3229: 0193
        movlb           0x00        ; 322A: 0020
        clrf            PIR1        ; 322B: 0191
        clrf            PIR2        ; 322C: 0192
        clrf            PIR3        ; 322D: 0193
        movlw           0x01        ; 322E: 3001
        movlb           0x03        ; 322F: 0023
        movwf           ANSELA      ; 3230: 008C
        clrf            ANSELB      ; 3231: 018D
        clrf            ANSELD      ; 3232: 018F
        clrf            ANSELE      ; 3233: 0190
        movlb           0x01        ; 3234: 0021
        clrf            ADCON0      ; 3235: 019D
        clrf            ADCON1      ; 3236: 019E
        movlb           0x05        ; 3237: 0025
        clrf            PIE3        ; 3238: 0193
        movlw           0x40        ; 3239: 3040
        movlb           0x0f        ; 323A: 002F
        movwf           PIE1        ; 323B: 0091
        clrf            PIE2        ; 323C: 0192
        movlw           0x08        ; 323D: 3008
        movlb           0x04        ; 323E: 0024
        movwf           TRISB       ; 323F: 008D
        movlb           0x07        ; 3240: 0027
        clrf            mem_94      ; 3241: 0194
        clrf            OPTION_REG  ; 3242: 0195
        movlw           0x01        ; 3243: 3001
        movlb           0x01        ; 3244: 0021
        movwf           TRISA       ; 3245: 008C
        movwf           TRISB       ; 3246: 008D
        movlw           0x87        ; 3247: 3087
        movwf           TRISC       ; 3248: 008E
        movlw           0x7f        ; 3249: 307F
        movwf           TRISD       ; 324A: 008F
        movlw           0x08        ; 324B: 3008
        movwf           TRISE       ; 324C: 0090
        movlw           0x20        ; 324D: 3020
        movlb           0x00        ; 324E: 0020
        call            sub_3258    ; 324F: 2258

        movlp           0x32        ; 3250: 31B2
        movlw           0x20        ; 3251: 3020
        movlb           0x02        ; 3252: 0022
        call            sub_3258    ; 3253: 2258

        movlw           0x15        ; 3254: 3015
        movlb           0x01        ; 3255: 0021
        movwf           WDTCON      ; 3256: 0097
        return                      ; 3257: 0008

;------------------------------------------------------------
; Subroutine: sub_3258
;
; called from: 324F
; called from: 3253

sub_3258
        movwf           LATA        ; 3258: 008C
        clrf            LATB        ; 3259: 018D
        movlw           0xc8        ; 325A: 30C8
        movwf           LATC        ; 325B: 008E
        movlw           0x7f        ; 325C: 307F
        movwf           LATD        ; 325D: 008F
        movlw           0x01        ; 325E: 3001
        movwf           LATE        ; 325F: 0090
        return                      ; 3260: 0008

label_3261
; jump here from: 2FAB
        goto            label_328c  ; 3261: 2A8C

loop_3262
; jump here from: 3290
        movf            mem_45, W   ; 3262: 0845
        movwf           mem_38      ; 3263: 00B8
        movlp           0x26        ; 3264: 31A6
        call            sub_2627    ; 3265: 2627

        movlp           0x32        ; 3266: 31B2
        movlb           0x01        ; 3267: 0021
        movwf           mem_d7      ; 3268: 00D7
        call            sub_329c    ; 3269: 229C

        movlp           0x0c        ; 326A: 318C
        call            I2CWrite    ; 326B: 24B3

        movf            mem_b9, W   ; 326C: 0839
        movwf           mem_c5      ; 326D: 00C5
        movlw           0x1b        ; 326E: 301B
        movwf           mem_bb      ; 326F: 00BB

loop_3270
; jump here from: 3276
; jump here from: 3279
; jump here from: 327B
; jump here from: 327E
; jump here from: 328B
; jump here from: 329A
        clrf            mem_3a      ; 3270: 01BA
        return                      ; 3271: 0008

loop_3272
; jump here from: 3293
        movlw           0x0d        ; 3272: 300D
        incf            mem_45, f   ; 3273: 0AC5
        subwf           mem_45, W   ; 3274: 0245
        btfss           STATUS, C   ; 3275: 1C03
        goto            loop_3270   ; 3276: 2A70

        clrf            mem_45      ; 3277: 01C5
        incf            mem_45, f   ; 3278: 0AC5
        goto            loop_3270   ; 3279: 2A70

loop_327a
; jump here from: 3296
        decfsz          mem_45, f   ; 327A: 0BC5
        goto            loop_3270   ; 327B: 2A70

        movlw           0x0c        ; 327C: 300C
        movwf           mem_45      ; 327D: 00C5
        goto            loop_3270   ; 327E: 2A70

loop_327f
; jump here from: 3299
        movf            mem_45, W   ; 327F: 0845
        movwf           mem_38      ; 3280: 00B8
        movlp           0x26        ; 3281: 31A6
        call            sub_2627    ; 3282: 2627

        movlp           0x32        ; 3283: 31B2
        movlb           0x01        ; 3284: 0021
        movwf           mem_d7      ; 3285: 00D7
        call            sub_329c    ; 3286: 229C

        movlp           0x0c        ; 3287: 318C
        call            I2CWrite    ; 3288: 24B3

        movlp           0x32        ; 3289: 31B2
        clrf            mem_bb      ; 328A: 01BB
        goto            loop_3270   ; 328B: 2A70

label_328c
; jump here from: 3261
        movlb           0x00        ; 328C: 0020
        movf            mem_3a, W   ; 328D: 083A
        xorlw           0x01        ; 328E: 3A01
        btfsc           STATUS, Z   ; 328F: 1903
        goto            loop_3262   ; 3290: 2A62

        xorlw           0x03        ; 3291: 3A03
        btfsc           STATUS, Z   ; 3292: 1903
        goto            loop_3272   ; 3293: 2A72

        xorlw           0x01        ; 3294: 3A01
        btfsc           STATUS, Z   ; 3295: 1903
        goto            loop_327a   ; 3296: 2A7A

        xorlw           0x07        ; 3297: 3A07
        btfsc           STATUS, Z   ; 3298: 1903
        goto            loop_327f   ; 3299: 2A7F
        goto            loop_3270   ; 329A: 2A70
;
; end of label_328c
;------------------------------------------------------------

        return                      ; 329B: 0008

;------------------------------------------------------------
; Subroutine: sub_329c
;
; called from: 0B0F
; called from: 3269
; called from: 3286

sub_329c
        movlw           0x11        ; 329C: 3011
        movlb           0x00        ; 329D: 0020
        movwf           mem_55      ; 329E: 00D5
        movlb           0x01        ; 329F: 0021
        movf            mem_d7, W   ; 32A0: 0857
        movlb           0x00        ; 32A1: 0020
        movwf           mem_56      ; 32A2: 00D6
        retlw           0x88        ; 32A3: 3488

label_32a4
; jump here from: 2553
        movlb           0x00        ; 32A4: 0020
        movf            mem_29, W   ; 32A5: 0829
        movwf           mem_23      ; 32A6: 00A3
        movf            mem_28, W   ; 32A7: 0828
        movwf           mem_22      ; 32A8: 00A2
        movlp           0x25        ; 32A9: 31A5
        call            sub_25ab    ; 32AA: 25AB

        movlp           0x32        ; 32AB: 31B2
        movlb           0x00        ; 32AC: 0020
        swapf           mem_24, W   ; 32AD: 0E24
        andlw           0x0f        ; 32AE: 390F
        movwf           mem_31      ; 32AF: 00B1
        movf            mem_24, W   ; 32B0: 0824
        movwf           mem_30      ; 32B1: 00B0
        movlw           0x0f        ; 32B2: 300F
        andwf           mem_30, f   ; 32B3: 05B0
        swapf           mem_27, W   ; 32B4: 0E27
        andlw           0x0f        ; 32B5: 390F
        movwf           mem_2f      ; 32B6: 00AF
        movf            mem_27, W   ; 32B7: 0827
        movwf           mem_2e      ; 32B8: 00AE
        movlw           0x0f        ; 32B9: 300F
        andwf           mem_2e, f   ; 32BA: 05AE
        call            sub_32be    ; 32BB: 22BE

        bsf             mem_49, 1   ; 32BC: 14C9
        return                      ; 32BD: 0008

;------------------------------------------------------------
; Subroutine: sub_32be
;
; called from: 32BB

sub_32be
        movf            mem_31, f   ; 32BE: 08B1
        btfss           STATUS, Z   ; 32BF: 1D03
        goto            loop_32c4   ; 32C0: 2AC4

        movlb           0x02        ; 32C1: 0022
        clrf            mem_153     ; 32C2: 01D3
        goto            label_32ca  ; 32C3: 2ACA

loop_32c4
; jump here from: 32C0
        movf            mem_31, W   ; 32C4: 0831
        addlw           0xd8        ; 32C5: 3ED8
        movlp           0x02        ; 32C6: 3182
        callw                       ; 32C7: 000A

        movlb           0x02        ; 32C8: 0022
        movwf           mem_153     ; 32C9: 00D3

label_32ca
; jump here from: 32C3
        movlb           0x00        ; 32CA: 0020
        movf            mem_30, W   ; 32CB: 0830
        addlw           0xd8        ; 32CC: 3ED8
        movlp           0x02        ; 32CD: 3182
        callw                       ; 32CE: 000A

        movlp           0x32        ; 32CF: 31B2
        movlb           0x02        ; 32D0: 0022
        movwf           mem_154     ; 32D1: 00D4
        movlb           0x00        ; 32D2: 0020
        movf            mem_31, f   ; 32D3: 08B1
        movlp           0x32        ; 32D4: 31B2
        btfss           STATUS, Z   ; 32D5: 1D03
        goto            loop_32dd   ; 32D6: 2ADD

        movlp           0x32        ; 32D7: 31B2
        movf            mem_30, f   ; 32D8: 08B0
        btfss           STATUS, Z   ; 32D9: 1D03
        goto            loop_32dd   ; 32DA: 2ADD

        movlb           0x02        ; 32DB: 0022
        clrf            mem_154     ; 32DC: 01D4

loop_32dd
; jump here from: 32D6
; jump here from: 32DA
        movlb           0x00        ; 32DD: 0020
        movf            mem_2f, W   ; 32DE: 082F
        addlw           0xd8        ; 32DF: 3ED8
        movlp           0x02        ; 32E0: 3182
        callw                       ; 32E1: 000A

        movlb           0x02        ; 32E2: 0022
        movwf           mem_155     ; 32E3: 00D5
        movlb           0x00        ; 32E4: 0020
        movf            mem_2e, W   ; 32E5: 082E
        addlw           0xd8        ; 32E6: 3ED8
        movlp           0x02        ; 32E7: 3182
        callw                       ; 32E8: 000A

        movlb           0x02        ; 32E9: 0022
        movwf           mem_156     ; 32EA: 00D6
        return                      ; 32EB: 0008

;------------------------------------------------------------
; Subroutine: sub_32ec
;
; called from: 087F

sub_32ec
        movlw           0x2a        ; 32EC: 302A
        movlb           0x00        ; 32ED: 0020
        movwf           mem_4f      ; 32EE: 00CF
        clrf            mem_50      ; 32EF: 01D0
        movlb           0x01        ; 32F0: 0021
        movf            mem_a5, W   ; 32F1: 0825
        movlb           0x00        ; 32F2: 0020
        movwf           mem_52      ; 32F3: 00D2
        movlb           0x01        ; 32F4: 0021
        movf            mem_a4, W   ; 32F5: 0824
        movlb           0x00        ; 32F6: 0020
        movwf           mem_51      ; 32F7: 00D1
        movlp           0x24        ; 32F8: 31A4
        call            sub_2479    ; 32F9: 2479

        movlp           0x32        ; 32FA: 31B2
        movf            mem_50, W   ; 32FB: 0850
        movwf           mem_57      ; 32FC: 00D7
        movf            mem_4f, W   ; 32FD: 084F
        movwf           mem_56      ; 32FE: 00D6
        movwf           mem_58      ; 32FF: 00D8
        movlw           0x79        ; 3300: 3079
        addwf           mem_58, f   ; 3301: 07D8
        movlw           0x2a        ; 3302: 302A
        movwf           mem_4f      ; 3303: 00CF
        clrf            mem_50      ; 3304: 01D0
        movlb           0x01        ; 3305: 0021
        movf            mem_a5, W   ; 3306: 0825
        movlb           0x00        ; 3307: 0020
        movwf           mem_52      ; 3308: 00D2
        movlb           0x01        ; 3309: 0021
        movf            mem_a4, W   ; 330A: 0824
        movlb           0x00        ; 330B: 0020
        movwf           mem_51      ; 330C: 00D1
        movlp           0x24        ; 330D: 31A4
        call            sub_249e    ; 330E: 249E

        movlp           0x32        ; 330F: 31B2
        movf            mem_50, W   ; 3310: 0850
        movwf           mem_57      ; 3311: 00D7
        movf            mem_4f, W   ; 3312: 084F
        movwf           mem_56      ; 3313: 00D6
        movwf           mem_59      ; 3314: 00D9
        movwf           mem_4f      ; 3315: 00CF
        movlw           0x06        ; 3316: 3006
        movlp           0x2d        ; 3317: 31AD
        call            sub_2ddf    ; 3318: 25DF

        movlp           0x32        ; 3319: 31B2
        movwf           mem_59      ; 331A: 00D9
        movwf           mem_52      ; 331B: 00D2
        movf            mem_58, W   ; 331C: 0858
        movlp           0x0d        ; 331D: 318D
        call            I2CRead    ; 331E: 25FD

        movlp           0x32        ; 331F: 31B2
        movlb           0x02        ; 3320: 0022
        movwf           mem_15a     ; 3321: 00DA
        movlb           0x00        ; 3322: 0020
        incf            mem_59, W   ; 3323: 0A59
        movwf           mem_52      ; 3324: 00D2
        movf            mem_58, W   ; 3325: 0858
        movlp           0x0d        ; 3326: 318D
        call            I2CRead    ; 3327: 25FD

        movlp           0x32        ; 3328: 31B2
        movlb           0x02        ; 3329: 0022
        movwf           mem_15b     ; 332A: 00DB
        movlb           0x00        ; 332B: 0020
        movf            mem_59, W   ; 332C: 0859
        addlw           0x02        ; 332D: 3E02
        movwf           mem_52      ; 332E: 00D2
        movf            mem_58, W   ; 332F: 0858
        movlp           0x0d        ; 3330: 318D
        call            I2CRead    ; 3331: 25FD

        movlb           0x02        ; 3332: 0022
        movwf           mem_159     ; 3333: 00D9
        return                      ; 3334: 0008

;------------------------------------------------------------
; Subroutine: sub_3335
;
; called from: 09CC

sub_3335
        movlw           0x50        ; 3335: 3050
        movwf           ADCON1      ; 3336: 009E
        bsf             TRISA, TRISA0; 3337: 140C
        movlw           0x01        ; 3338: 3001
        movwf           ADCON0      ; 3339: 009D
        bsf             ADCON0, NOT_DONE; 333A: 149D

loop_333b
; jump here from: 333C
        btfsc           mem_1d, 1   ; 333B: 189D
        goto            loop_333b   ; 333C: 2B3B

        movf            T2CON, W    ; 333D: 081C
        movwf           mem_6e      ; 333E: 00EE
        movlp           0x0f        ; 333F: 318F
        call            delay_2ns    ; 3340: 271B

        movlp           0x33        ; 3341: 31B3
        bsf             mem_1d, 1   ; 3342: 149D

loop_3343
; jump here from: 3344
        btfsc           mem_1d, 1   ; 3343: 189D
        goto            loop_3343   ; 3344: 2B43

        movf            T2CON, W    ; 3345: 081C
        movlb           0x00        ; 3346: 0020
        movwf           mem_47      ; 3347: 00C7
        movlp           0x0f        ; 3348: 318F
        call            delay_2ns    ; 3349: 271B

        movlp           0x33        ; 334A: 31B3
        movlb           0x01        ; 334B: 0021
        bsf             ADCON0, NOT_DONE; 334C: 149D

loop_334d
; jump here from: 334E
        btfsc           ADCON0, NOT_DONE; 334D: 189D
        goto            loop_334d   ; 334E: 2B4D

        movf            ADRESH, W   ; 334F: 081C
        movwf           mem_ef      ; 3350: 00EF
        movf            mem_ee, W   ; 3351: 086E
        movlb           0x00        ; 3352: 0020
        subwf           mem_47, W   ; 3353: 0247
        btfsc           STATUS, C   ; 3354: 1803
        goto            loop_3362   ; 3355: 2B62

        movlb           0x01        ; 3356: 0021
        movf            mem_ee, W   ; 3357: 086E
        movlb           0x02        ; 3358: 0022
        movwf           mem_126     ; 3359: 00A6
        movlb           0x00        ; 335A: 0020
        movf            mem_47, W   ; 335B: 0847
        movlb           0x01        ; 335C: 0021
        movwf           mem_ee      ; 335D: 00EE
        movlb           0x02        ; 335E: 0022
        movf            mem_126, W  ; 335F: 0826
        movlb           0x00        ; 3360: 0020
        movwf           mem_47      ; 3361: 00C7

loop_3362
; jump here from: 3355
        movf            mem_47, W   ; 3362: 0847
        movlb           0x01        ; 3363: 0021
        subwf           mem_ef, W   ; 3364: 026F
        btfsc           STATUS, C   ; 3365: 1803
        goto            loop_3373   ; 3366: 2B73

        movlb           0x00        ; 3367: 0020
        movf            mem_47, W   ; 3368: 0847
        movlb           0x02        ; 3369: 0022
        movwf           mem_126     ; 336A: 00A6
        movlb           0x01        ; 336B: 0021
        movf            mem_ef, W   ; 336C: 086F
        movlb           0x00        ; 336D: 0020
        movwf           mem_47      ; 336E: 00C7
        movlb           0x02        ; 336F: 0022
        movf            mem_126, W  ; 3370: 0826
        movlb           0x01        ; 3371: 0021
        movwf           mem_ef      ; 3372: 00EF

loop_3373
; jump here from: 3366
        movlb           0x02        ; 3373: 0022
        movf            mem_12b, W  ; 3374: 082B
        addlw           0xb3        ; 3375: 3EB3
        movwf           FSR1L       ; 3376: 0086
        movlw           0x01        ; 3377: 3001
        movwf           FSR1H       ; 3378: 0087
        movlb           0x00        ; 3379: 0020
        movf            mem_47, W   ; 337A: 0847
        movwf           INDF1       ; 337B: 0081
        movlb           0x01        ; 337C: 0021
        bcf             ADCON0, ADON; 337D: 101D
        return                      ; 337E: 0008

;------------------------------------------------------------
; Subroutine: sub_337f
;
; called from: 0A5D

sub_337f
        movlb           0x02        ; 337F: 0022
        movf            mem_124, W  ; 3380: 0824
        movlb           0x00        ; 3381: 0020
        movwf           mem_5b      ; 3382: 00DB
        movlb           0x02        ; 3383: 0022
        movf            mem_125, W  ; 3384: 0825
        movlb           0x00        ; 3385: 0020
        movwf           mem_5c      ; 3386: 00DC
        movlw           0x7d        ; 3387: 307D
        clrf            mem_5d      ; 3388: 01DD
        clrf            mem_5e      ; 3389: 01DE
        movwf           mem_4f      ; 338A: 00CF
        clrf            mem_50      ; 338B: 01D0
        clrf            mem_51      ; 338C: 01D1
        clrf            mem_52      ; 338D: 01D2
        movf            mem_5e, W   ; 338E: 085E
        movwf           mem_56      ; 338F: 00D6
        movf            mem_5d, W   ; 3390: 085D
        movwf           mem_55      ; 3391: 00D5
        movf            mem_5c, W   ; 3392: 085C
        movwf           mem_54      ; 3393: 00D4
        movf            mem_5b, W   ; 3394: 085B
        movwf           mem_53      ; 3395: 00D3
        call            sub_33ab    ; 3396: 23AB

        movlp           0x33        ; 3397: 31B3
        movf            mem_52, W   ; 3398: 0852
        movwf           mem_5e      ; 3399: 00DE
        movf            mem_51, W   ; 339A: 0851
        movwf           mem_5d      ; 339B: 00DD
        movf            mem_50, W   ; 339C: 0850
        movwf           mem_5c      ; 339D: 00DC
        movf            mem_4f, W   ; 339E: 084F
        movwf           mem_5b      ; 339F: 00DB
        movlw           0x0f        ; 33A0: 300F

loop_33a1
; jump here from: 33A6
        lsrf            mem_5e, f   ; 33A1: 36DE
        rrf             mem_5d, f   ; 33A2: 0CDD
        rrf             mem_5c, f   ; 33A3: 0CDC
        rrf             mem_5b, f   ; 33A4: 0CDB
        decfsz          WREG, f     ; 33A5: 0B89
        goto            loop_33a1   ; 33A6: 2BA1

        movf            mem_5b, W   ; 33A7: 085B
        movlb           0x02        ; 33A8: 0022
        movwf           mem_143     ; 33A9: 00C3
        return                      ; 33AA: 0008

;------------------------------------------------------------
; Subroutine: sub_33ab
;
; called from: 3396

sub_33ab
        clrf            mem_57      ; 33AB: 01D7
        clrf            mem_58      ; 33AC: 01D8
        clrf            mem_59      ; 33AD: 01D9
        clrf            mem_5a      ; 33AE: 01DA

loop_33af
; jump here from: 33C6
        btfss           mem_4f, 0   ; 33AF: 1C4F
        goto            loop_33b9   ; 33B0: 2BB9

        movf            mem_53, W   ; 33B1: 0853
        addwf           mem_57, f   ; 33B2: 07D7
        movf            mem_54, W   ; 33B3: 0854
        addwfc          mem_58, f   ; 33B4: 3DD8
        movf            mem_55, W   ; 33B5: 0855
        addwfc          mem_59, f   ; 33B6: 3DD9
        movf            mem_56, W   ; 33B7: 0856
        addwfc          mem_5a, f   ; 33B8: 3DDA

loop_33b9
; jump here from: 33B0
        lslf            mem_53, f   ; 33B9: 35D3
        rlf             mem_54, f   ; 33BA: 0DD4
        rlf             mem_55, f   ; 33BB: 0DD5
        rlf             mem_56, f   ; 33BC: 0DD6
        lsrf            mem_52, f   ; 33BD: 36D2
        rrf             mem_51, f   ; 33BE: 0CD1
        rrf             mem_50, f   ; 33BF: 0CD0
        rrf             mem_4f, f   ; 33C0: 0CCF
        movf            mem_52, W   ; 33C1: 0852
        iorwf           mem_51, W   ; 33C2: 0451
        iorwf           mem_50, W   ; 33C3: 0450
        iorwf           mem_4f, W   ; 33C4: 044F
        btfss           STATUS, Z   ; 33C5: 1D03
        goto            loop_33af   ; 33C6: 2BAF

        movf            mem_5a, W   ; 33C7: 085A
        movwf           mem_52      ; 33C8: 00D2
        movf            mem_59, W   ; 33C9: 0859
        movwf           mem_51      ; 33CA: 00D1
        movf            mem_58, W   ; 33CB: 0858
        movwf           mem_50      ; 33CC: 00D0
        movf            mem_57, W   ; 33CD: 0857
        movwf           mem_4f      ; 33CE: 00CF
        return                      ; 33CF: 0008

label_33d0
; jump here from: 2F97
        goto            label_3413  ; 33D0: 2C13

        incf            mem_28, f   ; 33D1: 0AA8
        btfsc           STATUS, Z   ; 33D2: 1903
        incf            mem_29, f   ; 33D3: 0AA9
        movlw           0x01        ; 33D4: 3001
        subwf           mem_29, W   ; 33D5: 0229
        movlw           0x41        ; 33D6: 3041
        btfsc           STATUS, Z   ; 33D7: 1903
        subwf           mem_28, W   ; 33D8: 0228
        btfss           STATUS, C   ; 33D9: 1C03
        goto            loop_33e3   ; 33DA: 2BE3

        clrf            mem_28      ; 33DB: 01A8
        incf            mem_28, f   ; 33DC: 0AA8
        clrf            mem_29      ; 33DD: 01A9
        goto            loop_33e3   ; 33DE: 2BE3

loop_33df
; jump here from: 33EF
        movf            mem_29, W   ; 33DF: 0829
        iorwf           mem_28, W   ; 33E0: 0428
        btfsc           STATUS, Z   ; 33E1: 1903
        goto            loop_33f0   ; 33E2: 2BF0

loop_33e3
; jump here from: 33DA
; jump here from: 33DE
; jump here from: 33F4
; jump here from: 3412
        clrf            mem_3a      ; 33E3: 01BA
        return                      ; 33E4: 0008
        movlw           0x01        ; 33E5: 3001
        subwf           mem_28, f   ; 33E6: 02A8
        movlw           0x00        ; 33E7: 3000
        subwfb          mem_29, f   ; 33E8: 3BA9
        movlw           0x01        ; 33E9: 3001
        subwf           mem_29, W   ; 33EA: 0229
        movlw           0x41        ; 33EB: 3041
        btfsc           STATUS, Z   ; 33EC: 1903
        subwf           mem_28, W   ; 33ED: 0228
        btfss           STATUS, C   ; 33EE: 1C03
        goto            loop_33df   ; 33EF: 2BDF

loop_33f0
; jump here from: 33E2
        movlw           0x40        ; 33F0: 3040
        movwf           mem_28      ; 33F1: 00A8
        movlw           0x01        ; 33F2: 3001
        movwf           mem_29      ; 33F3: 00A9
        goto            loop_33e3   ; 33F4: 2BE3

        movf            mem_29, W   ; 33F5: 0829
        movlb           0x01        ; 33F6: 0021
        movwf           mem_a1      ; 33F7: 00A1
        movlb           0x00        ; 33F8: 0020
        movf            mem_28, W   ; 33F9: 0828
        movlb           0x01        ; 33FA: 0021
        movwf           mem_a0      ; 33FB: 00A0
        movlw           0x0a        ; 33FC: 300A
        movlb           0x00        ; 33FD: 0020
        movwf           mem_55      ; 33FE: 00D5
        movlb           0x01        ; 33FF: 0021
        movf            mem_a1, W   ; 3400: 0821
        movlb           0x00        ; 3401: 0020
        movwf           mem_56      ; 3402: 00D6
        movlw           0x88        ; 3403: 3088
        movlp           0x0c        ; 3404: 318C
        call            I2CWrite    ; 3405: 24B3

        movlp           0x33        ; 3406: 31B3
        movlw           0x0b        ; 3407: 300B
        movwf           mem_55      ; 3408: 00D5
        movlb           0x01        ; 3409: 0021
        movf            mem_a0, W   ; 340A: 0820
        movlb           0x00        ; 340B: 0020
        movwf           mem_56      ; 340C: 00D6
        movlw           0x88        ; 340D: 3088
        movlp           0x0c        ; 340E: 318C
        call            I2CWrite    ; 340F: 24B3

        movlp           0x33        ; 3410: 31B3
        clrf            mem_3b      ; 3411: 01BB
        goto            loop_33e3   ; 3412: 2BE3

label_3413
; jump here from: 33D0
        movlb           0x00        ; 3413: 0020
        movf            mem_3a, W   ; 3414: 083A
        xorlw           0x01        ; 3415: 3A01
        btfsc           STATUS, Z   ; 3416: 1903
        goto            loop_37f5   ; 3417: 2BF5

        xorlw           0x03        ; 3418: 3A03
        btfsc           STATUS, Z   ; 3419: 1903
        goto            loop_37d1   ; 341A: 2BD1

        xorlw           0x01        ; 341B: 3A01
        btfsc           STATUS, Z   ; 341C: 1903
        goto            loop_37e5   ; 341D: 2BE5

        xorlw           0x07        ; 341E: 3A07
        btfsc           STATUS, Z   ; 341F: 1903
        goto            loop_37f5   ; 3420: 2BF5
        goto            label_37e3  ; 3421: 2BE3
;
; end of label_3413
;------------------------------------------------------------

        return                      ; 3422: 0008

;------------------------------------------------------------
; Subroutine: sub_3423
;
; called from: 092D

sub_3423
        movlw           0x10        ; 3423: 3010
        movlb           0x00        ; 3424: 0020
        movwf           mem_52      ; 3425: 00D2
        movlw           0x88        ; 3426: 3088
        movlp           0x0d        ; 3427: 318D
        call            I2CRead    ; 3428: 25FD

        movlp           0x34        ; 3429: 31B4
        movlb           0x01        ; 342A: 0021
        movwf           mem_d8      ; 342B: 00D8
        movlw           0x11        ; 342C: 3011
        movlb           0x00        ; 342D: 0020
        movwf           mem_52      ; 342E: 00D2
        movlw           0x88        ; 342F: 3088
        movlp           0x0d        ; 3430: 318D
        call            I2CRead    ; 3431: 25FD

        movlp           0x34        ; 3432: 31B4
        movlb           0x01        ; 3433: 0021
        movwf           mem_d7      ; 3434: 00D7
        movlw           0x12        ; 3435: 3012
        movlb           0x00        ; 3436: 0020
        movwf           mem_52      ; 3437: 00D2
        movlw           0x88        ; 3438: 3088
        movlp           0x0d        ; 3439: 318D
        call            I2CRead    ; 343A: 25FD

        movlp           0x34        ; 343B: 31B4
        movlb           0x01        ; 343C: 0021
        movwf           mem_d4      ; 343D: 00D4
        movlw           0x13        ; 343E: 3013
        movlb           0x00        ; 343F: 0020
        movwf           mem_52      ; 3440: 00D2
        movlw           0x88        ; 3441: 3088
        movlp           0x0d        ; 3442: 318D
        call            I2CRead    ; 3443: 25FD

        movlp           0x34        ; 3444: 31B4
        movlb           0x01        ; 3445: 0021
        movwf           mem_d5      ; 3446: 00D5
        movlw           0x14        ; 3447: 3014
        movlb           0x00        ; 3448: 0020
        movwf           mem_52      ; 3449: 00D2
        movlw           0x88        ; 344A: 3088
        movlp           0x0d        ; 344B: 318D
        call            I2CRead    ; 344C: 25FD

        movlp           0x34        ; 344D: 31B4
        movlb           0x01        ; 344E: 0021
        movwf           mem_d6      ; 344F: 00D6
        movf            mem_d8, W   ; 3450: 0858
        call            sub_3468    ; 3451: 2468

        movlp           0x34        ; 3452: 31B4
        movwf           mem_b9      ; 3453: 00B9
        movlb           0x01        ; 3454: 0021
        movf            mem_d7, W   ; 3455: 0857
        call            sub_3468    ; 3456: 2468

        movlp           0x34        ; 3457: 31B4
        movwf           mem_b8      ; 3458: 00B8
        movlb           0x01        ; 3459: 0021
        movf            mem_d4, W   ; 345A: 0854
        call            sub_3468    ; 345B: 2468

        movlp           0x34        ; 345C: 31B4
        movwf           mem_b5      ; 345D: 00B5
        movlb           0x01        ; 345E: 0021
        movf            mem_d5, W   ; 345F: 0855
        call            sub_3468    ; 3460: 2468

        movlp           0x34        ; 3461: 31B4
        movwf           mem_b6      ; 3462: 00B6
        movlb           0x01        ; 3463: 0021
        movf            mem_d6, W   ; 3464: 0856
        call            sub_3468    ; 3465: 2468

        movwf           mem_b7      ; 3466: 00B7
        return                      ; 3467: 0008

;------------------------------------------------------------
; Subroutine: sub_3468
;
; called from: 3451
; called from: 3456
; called from: 345B
; called from: 3460
; called from: 3465

sub_3468
        movlb           0x00        ; 3468: 0020
        movwf           mem_55      ; 3469: 00D5
        andlw           0x0f        ; 346A: 390F
        movwf           mem_52      ; 346B: 00D2
        movlw           0x0a        ; 346C: 300A
        movwf           mem_4f      ; 346D: 00CF
        movf            mem_55, W   ; 346E: 0855
        movwf           mem_53      ; 346F: 00D3
        movlw           0x04        ; 3470: 3004

loop_3471
; jump here from: 3473
        lsrf            mem_53, f   ; 3471: 36D3
        decfsz          WREG, f     ; 3472: 0B89
        goto            loop_3471   ; 3473: 2C71

        movf            mem_53, W   ; 3474: 0853
        andlw           0x0f        ; 3475: 390F
        movlp           0x2d        ; 3476: 31AD
        call            sub_2ddf    ; 3477: 25DF

        addwf           mem_52, W   ; 3478: 0752
        movwf           mem_54      ; 3479: 00D4
        return                      ; 347A: 0008

;------------------------------------------------------------
; Subroutine: sub_347b
;
; called from: 0A80

sub_347b
        movf            mem_bd, W   ; 347B: 083D
        movlb           0x00        ; 347C: 0020
        movwf           mem_23      ; 347D: 00A3
        movlb           0x02        ; 347E: 0022
        movf            mem_13e, W  ; 347F: 083E
        movlb           0x00        ; 3480: 0020
        movwf           mem_22      ; 3481: 00A2
        movlb           0x02        ; 3482: 0022
        movf            mem_13c, W  ; 3483: 083C
        movlb           0x00        ; 3484: 0020
        movwf           mem_33      ; 3485: 00B3
        movlb           0x02        ; 3486: 0022
        movf            mem_15d, W  ; 3487: 085D
        movlb           0x00        ; 3488: 0020
        movwf           mem_21      ; 3489: 00A1
        movlb           0x02        ; 348A: 0022
        movf            mem_15e, W  ; 348B: 085E
        movlb           0x00        ; 348C: 0020
        movwf           mem_20      ; 348D: 00A0
        movlb           0x02        ; 348E: 0022
        movf            mem_15c, W  ; 348F: 085C
        movlb           0x01        ; 3490: 0021
        movwf           mem_ba      ; 3491: 00BA
        movlp           0x1b        ; 3492: 319B
        call            sub_1b70    ; 3493: 2370

        movlp           0x34        ; 3494: 31B4
        movf            mem_a3, W   ; 3495: 0823
        movwf           mem_d8      ; 3496: 00D8
        movf            mem_a2, W   ; 3497: 0822
        movwf           mem_d9      ; 3498: 00D9
        movf            mem_b3, W   ; 3499: 0833
        movwf           mem_da      ; 349A: 00DA
        movlp           0x2d        ; 349B: 31AD
        call            sub_2deb    ; 349C: 25EB

        movlp           0x34        ; 349D: 31B4
        movlw           0x00        ; 349E: 3000
        movlb           0x00        ; 349F: 0020
        subwf           mem_23, W   ; 34A0: 0223
        movlw           0xeb        ; 34A1: 30EB
        btfsc           STATUS, Z   ; 34A2: 1903
        subwf           mem_22, W   ; 34A3: 0222
        btfss           STATUS, C   ; 34A4: 1C03
        goto            loop_34a9   ; 34A5: 2CA9

        clrf            mem_58      ; 34A6: 01D8
        clrf            mem_59      ; 34A7: 01D9
        clrf            mem_5a      ; 34A8: 01DA

loop_34a9
; jump here from: 34A5
        movf            mem_58, W   ; 34A9: 0858
        movlb           0x02        ; 34AA: 0022
        movwf           mem_15d     ; 34AB: 00DD
        movlb           0x00        ; 34AC: 0020
        movf            mem_59, W   ; 34AD: 0859
        movlb           0x02        ; 34AE: 0022
        movwf           mem_15e     ; 34AF: 00DE
        movlb           0x00        ; 34B0: 0020
        movf            mem_5a, W   ; 34B1: 085A
        movlb           0x02        ; 34B2: 0022
        movwf           mem_15c     ; 34B3: 00DC
        movlb           0x00        ; 34B4: 0020
        movf            mem_36, W   ; 34B5: 0836
        addwf           mem_36, W   ; 34B6: 0736
        addwf           mem_36, W   ; 34B7: 0736
        movwf           mem_5c      ; 34B8: 00DC
        movlb           0x01        ; 34B9: 0021
        lsrf            mem_c0, W   ; 34BA: 3640
        movlb           0x00        ; 34BB: 0020
        movwf           mem_5b      ; 34BC: 00DB
        movlb           0x01        ; 34BD: 0021
        btfss           mem_c0, 0   ; 34BE: 1C40
        goto            loop_34c2   ; 34BF: 2CC2

        movlb           0x00        ; 34C0: 0020
        bsf             mem_5c, 7   ; 34C1: 17DC

loop_34c2
; jump here from: 34BF
        movlb           0x00        ; 34C2: 0020
        movf            mem_5c, W   ; 34C3: 085C
        movwf           mem_55      ; 34C4: 00D5
        movf            mem_58, W   ; 34C5: 0858
        movwf           mem_56      ; 34C6: 00D6
        movf            mem_5b, W   ; 34C7: 085B
        movlp           0x0c        ; 34C8: 318C
        call            I2CWrite    ; 34C9: 24B3

        movlp           0x34        ; 34CA: 31B4
        incf            mem_5c, W   ; 34CB: 0A5C
        movwf           mem_55      ; 34CC: 00D5
        movf            mem_59, W   ; 34CD: 0859
        movwf           mem_56      ; 34CE: 00D6
        movf            mem_5b, W   ; 34CF: 085B
        movlp           0x0c        ; 34D0: 318C
        call            I2CWrite    ; 34D1: 24B3

        movf            mem_5c, W   ; 34D2: 085C
        addlw           0x02        ; 34D3: 3E02
        movwf           mem_55      ; 34D4: 00D5
        movf            mem_5a, W   ; 34D5: 085A
        movwf           mem_56      ; 34D6: 00D6
        movf            mem_5b, W   ; 34D7: 085B
        movlp           0x0c        ; 34D8: 318C
        goto            I2CWrite    ; 34D9: 2CB3

;------------------------------------------------------------
; Subroutine: sub_34da
;
; called from: 0AD6

sub_34da
        movlw           0x01        ; 34DA: 3001
        subwf           mem_a4, f   ; 34DB: 02A4
        movlw           0x00        ; 34DC: 3000
        subwfb          mem_a5, f   ; 34DD: 3BA5
        movlw           0x01        ; 34DE: 3001
        subwf           mem_a5, W   ; 34DF: 0225
        movlw           0xa4        ; 34E0: 30A4
        btfsc           STATUS, Z   ; 34E1: 1903
        subwf           mem_a4, W   ; 34E2: 0224
        btfss           STATUS, C   ; 34E3: 1C03
        goto            loop_34e9   ; 34E4: 2CE9

        movlw           0xa3        ; 34E5: 30A3
        movwf           mem_a4      ; 34E6: 00A4
        movlw           0x01        ; 34E7: 3001
        movwf           mem_a5      ; 34E8: 00A5

loop_34e9
; jump here from: 34E4
        movlw           0x74        ; 34E9: 3074
        movlb           0x00        ; 34EA: 0020
        movwf           mem_55      ; 34EB: 00D5
        movlb           0x01        ; 34EC: 0021
        movf            mem_a5, W   ; 34ED: 0825
        movlb           0x00        ; 34EE: 0020
        movwf           mem_56      ; 34EF: 00D6
        movlw           0x88        ; 34F0: 3088
        movlp           0x0c        ; 34F1: 318C
        call            I2CWrite    ; 34F2: 24B3

        movlp           0x34        ; 34F3: 31B4
        movlw           0x75        ; 34F4: 3075
        movwf           mem_55      ; 34F5: 00D5
        movlb           0x01        ; 34F6: 0021
        movf            mem_a4, W   ; 34F7: 0824
        movlb           0x00        ; 34F8: 0020
        movwf           mem_56      ; 34F9: 00D6
        movlw           0x88        ; 34FA: 3088
        movlp           0x0c        ; 34FB: 318C
        call            I2CWrite    ; 34FC: 24B3

        movlp           0x34        ; 34FD: 31B4
        movlp           0x24        ; 34FE: 31A4
        call            sub_2448    ; 34FF: 2448

        movlp           0x34        ; 3500: 31B4
        movlw           0x2a        ; 3501: 302A
        movlb           0x00        ; 3502: 0020
        movwf           mem_4f      ; 3503: 00CF
        clrf            mem_50      ; 3504: 01D0
        movlb           0x01        ; 3505: 0021
        movf            mem_a5, W   ; 3506: 0825
        movlb           0x00        ; 3507: 0020
        movwf           mem_52      ; 3508: 00D2
        movlb           0x01        ; 3509: 0021
        movf            mem_a4, W   ; 350A: 0824
        movlb           0x00        ; 350B: 0020
        movwf           mem_51      ; 350C: 00D1
        movlp           0x24        ; 350D: 31A4
        call            sub_2479    ; 350E: 2479

        movlp           0x34        ; 350F: 31B4
        movf            mem_50, W   ; 3510: 0850
        movwf           mem_59      ; 3511: 00D9
        movf            mem_4f, W   ; 3512: 084F
        movwf           mem_58      ; 3513: 00D8
        movwf           mem_5a      ; 3514: 00DA
        movlw           0x79        ; 3515: 3079
        addwf           mem_5a, f   ; 3516: 07DA
        movlw           0x2a        ; 3517: 302A
        movwf           mem_4f      ; 3518: 00CF
        clrf            mem_50      ; 3519: 01D0
        movlb           0x01        ; 351A: 0021
        movf            mem_a5, W   ; 351B: 0825
        movlb           0x00        ; 351C: 0020
        movwf           mem_52      ; 351D: 00D2
        movlb           0x01        ; 351E: 0021
        movf            mem_a4, W   ; 351F: 0824
        movlb           0x00        ; 3520: 0020
        movwf           mem_51      ; 3521: 00D1
        movlp           0x24        ; 3522: 31A4
        call            sub_249e    ; 3523: 249E

        movlp           0x34        ; 3524: 31B4
        movf            mem_50, W   ; 3525: 0850
        movwf           mem_59      ; 3526: 00D9
        movf            mem_4f, W   ; 3527: 084F
        movwf           mem_58      ; 3528: 00D8
        movwf           mem_5b      ; 3529: 00DB
        movwf           mem_4f      ; 352A: 00CF
        movlw           0x06        ; 352B: 3006
        movlp           0x2d        ; 352C: 31AD
        call            sub_2ddf    ; 352D: 25DF

        movlp           0x34        ; 352E: 31B4
        movwf           mem_5b      ; 352F: 00DB
        movwf           mem_55      ; 3530: 00D5
        clrf            mem_56      ; 3531: 01D6
        movf            mem_5a, W   ; 3532: 085A
        movlp           0x0c        ; 3533: 318C
        call            I2CWrite    ; 3534: 24B3

        movlp           0x34        ; 3535: 31B4
        incf            mem_5b, W   ; 3536: 0A5B
        movwf           mem_55      ; 3537: 00D5
        clrf            mem_56      ; 3538: 01D6
        movf            mem_5a, W   ; 3539: 085A
        movlp           0x0c        ; 353A: 318C
        call            I2CWrite    ; 353B: 24B3

        movlp           0x34        ; 353C: 31B4
        movf            mem_5b, W   ; 353D: 085B
        addlw           0x02        ; 353E: 3E02
        movwf           mem_55      ; 353F: 00D5
        clrf            mem_56      ; 3540: 01D6
        movf            mem_5a, W   ; 3541: 085A
        movlp           0x0c        ; 3542: 318C
        call            I2CWrite    ; 3543: 24B3

        movlp           0x34        ; 3544: 31B4
        movf            mem_5b, W   ; 3545: 085B
        addlw           0x03        ; 3546: 3E03
        movwf           mem_55      ; 3547: 00D5
        movlw           0xaa        ; 3548: 30AA
        movwf           mem_56      ; 3549: 00D6
        movf            mem_5a, W   ; 354A: 085A
        movlp           0x0c        ; 354B: 318C
        call            I2CWrite    ; 354C: 24B3

        movlp           0x34        ; 354D: 31B4
        movf            mem_5b, W   ; 354E: 085B
        addlw           0x04        ; 354F: 3E04
        movwf           mem_55      ; 3550: 00D5
        clrf            mem_56      ; 3551: 01D6
        movf            mem_5a, W   ; 3552: 085A
        movlp           0x0c        ; 3553: 318C
        call            I2CWrite    ; 3554: 24B3

        movf            mem_5b, W   ; 3555: 085B
        addlw           0x05        ; 3556: 3E05
        movwf           mem_55      ; 3557: 00D5
        clrf            mem_56      ; 3558: 01D6
        movf            mem_5a, W   ; 3559: 085A
        movlp           0x0c        ; 355A: 318C
        goto            I2CWrite    ; 355B: 2CB3

label_355c
; jump here from: 2F4C
        goto            label_356c  ; 355C: 2D6C
;
; end of label_355c
;------------------------------------------------------------


loop_355d
; jump here from: 3570
        call            sub_378e    ; 355D: 278E

        movlp           0x0c        ; 355E: 318C
        call            I2CWrite    ; 355F: 24B3

        movlw           0x08        ; 3560: 3008
        movwf           mem_3b      ; 3561: 00BB

label_3562
; jump here from: 356B
; jump here from: 357A
        clrf            mem_3a      ; 3562: 01BA
        return                      ; 3563: 0008

loop_3564
; jump here from: 3573
        goto            label_3767  ; 3564: 2F67

loop_3565
; jump here from: 3576
        goto            label_376f  ; 3565: 2F6F
;
; end of loop_3565
;------------------------------------------------------------


loop_3566
; jump here from: 3579
        call            sub_378e    ; 3566: 278E

        movlp           0x0c        ; 3567: 318C
        call            I2CWrite    ; 3568: 24B3

        movlp           0x35        ; 3569: 31B5
        clrf            mem_3b      ; 356A: 01BB
        goto            label_3562  ; 356B: 2D62

label_356c
; jump here from: 355C
        movlb           0x00        ; 356C: 0020
        movf            mem_3a, W   ; 356D: 083A
        xorlw           0x01        ; 356E: 3A01
        btfsc           STATUS, Z   ; 356F: 1903
        goto            loop_355d   ; 3570: 2D5D

        xorlw           0x03        ; 3571: 3A03
        btfsc           STATUS, Z   ; 3572: 1903
        goto            loop_3564   ; 3573: 2D64

        xorlw           0x01        ; 3574: 3A01
        btfsc           STATUS, Z   ; 3575: 1903
        goto            loop_3565   ; 3576: 2D65

        xorlw           0x07        ; 3577: 3A07
        btfsc           STATUS, Z   ; 3578: 1903
        goto            loop_3566   ; 3579: 2D66
        goto            label_3562  ; 357A: 2D62
;
; end of label_356c
;------------------------------------------------------------

        return                      ; 357B: 0008

label_357c
; jump here from: 2F42
        goto            label_358c  ; 357C: 2D8C

loop_357d
; jump here from: 3590
        call            sub_3787    ; 357D: 2787

        movlp           0x0c        ; 357E: 318C
        call            I2CWrite    ; 357F: 24B3

        movlw           0x06        ; 3580: 3006
        movwf           mem_3b      ; 3581: 00BB

label_3582
; jump here from: 358B
; jump here from: 359A
        clrf            mem_3a      ; 3582: 01BA
        return                      ; 3583: 0008

loop_3584
; jump here from: 3593
        goto            label_3767  ; 3584: 2F67

loop_3585
; jump here from: 3596
        goto            label_376f  ; 3585: 2F6F
;
; end of loop_3585
;------------------------------------------------------------


loop_3586
; jump here from: 3599
        call            sub_3787    ; 3586: 2787

        movlp           0x0c        ; 3587: 318C
        call            I2CWrite    ; 3588: 24B3

        movlp           0x35        ; 3589: 31B5
        clrf            mem_3b      ; 358A: 01BB
        goto            label_3582  ; 358B: 2D82

label_358c
; jump here from: 357C
        movlb           0x00        ; 358C: 0020
        movf            mem_3a, W   ; 358D: 083A
        xorlw           0x01        ; 358E: 3A01
        btfsc           STATUS, Z   ; 358F: 1903
        goto            loop_357d   ; 3590: 2D7D

        xorlw           0x03        ; 3591: 3A03
        btfsc           STATUS, Z   ; 3592: 1903
        goto            loop_3584   ; 3593: 2D84

        xorlw           0x01        ; 3594: 3A01
        btfsc           STATUS, Z   ; 3595: 1903
        goto            loop_3585   ; 3596: 2D85

        xorlw           0x07        ; 3597: 3A07
        btfsc           STATUS, Z   ; 3598: 1903
        goto            loop_3586   ; 3599: 2D86
        goto            label_3582  ; 359A: 2D82
;
; end of label_358c
;------------------------------------------------------------

        return                      ; 359B: 0008

label_359c
; jump here from: 2F9C
        goto            label_35c2  ; 359C: 2DC2

loop_359d
; jump here from: 35C6
        movf            mem_46, W   ; 359D: 0846
        movwf           mem_36      ; 359E: 00B6
        movlp           0x26        ; 359F: 31A6
        call            sub_2627    ; 35A0: 2627

        movlp           0x35        ; 35A1: 31B5
        movlb           0x01        ; 35A2: 0021
        movwf           mem_d5      ; 35A3: 00D5
        call            sub_377f    ; 35A4: 277F

        movlp           0x0c        ; 35A5: 318C
        call            I2CWrite    ; 35A6: 24B3

        movlb           0x03        ; 35A7: 0023
        movlw           0x18        ; 35A8: 3018
        clrf            mem_1c9     ; 35A9: 01C9
        incf            mem_1c9, f  ; 35AA: 0AC9
        movlb           0x00        ; 35AB: 0020
        movwf           mem_3b      ; 35AC: 00BB

label_35ad
; jump here from: 35C1
; jump here from: 35D0
        clrf            mem_3a      ; 35AD: 01BA
        return                      ; 35AE: 0008

loop_35af
; jump here from: 35C9
        goto            label_3767  ; 35AF: 2F67

loop_35b0
; jump here from: 35CC
        goto            label_376f  ; 35B0: 2F6F
;
; end of loop_35b0
;------------------------------------------------------------


loop_35b1
; jump here from: 35CF
        movf            mem_46, W   ; 35B1: 0846
        movwf           mem_36      ; 35B2: 00B6
        movlp           0x26        ; 35B3: 31A6
        call            sub_2627    ; 35B4: 2627

        movlp           0x35        ; 35B5: 31B5
        movlb           0x01        ; 35B6: 0021
        movwf           mem_d5      ; 35B7: 00D5
        call            sub_377f    ; 35B8: 277F

        movlp           0x0c        ; 35B9: 318C
        call            I2CWrite    ; 35BA: 24B3

        movlp           0x35        ; 35BB: 31B5
        movlb           0x03        ; 35BC: 0023
        clrf            mem_1c9     ; 35BD: 01C9
        incf            mem_1c9, f  ; 35BE: 0AC9
        movlb           0x00        ; 35BF: 0020
        clrf            mem_3b      ; 35C0: 01BB
        goto            label_35ad  ; 35C1: 2DAD

label_35c2
; jump here from: 359C
        movlb           0x00        ; 35C2: 0020
        movf            mem_3a, W   ; 35C3: 083A
        xorlw           0x01        ; 35C4: 3A01
        btfsc           STATUS, Z   ; 35C5: 1903
        goto            loop_359d   ; 35C6: 2D9D

        xorlw           0x03        ; 35C7: 3A03
        btfsc           STATUS, Z   ; 35C8: 1903
        goto            loop_35af   ; 35C9: 2DAF

        xorlw           0x01        ; 35CA: 3A01
        btfsc           STATUS, Z   ; 35CB: 1903
        goto            loop_35b0   ; 35CC: 2DB0

        xorlw           0x07        ; 35CD: 3A07
        btfsc           STATUS, Z   ; 35CE: 1903
        goto            loop_35b1   ; 35CF: 2DB1
        goto            label_35ad  ; 35D0: 2DAD
;
; end of label_35c2
;------------------------------------------------------------

        return                      ; 35D1: 0008

label_35d2
; jump here from: 2F56
        goto            label_35fc  ; 35D2: 2DFC

loop_35d3
; jump here from: 3600
        call            sub_3779    ; 35D3: 2779

        movlp           0x35        ; 35D4: 31B5
        call            sub_374e    ; 35D5: 274E

        movlp           0x35        ; 35D6: 31B5
        movwf           mem_32      ; 35D7: 00B2
        movf            mem_32, f   ; 35D8: 08B2
        btfss           STATUS, Z   ; 35D9: 1D03
        goto            loop_35e3   ; 35DA: 2DE3

        movf            mem_46, W   ; 35DB: 0846
        call            sub_379b    ; 35DC: 279B

        movlp           0x0c        ; 35DD: 318C
        call            I2CWrite    ; 35DE: 24B3

        movlp           0x35        ; 35DF: 31B5
        movlw           0x0a        ; 35E0: 300A
        movwf           mem_3b      ; 35E1: 00BB
        goto            label_35e5  ; 35E2: 2DE5

loop_35e3
; jump here from: 35DA
        movlp           0x16        ; 35E3: 3196
        call            sub_167c    ; 35E4: 267C

label_35e5
; jump here from: 35E2
; jump here from: 35FB
; jump here from: 360A
        clrf            mem_3a      ; 35E5: 01BA
        return                      ; 35E6: 0008

loop_35e7
; jump here from: 3603
        goto            label_3767  ; 35E7: 2F67

loop_35e8
; jump here from: 3606
        goto            label_376f  ; 35E8: 2F6F
;
; end of loop_35e8
;------------------------------------------------------------


loop_35e9
; jump here from: 3609
        call            sub_3779    ; 35E9: 2779

        movlp           0x35        ; 35EA: 31B5
        call            sub_374e    ; 35EB: 274E

        movlp           0x35        ; 35EC: 31B5
        movwf           mem_32      ; 35ED: 00B2
        movf            mem_32, f   ; 35EE: 08B2
        btfss           STATUS, Z   ; 35EF: 1D03
        goto            loop_35f7   ; 35F0: 2DF7

        movf            mem_46, W   ; 35F1: 0846
        call            sub_379b    ; 35F2: 279B

        movlp           0x0c        ; 35F3: 318C
        call            I2CWrite    ; 35F4: 24B3

        movlp           0x35        ; 35F5: 31B5
        goto            label_35fa  ; 35F6: 2DFA

loop_35f7
; jump here from: 35F0
        movlp           0x16        ; 35F7: 3196
        call            sub_167c    ; 35F8: 267C

        movlp           0x35        ; 35F9: 31B5

label_35fa
; jump here from: 35F6
        clrf            mem_3b      ; 35FA: 01BB
        goto            label_35e5  ; 35FB: 2DE5

label_35fc
; jump here from: 35D2
        movlb           0x00        ; 35FC: 0020
        movf            mem_3a, W   ; 35FD: 083A
        xorlw           0x01        ; 35FE: 3A01
        btfsc           STATUS, Z   ; 35FF: 1903
        goto            loop_35d3   ; 3600: 2DD3

        xorlw           0x03        ; 3601: 3A03
        btfsc           STATUS, Z   ; 3602: 1903
        goto            loop_35e7   ; 3603: 2DE7

        xorlw           0x01        ; 3604: 3A01
        btfsc           STATUS, Z   ; 3605: 1903
        goto            loop_35e8   ; 3606: 2DE8

        xorlw           0x07        ; 3607: 3A07
        btfsc           STATUS, Z   ; 3608: 1903
        goto            loop_35e9   ; 3609: 2DE9
        goto            label_35e5  ; 360A: 2DE5
;
; end of label_35fc
;------------------------------------------------------------

        return                      ; 360B: 0008

label_360c
; jump here from: 2F6A
        goto            label_3648  ; 360C: 2E48

loop_360d
; jump here from: 364C
        call            sub_3779    ; 360D: 2779

        movlp           0x35        ; 360E: 31B5
        call            sub_374e    ; 360F: 274E

        movlp           0x35        ; 3610: 31B5
        movwf           mem_32      ; 3611: 00B2
        movf            mem_32, f   ; 3612: 08B2
        btfss           STATUS, Z   ; 3613: 1D03
        goto            loop_361b   ; 3614: 2E1B

        movf            mem_40, W   ; 3615: 0840
        call            sub_37a1    ; 3616: 27A1

        movlp           0x35        ; 3617: 31B5
        call            sub_374e    ; 3618: 274E

        movlp           0x35        ; 3619: 31B5
        movwf           mem_32      ; 361A: 00B2

loop_361b
; jump here from: 3614
        movf            mem_32, f   ; 361B: 08B2
        btfss           STATUS, Z   ; 361C: 1D03
        goto            loop_3626   ; 361D: 2E26

        movf            mem_46, W   ; 361E: 0846
        call            sub_3795    ; 361F: 2795

        movlp           0x0c        ; 3620: 318C
        call            I2CWrite    ; 3621: 24B3

        movlp           0x35        ; 3622: 31B5
        movlw           0x0e        ; 3623: 300E
        movwf           mem_3b      ; 3624: 00BB
        goto            label_3628  ; 3625: 2E28

loop_3626
; jump here from: 361D
        movlp           0x16        ; 3626: 3196
        call            sub_167c    ; 3627: 267C

label_3628
; jump here from: 3625
; jump here from: 3647
; jump here from: 3656
        clrf            mem_3a      ; 3628: 01BA
        return                      ; 3629: 0008

loop_362a
; jump here from: 364F
        goto            label_3767  ; 362A: 2F67

loop_362b
; jump here from: 3652
        goto            label_376f  ; 362B: 2F6F
;
; end of loop_362b
;------------------------------------------------------------


loop_362c
; jump here from: 3655
        call            sub_3779    ; 362C: 2779

        movlp           0x35        ; 362D: 31B5
        call            sub_374e    ; 362E: 274E

        movlp           0x35        ; 362F: 31B5
        movwf           mem_32      ; 3630: 00B2
        movf            mem_32, f   ; 3631: 08B2
        btfss           STATUS, Z   ; 3632: 1D03
        goto            loop_363a   ; 3633: 2E3A

        movf            mem_40, W   ; 3634: 0840
        call            sub_37a1    ; 3635: 27A1

        movlp           0x35        ; 3636: 31B5
        call            sub_374e    ; 3637: 274E

        movlp           0x35        ; 3638: 31B5
        movwf           mem_32      ; 3639: 00B2

loop_363a
; jump here from: 3633
        movf            mem_32, f   ; 363A: 08B2
        btfss           STATUS, Z   ; 363B: 1D03
        goto            loop_3643   ; 363C: 2E43

        movf            mem_46, W   ; 363D: 0846
        call            sub_3795    ; 363E: 2795

        movlp           0x0c        ; 363F: 318C
        call            I2CWrite    ; 3640: 24B3

        movlp           0x35        ; 3641: 31B5
        goto            label_3646  ; 3642: 2E46

loop_3643
; jump here from: 363C
        movlp           0x16        ; 3643: 3196
        call            sub_167c    ; 3644: 267C

        movlp           0x35        ; 3645: 31B5

label_3646
; jump here from: 3642
        clrf            mem_3b      ; 3646: 01BB
        goto            label_3628  ; 3647: 2E28

label_3648
; jump here from: 360C
        movlb           0x00        ; 3648: 0020
        movf            mem_3a, W   ; 3649: 083A
        xorlw           0x01        ; 364A: 3A01
        btfsc           STATUS, Z   ; 364B: 1903
        goto            loop_360d   ; 364C: 2E0D

        xorlw           0x03        ; 364D: 3A03
        btfsc           STATUS, Z   ; 364E: 1903
        goto            loop_362a   ; 364F: 2E2A

        xorlw           0x01        ; 3650: 3A01
        btfsc           STATUS, Z   ; 3651: 1903
        goto            loop_362b   ; 3652: 2E2B

        xorlw           0x07        ; 3653: 3A07
        btfsc           STATUS, Z   ; 3654: 1903
        goto            loop_362c   ; 3655: 2E2C
        goto            label_3628  ; 3656: 2E28
;
; end of label_3648
;------------------------------------------------------------

        return                      ; 3657: 0008

label_3658
; jump here from: 2F60
        goto            label_36a8  ; 3658: 2EA8

loop_3659
; jump here from: 36AC
        call            sub_3779    ; 3659: 2779

        movlp           0x35        ; 365A: 31B5
        call            sub_374e    ; 365B: 274E

        movlp           0x35        ; 365C: 31B5
        movwf           mem_32      ; 365D: 00B2
        movf            mem_32, f   ; 365E: 08B2
        btfss           STATUS, Z   ; 365F: 1D03
        goto            loop_3670   ; 3660: 2E70

        movf            mem_46, W   ; 3661: 0846
        call            sub_37b5    ; 3662: 27B5

        movlp           0x35        ; 3663: 31B5
        call            sub_374e    ; 3664: 274E

        movlp           0x35        ; 3665: 31B5
        movwf           mem_32      ; 3666: 00B2
        movf            mem_32, f   ; 3667: 08B2
        btfss           STATUS, Z   ; 3668: 1D03
        goto            loop_3670   ; 3669: 2E70

        movf            mem_46, W   ; 366A: 0846
        call            sub_37ba    ; 366B: 27BA

        movlp           0x35        ; 366C: 31B5
        call            sub_374e    ; 366D: 274E

        movlp           0x35        ; 366E: 31B5
        movwf           mem_32      ; 366F: 00B2

loop_3670
; jump here from: 3660
; jump here from: 3669
        movf            mem_32, f   ; 3670: 08B2
        btfss           STATUS, Z   ; 3671: 1D03
        goto            loop_367c   ; 3672: 2E7C

        movf            mem_46, W   ; 3673: 0846
        movwf           mem_40      ; 3674: 00C0
        call            sub_37d9    ; 3675: 27D9

        movlp           0x0c        ; 3676: 318C
        call            I2CWrite    ; 3677: 24B3

        movlp           0x35        ; 3678: 31B5
        movlw           0x0c        ; 3679: 300C
        movwf           mem_3b      ; 367A: 00BB
        goto            label_367e  ; 367B: 2E7E

loop_367c
; jump here from: 3672
        movlp           0x16        ; 367C: 3196
        call            sub_167c    ; 367D: 267C

label_367e
; jump here from: 367B
; jump here from: 36A7
; jump here from: 36B6
        clrf            mem_3a      ; 367E: 01BA
        return                      ; 367F: 0008

loop_3680
; jump here from: 36AF
        goto            label_3767  ; 3680: 2F67

loop_3681
; jump here from: 36B2
        goto            label_376f  ; 3681: 2F6F
;
; end of loop_3681
;------------------------------------------------------------


loop_3682
; jump here from: 36B5
        call            sub_3779    ; 3682: 2779

        movlp           0x35        ; 3683: 31B5
        call            sub_374e    ; 3684: 274E

        movlp           0x35        ; 3685: 31B5
        movwf           mem_32      ; 3686: 00B2
        movf            mem_32, f   ; 3687: 08B2
        btfss           STATUS, Z   ; 3688: 1D03
        goto            loop_3699   ; 3689: 2E99

        movf            mem_46, W   ; 368A: 0846
        call            sub_37b5    ; 368B: 27B5

        movlp           0x35        ; 368C: 31B5
        call            sub_374e    ; 368D: 274E

        movlp           0x35        ; 368E: 31B5
        movwf           mem_32      ; 368F: 00B2
        movf            mem_32, f   ; 3690: 08B2
        btfss           STATUS, Z   ; 3691: 1D03
        goto            loop_3699   ; 3692: 2E99

        movf            mem_46, W   ; 3693: 0846
        call            sub_37ba    ; 3694: 27BA

        movlp           0x35        ; 3695: 31B5
        call            sub_374e    ; 3696: 274E

        movlp           0x35        ; 3697: 31B5
        movwf           mem_32      ; 3698: 00B2

loop_3699
; jump here from: 3689
; jump here from: 3692
        movf            mem_32, f   ; 3699: 08B2
        btfss           STATUS, Z   ; 369A: 1D03
        goto            loop_36a3   ; 369B: 2EA3

        movf            mem_46, W   ; 369C: 0846
        movwf           mem_40      ; 369D: 00C0
        call            sub_37d9    ; 369E: 27D9

        movlp           0x0c        ; 369F: 318C
        call            I2CWrite    ; 36A0: 24B3

        movlp           0x35        ; 36A1: 31B5
        goto            label_36a6  ; 36A2: 2EA6

loop_36a3
; jump here from: 369B
        movlp           0x16        ; 36A3: 3196
        call            sub_167c    ; 36A4: 267C

        movlp           0x35        ; 36A5: 31B5

label_36a6
; jump here from: 36A2
        clrf            mem_3b      ; 36A6: 01BB
        goto            label_367e  ; 36A7: 2E7E

label_36a8
; jump here from: 3658
        movlb           0x00        ; 36A8: 0020
        movf            mem_3a, W   ; 36A9: 083A
        xorlw           0x01        ; 36AA: 3A01
        btfsc           STATUS, Z   ; 36AB: 1903
        goto            loop_3659   ; 36AC: 2E59

        xorlw           0x03        ; 36AD: 3A03
        btfsc           STATUS, Z   ; 36AE: 1903
        goto            loop_3680   ; 36AF: 2E80

        xorlw           0x01        ; 36B0: 3A01
        btfsc           STATUS, Z   ; 36B1: 1903
        goto            loop_3681   ; 36B2: 2E81

        xorlw           0x07        ; 36B3: 3A07
        btfsc           STATUS, Z   ; 36B4: 1903
        goto            loop_3682   ; 36B5: 2E82
        goto            label_367e  ; 36B6: 2E7E
;
; end of label_36a8
;------------------------------------------------------------

        return                      ; 36B7: 0008

label_36b8
; jump here from: 2F74
        goto            label_373e  ; 36B8: 2F3E

loop_36b9
; jump here from: 3742
        call            sub_3779    ; 36B9: 2779

        movlp           0x35        ; 36BA: 31B5
        call            sub_374e    ; 36BB: 274E

        movlp           0x35        ; 36BC: 31B5
        movwf           mem_32      ; 36BD: 00B2
        movf            mem_32, f   ; 36BE: 08B2
        btfss           STATUS, Z   ; 36BF: 1D03
        goto            loop_36c7   ; 36C0: 2EC7

        movf            mem_40, W   ; 36C1: 0840
        call            sub_37a1    ; 36C2: 27A1

        movlp           0x35        ; 36C3: 31B5
        call            sub_374e    ; 36C4: 274E

        movlp           0x35        ; 36C5: 31B5
        movwf           mem_32      ; 36C6: 00B2

loop_36c7
; jump here from: 36C0
        movf            mem_32, f   ; 36C7: 08B2
        btfss           STATUS, Z   ; 36C8: 1D03
        goto            loop_36d0   ; 36C9: 2ED0

        movf            mem_46, W   ; 36CA: 0846
        call            sub_37a6    ; 36CB: 27A6

        movlp           0x35        ; 36CC: 31B5
        call            sub_374e    ; 36CD: 274E

        movlp           0x35        ; 36CE: 31B5
        movwf           mem_32      ; 36CF: 00B2

loop_36d0
; jump here from: 36C9
        movf            mem_32, f   ; 36D0: 08B2
        btfss           STATUS, Z   ; 36D1: 1D03
        goto            loop_36d9   ; 36D2: 2ED9

        movf            mem_46, W   ; 36D3: 0846
        call            sub_37ab    ; 36D4: 27AB

        movlp           0x35        ; 36D5: 31B5
        call            sub_374e    ; 36D6: 274E

        movlp           0x35        ; 36D7: 31B5
        movwf           mem_32      ; 36D8: 00B2

loop_36d9
; jump here from: 36D2
        movf            mem_32, f   ; 36D9: 08B2
        btfss           STATUS, Z   ; 36DA: 1D03
        goto            loop_36e2   ; 36DB: 2EE2

        movf            mem_46, W   ; 36DC: 0846
        call            sub_37bf    ; 36DD: 27BF

        movlp           0x35        ; 36DE: 31B5
        call            sub_374e    ; 36DF: 274E

        movlp           0x35        ; 36E0: 31B5
        movwf           mem_32      ; 36E1: 00B2

loop_36e2
; jump here from: 36DB
        movf            mem_32, f   ; 36E2: 08B2
        btfss           STATUS, Z   ; 36E3: 1D03
        goto            loop_36eb   ; 36E4: 2EEB

        movf            mem_46, W   ; 36E5: 0846
        call            sub_37b0    ; 36E6: 27B0

        movlp           0x35        ; 36E7: 31B5
        call            sub_374e    ; 36E8: 274E

        movlp           0x35        ; 36E9: 31B5
        movwf           mem_32      ; 36EA: 00B2

loop_36eb
; jump here from: 36E4
        movf            mem_32, f   ; 36EB: 08B2
        btfss           STATUS, Z   ; 36EC: 1D03
        goto            loop_36f7   ; 36ED: 2EF7

        movf            mem_46, W   ; 36EE: 0846
        movwf           mem_43      ; 36EF: 00C3
        call            sub_37f7    ; 36F0: 27F7

        movlp           0x0c        ; 36F1: 318C
        call            I2CWrite    ; 36F2: 24B3

        movlp           0x35        ; 36F3: 31B5
        movlw           0x10        ; 36F4: 3010
        movwf           mem_3b      ; 36F5: 00BB
        goto            label_36f9  ; 36F6: 2EF9

loop_36f7
; jump here from: 36ED
        movlp           0x16        ; 36F7: 3196
        call            sub_167c    ; 36F8: 267C

label_36f9
; jump here from: 36F6
; jump here from: 373D
; jump here from: 374C
        clrf            mem_3a      ; 36F9: 01BA
        return                      ; 36FA: 0008

loop_36fb
; jump here from: 3745
        goto            label_3767  ; 36FB: 2F67

loop_36fc
; jump here from: 3748
        goto            label_376f  ; 36FC: 2F6F
;
; end of loop_36fc
;------------------------------------------------------------


loop_36fd
; jump here from: 374B
        call            sub_3779    ; 36FD: 2779

        movlp           0x35        ; 36FE: 31B5
        call            sub_374e    ; 36FF: 274E

        movlp           0x35        ; 3700: 31B5
        movwf           mem_32      ; 3701: 00B2
        movf            mem_32, f   ; 3702: 08B2
        btfss           STATUS, Z   ; 3703: 1D03
        goto            loop_370b   ; 3704: 2F0B

        movf            mem_40, W   ; 3705: 0840
        call            sub_37a1    ; 3706: 27A1

        movlp           0x35        ; 3707: 31B5
        call            sub_374e    ; 3708: 274E

        movlp           0x35        ; 3709: 31B5
        movwf           mem_32      ; 370A: 00B2

loop_370b
; jump here from: 3704
        movf            mem_32, f   ; 370B: 08B2
        btfss           STATUS, Z   ; 370C: 1D03
        goto            loop_3714   ; 370D: 2F14

        movf            mem_46, W   ; 370E: 0846
        call            sub_37a6    ; 370F: 27A6

        movlp           0x35        ; 3710: 31B5
        call            sub_374e    ; 3711: 274E

        movlp           0x35        ; 3712: 31B5
        movwf           mem_32      ; 3713: 00B2

loop_3714
; jump here from: 370D
        movf            mem_32, f   ; 3714: 08B2
        btfss           STATUS, Z   ; 3715: 1D03
        goto            loop_371d   ; 3716: 2F1D

        movf            mem_46, W   ; 3717: 0846
        call            sub_37ab    ; 3718: 27AB

        movlp           0x35        ; 3719: 31B5
        call            sub_374e    ; 371A: 274E

        movlp           0x35        ; 371B: 31B5
        movwf           mem_32      ; 371C: 00B2

loop_371d
; jump here from: 3716
        movf            mem_32, f   ; 371D: 08B2
        btfss           STATUS, Z   ; 371E: 1D03
        goto            loop_3726   ; 371F: 2F26

        movf            mem_46, W   ; 3720: 0846
        call            sub_37bf    ; 3721: 27BF

        movlp           0x35        ; 3722: 31B5
        call            sub_374e    ; 3723: 274E

        movlp           0x35        ; 3724: 31B5
        movwf           mem_32      ; 3725: 00B2

loop_3726
; jump here from: 371F
        movf            mem_32, f   ; 3726: 08B2
        btfss           STATUS, Z   ; 3727: 1D03
        goto            loop_372f   ; 3728: 2F2F

        movf            mem_46, W   ; 3729: 0846
        call            sub_37b0    ; 372A: 27B0

        movlp           0x35        ; 372B: 31B5
        call            sub_374e    ; 372C: 274E

        movlp           0x35        ; 372D: 31B5
        movwf           mem_32      ; 372E: 00B2

loop_372f
; jump here from: 3728
        movf            mem_32, f   ; 372F: 08B2
        btfss           STATUS, Z   ; 3730: 1D03
        goto            loop_3739   ; 3731: 2F39

        movf            mem_46, W   ; 3732: 0846
        movwf           mem_43      ; 3733: 00C3
        call            sub_37f7    ; 3734: 27F7

        movlp           0x0c        ; 3735: 318C
        call            I2CWrite    ; 3736: 24B3

        movlp           0x35        ; 3737: 31B5
        goto            label_373c  ; 3738: 2F3C

loop_3739
; jump here from: 3731
        movlp           0x16        ; 3739: 3196
        call            sub_167c    ; 373A: 267C

        movlp           0x35        ; 373B: 31B5

label_373c
; jump here from: 3738
        clrf            mem_3b      ; 373C: 01BB
        goto            label_36f9  ; 373D: 2EF9

label_373e
; jump here from: 36B8
        movlb           0x00        ; 373E: 0020
        movf            mem_3a, W   ; 373F: 083A
        xorlw           0x01        ; 3740: 3A01
        btfsc           STATUS, Z   ; 3741: 1903
        goto            loop_36b9   ; 3742: 2EB9

        xorlw           0x03        ; 3743: 3A03
        btfsc           STATUS, Z   ; 3744: 1903
        goto            loop_36fb   ; 3745: 2EFB

        xorlw           0x01        ; 3746: 3A01
        btfsc           STATUS, Z   ; 3747: 1903
        goto            loop_36fc   ; 3748: 2EFC

        xorlw           0x07        ; 3749: 3A07
        btfsc           STATUS, Z   ; 374A: 1903
        goto            loop_36fd   ; 374B: 2EFD
        goto            label_36f9  ; 374C: 2EF9
;
; end of label_373e
;------------------------------------------------------------

        return                      ; 374D: 0008

;------------------------------------------------------------
; Subroutine: sub_374e
;
; called from: 35D5
; called from: 35EB
; called from: 360F
; called from: 3618
; called from: 362E
; called from: 3637
; called from: 365B
; called from: 3664
; called from: 366D
; called from: 3684
; called from: 368D
; called from: 3696
; called from: 36BB
; called from: 36C4
; called from: 36CD
; called from: 36D6
; called from: 36DF
; called from: 36E8
; called from: 36FF
; called from: 3708
; called from: 3711
; called from: 371A
; called from: 3723
; called from: 372C

sub_374e
        movwf           mem_51      ; 374E: 00D1
        movf            mem_4f, W   ; 374F: 084F
        subwf           mem_51, W   ; 3750: 0251
        btfsc           STATUS, C   ; 3751: 1803
        goto            loop_375c   ; 3752: 2F5C

        movf            mem_50, W   ; 3753: 0850
        subwf           mem_51, W   ; 3754: 0251
        btfsc           STATUS, C   ; 3755: 1803
        retlw           0x00        ; 3756: 3400
        movf            mem_4f, W   ; 3757: 084F
        subwf           mem_50, W   ; 3758: 0250

label_3759
; jump here from: 3766
        btfss           STATUS, C   ; 3759: 1C03
        retlw           0x01        ; 375A: 3401
        retlw           0x00        ; 375B: 3400

loop_375c
; jump here from: 3752
        movf            mem_51, W   ; 375C: 0851
        xorwf           mem_4f, W   ; 375D: 064F
        btfsc           STATUS, Z   ; 375E: 1903
        retlw           0x00        ; 375F: 3400
        movf            mem_4f, W   ; 3760: 084F
        subwf           mem_50, W   ; 3761: 0250
        btfss           STATUS, C   ; 3762: 1C03
        retlw           0x01        ; 3763: 3401
        movf            mem_50, W   ; 3764: 0850
        subwf           mem_51, W   ; 3765: 0251
        goto            label_3759  ; 3766: 2F59

label_3767
; jump here from: 3564
; jump here from: 3584
; jump here from: 35AF
; jump here from: 35E7
; jump here from: 362A
; jump here from: 3680
; jump here from: 36FB
        movlb           0x00        ; 3767: 0020
        movlw           0x18        ; 3768: 3018
        incf            mem_46, f   ; 3769: 0AC6
        subwf           mem_46, W   ; 376A: 0246
        btfsc           STATUS, C   ; 376B: 1803
        clrf            mem_46      ; 376C: 01C6
        clrf            mem_3a      ; 376D: 01BA
        return                      ; 376E: 0008

label_376f
; jump here from: 3565
; jump here from: 3585
; jump here from: 35B0
; jump here from: 35E8
; jump here from: 362B
; jump here from: 3681
; jump here from: 36FC
        movlb           0x00        ; 376F: 0020
        movlw           0x18        ; 3770: 3018
        decf            mem_46, f   ; 3771: 03C6
        subwf           mem_46, W   ; 3772: 0246
        btfss           STATUS, C   ; 3773: 1C03
        goto            loop_3777   ; 3774: 2F77

        movlw           0x17        ; 3775: 3017
        movwf           mem_46      ; 3776: 00C6

loop_3777
; jump here from: 3774
        clrf            mem_3a      ; 3777: 01BA
        return                      ; 3778: 0008

;------------------------------------------------------------
; Subroutine: sub_3779
;
; called from: 35D3
; called from: 35E9
; called from: 360D
; called from: 362C
; called from: 3659
; called from: 3682
; called from: 36B9
; called from: 36FD

sub_3779
        movf            mem_3c, W   ; 3779: 083C
        movwf           mem_4f      ; 377A: 00CF
        movf            mem_46, W   ; 377B: 0846
        movwf           mem_50      ; 377C: 00D0
        movf            mem_3e, W   ; 377D: 083E
        return                      ; 377E: 0008

;------------------------------------------------------------
; Subroutine: sub_377f
;
; called from: 0B31
; called from: 35A4
; called from: 35B8

sub_377f
        movlw           0x13        ; 377F: 3013
        movlb           0x00        ; 3780: 0020
        movwf           mem_55      ; 3781: 00D5
        movlb           0x01        ; 3782: 0021
        movf            mem_d5, W   ; 3783: 0855
        movlb           0x00        ; 3784: 0020
        movwf           mem_56      ; 3785: 00D6
        retlw           0x88        ; 3786: 3488

;------------------------------------------------------------
; Subroutine: sub_3787
;
; called from: 357D
; called from: 3586

sub_3787
        movf            mem_46, W   ; 3787: 0846
        movwf           mem_3e      ; 3788: 00BE
        movlw           0x68        ; 3789: 3068
        movwf           mem_55      ; 378A: 00D5
        movf            mem_3e, W   ; 378B: 083E
        movwf           mem_56      ; 378C: 00D6
        retlw           0x88        ; 378D: 3488

;------------------------------------------------------------
; Subroutine: sub_378e
;
; called from: 355D
; called from: 3566

sub_378e
        movf            mem_46, W   ; 378E: 0846
        movwf           mem_3c      ; 378F: 00BC
        movlw           0x6a        ; 3790: 306A
        movwf           mem_55      ; 3791: 00D5
        movf            mem_3c, W   ; 3792: 083C
        movwf           mem_56      ; 3793: 00D6
        retlw           0x88        ; 3794: 3488

;------------------------------------------------------------
; Subroutine: sub_3795
;
; called from: 361F
; called from: 363E

sub_3795
        movwf           mem_44      ; 3795: 00C4
        movlw           0x70        ; 3796: 3070
        movwf           mem_55      ; 3797: 00D5
        movf            mem_44, W   ; 3798: 0844
        movwf           mem_56      ; 3799: 00D6
        retlw           0x88        ; 379A: 3488

;------------------------------------------------------------
; Subroutine: sub_379b
;
; called from: 35DC
; called from: 35F2

sub_379b
        movwf           mem_41      ; 379B: 00C1
        movlw           0x6c        ; 379C: 306C
        movwf           mem_55      ; 379D: 00D5
        movf            mem_41, W   ; 379E: 0841
        movwf           mem_56      ; 379F: 00D6
        retlw           0x88        ; 37A0: 3488

;------------------------------------------------------------
; Subroutine: sub_37a1
;
; called from: 3616
; called from: 3635
; called from: 36C2
; called from: 3706

sub_37a1
        movwf           mem_4f      ; 37A1: 00CF
        movf            mem_46, W   ; 37A2: 0846
        movwf           mem_50      ; 37A3: 00D0
        movf            mem_41, W   ; 37A4: 0841
        return                      ; 37A5: 0008

;------------------------------------------------------------
; Subroutine: sub_37a6
;
; called from: 36CB
; called from: 370F

sub_37a6
        movwf           mem_4f      ; 37A6: 00CF
        movf            mem_3e, W   ; 37A7: 083E
        movwf           mem_50      ; 37A8: 00D0
        movf            mem_44, W   ; 37A9: 0844
        return                      ; 37AA: 0008

;------------------------------------------------------------
; Subroutine: sub_37ab
;
; called from: 36D4
; called from: 3718

sub_37ab
        movwf           mem_4f      ; 37AB: 00CF
        movf            mem_3c, W   ; 37AC: 083C
        movwf           mem_50      ; 37AD: 00D0
        movf            mem_44, W   ; 37AE: 0844
        return                      ; 37AF: 0008

;------------------------------------------------------------
; Subroutine: sub_37b0
;
; called from: 36E6
; called from: 372A

sub_37b0
        movwf           mem_4f      ; 37B0: 00CF
        movf            mem_40, W   ; 37B1: 0840
        movwf           mem_50      ; 37B2: 00D0
        movf            mem_44, W   ; 37B3: 0844
        return                      ; 37B4: 0008

;------------------------------------------------------------
; Subroutine: sub_37b5
;
; called from: 3662
; called from: 368B

sub_37b5
        movwf           mem_4f      ; 37B5: 00CF
        movf            mem_3e, W   ; 37B6: 083E
        movwf           mem_50      ; 37B7: 00D0
        movf            mem_41, W   ; 37B8: 0841
        return                      ; 37B9: 0008

;------------------------------------------------------------
; Subroutine: sub_37ba
;
; called from: 366B
; called from: 3694

sub_37ba
        movwf           mem_4f      ; 37BA: 00CF
        movf            mem_3c, W   ; 37BB: 083C
        movwf           mem_50      ; 37BC: 00D0
        movf            mem_41, W   ; 37BD: 0841
        return                      ; 37BE: 0008

;------------------------------------------------------------
; Subroutine: sub_37bf
;
; called from: 36DD
; called from: 3721

sub_37bf
        movwf           mem_4f      ; 37BF: 00CF
        movf            mem_41, W   ; 37C0: 0841
        movwf           mem_50      ; 37C1: 00D0
        movf            mem_44, W   ; 37C2: 0844
        return                      ; 37C3: 0008

;------------------------------------------------------------
; Subroutine: sub_37c4
;
; called from: 0C62
; called from: 0C8B

sub_37c4
        movlw           0x6c        ; 37C4: 306C
        movlb           0x00        ; 37C5: 0020
        call            sub_37de    ; 37C6: 27DE

        movlp           0x0c        ; 37C7: 318C
        call            I2CWrite    ; 37C8: 24B3

        movlp           0x35        ; 37C9: 31B5
        movlw           0x6d        ; 37CA: 306D
        call            sub_37de    ; 37CB: 27DE

        movlp           0x0c        ; 37CC: 318C
        call            I2CWrite    ; 37CD: 24B3

        movlp           0x35        ; 37CE: 31B5
        call            sub_37d9    ; 37CF: 27D9

        movlp           0x0c        ; 37D0: 318C

loop_37d1
; jump here from: 341A
        call            I2CWrite    ; 37D1: 24B3

        movlw           0x6f        ; 37D2: 306F
        movwf           mem_55      ; 37D3: 00D5
        movf            mem_40, W   ; 37D4: 0840
        movwf           mem_56      ; 37D5: 00D6
        movlw           0x88        ; 37D6: 3088
        movlp           0x0c        ; 37D7: 318C
        goto            I2CWrite    ; 37D8: 2CB3

;------------------------------------------------------------
; Subroutine: sub_37d9
;
; called from: 3675
; called from: 369E
; called from: 37CF

sub_37d9
        movlw           0x6e        ; 37D9: 306E
        movwf           mem_55      ; 37DA: 00D5
        movf            mem_40, W   ; 37DB: 0840
        movwf           mem_56      ; 37DC: 00D6
        retlw           0x88        ; 37DD: 3488

;------------------------------------------------------------
; Subroutine: sub_37de
;
; called from: 37C6
; called from: 37CB

sub_37de
        movwf           mem_55      ; 37DE: 00D5
        movf            mem_41, W   ; 37DF: 0841
        movwf           mem_56      ; 37E0: 00D6
        retlw           0x88        ; 37E1: 3488

;------------------------------------------------------------
; Subroutine: sub_37e2
;
; called from: 0CA0

sub_37e2
        movlw           0x70        ; 37E2: 3070

label_37e3
; jump here from: 3421
        movlb           0x00        ; 37E3: 0020
        call            sub_37fc    ; 37E4: 27FC

loop_37e5
; jump here from: 341D
        movlp           0x0c        ; 37E5: 318C
        call            I2CWrite    ; 37E6: 24B3

        movlp           0x35        ; 37E7: 31B5
        movlw           0x71        ; 37E8: 3071
        call            sub_37fc    ; 37E9: 27FC

        movlp           0x0c        ; 37EA: 318C
        call            I2CWrite    ; 37EB: 24B3

        movlp           0x35        ; 37EC: 31B5
        call            sub_37f7    ; 37ED: 27F7

        movlp           0x0c        ; 37EE: 318C
        call            I2CWrite    ; 37EF: 24B3

        movlw           0x73        ; 37F0: 3073
        movwf           mem_55      ; 37F1: 00D5
        movf            mem_43, W   ; 37F2: 0843
        movwf           mem_56      ; 37F3: 00D6
        movlw           0x88        ; 37F4: 3088

loop_37f5
; jump here from: 3417
; jump here from: 3420
        movlp           0x0c        ; 37F5: 318C
        goto            I2CWrite    ; 37F6: 2CB3

;------------------------------------------------------------
; Subroutine: sub_37f7
;
; called from: 36F0
; called from: 3734
; called from: 37ED

sub_37f7
        movlw           0x72        ; 37F7: 3072
        movwf           mem_55      ; 37F8: 00D5
        movf            mem_43, W   ; 37F9: 0843
        movwf           mem_56      ; 37FA: 00D6
        retlw           0x88        ; 37FB: 3488

;------------------------------------------------------------
; Subroutine: sub_37fc
;
; called from: 37E4
; called from: 37E9

sub_37fc
        movwf           mem_55      ; 37FC: 00D5
        movf            mem_44, W   ; 37FD: 0844
        movwf           mem_56      ; 37FE: 00D6
        retlw           0x88        ; 37FF: 3488
Bank3800_Vector org 0x3800

;------------------------------------------------------------
; Subroutine: sub_3f3b
;
; called from: 015C

sub_3f3b
        movlb           0x00        ; 3F3B: 0020
        movf            mem_3b, W   ; 3F3C: 083B
        xorlw           0x22        ; 3F3D: 3A22
        btfss           STATUS, Z   ; 3F3E: 1D03
        clrf            mem_3b      ; 3F3F: 01BB
        return                      ; 3F40: 0008

label_3f41
; jump here from: 2555
        movlb           0x02        ; 3F41: 0022
        clrf            mem_153     ; 3F42: 01D3
        clrf            mem_154     ; 3F43: 01D4
        clrf            mem_155     ; 3F44: 01D5
        clrf            mem_156     ; 3F45: 01D6
        return                      ; 3F46: 0008

;------------------------------------------------------------
; Subroutine: sub_3f47
;
; called from: 086A

sub_3f47
        movlw           0x09        ; 3F47: 3009
        movlb           0x00        ; 3F48: 0020
        movwf           mem_52      ; 3F49: 00D2
        movlw           0x88        ; 3F4A: 3088
        movlp           0x0d        ; 3F4B: 318D
        call            I2CRead    ; 3F4C: 25FD

        movlb           0x01        ; 3F4D: 0021
        movwf           mem_b2      ; 3F4E: 00B2
        return                      ; 3F4F: 0008

;------------------------------------------------------------
; Subroutine: sub_3f50
;
; called from: 086D

sub_3f50
        movlw           0x05        ; 3F50: 3005
        movlb           0x00        ; 3F51: 0020
        movwf           mem_52      ; 3F52: 00D2
        movlw           0x88        ; 3F53: 3088
        movlp           0x0d        ; 3F54: 318D
        call            I2CRead    ; 3F55: 25FD

        movlb           0x01        ; 3F56: 0021
        movwf           mem_b3      ; 3F57: 00B3
        return                      ; 3F58: 0008

;------------------------------------------------------------
; Subroutine: sub_3f59
;
; called from: 084E
; called from: 22F3

sub_3f59
        movlw           0x48        ; 3F59: 3048
        movlb           0x00        ; 3F5A: 0020
        movwf           mem_52      ; 3F5B: 00D2
        movlw           0x87        ; 3F5C: 3087
        movlp           0x0d        ; 3F5D: 318D
        call            I2CRead    ; 3F5E: 25FD

        movlp           0x3f        ; 3F5F: 31BF
        movlb           0x01        ; 3F60: 0021
        movwf           mem_b8      ; 3F61: 00B8
        movlw           0x08        ; 3F62: 3008
        subwf           mem_b8, W   ; 3F63: 0238
        btfss           STATUS, C   ; 3F64: 1C03
        return                      ; 3F65: 0008
        movlw           0x48        ; 3F66: 3048
        clrf            mem_38      ; 3F67: 01B8
        movlb           0x00        ; 3F68: 0020
        movwf           mem_55      ; 3F69: 00D5
        movlw           0x87        ; 3F6A: 3087
        clrf            mem_56      ; 3F6B: 01D6
        movlp           0x0c        ; 3F6C: 318C
        goto            I2CWrite    ; 3F6D: 2CB3

;------------------------------------------------------------
; Subroutine: sub_3f6e
;
; called from: 0851
; called from: 22F6

sub_3f6e
        movlw           0x48        ; 3F6E: 3048
        movlb           0x00        ; 3F6F: 0020
        movwf           mem_52      ; 3F70: 00D2
        movlw           0x83        ; 3F71: 3083
        movlp           0x0d        ; 3F72: 318D
        call            I2CRead    ; 3F73: 25FD

        movlp           0x3f        ; 3F74: 31BF
        movlb           0x01        ; 3F75: 0021
        movwf           mem_e9      ; 3F76: 00E9
        movlw           0x08        ; 3F77: 3008
        subwf           mem_e9, W   ; 3F78: 0269
        btfss           STATUS, C   ; 3F79: 1C03
        return                      ; 3F7A: 0008
        movlw           0x48        ; 3F7B: 3048
        clrf            mem_69      ; 3F7C: 01E9
        movlb           0x00        ; 3F7D: 0020
        movwf           mem_55      ; 3F7E: 00D5
        movlw           0x83        ; 3F7F: 3083
        clrf            mem_56      ; 3F80: 01D6
        movlp           0x0c        ; 3F81: 318C
        goto            I2CWrite    ; 3F82: 2CB3

;------------------------------------------------------------
; Subroutine: sub_3f83
;
; called from: 0930

sub_3f83
        clrf            mem_13a     ; 3F83: 01BA
        movlb           0x01        ; 3F84: 0021
        clrf            mem_c6      ; 3F85: 01C6
        clrf            mem_c3      ; 3F86: 01C3
        movlb           0x02        ; 3F87: 0022
        clrf            mem_165     ; 3F88: 01E5
        clrf            mem_12e     ; 3F89: 01AE
        clrf            mem_12d     ; 3F8A: 01AD
        movlb           0x00        ; 3F8B: 0020
        clrf            mem_32      ; 3F8C: 01B2
        movlb           0x01        ; 3F8D: 0021
        clrf            mem_e5      ; 3F8E: 01E5
        movlb           0x00        ; 3F8F: 0020
        clrf            mem_3b      ; 3F90: 01BB
        movlb           0x02        ; 3F91: 0022
        clrf            mem_12a     ; 3F92: 01AA
        clrf            mem_146     ; 3F93: 01C6
        movlb           0x03        ; 3F94: 0023
        clrf            mem_1c9     ; 3F95: 01C9
        incf            mem_1c9, f  ; 3F96: 0AC9
        movlb           0x02        ; 3F97: 0022
        clrf            mem_122     ; 3F98: 01A2
        clrf            mem_123     ; 3F99: 01A3
        return                      ; 3F9A: 0008

;------------------------------------------------------------
; Subroutine: sub_3f9b
;
; called from: 2632

sub_3f9b
        movwf           mem_51      ; 3F9B: 00D1
        movlw           0x08        ; 3F9C: 3008
        movwf           mem_52      ; 3F9D: 00D2
        clrf            mem_53      ; 3F9E: 01D3

loop_3f9f
; jump here from: 3FB0
        movf            mem_51, W   ; 3F9F: 0851
        movwf           mem_50      ; 3FA0: 00D0
        movlw           0x07        ; 3FA1: 3007

loop_3fa2
; jump here from: 3FA4
        lsrf            mem_50, f   ; 3FA2: 36D0
        decfsz          WREG, f     ; 3FA3: 0B89
        goto            loop_3fa2   ; 3FA4: 2FA2

        lslf            mem_53, W   ; 3FA5: 3553
        iorwf           mem_50, W   ; 3FA6: 0450
        movwf           mem_53      ; 3FA7: 00D3
        lslf            mem_51, f   ; 3FA8: 35D1
        movf            mem_4f, W   ; 3FA9: 084F
        subwf           mem_53, W   ; 3FAA: 0253
        btfss           STATUS, C   ; 3FAB: 1C03
        goto            loop_3faf   ; 3FAC: 2FAF

        movf            mem_4f, W   ; 3FAD: 084F
        subwf           mem_53, f   ; 3FAE: 02D3

loop_3faf
; jump here from: 3FAC
        decfsz          mem_52, f   ; 3FAF: 0BD2
        goto            loop_3f9f   ; 3FB0: 2F9F

        movf            mem_53, W   ; 3FB1: 0853
        return                      ; 3FB2: 0008

;------------------------------------------------------------
; Subroutine: sub_3fb3
;
; called from: 085A
; called from: 22FF

sub_3fb3
        movlw           0x08        ; 3FB3: 3008
        movlb           0x00        ; 3FB4: 0020
        movwf           mem_52      ; 3FB5: 00D2
        movlw           0x88        ; 3FB6: 3088
        movlp           0x0d        ; 3FB7: 318D
        call            I2CRead    ; 3FB8: 25FD

        movlp           0x3f        ; 3FB9: 31BF
        movlb           0x01        ; 3FBA: 0021
        movwf           mem_c0      ; 3FBB: 00C0
        movlw           0xf2        ; 3FBC: 30F2
        subwf           mem_c0, W   ; 3FBD: 0240
        btfss           STATUS, C   ; 3FBE: 1C03
        return                      ; 3FBF: 0008
        movlw           0x08        ; 3FC0: 3008
        clrf            mem_40      ; 3FC1: 01C0
        movlb           0x00        ; 3FC2: 0020
        movwf           mem_55      ; 3FC3: 00D5
        movlb           0x01        ; 3FC4: 0021
        movf            mem_c0, W   ; 3FC5: 0840
        movlb           0x00        ; 3FC6: 0020
        movwf           mem_56      ; 3FC7: 00D6
        movlw           0x88        ; 3FC8: 3088
        movlp           0x0c        ; 3FC9: 318C
        goto            I2CWrite    ; 3FCA: 2CB3

;------------------------------------------------------------
; Subroutine: sub_3fcb
;
; called from: 0A78

sub_3fcb
        movlb           0x02        ; 3FCB: 0022
        movf            mem_13d, W  ; 3FCC: 083D
        movlb           0x00        ; 3FCD: 0020
        movwf           mem_21      ; 3FCE: 00A1
        movlb           0x02        ; 3FCF: 0022
        movf            mem_13e, W  ; 3FD0: 083E
        movlb           0x00        ; 3FD1: 0020
        movwf           mem_20      ; 3FD2: 00A0
        movlb           0x02        ; 3FD3: 0022
        movf            mem_13c, W  ; 3FD4: 083C
        movlb           0x01        ; 3FD5: 0021
        movwf           mem_ba      ; 3FD6: 00BA
        movlp           0x1b        ; 3FD7: 319B
        call            sub_1b70    ; 3FD8: 2370

        movf            mem_b3, W   ; 3FD9: 0833
        movlb           0x02        ; 3FDA: 0022
        movwf           mem_13c     ; 3FDB: 00BC
        movlb           0x00        ; 3FDC: 0020
        movf            mem_22, W   ; 3FDD: 0822
        movlb           0x02        ; 3FDE: 0022
        movwf           mem_13e     ; 3FDF: 00BE
        movlb           0x00        ; 3FE0: 0020
        movf            mem_23, W   ; 3FE1: 0823
        movlb           0x02        ; 3FE2: 0022
        movwf           mem_13d     ; 3FE3: 00BD
        return                      ; 3FE4: 0008

;------------------------------------------------------------
; Subroutine: I2CRecv
;
; called from: 0E19

I2CRecv
        clrf            mem_51      ; 3FE5: 01D1
        movlw           0x80        ; 3FE6: 3080
        movwf           mem_4f      ; 3FE7: 00CF
        bsf             PORTC, RC5  ; 3FE8: 168E
        clrf            mem_50      ; 3FE9: 01D0

loop_3fea
; jump here from: 3FFD
        bsf             PORTC, RC4  ; 3FEA: 160E
        movlp           0x0f        ; 3FEB: 318F
        call            delay_2ns    ; 3FEC: 271B

        movlp           0x3f        ; 3FED: 31BF
        movf            mem_4f, W   ; 3FEE: 084F
        btfsc           PORTC, RC5  ; 3FEF: 1A8E
        iorwf           mem_51, f   ; 3FF0: 04D1
        movlp           0x0f        ; 3FF1: 318F
        call            delay_2ns    ; 3FF2: 271B

        movlp           0x3f        ; 3FF3: 31BF
        bcf             PORTC, RC4  ; 3FF4: 120E
        movlp           0x0f        ; 3FF5: 318F
        call            delay_2ns    ; 3FF6: 271B

        movlp           0x3f        ; 3FF7: 31BF
        movlw           0x08        ; 3FF8: 3008
        lsrf            mem_4f, f   ; 3FF9: 36CF
        incf            mem_50, f   ; 3FFA: 0AD0
        subwf           mem_50, W   ; 3FFB: 0250
        btfss           STATUS, C   ; 3FFC: 1C03
        goto            loop_3fea   ; 3FFD: 2FEA

        movf            mem_51, W   ; 3FFE: 0851
        return                      ; 3FFF: 0008


;------------- symbol definitions ------------------

_CONFIG1    equ   _IESO_OFF & _FOSC_EXTRC & _BOREN_OFF & _FOSC_ECL & _FOSC_XT & _BOREN_NSLEEP & _BOREN_SBODEN ; 0x29f9
_CONFIG2    equ   _WRT_BOOT & _LVP_OFF & _WRT_ALL & _PLLEN_OFF & _WRT_HALF ; 0x1efc
_IDLOC0    equ   0x00
_IDLOC1    equ   0x02
_IDLOC2    equ   0x01
_IDLOC3    equ   0x00
mem_120    equ   0x120
mem_121    equ   0x121
mem_122    equ   0x122
mem_123    equ   0x123
mem_124    equ   0x124
mem_125    equ   0x125
mem_126    equ   0x126
mem_127    equ   0x127
mem_128    equ   0x128
mem_129    equ   0x129
mem_12a    equ   0x12A
mem_12b    equ   0x12B
mem_12c    equ   0x12C
mem_12d    equ   0x12D
mem_12e    equ   0x12E
mem_12f    equ   0x12F
mem_130    equ   0x130
mem_131    equ   0x131
mem_132    equ   0x132
usb_count    equ   0x133
mem_134    equ   0x134
mem_135    equ   0x135
mem_136    equ   0x136
mem_137    equ   0x137
mem_138    equ   0x138
mem_139    equ   0x139
mem_13a    equ   0x13A
mem_13b    equ   0x13B
mem_13c    equ   0x13C
mem_13d    equ   0x13D
mem_13e    equ   0x13E
mem_13f    equ   0x13F
mem_140    equ   0x140
mem_141    equ   0x141
mem_142    equ   0x142
mem_143    equ   0x143
mem_144    equ   0x144
mem_radio_status    equ   0x145
mem_146    equ   0x146
mem_147    equ   0x147
mem_148    equ   0x148
mem_149    equ   0x149
mem_14a    equ   0x14A
mem_14b    equ   0x14B
mem_14c    equ   0x14C
mem_14d    equ   0x14D
mem_14e    equ   0x14E
mem_14f    equ   0x14F
mem_150    equ   0x150
mem_151    equ   0x151
mem_152    equ   0x152
mem_153    equ   0x153
mem_154    equ   0x154
mem_155    equ   0x155
mem_156    equ   0x156
mem_157    equ   0x157
mem_158    equ   0x158
mem_159    equ   0x159
mem_15a    equ   0x15A
mem_15b    equ   0x15B
mem_15c    equ   0x15C
mem_15d    equ   0x15D
mem_15e    equ   0x15E
mem_15f    equ   0x15F
mem_160    equ   0x160
mem_161    equ   0x161
mem_162    equ   0x162
mem_163    equ   0x163
mem_164    equ   0x164
mem_165    equ   0x165
mem_166    equ   0x166
mem_167    equ   0x167
mem_168    equ   0x168
mem_169    equ   0x169
mem_16a    equ   0x16A
mem_16b    equ   0x16B
mem_16c    equ   0x16C
mem_16d    equ   0x16D
serial_count    equ   0x16E
mem_16f    equ   0x16F
serial_output0    equ   0x1A0
serial_output1    equ   0x1A1
serial_output2    equ   0x1A2
serial_output3    equ   0x1A3
serial_output4    equ   0x1A4
serial_output5    equ   0x1A5
serial_output6    equ   0x1A6
serial_output7    equ   0x1A7
serial_output8    equ   0x1A8
serial_output9    equ   0x1A9
serial_outputa    equ   0x1AA
serial_outputb    equ   0x1AB
serial_outputc    equ   0x1AC
serial_outputd    equ   0x1AD
serial_outpute    equ   0x1AE
serial_outputf    equ   0x1AF
serial_output10    equ   0x1B0
serial_output11    equ   0x1B1
mem_1b4    equ   0x1B4
mem_1b6    equ   0x1B6
serial_buffer0    equ   0x1BA
serial_buffer1    equ   0x1BB
serial_buffer2    equ   0x1BC
serial_buffer3    equ   0x1BD
mem_1be    equ   0x1BE
mem_1bf    equ   0x1BF
mem_1c0    equ   0x1C0
mem_1c1    equ   0x1C1
mem_1c2    equ   0x1C2
mem_1c3    equ   0x1C3
mem_1c4    equ   0x1C4
mem_1c5    equ   0x1C5
mem_1c6    equ   0x1C6
mem_1c7    equ   0x1C7
mem_1c8    equ   0x1C8
mem_1c9    equ   0x1C9
mem_1ca    equ   0x1CA
mem_1cb    equ   0x1CB
mem_1cc    equ   0x1CC
mem_1cd    equ   0x1CD
mem_1ce    equ   0x1CE
mem_1cf    equ   0x1CF
mem_1d    equ   0x1D
mem_1d0    equ   0x1D0
mem_1d1    equ   0x1D1
mem_1d2    equ   0x1D2
mem_1d3    equ   0x1D3
mem_1d4    equ   0x1D4
mem_1d5    equ   0x1D5
mem_1d6    equ   0x1D6
mem_1d7    equ   0x1D7
mem_1d8    equ   0x1D8
mem_1f1    equ   0x1F1
mem_1f2    equ   0x1F2
mem_1fc    equ   0x1FC
mem_1fd    equ   0x1FD
mem_20    equ   0x20
mem_21    equ   0x21
mem_22    equ   0x22
mem_23    equ   0x23
mem_24    equ   0x24
mem_25    equ   0x25
mem_26    equ   0x26
mem_27    equ   0x27
mem_28    equ   0x28
mem_29    equ   0x29
mem_2a    equ   0x2A
mem_2b    equ   0x2B
mem_2c    equ   0x2C
mem_2d    equ   0x2D
mem_2e    equ   0x2E
mem_2f    equ   0x2F
mem_30    equ   0x30
mem_31    equ   0x31
mem_32    equ   0x32
mem_33    equ   0x33
mem_34    equ   0x34
mem_35    equ   0x35
mem_36    equ   0x36
mem_37    equ   0x37
mem_38    equ   0x38
mem_39    equ   0x39
mem_3a    equ   0x3A
mem_3b    equ   0x3B
mem_3c    equ   0x3C
mem_3d    equ   0x3D
mem_3e    equ   0x3E
mem_3f    equ   0x3F
mem_40    equ   0x40
mem_41    equ   0x41
mem_42    equ   0x42
mem_43    equ   0x43
mem_44    equ   0x44
mem_45    equ   0x45
mem_46    equ   0x46
mem_47    equ   0x47
mem_48    equ   0x48
mem_49    equ   0x49
mem_4a    equ   0x4A
mem_4b    equ   0x4B
mem_4c    equ   0x4C
mem_4d    equ   0x4D
mem_4e    equ   0x4E
mem_4f    equ   0x4F
mem_50    equ   0x50
mem_51    equ   0x51
mem_52    equ   0x52
mem_53    equ   0x53
mem_54    equ   0x54
mem_55    equ   0x55
mem_56    equ   0x56
mem_57    equ   0x57
mem_58    equ   0x58
mem_59    equ   0x59
mem_5a    equ   0x5A
mem_5b    equ   0x5B
mem_5c    equ   0x5C
mem_5d    equ   0x5D
mem_5e    equ   0x5E
mem_5f    equ   0x5F
mem_60    equ   0x60
mem_61    equ   0x61
mem_62    equ   0x62
mem_63    equ   0x63
mem_64    equ   0x64
mem_65    equ   0x65
mem_66    equ   0x66
mem_67    equ   0x67
mem_68    equ   0x68
mem_69    equ   0x69
mem_6a    equ   0x6A
mem_6e    equ   0x6E
mem_70    equ   0x70
mem_71    equ   0x71
mem_72    equ   0x72
mem_73    equ   0x73
mem_74    equ   0x74
mem_75    equ   0x75
mem_76    equ   0x76
mem_77    equ   0x77
mem_78    equ   0x78
mem_79    equ   0x79
mem_7a    equ   0x7A
mem_7b    equ   0x7B
mem_94    equ   0x94
mem_a0    equ   0xA0
mem_a1    equ   0xA1
mem_a2    equ   0xA2
mem_a3    equ   0xA3
mem_a4    equ   0xA4
mem_a5    equ   0xA5
mem_a6    equ   0xA6
mem_a7    equ   0xA7
mem_a8    equ   0xA8
mem_a9    equ   0xA9
mem_aa    equ   0xAA
mem_ab    equ   0xAB
mem_ac    equ   0xAC
mem_ad    equ   0xAD
mem_ae    equ   0xAE
mem_af    equ   0xAF
mem_b0    equ   0xB0
mem_b1    equ   0xB1
mem_b2    equ   0xB2
mem_b3    equ   0xB3
mem_b4    equ   0xB4
mem_b5    equ   0xB5
mem_b6    equ   0xB6
mem_b7    equ   0xB7
mem_b8    equ   0xB8
mem_b9    equ   0xB9
mem_ba    equ   0xBA
mem_bb    equ   0xBB
mem_bc    equ   0xBC
mem_bd    equ   0xBD
mem_be    equ   0xBE
mem_bf    equ   0xBF
mem_c0    equ   0xC0
mem_c1    equ   0xC1
mem_c2    equ   0xC2
mem_c3    equ   0xC3
mem_c4    equ   0xC4
mem_c5    equ   0xC5
mem_c6    equ   0xC6
mem_c7    equ   0xC7
mem_c8    equ   0xC8
mem_c9    equ   0xC9
mem_ca    equ   0xCA
mem_cb    equ   0xCB
mem_cc    equ   0xCC
mem_cd    equ   0xCD
mem_ce    equ   0xCE
mem_cf    equ   0xCF
mem_d0    equ   0xD0
mem_d1    equ   0xD1
mem_d2    equ   0xD2
mem_d3    equ   0xD3
mem_d4    equ   0xD4
mem_d5    equ   0xD5
mem_d6    equ   0xD6
mem_d7    equ   0xD7
mem_d8    equ   0xD8
mem_d9    equ   0xD9
mem_da    equ   0xDA
mem_db    equ   0xDB
mem_dc    equ   0xDC
mem_dd    equ   0xDD
mem_de    equ   0xDE
mem_df    equ   0xDF
mem_e0    equ   0xE0
mem_e1    equ   0xE1
mem_e2    equ   0xE2
mem_e3    equ   0xE3
mem_e4    equ   0xE4
mem_e5    equ   0xE5
mem_e6    equ   0xE6
mem_e7    equ   0xE7
mem_e8    equ   0xE8
mem_e9    equ   0xE9
mem_ea    equ   0xEA
mem_eb    equ   0xEB
mem_ec    equ   0xEC
mem_ed    equ   0xED
mem_ee    equ   0xEE
mem_ef    equ   0xEF


;---------------------------------------------------


        end


