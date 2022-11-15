.model small
.386
.stack 100h
.data

welcome db "---------- Welcome to the PC Builder ----------", 10, 10, "$"
menu db "What do you want to buy?", 10, 10, "$"
PCparts db "1 - Computer System parts", 10, "$"
peripheral db "2 - Peripheral devices", 10, "$"
scratch db "3 - Exit", 10, 10, "$"
decision db "Enter your Choices: $"

; PC parts variables

partsIntro db "Which component Do you want to Buy?", 10, "$"
case db "1 - Case", 10, "$"
motherboard db "2 - Motherboard", 10, "$"
GPU db "3 - GPU", 10, "$"
ram db "4 - Ram", 10, "$"
storage db "5 - Storage", 10, "$"

; Cases 

thermaltake db "1 - Thermaltake H330 Tempered Glass Mid-Tower Chassis - 15,000/-", 10, "$"
asus db "2 - Asus TUF Gaming GT301 Compact Case - 21,800/-", 10, "$"
cougar db "3 - Cougar Blazer Essence Gaming Mid Tower - 29,900/-", 10, "$"
firstPlayer db "4 - 1stPlayer BASS (Black) Micro ATX Case - 18,900/-", 10, "$"
bloody db "5 - Bloody GH-30 ROGUE Mid Tower Gaming Case - 18,800/-", 10, "$"

; motherboards

asusBoard db "1 - Asus PRIME A520M-E AMD Ryzen AM4 micro ATX Motherboard - 16,500/-", 10, "$"
gigaByte db "2 - Gigabyte H610M H DDR4 Intel H610 Motherboard LGA1700 - Rev 1.0 - 22,800/-", 10, "$"
MSI db "3 - MSI PRO B660M-E DDR4 Intel LGA1700 Motherboard - 28,500/-", 10, "$"
asRock db "4 - ASRock B550M-ITX/ac AMD AM4 Ryzen Motherboard - 90-MXBDH0-A0UAYZ - 26,900/-", 10, "$"

; GPUs

nvidia db "1 - MSI NVIDIA GeForce GT 730 OC Edition 4GB - 912-V809-4019 - 16,800/-", 10, "$"
zotac db "2 - ZOTAC GAMING GeForce RTX 4090 Graphics Card - 24GB 384-bit - 459,990/-", 10, "$"
amd db "3 - Gigabyte  Radeon RX 6400 EAGLE 4G Graphics Card - 46,900/-", 10, "$"
asusGpu db "4 - Asus TUF GAMING Radeon RX 6700 XT OC Edition Graphics Card - 164,900", 10, "$"

; Rams

twoGb db "1 - 4GB DDR4 SOD Memory For Notebook - 700/-", 10, "$"
fourGb db "2 - 4GB DDR4 SOD Memory For Notebook - 1,700/-", 10, "$"
eightGb db "3 - Lexar 8GB DDR4-3200 SODIMM Laptop Memory - 5,500/-", 10, "$"
sixteenGb db "4 - Lexar DDR4-3200 UDIMM Desktop Memory 16GB - 10,500/-", 10, "$"

; Storage

hdd db "1 - WD Blue 1TB PC Mobile Hard Disk Drive - 5,800/-", 10, "$"
ssd db "2 - Hikvision SSD C100 series 120GB - 3,350", 10, "$"
internal db "3 - Seagate 4TB IronWolf NAS ST4000VN008 SATA 6Gb/s 3.5 - 27,000/-", 10, "$"


; Peripherals

keyboard db "1 - Logitech K120 USB Keyboard - 2,350/-", 10, "$"
led db "2 - ViewSonic VX3276-2K-mhd 32 WQHD SuperClear IPS Monitor - 89,990/-", 10, "$"
mouse db "3 - Logitech G402 Hyperion Fury Ultra-Fast FPS Gaming Mouse - 4,900/-", 10, "$"
speakers db "4 - Logitech Stereo Speakers Z120 - 2,700/-", 10, "$"

; Ending variables

ending db "Thanks for purchasing. Would you like to start over again? [Y/N]$"
endSection db "XXXXXXXXX$"
invalid db 10, "Enter valid choice$"

