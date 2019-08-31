EESchema Schematic File Version 4
LIBS:exceptionallyuselessbox-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5D18DAF3
P 4100 3500
F 0 "A1" H 4350 2550 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4650 2450 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4250 2550 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4100 2500 50  0001 C CNN
	1    4100 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5D18DF97
P 2650 2650
F 0 "J1" H 2568 2867 50  0000 C CNN
F 1 "Conn_01x02" H 2568 2776 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Vertical" H 2650 2650 50  0001 C CNN
F 3 "~" H 2650 2650 50  0001 C CNN
	1    2650 2650
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 5D18EA70
P 2650 3500
F 0 "J2" H 2568 3817 50  0000 C CNN
F 1 "Conn_01x04" H 2568 3726 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B04B-XH-A_1x04_P2.50mm_Vertical" H 2650 3500 50  0001 C CNN
F 3 "~" H 2650 3500 50  0001 C CNN
	1    2650 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3600 3500 2850 3500
Wire Wire Line
	2850 3600 3600 3600
$Comp
L power:+5V #PWR02
U 1 1 5D19240F
P 3050 3300
F 0 "#PWR02" H 3050 3150 50  0001 C CNN
F 1 "+5V" H 3065 3473 50  0000 C CNN
F 2 "" H 3050 3300 50  0001 C CNN
F 3 "" H 3050 3300 50  0001 C CNN
	1    3050 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5D1926FA
P 3050 3850
F 0 "#PWR03" H 3050 3600 50  0001 C CNN
F 1 "GND" H 3055 3677 50  0000 C CNN
F 2 "" H 3050 3850 50  0001 C CNN
F 3 "" H 3050 3850 50  0001 C CNN
	1    3050 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3850 3050 3700
Wire Wire Line
	3050 3700 2850 3700
Wire Wire Line
	2850 3400 3050 3400
Wire Wire Line
	3050 3400 3050 3300
$Comp
L power:GND #PWR01
U 1 1 5D19481E
P 3050 2850
F 0 "#PWR01" H 3050 2600 50  0001 C CNN
F 1 "GND" H 3055 2677 50  0000 C CNN
F 2 "" H 3050 2850 50  0001 C CNN
F 3 "" H 3050 2850 50  0001 C CNN
	1    3050 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2650 3350 2650
Wire Wire Line
	3350 2650 3350 3400
Wire Wire Line
	3350 3400 3600 3400
$Comp
L Device:R R1
U 1 1 5D1953C7
P 3350 2400
F 0 "R1" H 3420 2446 50  0000 L CNN
F 1 "10k" H 3420 2355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3280 2400 50  0001 C CNN
F 3 "~" H 3350 2400 50  0001 C CNN
	1    3350 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2550 3350 2650
Connection ~ 3350 2650
Wire Wire Line
	2850 2750 3050 2750
Wire Wire Line
	3050 2750 3050 2850
$Comp
L power:+5V #PWR06
U 1 1 5D195D90
P 3350 2100
F 0 "#PWR06" H 3350 1950 50  0001 C CNN
F 1 "+5V" H 3365 2273 50  0000 C CNN
F 2 "" H 3350 2100 50  0001 C CNN
F 3 "" H 3350 2100 50  0001 C CNN
	1    3350 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2100 3350 2250
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5D199E95
P 5900 3000
F 0 "J4" H 5980 3042 50  0000 L CNN
F 1 "Conn_01x03" H 5980 2951 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5900 3000 50  0001 C CNN
F 3 "~" H 5900 3000 50  0001 C CNN
	1    5900 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 5D19A45C
P 5900 3700
F 0 "J5" H 5980 3742 50  0000 L CNN
F 1 "Conn_01x03" H 5980 3651 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5900 3700 50  0001 C CNN
F 3 "~" H 5900 3700 50  0001 C CNN
	1    5900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3100 5500 3100
Wire Wire Line
	5500 3100 5500 3800
Wire Wire Line
	5700 3800 5500 3800
Text GLabel 5300 2900 0    50   Input ~ 0
TOP
Text GLabel 5300 3600 0    50   Input ~ 0
BOT
Text GLabel 3000 4200 0    50   Input ~ 0
TOP
Text GLabel 3000 4450 0    50   Input ~ 0
BOT
Wire Wire Line
	3000 4200 3300 4200
Wire Wire Line
	3300 4200 3300 3900
Wire Wire Line
	3300 3900 3600 3900
Wire Wire Line
	3600 4000 3400 4000
Wire Wire Line
	3400 4000 3400 4450
Wire Wire Line
	3400 4450 3000 4450
