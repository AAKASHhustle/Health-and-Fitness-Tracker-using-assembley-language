include "emu8086.inc" 

    
.model small
.stack 100h
.data     
.code
main proc
MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    
INT 10H
          
          
    mov ax, @data
    mov ds, ax
    define_scan_num 
 define_clear_screen
 
    
    GOTOXY 20, 5  
    printn "||======================================||"
    GOTOXY 20, 6
    printn "||                                      ||"
    GOTOXY 20, 7
    printn "||      *   HEALTH AND FITNESS  *       ||"
    GOTOXY 20, 8
    printn "||                 TRACKER              ||"
    GOTOXY 20, 9
    printn "||                                      ||"
    GOTOXY 20, 10
    printn "||======================================||"
    
    
    
     
    call clear_screen
    mov cx, 0
    
MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H
    GOTOXY 0, 1     ;welcome complt
      
    MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h      
 ;===================================================================
  GOTOXY 30, 2
    printn "NOTE: 1 feet = 30.48 cm"  
       
 GOTOXY 15, 5
PRINT 'ENTER YOUR HEIGHT (CM) :  '         
    CALL SCAN_NUM                         
    MOV [0200h],CX                       
    MOV AX,CX                             
                             
 
  
    GOTOXY 15, 7
    PRINT 'ENTER YOUR WEIGHT (kg) :  ' 
    CALL SCAN_NUM                       
    MOV [0202h],CX                       
    MOV CX,0h 
                      
                      MOV BX,[0202h]
                      SUB AX,BX          
                      
                      mov dx,ax
                      
                      cmp dx, 95
                      JL Over
                      
                      cmp dx, 110
                      JG Under
                      
                      cmp dx, 110
                      JL Perfect
    
                      
                      
                      
                      
     
    Under:
    GOTOXY 30, 11
        print "YOU ARE UNDER WEIGHT " 
        MOV CX,04
        jmp press
    Perfect:
    GOTOXY 30, 11
       print "YOU HAVE PREFECT WEIGHT "
       MOV CX,10
       jmp press 
    Over:
    GOTOXY 30, 11
       print "YOU ARE OVER WEIGHT " 
       MOV CX,05
       jmp press 
        
       
       press:
       
       MOV [0260H],CX
       
       GOTOXY 2,14
       print "PRESS 1. IF YOU WANT TO GAIN WEIGHT."
       
       
       GOTOXY 2,16 
       print "PRESS 2. IF YOU WANT TO LOOSE WEIGHT."
      GOTOXY 27, 23
      
    print "Press any key for next page.."
    mov ah, 0
    int 16h
    
       call clear_screen


MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H
          MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h 
 
       GOTOXY 17, 2
    print "Press 1 or 2 as per conditions shown in prevoius page "
    mov ah, 01h
    int 21h
    
    
    cmp al, '1'
    JE P1
    cmp al,'2'
    JE P2
    
    P1:
    
    GOTOXY 2, 4
    print "1.Eat more and sleep 8hrs a day"
    GOTOXY 2, 6
    print "2.Absorb high calorie food(Potato, Brown Rice, Chicken breast, CheckPeas,        Almond,Sweet potato etc.)" 
    GOTOXY 2, 9
    print "3.Drink at least 3L water per day"
    GOTOXY 2, 11
    print "4.Eat vegetables"
    GOTOXY 2, 13
    print "5.One glass of Milk and one whole Egg each Day"
    GOTOXY 27, 23
    print "Press any key to continue.."
    jmp exit5
    
    P2:
     
    GOTOXY 2, 4
    print "1.Try to follow a low calorie Healthy Diet"
    GOTOXY 2, 6
    print "2.Eat high protein and avoid Fast food"
    GOTOXY 2, 8
    print "3.Do some Workout for weight lose(Walking,Crunching,Running,Ropping)"
    GOTOXY 2, 10
    print "4.Eat vegetables containing Omega3 "
    GOTOXY 27, 23
    print "Press any key to continue.." 
    jmp exit5
    
    exit5:
    mov ah, 0
    int 16h
    call clear_screen
    
MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H
    
    
   GOTOXY 30, 2
    printn "Pulse Check"  
       
 GOTOXY 15, 5