.code
start:

    mov ax, @data
    mov ds, ax

    
    mov cx, 15
    mov ah, 02
    mov dl, 20h
    l1:
    int 21h
    loop l1
    
    
    mov ah, 09
    lea dx, welcome
    int 21h
    
    scratchStart:
    
    mov ah, 02
    mov dl, 10
    int 21h
    
    mov ah, 09
    lea dx, menu
    int 21h
    
    mov ah, 09
    lea dx, PCparts
    int 21h
    
    mov ah, 09
    lea dx, peripheral
    int 21h
    
    mov ah, 09
    lea dx, scratch
    int 21h
    
    mov ah, 09
    lea dx, decision
    int 21h
    
    mov ah, 01
    int 21h
    mov bl, al
    
    mov ah, 02
    mov dl, 10
    int 21h

    cmp bl, 49
    je parts
    
    cmp bl, 50
    je peripherals
    
    cmp bl, 51
    je builder
    
    jmp exit
    
    
    parts: ; Parts Section
    
    mov ah, 02
    mov dl, 10 
    int 21h
    
    mov ah, 09
    lea dx, partsIntro
    int 21h
    
    mov ah, 09
    lea dx, case
    int 21h
    
    mov ah, 09
    lea dx, motherboard
    int 21h
    
    mov ah, 09
    lea dx, GPU
    int 21h
    
    mov ah, 09
    lea dx, ram
    int 21h
    
    mov ah, 09
    lea dx, storage
    int 21h
    
    
    mov ah, 09
    lea dx, decision
    int 21h
    
    mov ah, 01
    int 21h
    mov bl, al
    
    mov cx, 2
    mov ah, 02
    mov dl, 10
    l2:
    int 21h
    loop l2

    cmp bl, 49
    je caseSection 

    cmp bl, 50
    je motherboardSection

    cmp bl, 51
    je GPUSection

    cmp bl, 52
    je ramSection

    cmp bl, 53 
    je storageSection

    caseSection:
    
    mov ah, 09
    lea dx, thermaltake
    int 21h
    
    mov ah, 09
    lea dx, asus
    int 21h
    
    mov ah, 09
    lea dx, cougar
    int 21h
    
    mov ah, 09
    lea dx, firstPlayer
    int 21h
    
    mov ah, 09
    lea dx, bloody
    int 21h
    
    mov ah, 09
    lea dx, decision
    int 21h
    
    mov ah, 01
    int 21h
    
    cmp al, 55
    jge invalidInput
    
    jmp exit
    
    motherboardSection:
    
    mov ah, 09
    lea dx, asusBoard
    int 21h
    
    mov ah, 09
    lea dx, gigaByte
    int 21h
    
    mov ah, 09
    lea dx, MSI
    int 21h
    
    mov ah, 09
    lea dx, asRock
    int 21h
    
    mov ah, 09
    lea dx, decision
    int 21h
    
    mov ah, 01
    int 21h
    
    cmp al, 53
    jge invalidInput
    
    
    jmp exit
    
    
    GPUSection:
    
    
    mov ah, 09
    lea dx, nvidia
    int 21h
    
    mov ah, 09
    lea dx, zotac
    int 21h
    
    mov ah, 09
    lea dx, amd
    int 21h
    
    mov ah, 09
    lea dx, asusGpu
    int 21h
    
    mov ah, 09
    lea dx, decision
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, 53
    jge invalidInput
    
    
    jmp exit
    
    ramSection:
    
    mov ah, 09
    lea dx, twoGb
    int 21h
    
    mov ah, 09
    lea dx, fourGb
    int 21h
    
    mov ah, 09
    lea dx, eightGb
    int 21h
    
    mov ah, 09
    lea dx, sixteenGb
    int 21h
    
    mov ah, 09
    lea dx, decision
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, 53
    jge invalidInput
    
    
    jmp exit

    
    storageSection:
    
    
    mov ah, 09
    lea dx, hdd
    int 21h
    
    mov ah, 09
    lea dx, ssd
    int 21h
    
    mov ah, 09
    lea dx, internal
    int 21h
    
    mov ah, 09
    lea dx, decision
    int 21h
    
    mov ah, 01
    int 21h
    
    cmp al, 52
    jge invalidInput
    
    
    jmp exit
    
    peripherals: ; Peripherals Section
    
    
    
    mov ah, 09
    lea dx, led
    int 21h
    
    mov ah, 09
    lea dx, keyboard
    int 21h
    
    mov ah, 09
    lea dx, mouse
    int 21h
    
    mov ah, 09
    lea dx, speakers
    int 21h
    
    mov ah, 09
    lea dx, decision
    int 21h
    
    mov ah, 01
    int 21h
    
    cmp al, 53
    jge invalidInput
    
    
    jmp exit
    
    
    builder: ; Builder Section
    
    mov ah, 4ch 
    int 21h
    
    invalidInput:
    
    
    mov cx, 2
    mov ah, 02
    mov dl, 10
    gap1:
    int 21h
    loop gap1
    
    mov ah, 09
    lea dx, invalid
    int 21h
    
    mov cx, 2
    mov ah, 02
    mov dl, 10
    gap2:
    int 21h
    
    loop gap2
    
    
    jmp scratchStart
    
    exit: ; Exit section
    
    mov cx, 2
    mov ah, 02
    mov dl, 10
    l3:
    int 21h
    loop l3

    mov ah, 09
    lea dx, ending
    int 21h

    mov ah, 08
    int 21h
    mov bl, al
    
    cmp bl, 'y'
    je close
    
    cmp bl, 'Y'
    je close
    
    mov ah, 4ch
    int 21h
    
    close: 
    
    jmp scratchStart
   
    
end start