$Comp
L power:GND #PWR08
U 1 1 5D19E17B
P 4100 4800
F 0 "#PWR08" H 4100 4550 50  0001 C CNN
F 1 "GND" H 4105 4627 50  0000 C CNN
F 2 "" H 4100 4800 50  0001 C CNN
F 3 "" H 4100 4800 50  0001 C CNN
	1    4100 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4800 4100 4700
Wire Wire Line
	4200 4500 4200 4700
Wire Wire Line
	4200 4700 4100 4700
Connection ~ 4100 4700
Wire Wire Line
	4100 4700 4100 4500
$Comp
L power:+5V #PWR010
U 1 1 5D1A0909
P 4300 2150
F 0 "#PWR010" H 4300 2000 50  0001 C CNN
F 1 "+5V" H 4315 2323 50  0000 C CNN
F 2 "" H 4300 2150 50  0001 C CNN
F 3 "" H 4300 2150 50  0001 C CNN
	1    4300 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2150 4300 2500
$Comp
L Device:CP C1
U 1 1 5D1A1C0C
P 7250 2400
F 0 "C1" H 7368 2446 50  0000 L CNN
F 1 "100u" H 7368 2355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P5.00mm" H 7288 2250 50  0001 C CNN
F 3 "~" H 7250 2400 50  0001 C CNN
	1    7250 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 5D1A21BD
P 4100 5550
F 0 "C2" H 4218 5596 50  0000 L CNN
F 1 "100u" H 4218 5505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P5.00mm" H 4138 5400 50  0001 C CNN
F 3 "~" H 4100 5550 50  0001 C CNN
	1    4100 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5D1A2558
P 7250 2800
F 0 "#PWR015" H 7250 2550 50  0001 C CNN
F 1 "GND" H 7255 2627 50  0000 C CNN
F 2 "" H 7250 2800 50  0001 C CNN
F 3 "" H 7250 2800 50  0001 C CNN
	1    7250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2050 7250 2250
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5D18E8D1
P 2650 5400
F 0 "J3" H 2568 5617 50  0000 C CNN
F 1 "Conn_01x02" H 2568 5526 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Vertical" H 2650 5400 50  0001 C CNN
F 3 "~" H 2650 5400 50  0001 C CNN
	1    2650 5400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5D18EFFB
P 3050 5700
F 0 "#PWR05" H 3050 5450 50  0001 C CNN
F 1 "GND" H 3055 5527 50  0000 C CNN
F 2 "" H 3050 5700 50  0001 C CNN
F 3 "" H 3050 5700 50  0001 C CNN
	1    3050 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 5400 2850 5400
Wire Wire Line
	2850 5500 3050 5500
NoConn ~ 4600 2900
NoConn ~ 4600 3000
NoConn ~ 4600 3300
NoConn ~ 4600 3500
NoConn ~ 4600 3600
NoConn ~ 4600 3700
NoConn ~ 4600 3800
NoConn ~ 4600 3900
NoConn ~ 4600 4000
NoConn ~ 4600 4100
NoConn ~ 4600 4200
NoConn ~ 3600 4100
NoConn ~ 3600 3800
NoConn ~ 3600 3700
NoConn ~ 3600 3300
NoConn ~ 3600 3200
NoConn ~ 3600 3100
NoConn ~ 3600 3000
NoConn ~ 3600 2900
NoConn ~ 4200 2500
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5D1A98F1
P 5100 2000
F 0 "#FLG0101" H 5100 2075 50  0001 C CNN
F 1 "PWR_FLAG" H 5100 2173 50  0000 C CNN
F 2 "" H 5100 2000 50  0001 C CNN
F 3 "~" H 5100 2000 50  0001 C CNN
	1    5100 2000
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5D1A9E5E
P 5500 2000
F 0 "#FLG0102" H 5500 2075 50  0001 C CNN
F 1 "PWR_FLAG" H 5500 2173 50  0000 C CNN
F 2 "" H 5500 2000 50  0001 C CNN
F 3 "~" H 5500 2000 50  0001 C CNN
	1    5500 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 1900 5100 2000
$Comp
L power:GND #PWR0102
U 1 1 5D1ACC8E
P 5500 1900
F 0 "#PWR0102" H 5500 1650 50  0001 C CNN
F 1 "GND" H 5505 1727 50  0000 C CNN
F 2 "" H 5500 1900 50  0001 C CNN
F 3 "" H 5500 1900 50  0001 C CNN
	1    5500 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5500 1900 5500 2000
Wire Wire Line
	5600 3700 5700 3700
Wire Wire Line
	5700 3000 5600 3000
Wire Wire Line
	5600 3000 5600 3700
Wire Wire Line
	5300 3600 5700 3600