PRINT 'ENTER YOUR PULSE (HEART RATE PER MIN) :  '         
    CALL SCAN_NUM                         
    MOV [0204h],CX                       
    MOV AX,CX                             
                             
 
  
    GOTOXY 2, 7
    PRINT 'DID YOU CHECK YOUR PULSE AFTER PHYSICAL EXERSISE (1 FOR YES 2 FOR NO) :  ' 
    CALL SCAN_NUM                       
    MOV [0206h],CX                       
    MOV CX,0h 
    
    CMP CX,1
    JE CON1
    CMP CX,2
    JE CON2    
        
    MOV DX,AX
    
        CON1:
        CMP DX,60
        JL PULSE1
        CMP DX,100
        JG PULSE1
        CMP DX,100
        JL PULSE2 
        
        CON2:
        CMP DX,100
        JL PULSE1
        CMP DX,150
        JG PULSE1
        CMP DX,150
        JL PULSE2
        
    PULSE1:
    GOTOXY 30, 11
        print "YOU NEED TO CONSULT A DOCTOR " 
        MOV CX,06
        jmp press1
    PULSE2:
    GOTOXY 30, 11
       print "YOUR HEART IS DOING FINE  " 
       MOV CX,10
       jmp press1 
       
    press1:
    
    MOV AX,[0260H] 
    ADD AX,CX
    MOV [0260H],AX
    
    GOTOXY 30, 15
    print "Press any key for next page.."  
    
    
    mov ah, 0
    int 16h
            
            
            
            
            
            
call clear_screen


MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H   
         
         
          MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h 
 
       GOTOXY 30, 2
    print "BLOOD PRESSURE CHECK "
 
        
    GOTOXY 15, 5
    PRINT 'ENTER SYSTOLIC mm Hg (upper number) :  '         
    CALL SCAN_NUM                         
    MOV [0214h],CX                       
    MOV AX,CX                             
                             
 
  
    GOTOXY 15, 7
    PRINT 'ENTER DIASTOLIC mm Hg (lower number) :  ' 
    CALL SCAN_NUM                       
    MOV [0216h],CX                       
    MOV CX,0h      
              
              MOV BX,[0216h]
              MOV DX,AX
              
              CMP DX,90
              JLE LOW1
              CMP BX,60
              JLE LOW1
              CMP DX,180
              JGE HIGH3
              CMP BX,120
              JGE HIGH3
              CMP DX,140
              JGE HIGH2
              CMP BX,90
              JGE HIGH2
              CMP DX,130
              JGE HIGH1
              CMP BX,81
              JGE HIGH1
              CMP DX,120
              JGE ELEVETED
              JL NORMAL
              
    LOW1:    
    GOTOXY 15, 11
       print "YOU HAVE LOW BLOOD PRESSURE (HYPOTENSION) " 
       MOV CX,05
       jmp MOVEON
       
    HIGH1:    
    GOTOXY 15, 11
       print "YOU HAVE HIGH BLOOD PRESSURE (HYPERTENSION STAGE 1) "
       MOV CX,11
       jmp MOVEON
       
    HIGH2:    
    GOTOXY 15, 11
       print "YOU HAVE HIGH BLOOD PRESSURE (HYPERTENSION STAGE 2) " 
       MOV CX,09
       jmp MOVEON    
       
    HIGH3:    
    GOTOXY 15, 11
       print "YOU HAVE HIGH BLOOD PRESSURE (HYPERTENSION STAGE 3) " 
       MOV CX,07
       jmp MOVEON 
       
    ELEVETED:    
    GOTOXY 15, 11
       print "YOU HAVE ELEVETED BLOOD PRESSURE (BORDERLINE) " 
       MOV CX,13
       jmp MOVEON
       
    NORMAL:    
    GOTOXY 15, 11
       print "YOU HAVE NORMAL BLOOD PRESSURE  " 
       MOV CX,15
       jmp MOVEON
       
    MOVEON:
    
    MOV AX,[0260H] 
    ADD AX,CX
    MOV [0260H],AX
     
    GOTOXY 25,14
    print "Press any key for next page.."
    mov ah, 0
    int 16h            
            
            
            
call clear_screen


MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H

    
    GOTOXY 2, 2
    print "ENTER 1 TO CONTROL HIGH BLOOD PRESSURE (DEFAULT) & 2 TO CONTROL LOW BLOOD     PRESSURE "
    mov ah, 01h
    int 21h
    
    
    cmp al, '1'
    JE Pa1
    cmp al,'2'
    JE Pa2
    
    Pa1:
    
    GOTOXY 2, 4
    print "1. Lose extra weight and watch your waistline"
    GOTOXY 2, 6
    print "2. Exercise regularly" 
    GOTOXY 2, 8
    print "3. Eat a healthy diet"
    GOTOXY 2, 10
    print "4. Reduce sodium in your diet"
    GOTOXY 2, 12
    print "5. Limit the amount of alcohol you drink" 
    GOTOXY 2, 14
    print "6. Quit smoking"
    GOTOXY 2, 16
    print "7. Cut back on caffeine" 
    GOTOXY 2, 18
    print "8. Reduce your stress"
    GOTOXY 2, 20
    print "9. Monitor your blood pressure at home and see your doctor regularly"
    GOTOXY 2, 22
    print "10. Get support"
    GOTOXY 27, 24
    print "Press any key to continue.."
    jmp exit1
    
    Pa2:
     
    GOTOXY 2, 4
    print "1. Use more salt."
    GOTOXY 2, 6
    print "2. Drink more water." 
    GOTOXY 2, 8
    print "3. Follow your medications"
    GOTOXY 2, 10
    print "4. Wear compression stockings. "
    GOTOXY 2, 12
    print "5. Drink more water, less alcohol. " 
    GOTOXY 2, 14
    print "6. Pay attention to your body positions."
    GOTOXY 2, 16
    print "7. Eat small, low-carb meals." 
    GOTOXY 2, 18
    print "8. Exercise regularly."
    GOTOXY 2, 20
    print "9. Monitor your blood pressure at home and see your doctor regularly"
    GOTOXY 2, 22
    print "10. Get support"
    GOTOXY 27, 24
    print "Press any key to continue.."
    jmp exit1
    
    exit1:
    mov ah, 0
    int 16h           
            
            
            
call clear_screen


MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H    
         
         
          MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h 


GOTOXY 30, 2
    print "CHOLESTEROL CHECK "
 
        

    
    GOTOXY 15, 4
    PRINT 'ENTER BAD CHOLESTEROL LEVEL (LDL CHOLESTEROL) :  '         
    CALL SCAN_NUM                         
    MOV [0220h],CX                       
    MOV AX,CX                             
                             
    MOV DX,AX
    CMP DX,130
    JL DES2
    CMP DX,160
    JG VHIGH2
    JLE BHIGH2
    
    
    DES2:    
    GOTOXY 15, 6
       print "YOUR LDL CHOLESTEROL LEVEL IS DESIRABLE "
       jmp NEXT2
       
    VHIGH2:    
    GOTOXY 15, 6
       print "YOUR LDL CHOLESTEROL LEVEL IS VERY HIGH "
       jmp NEXT2
       
    BHIGH2:    
    GOTOXY 15, 6
       print "YOUR LDL CHOLESTEROL LEVEL IS BORDERLINE HIGH "
       jmp NEXT2
    
    NEXT2:
    
    GOTOXY 15, 8
    PRINT 'ENTER GOOD CHOLESTEROL LEVEL (HDL CHOLESTEROL) :  '         
    CALL SCAN_NUM                         
    MOV [0222h],CX                       
    MOV AX,CX                             
                             
    MOV DX,AX
    CMP DX,50
    JGE DES3
    CMP DX,40
    JL VHIGH3
    JGE BHIGH3
    
    DES3:    
    GOTOXY 15, 10
       print "YOUR HDL CHOLESTEROL LEVEL IS DESIRABLE "
       jmp NEXT3
       
    VHIGH3:    
    GOTOXY 15, 10
       print "YOUR HDL CHOLESTEROL LEVEL IS VERY HIGH "
       jmp NEXT3
       
    BHIGH3:    
    GOTOXY 15, 10
       print "YOUR HDL CHOLESTEROL LEVEL IS BORDERLINE HIGH "
       jmp NEXT3
    
    NEXT3:
    
    
    GOTOXY 15, 12
    PRINT 'ENTER TRIGLYCERIDES LEVEL :  '         
    CALL SCAN_NUM                         
    MOV [0224h],CX                       
    MOV AX,CX
                                 
                             
    MOV DX,AX
    CMP DX,200
    JL DES4
    CMP DX,240
    JG VHIGH4
    JLE BHIGH4
    
    DES4:    
    GOTOXY 15, 14
       print "YOUR TRIGLYCERIDES LEVEL IS DESIRABLE "
       jmp NEXT1
       
    VHIGH4:    
    GOTOXY 15, 14
       print "YOUR TRIGLYCERIDES LEVEL IS VERY HIGH "
       jmp NEXT1
       
    BHIGH4:    
    GOTOXY 15, 14
       print "YOUR TRIGLYCERIDES LEVEL IS BORDERLINE HIGH "
       jmp NEXT1
    
    NEXT1:   
       
    MOV DX,[0220h]
    MOV CX,[0222h]
    ADD DX,CX
    MOV CX,[0224h]
    MOV AX,CX
    MOV BX,5H
    XOR DX,DX
    DIV BX
    ADD AX,DX
    
    MOV DX,AX
    CMP DX,200
    JLE DES1
    CMP DX,240
    JG VHIGH1
    JLE BHIGH1 
    
    
    DES1:    
    GOTOXY 15, 18
       print "YOUR TOTAL CHOLESTEROL LEVEL IS DESIRABLE " 
       MOV CX,15
       jmp MOVEON1
       
    VHIGH1:    
    GOTOXY 15, 18
       print "YOUR TOTAL CHOLESTEROL LEVEL IS VERY HIGH "
       MOV CX,13
       jmp MOVEON1
       
    BHIGH1:    
    GOTOXY 15, 18
       print "YOUR TOTAL CHOLESTEROL LEVEL IS BORDERLINE HIGH "  
       MOV CX,10
       jmp MOVEON1       
       
    MOVEON1:
    
    MOV AX,[0260H] 
    ADD AX,CX
    MOV [0260H],AX
     
    GOTOXY 25,20
    print "Press any key for next page.."
    mov ah, 0
    int 16h  
    
    
    
