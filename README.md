# LearningAL
学习王爽主编的《汇编语言》的一些程序和记录
## 检测点 1.1
(1) 13 (2) 1024 0 1023 (3) 8192 1024 (4) 2^30 2^20 2^10 (5) 64 1 16 4 (6) 1 1 2 2 4 (7) 512 256 (8) 二进制
## 检测点 2.1
(1) F4A3H 31A3H 3123H 6246H 826CH 6246H 826CH 04D8H 0482H 6C82H D882H D888H D810H 6246H

(2) 
```
MOV AX, 2
ADD AX, AX
ADD AX, AX
ADD AX, AX
```
## 检测点 2.2
(1) 00010H 1000FH (2) 0101H 2000H
## 检测点 2.3
4 mov sub jmp jmp 0000H
## 检测点 3.1
(1) 2662H E626H E626H 2662H D6E6H FD48H 2C14H 0000H 00E6H 0000H 0026H 000CH

(2) 
1.
```
MOV AX, 6622H
JMP 0FF0:0100H
MOV AX, 2000H
MOV DS, AX
MOV AX, [0008]
MOV AX, [0002]
```
2.
```
CS:IP       DS      AX      BX
2000:0000   1000H   0000H   0000H
2000:0003   1000H   6622H   0000H
1000:0000   1000H   6622H   0000H
1000:0003   1000H   2000H   0000H
1000:0005   2000H   2000H   0000H
1000:0008   2000H   C189H   0000H
1000:000B   2000H   EA66H   0000H
```

3.
没有区别，CS:IP指向的是程序，DS段是数据

## 检测点 3.2
(1)
```
MOV AX, 2000H
MOV SS, AX
MOV SP, 0010H
```
(2)
```
MOV AX, 1000H
MOV SS, AX
MOV SP, 0000H
```
## 实验 4
见 CODE_01.ASM
## 检测点 6.1
(1) 
```
MOV CS:[BX], AX
```
(2)
CS 1AH POP CS:[BX]
## 实验 6
问题7.9 见CODE_02.ASM
## 实验 7
见CODE_03.ASM
## 检测点 9.1
(1) DB 0, 0, 0

(2) BX CS

(3) 0006H 00BEH
## 检测点 9.2
```
MOV CL, DS:[BX]
MOV CH, 0
JCXZ ok
INC BX
```
## 检测点 9.3
INC CX
## 实验9
见CODE_04.ASM