Wire Wire Line
	5700 2900 5300 2900
$Comp
L Device:Q_NMOS_GDS Q1
U 1 1 5D426E91
P 3700 6150
F 0 "Q1" H 3906 6196 50  0000 L CNN
F 1 "IRFZ44N" H 3906 6105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3900 6250 50  0001 C CNN
F 3 "~" H 3700 6150 50  0001 C CNN
	1    3700 6150
	1    0    0    -1  
$EndComp
Text GLabel 2850 6150 0    50   Input ~ 0
SERVO_ON
Wire Wire Line
	3800 6550 3800 6350
Text GLabel 3000 4700 0    50   Input ~ 0
SERVO_ON
Wire Wire Line
	3000 4700 3500 4700
Wire Wire Line
	3500 4700 3500 4200
Wire Wire Line
	3500 4200 3600 4200
Wire Wire Line
	3050 5150 3050 5400
Wire Wire Line
	3050 5500 3050 5700
$Comp
L power:+5V #PWR0101
U 1 1 5D433C1B
P 3050 5150
F 0 "#PWR0101" H 3050 5000 50  0001 C CNN
F 1 "+5V" H 3065 5323 50  0000 C CNN
F 2 "" H 3050 5150 50  0001 C CNN
F 3 "" H 3050 5150 50  0001 C CNN
	1    3050 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 5D43549D
P 3350 5400
F 0 "L1" V 3540 5400 50  0000 C CNN
F 1 "10 mH" V 3449 5400 50  0000 C CNN
F 2 "Inductor_THT:L_Radial_D9.5mm_P5.00mm_Fastron_07HVP" H 3350 5400 50  0001 C CNN
F 3 "~" H 3350 5400 50  0001 C CNN
	1    3350 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 5400 3050 5400
Connection ~ 3050 5400
Wire Wire Line
	7250 2550 7250 2800
$Comp
L power:+5V #PWR0104
U 1 1 5D44F2C4
P 7250 2050
F 0 "#PWR0104" H 7250 1900 50  0001 C CNN
F 1 "+5V" H 7265 2223 50  0000 C CNN
F 2 "" H 7250 2050 50  0001 C CNN
F 3 "" H 7250 2050 50  0001 C CNN
	1    7250 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5D44FFFE
P 5100 1900
F 0 "#PWR0105" H 5100 1750 50  0001 C CNN
F 1 "+5V" H 5115 2073 50  0000 C CNN
F 2 "" H 5100 1900 50  0001 C CNN
F 3 "" H 5100 1900 50  0001 C CNN
	1    5100 1900
	1    0    0    -1  
$EndComp
NoConn ~ 4000 2500
$Comp
L Device:R R2
U 1 1 5D4624B6
P 3250 6150
F 0 "R2" V 3043 6150 50  0000 C CNN
F 1 "1K" V 3134 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 3180 6150 50  0001 C CNN
F 3 "~" H 3250 6150 50  0001 C CNN
	1    3250 6150
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5D462815
P 3250 6550
F 0 "R3" V 3043 6550 50  0000 C CNN
F 1 "10K" V 3134 6550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 3180 6550 50  0001 C CNN
F 3 "~" H 3250 6550 50  0001 C CNN
	1    3250 6550
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 6150 3400 6150
Wire Wire Line
	2850 6150 3000 6150
Wire Wire Line
	3000 6150 3000 6550
Wire Wire Line
	3000 6550 3100 6550
Connection ~ 3000 6150
Wire Wire Line
	3000 6150 3100 6150
$Comp
L power:GND #PWR?
U 1 1 5D4704C0
P 3550 6650
F 0 "#PWR?" H 3550 6400 50  0001 C CNN
F 1 "GND" H 3555 6477 50  0000 C CNN
F 2 "" H 3550 6650 50  0001 C CNN
F 3 "" H 3550 6650 50  0001 C CNN
	1    3550 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 6650 3550 6550
Wire Wire Line
	3550 6550 3400 6550
Wire Wire Line
	3500 5400 4100 5400
Wire Wire Line
	4100 5400 5600 5400
Wire Wire Line
	5600 5400 5600 3700
Connection ~ 4100 5400
Connection ~ 5600 3700
Wire Wire Line
	4100 6550 3800 6550
Wire Wire Line
	4100 5700 4100 6550
Connection ~ 3550 6550
Connection ~ 3800 6550
Wire Wire Line
	3800 6550 3550 6550
Wire Wire Line
	3800 5950 3800 5800
Wire Wire Line
	3800 5800 5500 5800
Wire Wire Line
	5500 5800 5500 3800
Connection ~ 5500 3800
$EndSCHEMATC