call clear_screen

MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H

    
    GOTOXY 2, 2
    print "TIPS TO REDUCE YOUR CHOLESTEROL LEVEL "
    
    GOTOXY 2, 4
    print "1. Limit your intake of foods full of saturated fats, trans fats, and dietary cholesterol."
    GOTOXY 2, 8
    print "2. Eat a lot more fiber-rich foods (especially soluble fiber from foods like  beans, oats, barley, fruits, and vegetables)." 
    GOTOXY 2, 12
    print "3. Choose protein-rich plant foods (such as legumes or beans, nuts, and seeds) over meat."
    GOTOXY 2, 16
    print "4. Lose as much excess weight as possible."
    GOTOXY 2, 18
    print "5.Take plant sterol supplements. (Sterols are naturally occurring substances   found in plants. A daily intake of 1 to 2 grams of plant sterols has been shown to lower LDL cholesterol levels.)"
    
   
    
    
    GOTOXY 25,24
    print "Press any key for next page.."
    mov ah, 0
    int 16h      


    mov cx, 0
    
MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H
    GOTOXY 0, 1     ;welcome complt
      
    MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h      
         
;==============================================================
;BODY FAT

    GOTOXY 30, 2
    printn "BODY FAT CHECKER"
    
    GOTOXY 15, 5
    print "ENTER GENDER <1 FOR MALE, 2 FOR FEMALE>: "
    CALL SCAN_NUM
    MOV [0230H],CX
    MOV AX,CX
    
    CMP AX,1
    JE BFM
    
    CMP AX,2
    JE BFF
    
    
    BFM:
    GOTOXY 15,8
    print "ENTER YOUR BMI: "
    CALL SCAN_NUM
    MOV [0250H],CX
    
    GOTOXY 15,11
    print "ENTER YOUR AGE: "
    CALL SCAN_NUM
    MOV [0252H],CX
    
    MOV BX,120
    MOV AX,[0250H]
    MUL BX
    MOV CX,AX
    MOV AX,[0252H]
    MOV BX,23
    MUL BX
    ADD CX,AX 
    MOV BX,1620
    SUB CX,BX
    MOV BX,100
    MOV AX,CX
    XOR DX,DX 
    DIV BX
    JMP RE
          
      
    BFF:
    GOTOXY 15,8
    print "ENTER YOUR BMI: "
    CALL SCAN_NUM
    MOV [0250H],CX
    
    GOTOXY 15,11
    print "ENTER YOUR AGE:"
    CALL SCAN_NUM
    MOV [0252H],CX
    
    MOV BX,120
    MOV AX,[0250H]
    MUL BX
    MOV CX,AX
    MOV AX,[0252H]
    MOV BX,23
    MUL BX
    ADD CX,AX 
    MOV BX,540
    SUB CX,BX
    MOV BX,100
    MOV AX,CX
    XOR DX,DX 
    DIV BX

       
    RE:   
        GOTOXY 15,15
        print "BODY FAT: "  
        
    mov cx,0 
    mov dx,0 
    label1: 
        ; if ax is zero 
        cmp ax,0 
        je print1       
          
        ;initilize bx to 10 
        mov bx,10         
          
        ; extract the last digit 
        div bx                   
          
        ;push it in the stack 
        push dx               
          
        ;increment the count 
        inc cx               
          
        ;set dx to 0  
        xor dx,dx 
        jmp label1 
        print1: 
        ;check if count  
        ;is greater than zero 
        cmp cx,0 
        je EX
          
        ;pop the top of stack 
        pop dx 
          
        ;add 48 so that it  
        ;represents the ASCII 
        ;value of digits 
        add dx,48 
          
        ;interuppt to print a 
        ;character 
        mov ah,02h 
        int 21h 
          
        ;decrease the count 
        dec cx 
        jmp print1   
    
    
    
        
        
       
    EX:
        GOTOXY 27, 23      
        print "Press any key for next page.."
        mov ah, 0
        int 16h
        call clear_screen


MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H
          MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h 
          
          
    GOTOXY 30, 2
    printn "BODY FAT RANGES"
    GOTOXY 15, 5
    printn "||=====================================||"
    GOTOXY 15, 6
    printn "||  DESCRIPTION  ||  FEMALE  ||  MALE  ||"  
    GOTOXY 15, 7
    printn "||---------------||----------||--------||"
    GOTOXY 15, 8
    printn "||  RECOMMENDED  ||  20-25%  ||  8-14% ||"
    GOTOXY 15, 9
    printn "||---------------||----------||--------||"
    GOTOXY 15, 10
    printn "||    AVERAGE    ||  22-25%  || 15-19% ||"
    GOTOXY 15, 11
    printn "||---------------||----------||--------||" 
    GOTOXY 15, 12
    printn "||     OBESE     ||   30+%   ||  25+%  ||"
    GOTOXY 15, 13
    printn "||=====================================||"  
    
    GOTOXY 27, 23      
        print "Press any key for next page.."
        mov ah, 0
        int 16h
        call clear_screen


     


                   
                   
                   
MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H

   GOTOXY 30, 2
    printn "CALORIE BURNT" 
          MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h                             
 GOTOXY 15, 5
PRINT 'ENTER THE GRADE AT WHICH YOU ARE RUNNING :  '         
    CALL SCAN_NUM                         
    MOV [0208h],CX                       
    MOV AX,CX 
    MOV BX, 05H
    MUL BX
    ADD AX,5FH 
    MOV CX,[0202h]
    MUL CX
    ADD AX,54H 
    MOV BX,64H
    DIV BX      
     GOTOXY 15, 7
PRINT 'ENTER THE DISTANCE :  '
    CALL SCAN_NUM 
    MOV [0210h],CX
    MUL CX  
         GOTOXY 15, 10
PRINT 'CALORIE BURNT :  '
         
    mov cx,0 
    mov dx,0 
    label2: 
        ; if ax is zero 
        cmp ax,0 
        je print2       
          
        ;initilize bx to 10 
        mov bx,10         
          
        ; extract the last digit 
        div bx                   
          
        ;push it in the stack 
        push dx               
          
        ;increment the count 
        inc cx               
          
        ;set dx to 0  
        xor dx,dx 
        jmp label2 
        print2: 
        ;check if count  
        ;is greater than zero 
        cmp cx,0 
        je EXIT6
          
        ;pop the top of stack 
        pop dx 
          
        ;add 48 so that it  
        ;represents the ASCII 
        ;value of digits 
        add dx,48 
          
        ;interuppt to print a 
        ;character 
        mov ah,02h 
        int 21h 
          
        ;decrease the count 
        dec cx 
        jmp print2 
        
        JMP EXIT6
        
     EXIT6:  
    
    
     GOTOXY 27, 23
     print "Press any key to exit.." 
        
        
    
    mov ah, 0
    int 16h
    call clear_screen
    
    
MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H

    
    GOTOXY 12, 2
    print "YOUR FITNESS SCORE (OUT OF 50) "
    
     MOV AX,[0260H]
    
    GOTOXY 15, 10
    PRINT 'TOTAL SCORE :  '
    
    mov cx,0 
    mov dx,0 
    label3: 
        ; if ax is zero 
        cmp ax,0 
        je print3       
          
        ;initilize bx to 10 
        mov bx,10         
          
        ; extract the last digit 
        div bx                   
          
        ;push it in the stack 
        push dx               
          
        ;increment the count 
        inc cx               
          
        ;set dx to 0  
        xor dx,dx 
        jmp label3 
        print3: 
        ;check if count  
        ;is greater than zero 
        cmp cx,0 
        je exit2
          
        ;pop the top of stack 
        pop dx 
          
        ;add 48 so that it  
        ;represents the ASCII 
        ;value of digits 
        add dx,48 
          
        ;interuppt to print a 
        ;character 
        mov ah,02h 
        int 21h 
          
        ;decrease the count 
        dec cx 
        jmp print3
        
        exit2:
        

        GOTOXY 25,24
        print "Press any key for next page.."
        mov ah, 0
        int 16h        
    
                                                                      
    mov ah, 4ch
    int 21h 
    
   

end main

