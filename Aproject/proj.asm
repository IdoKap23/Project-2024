IDEAL
		;namw of the game: The legend of cyber: tears of memory
macro SHOW_MOUSE
	mov ax, 1
	int 33h
endm


macro HIDE_MOUSE
	mov ax, 2
	int 33h
endm

MACRO SHOW_CHAR  MY_CHAR
	push ax
	push dx
	mov dl,MY_CHAR
	mov ah,2
	int 21h
	pop dx
	pop ax
ENDM
MODEL small
STACK 100h

FILE_NAME_IN0  equ 'blank.bmp'
FILE_NAME_OUT0 equ 'blank2.bmp'
FILE_NAME_IN1  equ 'blueback.bmp'
FILE_NAME_OUT1 equ 'blueback2.bmp'
FILE_NAME_IN2  equ 'redback.bmp'
FILE_NAME_OUT2 equ 'redback2.bmp'
FILE_NAME_IN3  equ 'gege.bmp'
FILE_NAME_OUT3 equ 'gege2.bmp'
FILE_NAME_IN4  equ 'Black.bmp'
FILE_NAME_OUT4 equ 'Black2.bmp'
FILE_NAME_IN5  equ 'red.bmp'
FILE_NAME_OUT5 equ 'red2.bmp'
FILE_NAME_IN6  equ 'blue.bmp'
FILE_NAME_OUT6 equ 'blue2.bmp'
FILE_NAME_IN7  equ 'green.bmp'
FILE_NAME_OUT7 equ 'green2.bmp'
FILE_NAME_IN8  equ 'yel.bmp'
FILE_NAME_OUT8 equ 'yel2.bmp'
FILE_NAME_IN9  equ 'yellowbk.bmp'
FILE_NAME_OUT9 equ 'yellowbk2.bmp'
FILE_NAME_IN10  equ 'Start.bmp'
FILE_NAME_OUT10 equ 'Start2.bmp'
FILE_NAME_IN11  equ 'End.bmp'
FILE_NAME_OUT11 equ 'End2.bmp'
FILE_NAME_IN12  equ 'sBlue.bmp'
FILE_NAME_OUT12 equ 'sBlue2.bmp'
FILE_NAME_IN13  equ 'sRed.bmp'
FILE_NAME_OUT13 equ 'sRed2.bmp'
FILE_NAME_IN14  equ 'sGreen.bmp'
FILE_NAME_OUT14 equ 'sGreen2.bmp'
FILE_NAME_IN15  equ 'sYellow.bmp'
FILE_NAME_OUT15 equ 'sYellow2.bmp'
FILE_NAME_IN16  equ 'sPurple.bmp'
FILE_NAME_OUT16 equ 'sPurple2.bmp'
FILE_NAME_IN17  equ 'purple.bmp'
FILE_NAME_OUT17 equ 'purple2.bmp'
FILE_NAME_IN18  equ 'purplebk.bmp'
FILE_NAME_OUT18 equ 'purplebk2.bmp'

SCREEN_WIDTH = 320
BMP_MAX_WIDTH = SCREEN_WIDTH
BMP_MAX_HEIGHT = 200

	REDC = 79
	YELLOWC = 251
	DARK_YELLOWC = 64
	GREENC = 177
	BLUEC = 232
	purple = 213
	marron = 1


DATASEG
	
	 ScrLine 	db BMP_MAX_WIDTH dup (0)  ; One Color line read buffer
	
	FileName0 	 db FILE_NAME_IN0,0
	FileNameOut0 db FILE_NAME_OUT0 ,0
	FileName1 	 db FILE_NAME_IN1,0
	FileNameOut1 db FILE_NAME_OUT1 ,0
	FileName2 	 db FILE_NAME_IN2,0
	FileNameOut2 db FILE_NAME_OUT2 ,0
	FileName3 	 db FILE_NAME_IN3,0
	FileNameOut3 db FILE_NAME_OUT3 ,0
	FileName4 	 db FILE_NAME_IN4,0
	FileNameOut4 db FILE_NAME_OUT4 ,0
	FileName5 	 db FILE_NAME_IN5,0
	FileNameOut5 db FILE_NAME_OUT5 ,0
	FileName6 	 db FILE_NAME_IN6,0
	FileNameOut6 db FILE_NAME_OUT6 ,0
	FileName7 	 db FILE_NAME_IN7,0
	FileNameOut7 db FILE_NAME_OUT7 ,0
	FileName8 	 db FILE_NAME_IN8,0
	FileNameOut8 db FILE_NAME_OUT8 ,0
	FileName9 	 db FILE_NAME_IN9,0
	FileNameOut9 db FILE_NAME_OUT9 ,0
	FileName10 	 db FILE_NAME_IN10,0
	FileNameOut10 db FILE_NAME_OUT10 ,0
	FileName11 	 db FILE_NAME_IN11,0
	FileNameOut11 db FILE_NAME_OUT11 ,0
	FileName12 	 db FILE_NAME_IN12 ,0
	FileNameOut12 db FILE_NAME_OUT12 ,0
	FileName13 	 db FILE_NAME_IN13,0
	FileNameOut13 db FILE_NAME_OUT13 ,0
	FileName14 	 db FILE_NAME_IN14,0
	FileNameOut14 db FILE_NAME_OUT14 ,0
	FileName15 	 db FILE_NAME_IN15,0
	FileNameOut15 db FILE_NAME_OUT15 ,0
	FileName16 	 db FILE_NAME_IN16,0
	FileNameOut16 db FILE_NAME_OUT16 ,0
	FileName17 	 db FILE_NAME_IN17,0
	FileNameOut17 db FILE_NAME_OUT17 ,0
	FileName18 	 db FILE_NAME_IN18,0
	FileNameOut18 db FILE_NAME_OUT18 ,0
	
	FileHandle	dw ?
	Header 	    db 54 dup(0)
	Palette 	db 400h dup (0)
	Palette2 	db 400h dup (0)
	
	BmpFileErrorMsg1    	db 'Error At Opening Bmp File ',FILE_NAME_IN1, 0dh, 0ah,'$'

	
	ErrorFile           db 0
	
	Red db REDC
	Blue db BLUEC
	Green db GREENC
	Yellow db YELLOWC
	DarkYellow db DARK_YELLOWC
	PurpleB db purple
	Marrron db marron
	
	StageColor db ?
	
	BmpLeft dw ?
	BmpTop dw ?
	BmpWidth dw ?
	BmpHeight dw ?
	
	;player:
	PLAYER_WIDTH = 17
	PLAYER_HIGHT = 18
	PLAYER_HIGHT_MIDDLE = 8
	PLAYER_WIDTH_MIDDLE = 8
	; 306 bytes
	;3 - cyen
	;6 - brown
	;55 - blue
	;66 - light brown
	;104 - dark blue
	;50 - light cyen
	player db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		   db 0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0
		   db 0,0,0,0,0,3,3,3,3,3,3,3,3,0,0,0,0
		   db 0,0,0,66,0,3,6,6,6,6,6,6,3,0,66,0,0
		   db 0,0,0,66,0,6,6,6,6,6,6,6,6,0,66,0,0
		   db 0,0,0,66,66,6,66,3,66,66,3,66,6,66,66,0,0
		   db 0,0,0,66,66,6,66,6,66,66,6,66,6,66,66,0,0
		   db 0,0,0,0,66,66,66,66,66,66,66,66,66,66,55,0,0
		   db 0,0,0,0,3,3,66,66,6,6,66,66,3,3,55,0,0
		   db 0,0,104,104,104,104,104,66,66,66,66,3,3,55,55,55,0
		   db 0,104,55,55,55,55,104,104,3,3,3,3,3,66,55,55,0
		   db 0,104,104,55,55,104,104,55,6,6,3,3,66,66,66,55,0
		   db 0,104,104,55,55,104,104,55,3,6,6,6,6,66,66,66,0
		   db 0,104,55,55,55,55,104,55,6,6,3,3,3,3,66,0,0
		   db 0,104,104,104,104,104,104,55,3,3,3,3,3,0,0,0,0
		   db 0,0,55,55,55,55,55,6,0,0,6,6,6,0,0,0,0
		   db 0,0,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0
		   db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	Xplayer dw ?
	Yplayer dw ?
	XplayerB dw ?
	YplayerB dw ?
	
    
	;virus:
	VIRUS_WIDTH = 16
	VIRUS_HIGHT = 18
	VIRUS_HIGHT_MIDDLE = 8
	VIRUS_WIDTH_MIDDLE = 7
	;288 bytes
	;18 - black
	;30 - gray
	;53 - light blue
	;54 - blue
	virus db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		  db 0,0,0,0,0,0,18,18,18,18,0,0,0,0,0,0
		  db 0,0,0,0,18,18,30,30,30,30,18,18,0,0,0,0
		  db 0,0,0,18,30,30,54,54,54,54,30,30,18,0,0,0
		  db 0,0,18,30,54,54,54,54,54,54,54,54,30,18,0,0
		  db 0,0,18,30,54,54,53,54,54,53,54,54,30,18,0,0
		  db 0,18,30,54,54,53,53,54,54,53,53,54,54,30,18,0
		  db 0,18,30,54,54,53,53,54,54,53,53,54,54,30,18,0
		  db 0,18,30,54,54,53,53,54,54,53,53,54,54,30,18,0
		  db 0,18,30,54,54,53,54,54,54,54,53,54,54,30,18,0
		  db 0,18,30,54,54,54,54,54,54,54,54,54,30,18,0,0
		  db 0,0,18,30,54,54,54,54,54,54,54,54,30,18,0,0
		  db 0,0,18,30,54,54,54,54,54,30,30,30,18,0,0,0
		  db 0,0,0,18,30,54,54,54,30,18,18,18,0,0,0,0
		  db 0,0,0,0,18,30,30,54,30,18,0,0,0,0,0,0
		  db 0,0,0,0,0,18,18,30,30,18,0,0,0,0,0,0
		  db 0,0,0,0,0,0,0,18,18,18,0,0,0,0,0,0
		  db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	;virus 1
	Xvirus dw ?
	Yvirus dw ?
	XvirusB dw ?
	YvirusB dw ?
	
	;virus 2
	Xvirus2 dw ?
	Yvirus2 dw ?
	Xvirus2B dw ?
	Yvirus2B dw ?
	
	
	;bug:
	BUG_SIZE = 16
	BUG_SIZE_MIDDLE = 7
	;225 bytes
	;18 - black
	;50 - green
	;51 - cyen
	bug db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		db 0,0,0,0,18,0,0,0,18,0,0,0,0,0,0,0
		db 0,0,0,18,18,0,0,18,18,0,0,0,0,0,0,0
		db 0,0,18,50,18,18,18,50,18,0,0,0,0,0,0,0
		db 0,0,18,50,50,50,50,50,18,0,0,0,0,0,0,0
		db 0,0,18,50,18,50,18,50,50,18,0,0,0,0,0,0
		db 0,0,18,50,50,50,50,50,50,18,0,0,0,0,0,0
		db 0,18,50,50,146,146,146,50,50,50,18,0,0,0,0,0
		db 0,18,50,146,146,146,146,146,50,50,18,0,0,0,0,0
		db 0,0,18,50,50,18,50,50,50,50,50,18,0,0,0,0
		db 0,0,0,18,50,50,50,50,18,50,50,50,18,18,18,0
		db 0,0,0,18,18,18,18,18,50,50,50,50,50,50,18,0
		db 0,0,0,18,50,50,50,50,50,50,50,50,50,18,0,0
		db 0,0,0,0,18,50,50,18,50,50,50,18,18,0,0,0
		db 0,0,0,0,0,18,18,0,18,18,18,0,0,0,0,0
		db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	;bug 1
	Xbug dw ?
	Ybug dw ?
	XbugB dw ?
	YbugB dw ?
	
	;bug 2
	Xbug2 dw ?
	Ybug2 dw ?
	Xbug2B dw ?
	Ybug2B dw ?
	
	
	
	CHAPT3_SIZE = 18
	CHAPT3_SIZE_MIDDLE = 8
	;324 bytes
	;52 - cyan
	;53 - light blue
	;106 - purple
	
	chapt3 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,232,242,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,242,242,106,242,242,0,0,0,0,0,0
			 db 0,0,0,0,242,0,242,242,106,106,106,106,242,242,0,0,0,0
			 db 0,0,0,242,106,0,242,106,106,0,0,106,106,106,242,0,0,0
			 db 0,0,0,242,106,0,242,106,106,0,0,0,0,0,0,0,0,0
			 db 0,0,242,106,106,0,242,242,106,106,242,242,242,242,242,0,0,0
			 db 0,0,242,106,0,0,242,52,242,242,52,242,106,106,242,242,0,0
			 db 0,242,106,106,0,0,106,242,52,52,242,106,106,106,106,242,242,0
			 db 0,242,242,106,106,106,106,242,52,52,242,106,0,0,106,106,242,0
			 db 0,0,242,242,106,106,242,52,242,242,52,242,0,0,106,242,0,0
			 db 0,0,0,242,242,242,242,242,106,106,242,242,0,106,106,242,0,0
			 db 0,0,0,0,0,0,0,0,0,106,106,242,0,106,242,0,0,0
			 db 0,0,0,242,106,106,106,0,0,106,106,242,0,106,242,0,0,0
			 db 0,0,0,0,242,242,106,106,106,106,242,242,0,242,0,0,0,0
			 db 0,0,0,0,0,0,242,242,106,242,242,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,242,242,0,0,0,0,0,0,0,0
			 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
	Xchapt3 dw ?
	Ychapt3 dw ?
	Xchapt3B dw ?
	Ychapt3B dw ?
	
	;chapt3 2
	Xchapt32 dw ?
	Ychapt32 dw ?
	Xchapt32B dw ?
	Ychapt32B dw ?
	
	
	BOSS_WIDTH = 49
	BOSS_HIGHT = 28
	BOSS_HIGHT_MIDDLE = 13
	BOSS_WIDTH_MIDLE = 24
	;1372 bytes
	;184 dark marron
	;4 - marron
	boss db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,184,184,184,184,184,184,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,184,184,184,184,4,4,4,184,184,4,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,184,184,184,4,4,4,184,184,4,4,4,184,4,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,184,4,4,4,184,184,184,184,184,184,184,184,4,184,4,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,184,4,184,184,184,184,184,184,184,184,184,184,184,4,184,4,184,184,0,0,0,0,0,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,184,4,184,184,184,184,184,184,184,184,184,184,184,4,184,4,4,184,184,0,0,0,184,184,184,0,0,0,0,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,184,184,184,184,184,184,184,184,184,184,184,184,4,4,184,184,4,184,184,0,0,0,184,184,184,184,0,0,184,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,184,184,184,184,184,184,184,4,4,184,184,4,184,4,184,184,184,0,0,184,184,184,184,0,184,184,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,184,184,184,184,184,184,4,184,184,184,184,4,184,4,184,184,184,0,0,184,184,184,184,0,184,184,184,0,0,184,184,184,184,184,184,184,184,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,184,184,184,184,4,184,184,184,184,4,184,184,184,4,184,184,184,0,0,184,184,184,184,184,184,184,0,184,184,184,4,4,4,4,4,4,184,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,184,4,184,184,184,184,184,184,184,184,184,184,4,184,184,184,184,184,184,184,184,184,184,0,184,184,184,4,184,184,4,184,184,184,4,184,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,184,4,184,184,184,184,184,4,184,184,184,184,184,4,184,184,184,184,184,184,184,184,184,184,184,184,4,184,184,184,4,184,184,184,184,4,184,0,0,0,0,0
		 db 0,0,0,0,0,0,0,184,184,184,184,184,184,184,4,184,184,184,184,184,184,4,184,184,184,4,4,4,4,4,184,184,184,184,184,184,4,184,4,4,0,184,184,4,184,0,0,0,0
		 db 0,0,0,0,0,0,0,0,184,184,184,184,184,184,184,4,184,184,184,184,184,184,4,184,184,4,184,184,4,184,4,184,4,184,184,184,4,184,184,4,184,184,184,184,4,184,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,184,184,184,4,184,184,184,184,184,184,184,4,184,4,184,184,4,184,4,184,4,184,4,4,184,184,184,184,4,184,184,184,184,4,184,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,184,184,4,184,184,184,184,184,184,4,4,184,184,4,4,4,4,4,184,4,4,184,184,184,184,184,184,4,184,184,184,184,184,4,184,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,4,184,184,184,184,184,184,4,184,184,184,184,4,184,4,184,4,4,4,184,184,0,184,184,184,4,184,184,184,184,184,4,184,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,184,184,184,184,184,184,184,4,184,184,184,184,184,184,184,184,184,184,4,184,0,0,0,184,184,4,184,184,184,0,0,184,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,184,184,4,184,4,4,4,184,184,4,184,184,184,184,4,184,0,0,0,0,184,184,184,184,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,4,184,4,184,184,184,184,4,4,4,184,184,0,184,184,184,0,0,0,0,0,184,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,4,184,184,4,4,4,4,184,184,4,184,184,0,0,0,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,184,184,184,184,184,184,184,4,4,184,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,184,4,184,184,184,184,184,184,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,4,184,184,184,184,0,184,4,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,184,4,184,184,0,0,0,184,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,184,184,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
	Xboss dw ?
	Yboss dw ?
	XbossB dw ?
	YbossB dw ?
	
	
	
	;1372 bytes
	;220 - dark cyan
	;3 - cyan
	boss2 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,220,220,220,220,220,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,220,220,220,220,3,3,3,220,220,3,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,220,220,220,3,3,3,220,220,3,3,3,220,3,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,220,3,3,3,220,220,220,220,220,220,220,220,3,220,3,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,220,3,220,220,220,220,220,220,220,220,220,220,220,3,220,3,220,220,0,0,0,0,0,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,220,3,220,220,220,220,220,220,220,220,220,220,220,3,220,3,3,220,220,0,0,0,220,220,220,0,0,0,0,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,220,220,220,220,220,220,220,220,220,220,220,220,3,3,220,220,3,220,220,0,0,0,220,220,220,220,0,0,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,220,220,220,220,220,220,220,3,3,220,220,3,220,3,220,220,220,0,0,220,220,220,220,0,220,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,220,220,220,220,220,220,3,220,220,220,220,3,220,3,220,220,220,0,0,220,220,220,220,0,220,220,220,0,0,220,220,220,220,220,220,220,220,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,220,220,220,220,3,220,220,220,220,3,220,220,220,3,220,220,220,0,0,220,220,220,220,220,220,220,0,220,220,220,3,3,3,3,3,3,220,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,220,3,220,220,220,220,220,220,220,220,220,220,3,220,220,220,220,220,220,220,220,220,220,0,220,220,220,3,220,220,3,220,220,220,3,220,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,220,3,220,220,220,220,220,3,220,220,220,220,220,3,220,220,220,220,220,220,220,220,220,220,220,220,3,220,220,220,3,220,220,220,220,3,220,0,0,0,0,0
		 db 0,0,0,0,0,0,0,220,220,220,220,220,220,220,3,220,220,220,220,220,220,3,220,220,220,3,3,3,3,3,220,220,220,220,220,220,3,220,3,3,0,220,220,3,220,0,0,0,0
		 db 0,0,0,0,0,0,0,0,220,220,220,220,220,220,220,3,220,220,220,220,220,220,3,220,220,3,220,220,3,220,3,220,3,220,220,220,3,220,220,3,220,220,220,220,3,220,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,220,220,220,3,220,220,220,220,220,220,220,3,220,3,220,220,3,220,3,220,3,220,3,3,220,220,220,220,3,220,220,220,220,3,220,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,220,220,3,220,220,220,220,220,220,3,3,220,220,3,3,3,3,3,220,3,3,220,220,220,220,220,220,3,220,220,220,220,220,3,220,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,3,220,220,220,220,220,220,3,220,220,220,220,3,220,3,220,3,3,3,220,220,0,220,220,220,3,220,220,220,220,220,3,220,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,220,220,220,220,220,220,220,3,220,220,220,220,220,220,220,220,220,220,3,220,0,0,0,220,220,3,220,220,220,0,0,220,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,220,220,3,220,3,3,3,220,220,3,220,220,220,220,3,220,0,0,0,0,220,220,220,220,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,3,220,3,220,220,220,220,3,3,3,220,220,0,220,220,220,0,0,0,0,0,220,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,3,220,220,3,3,3,3,220,220,3,220,220,0,0,0,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,220,220,220,220,220,220,220,3,3,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,220,3,220,220,220,220,220,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,3,220,220,220,220,0,220,3,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,220,3,220,220,0,0,0,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,220,220,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
	Xboss2 dw ?
	Yboss2 dw ?
	Xboss2B dw ?
	Yboss2B dw ?
	
	
	
;player shot
	PSHOTH_WIDTH = 14
	PSHOTH_HIGHT = 4
    ;56 bytes
	;11 - cyan
	PshotH db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,11,11,11,11,11,11,11,11,11,11,11,11,0
		 db 0,11,11,11,11,11,11,11,11,11,11,11,11,0
	     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 
	XPshotH dw ?
	YPshotH dw ?

	
	PSHOTV_WIDTH = 4
	PSHOTV_HIGHT = 14
    ;56 bytes
	;11 - cyan
	PshotV db 0,0,0,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
		 db 0,11,11,0
	     db 0,0,0,0
		 
	XPshotV dw ?
	YPshotV dw ?
	
	
	ShotExist db 0
	
;Bug shot
	BSHOT_HIGHT = 4
	BSHOT_WIDTH = 14
    ;56 bytes
	;47 - green
	Bshot db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,47,47,47,47,47,47,47,47,47,47,47,47,0
		 db 0,47,47,47,47,47,47,47,47,47,47,47,47,0
	     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 
	XBshotR dw ?
	YBshotR dw ?
	XBshotR2 dw ?
	YBshotR2 dw ?

	
	XBshotL dw ?
	YBshotL dw ?
	XBshotL2 dw ?
	YBshotL2 dw ?
	BshotLExist db 0
	BshotRExist db 0
	BshotL2Exist db 0
	BshotR2Exist db 0

;virus shot
	VSHOT_WIDTH = 4
	VSHOT_HIGHT = 14
    ;56 bytes
	;34 - purple
	Vshot db 0,0,0,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
		 db 0,34,34,0
	     db 0,0,0,0
		 
	XVshotU dw ?
	YVshotU dw ?
	XVshotU2 dw ?
	YVshotU2 dw ?
	
	XVshotD dw ?
	YVshotD dw ?
	XVshotD2 dw ?
	YVshotD2 dw ?
	VshotUExist db 0
	VshotDExist db 0
	VshotU2Exist db 0
	VshotD2Exist db 0
	
;chapt3 shot
	CSHOTH_WIDTH = 14
	CSHOTH_HIGHT = 4
    ;56 bytes
	;53 - light blue
	;106 - purple
	CshotH db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,106,53,106,53,106,53,106,53,106,53,106,53,0
		 db 0,53,106,53,106,53,106,53,106,53,106,53,106,0
	     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 
	XCshotHL dw ?
	YCshotHL dw ?
	XCshotHL2 dw ?
	YCshotHL2 dw ?

	
	XCshotHR dw ?
	YCshotHR dw ?
	XCshotHR2 dw ?
	YCshotHR2 dw ?
	
	CshotHLExist db 0
	CshotHRExist db 0
	CshotHL2Exist db 0
	CshotHR2Exist db 0
	
	CSHOTV_WIDTH = 4
	CSHOTV_HIGHT = 14
    ;56 bytes
	;53 - light blue
	;106 - purple
	CshotV db 0,0,0,0
		 db 0,53,106,0
		 db 0,106,53,0
		 db 0,53,106,0
		 db 0,106,53,0
		 db 0,53,106,0
		 db 0,106,53,0
		 db 0,53,106,0
		 db 0,106,53,0
		 db 0,53,106,0
		 db 0,106,53,0
		 db 0,53,106,0
		 db 0,106,53,0
	     db 0,0,0,0
		 
	XCshotVU dw ?
	YCshotVU dw ?
	XCshotVU2 dw ?
	YCshotVU2 dw ?
	
	XCshotVD dw ?
	YCshotVD dw ?
	XCshotVD2 dw ?
	YCshotVD2 dw ?
	
	CshotVUExist db 0
	CshotVDExist db 0
	CshotVU2Exist db 0
	CshotVD2Exist db 0
	
;bosV1 shot
	B1SHOT_WIDTH = 28
	B1SHOT_HIGHT = 6
    ;56 bytes
	;220 - dark cyan
	;3 - cyan
	B1shot db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,0
		 db 0,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,0
		 db 0,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,0
		 db 0,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,3,220,0
	     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 
	XB1shot dw ?
	YB1shot dw ?
	
	B1shotExist db 0
	
	

;boss2 shot
	B2SHOT_WIDTH = 28
	B2SHOT_HIGHT = 6
    ;56 bytes
	;184 dark marron
	;4 - marron
	B2shot db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 db 0,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,0
		 db 0,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,0
		 db 0,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,0
		 db 0,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,4,184,0
	     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		 
	XB2shot dw ?
	YB2shot dw ?
	
	B2shotExist db 0
;movement
	move dw 0
	moveshots dw 0
	moveVshots dw 0

	NoKey db 0
	
;lives
	bugLives db 1
	bugLives2 db 1 
	virusLives db 2
	virusLives2 db 2
	chapt3Lives db 3
	chapt3Lives2 db 3
	bossLives db 5
	bossLives2 db 5
	lives db 5
;alive
	bug1Alive db 0
	bug2Alive db 0
	virus1Alive db 0
	virus2Alive db 0
	chapt31Alive db 0
	chapt32Alive db 0
	boss1Alive db 0
	boss2Alive db 0
	playerAlive db 0
	playerHit db 0
	
;freeze and exit
	froze dw 0
	stoper dw 0
	timeFreeze db 0
	timeFroze db 0
	exitt db 0
	
	lastDiraction db ?
	shotDiraction db 0
;shot movement
	
	shotShot db 0
	Vshoot db 0
	Bshoot db 0
	Cshoot db 0
	V2shoot db 0
	B2shoot db 0
	C2shoot db 0
	boss1shoot db 0
	boss2shoot db 0
	
	
	
	hearts db 3,' ',3,' ',3,' ',3,' ',3,' ',0,0
	hearts2 db 3,' ',3,' ',3,' ',3,' ',3,' ',0,0
	level db "LV:"
	levelNumber db 0
	stage db " ST:"
	stageNumber db 0
	
	lengthY1 dw 45
	lengthX1 dw 50
	Xstart1 dw 60
	Ystart1 dw 63
	lengthY2 dw 45
	lengthX2 dw 50
	Xstart2 dw 135
	Ystart2 dw 63
	lengthY3 dw 45
	lengthX3 dw 50
	Xstart3 dw 210
	Ystart3 dw 63
	
	
	
	
	b1pressed db 0
	b2pressed db 0
	b3pressed db 0
	bpressed db 0
	correct_button db 0
	ForceExit db 0
	down db 0
	down2 db 0
	left db 0
	left2 db 0
	upLeft db 0
	UpLeft2 db 0
	bup db 0
	bup2 db 0
	havesword db 0
	HowManyTimes dw 01000h
	startg db 1
     	  
	currentQ db "                                   "
	currentQLength db 0
	currentA1 db "1.          "
	currentA1Length db 0
		 
	currentA2 db "2.         "
	currentA2Length db 0
	currentA3 db "3.        "
	currentA3Length db 0
		 
	Q1 db "What register is used for loop?"
	Q1_Length db 31
	Q1A1 db "1. Ax"
	Q1A1_Length db 5
	Q1A2 db "2. Bx"
	Q1A2_Length db 5
	Q1A3 db "3. Cx"
	Q1A3_Length db 5
	
	Q2 db "How does the stack segment work?"
	Q2_Length db 32
	Q2A1 db "1. FIFO"
	Q2A1_Length db 7
	Q2A2 db "2. LIFO"
	Q2A2_Length db 7
	Q2A3 db "3. NGGYU"
	Q2A3_Length db 8

	Q3 db "What int writes text in video mode?"
	Q3_Length db 35
	Q3A1 db "1.Int10h,13h"
	Q3A1_Length db 12
	Q3A2 db "2.Int21h,9"
	Q3A2_Length db 10
	Q3A3 db "3.Int33h,C                                                                          "
	Q3A3_Length db 10
	
	Q4 db "What do you have to do after push?"
	Q4_Length db 34
	Q4A1 db "1. Pop"
	Q4A1_Length db 6
	Q4A2 db "2. Push"
	Q4A2_Length db 7
	Q4A3 db "3. Nothing"
	Q4A3_Length db 10
		   
	Q5 db "What is 2 in the power of 7?"
	Q5_Length db 28
	Q5A1 db "1. 128"
	Q5A1_Length db 6
	Q5A2 db "2. 256"
	Q5A2_Length db 6
	Q5A3 db "3. -1"
	Q5A3_Length db 5
		   
	Q6 db "What is the hardest opponant?"
	Q6_Length db 29
	Q6A1 db "1. chapt3"
	Q6A1_Length db 9
	Q6A2 db "2.the boss"
	Q6A2_Length db 10
	Q6A3 db "3. bug"
	Q6A3_Length db 6
		
	Q7 db "What is this game based of?"
	Q7_Length db 27
	Q7A1 db "1. TLOZ"
	Q7A1_Length db 7
	Q7A2 db "2. PacMan"
	Q7A2_Length db 9
	Q7A3 db "3. Nothing"
	Q7A3_Length db 10
	
	dethNow db 0
CODESEG
    
start: 
	mov ax, @data
	mov ds,ax
	 
	 call SetGraphic
	
	call play
	jmp exit
	
	 call RegisterAsyncMouse
	 call Level1
	 jmp far exit
	
	 call lv1st3
	 call lv1st1
	 
	 call lv1st3
	 jmp far exit
	 call WriteLives
	 inc [stageNumber]
	 call WriteLvl
	 mov ah, 7
	 int 21h
	 
	 
		
exitError:
    mov dx, offset BmpFileErrorMsg1
	mov ah,9
	int 21h
exit:
	;mov ah, 7
	;int 21h
	mov ah, '-'
	sub ah, '0'
	mov [levelNumber], ah
	mov [stageNumber], ah
	call WriteLvl
	mov dx, offset FileName11
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName11
	call OpenShowBmp
	cmp [ErrorFile],1
	mov ah, 7
	int 21h
	
	call SetText
	
	
	mov ax, 4c00h
	int 21h
;proc start:



proc  SetGraphic
	push ax
	mov ax,13h   
	int 10h
	pop ax
	ret
endp  SetGraphic

proc  SetText
	push ax
	mov ax,02h   			 
	int 10h
	pop ax
	ret
endp  SetText

;*************************************
;proc info:
;input: all varibels
;output: all varibels reseted
;register usge: none
;functionality: resets all varibels at the start of a new level
;the proc expects: none
;*************************************
proc ResetAll
	mov [word Xplayer], 0
	mov [word Yplayer], 0
	mov [word YplayerB], 0
	mov [word XplayerB], 0
	
	mov [word Xbug], 0
	mov [word Ybug], 0
	mov [word YbugB], 0
	mov [word XbugB], 0
	
	mov [word Xbug2], 0
	mov [word Ybug2], 0
	mov [word Ybug2B], 0
	mov [word Xbug2B], 0
	
	mov [word Xvirus], 0
	mov [word Yvirus], 0
	mov [word YvirusB], 0
	mov [word XvirusB], 0

	mov [word Xvirus2], 0
	mov [word Yvirus2], 0
	mov [word Yvirus2B], 0
	mov [word Xvirus2B], 0
	
	mov [word Xchapt3], 0
	mov [word Ychapt3], 0
	mov [word Ychapt3B], 0
	mov [word Xchapt3B], 0
	
	mov [word Xchapt32], 0
	mov [word Ychapt32], 0
	mov [word Ychapt32B], 0
	mov [word Xchapt32B], 0
	
	mov [byte lives], 5
	mov [byte bugLives], 1
	mov [byte bugLives2], 1
	mov [byte virusLives], 2
	mov [byte virusLives2], 2
	mov [byte chapt3Lives], 3
	mov [byte chapt3Lives2], 3
	
	mov [byte timeFroze], 0
	mov [byte lastDiraction], 0
	mov [byte shotDiraction], 0
	
	mov [byte stageNumber], 0
	inc [byte levelNumber]
	
	mov [move], 0
	mov [moveshots], 0
	mov [moveVshots], 0
	
	mov [Vshoot], 0
	mov [Bshoot], 0
	mov [Cshoot], 0
	mov [V2shoot], 0
	mov [B2shoot], 0
	mov [C2shoot], 0
	mov [boss1shoot], 0
	mov [shotShot], 0
	ret
endp ResetAll

;*************************************
;proc info:
;input: all varibels exept player lives
;output: all varibels exept player lives reseted
;register usge: none
;functionality: resets all varibels at the start of a new stage
;the proc expects: 
;*************************************
proc StageReset
	mov [word Xplayer], 0
	mov [word Yplayer], 0
	mov [word YplayerB], 0
	mov [word XplayerB], 0
	
	mov [ShotExist], 0
	
	mov [word Xbug], 0
	mov [word Ybug], 0
	mov [word YbugB], 0
	mov [word XbugB], 0
	
	mov [word Xbug2], 0
	mov [word Ybug2], 0
	mov [word Ybug2B], 0
	mov [word Xbug2B], 0
	
	mov [word Xvirus], 0
	mov [word Yvirus], 0
	mov [word YvirusB], 0
	mov [word XvirusB], 0

	mov [word Xvirus2], 0
	mov [word Yvirus2], 0
	mov [word Yvirus2B], 0
	mov [word Xvirus2B], 0
	
	mov [word Xchapt3], 0
	mov [word Ychapt3], 0
	mov [word Ychapt3B], 0
	mov [word Xchapt3B], 0
	
	mov [word Xchapt32], 0
	mov [word Ychapt32], 0
	mov [word Ychapt32B], 0
	mov [word Xchapt32B], 0
	
	mov [byte bugLives], 1
	mov [byte bugLives2], 1
	mov [byte virusLives], 2
	mov [byte virusLives2], 2
	mov [byte chapt3Lives], 3
	mov [byte chapt3Lives2], 3
	
	mov [byte timeFroze], 0
	mov [byte lastDiraction], 0
	mov [byte shotDiraction], 0
	
	inc [byte stageNumber]
	mov [move], 0
	mov [moveshots], 0
	mov [moveVshots], 0
	
	mov [ForceExit], 0
	
	mov [exitt], 0
	mov [Vshoot], 0
	mov [Bshoot], 0
	mov [Cshoot], 0
	mov [V2shoot], 0
	mov [B2shoot], 0
	mov [C2shoot], 0
	mov [boss1shoot], 0
	mov [shotShot], 0
	ret
endp StageReset

;==============================================================================================================================

; player:
;*************************************
;proc info:
;input: Xplayer, Yplayer, PLAYER_HIGHT, PLAYER_WIDTH
;output: puts or deletes player of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the player at the location set by the x and y varibels
;the proc expects: the varibels Xplayer and Yplayer to contain the x and y
;				   the consts PLAYER_HIGHT and PLAYER_WIDTH to contain the length and width
;*************************************
proc putPlayer
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[Yplayer]
@@nextR:
	
		mov di,0
		mov cx,[Xplayer]
	@@nextC:
		 
			mov ah,0dh
			int 10h ;; al got one pixell from screen
			
			xor al,[byte player + bx]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,PLAYER_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, PLAYER_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putPlayer

;*************************************
;proc info:
;input: cx, dx
;output: Xplayer, Yplayer, XplayerB, YplayerB
;register usge: cx, dx
;functionality: sets the player start location in the varibels
;the proc expects: cx and dx to contain the start x and y
;*************************************
proc SetStartPlayer
	push cx
	push dx
	mov [Xplayer], cx
	mov [Yplayer], dx
	add cx, 17
	mov [XplayerB], cx
	add dx, 18
	mov [YplayerB], dx
	mov [playerAlive], 1
	pop dx
	pop cx
	ret
endp SetStartPlayer

;*************************************
;proc info:
;input: none
;output: moves the player one pixel left
;register usge: none
;functionality: moves the player left using xor movement
;the proc expects: Xplayer and Yplayer to contain the x and y
;*************************************
proc  MovePlayerLeft
	push cx
	push dx
	cmp [Xplayer], 0
	jnz @@NoMove1
	jmp @@NoMove
@@NoMove1:
	mov cx, PLAYER_HIGHT
	dec cx
	mov dx, [Yplayer]
	inc dx
	mov di, [Xplayer]
	inc di
@@keepChecking:
	xchg cx,di
	mov ah,0dh
	int 10h
	xchg cx,di
	inc dx
	cmp al, [StageColor]
	jz @@NoMove
	loop @@keepChecking

	call putPlayer ; delete at curret locatein
	sub [Xplayer], 2
	sub [XplayerB], 2
	call putPlayer
@@NoMove:
	pop dx
	pop cx
	ret
endp MovePlayerLeft

;*************************************
;proc info:
;input: none
;output: moves the player one pixel right
;register usge: none
;functionality: moves the player right using xor movement
;the proc expects: Xplayer and Yplayer to contain the x and y 
;*************************************
proc  MovePlayerRight
	push cx
	push dx
	cmp [Xplayer], 304
	jnz @@NoMove1
	jmp @@NoMove
@@NoMove1:
	mov cx, PLAYER_HIGHT
	mov dx, [Yplayer]
	mov di, [XplayerB]
	sub cx, 2
	inc dx
	dec di
@@keepChecking:
	xchg cx,di
	mov ah,0dh
	int 10h
	xchg cx,di
	inc dx
	cmp al, [StageColor]
	jz @@NoMove
	loop @@keepChecking

	call putPlayer ; delete at curret locatein
	add [Xplayer], 2
	add [XplayerB], 2
	call putPlayer
@@NoMove:
	pop dx
	pop cx
	ret
endp MovePlayerRight

;*************************************
;proc info:
;input: none
;output: moves the player one pixel up
;register usge: none
;functionality: moves the player up using xor movement
;the proc expects: Xplayer and Yplayer to contain the x and y
;*************************************
proc  MovePlayerUp
	push cx
	push dx
	cmp [Yplayer], 20
	jnz @@NoMove1
	jmp @@NoMove
@@NoMove1:
	mov cx, PLAYER_WIDTH
	mov dx, [Yplayer]
	dec dx
	mov di, [Xplayer]
	SUB CX, 2
	
@@keepChecking:
	xchg cx,di
	mov ah,0dh
	int 10h
	xchg cx,di
	inc di
	cmp al, [StageColor]
	jz @@NoMove
	loop @@keepChecking

	call putPlayer ; delete at curret locatein
	sub [Yplayer], 2
	sub [YplayerB], 2
	call putPlayer
@@NoMove:
	pop dx
	pop cx
	ret
endp MovePlayerUp

;*************************************
;proc info:
;input: none
;output: moves the player one pixel down
;register usge: none
;functionality: moves the player down using xor movement
;the proc expects: Xplayer and Yplayer to contain the x and y
;*************************************
proc  MovePlayerDown
	push cx
	push dx
	cmp [Yplayer], 184
	jnz @@NoMove1
	jmp @@NoMove
@@NoMove1:
	mov cx, PLAYER_WIDTH
	mov dx, [YplayerB]
	mov di, [Xplayer]
	sub dx, 2
	SUB CX, 4
	inc dx
@@keepChecking:
	xchg cx,di
	mov ah,0dh
	int 10h
	xchg cx,di
	inc di
	cmp al, [StageColor]
	jz @@NoMove
	loop @@keepChecking

	call putPlayer ; delete at curret locatein
	add [Yplayer], 2
	add [YplayerB], 2
	call putPlayer
@@NoMove:
	pop dx
	pop cx
	ret
endp MovePlayerDown

;*************************************
;proc info:
;input: none
;output: ah containing if there was a key press and what key was pressed
;register usge: ax
;functionality: checks if a key was pressed and returns the result in ah (using int 16h)
;the proc expects: none
;*************************************
proc CheckAndReadKey
	  mov ah ,1
	  int 16h
	  pushf
	  jz @@return 
	  mov ah ,0
	  int 16h

@@return:	
	  popf
	  ret
endp CheckAndReadKey

;*************************************
;proc info:
;input: ah
;output: moving the player of exiting the program
;register usge: ax
;functionality: checks which key was pressed and do the assigned proc
;the proc expects: ah to contain which key was pressed
;*************************************
proc MovePlayer

   	  cmp ah,4bh ;left arrow scan code
	  jnz A
	  call MoveplayerLeft
	  mov [byte lastDiraction], 1
	  jmp n7
A:
	  cmp ah,30 ;left arrow scan code
	  jnz n1
	  call MoveplayerLeft
	  mov [byte lastDiraction], 1
	  jmp n7
n1:
	  cmp ah,48h ;up arrow scan code
	  jnz W
	  call MovePlayerUp
	  mov [byte lastDiraction], 3
	  jmp n7
W:
	  cmp ah,17 ;up arrow scan code
	  jnz n2
	  call MovePlayerUp
	  mov [byte lastDiraction], 3
	  jmp n7
n2:
	  cmp ah,4dh ;right arrow scan code
	  jnz D
	  call MovePlayerRight
	  mov [byte lastDiraction], 2
	  jmp n7
D:
	  cmp ah,32 ;right arrow scan code
	  jnz n3
	  call MovePlayerRight
	  mov [byte lastDiraction], 2
	  jmp n7
n3:
	  cmp ah,50h ;down arrow scan code
	  jnz S
	  call MovePlayerDown
	  mov [byte lastDiraction], 4
	  jmp n7
S:
	  cmp ah,31 ;down arrow scan code
	  jnz n4
	  call MovePlayerDown
	  mov [byte lastDiraction], 4
	  jmp n7
n4:
	cmp ah,1 ; Escape scan code
	jnz n5
	mov [exitt], 1
	jmp n7
n5:
	cmp [havesword], 1
	jnz n6
	cmp ah, 2ch
	jnz n6
    cmp [ShotExist],1
	jz n7
	push ax
	mov [shotShot],1
	mov ah, [lastDiraction]
	mov [shotDiraction], ah
	mov cx, 1
	call Shoot
	pop ax
	jmp n7
n6:
	cmp ah, 2dh
	jnz n7
	cmp [timeFreeze], 1
	jz n7
	cmp [timeFroze], 1
	jz n7
	mov [timeFreeze], 1
	mov [timeFroze], 1
	jmp n7
n7:
	ret
endp MovePlayer

;*************************************
;proc info:
;input: none
;output: shot on the screen
;register usge: none
;functionality: places the shot in the start location and direction
;the proc expects: shotDiraction to be 1-4, ShotExist to be 0
;*************************************
proc StartShot
	cmp [shotDiraction], 1
	jne @@e1
	cmp [Xplayer], 10
	jna @@e4
	call SetStartPshotHLeft
	call putPshotH
	mov [ShotExist], 1
	mov [shotShot],0
@@e1:
	cmp [shotDiraction], 2
	jne @@e2
	cmp [Xplayer], 310
	jnb @@e4
	call SetStartPshotHRight
	call putPshotH
	mov [ShotExist], 1
	mov [shotShot],0
@@e2:
	cmp [shotDiraction], 3
	jne @@e3
	cmp [Yplayer], 10
	jna @@e4
	call SetStartPshotVUp
	call putPshotV
	mov [ShotExist], 1
	mov [shotShot],0
@@e3:
	cmp [shotDiraction], 4
	jne @@e4
	cmp [Yplayer], 180
	jnb @@e4
	call SetStartPshotVDown
	call putPshotV
	mov [ShotExist], 1
	mov [shotShot],0
@@e4:
	ret
endp StartShot

;*************************************
;proc info:
;input: none
;output: shot on the screen
;register usge: none
;functionality: moves the shot in the right direction
;the proc expects: shotDiraction to be 1-4, ShotExist to be 1
proc MoveShot
	cmp [shotDiraction], 1
	jne @@e1
	call MovePshotHLeft
@@e1:
	cmp [shotDiraction], 2
	jne @@e2
	call MovePshotHRight
@@e2:
	cmp [shotDiraction], 3
	jne @@e3
	call MovePshotVUp
@@e3:
	cmp [shotDiraction], 4
	jne @@e4
	call MovePshotVDown
@@e4:
	ret
endp MoveShot

;*************************************
;proc info:
;input: none
;output: none
;register usge: ax
;functionality: uses the CheckAndReadKey proc to check player movment
;the proc expects: none
;*************************************
proc CheckKey
	 call CheckAndReadKey
	 jz @@NoKey
	 call MovePlayer
	 
@@NoKey:
	ret
endp CheckKey

;==============================================================================================================================




; virus:
;*************************************
;proc info:
;input: Xvirus, Yvirus, VIRUS_HIGHT, VIRUS_WIDTH
;output: puts or deletes virus of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the virus at the location set by the x and y varibels
;the proc expects: the varibels Xvirus and Yvirus to contain the x and y
;				   the consts VIRUS_HIGHT and VIRUS_WIDTH to contain the length and width
;*************************************
proc putVirus
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[Yvirus]
@@nextR:
	
		mov di,0
		mov cx,[Xvirus]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte virus + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,VIRUS_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, VIRUS_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putVirus

;*************************************
;proc info:
;input: cx, dx
;output: Xvirus, Yvirus, XvirusB, YvirusB
;register usge: cx, dx
;functionality: sets the virus start location in the varibels
;the proc expects: cx and dx to contain the start x and y
;*************************************
proc SetStartVirus
	push cx
	push dx
	mov [Xvirus], cx
	mov [Yvirus], dx
	add cx, VIRUS_WIDTH
	mov [XvirusB], cx
	add dx, VIRUS_HIGHT
	mov [YvirusB], dx
	mov [virus1Alive], 1
	pop dx
	pop cx
	ret
endp SetStartVirus

;*************************************
;proc info:
;input: none
;output: moves the virus one pixel left
;register usge: none
;functionality: moves the virus up using xor movement
;the proc expects: Xvirus and Yvirus to contain the x and y
;*************************************
proc  MoveVirusLeft
	call putVirus ; delete at curret locatein
	dec [Xvirus]
	dec [XvirusB]
	call putVirus ; put it  at new location
	ret
endp MoveVirusLeft

;*************************************
;proc info:
;input: none
;output: moves the virus one pixel right
;register usge: none
;functionality: moves the virus up using xor movement
;the proc expects: Xvirus and Yvirus to contain the x and y
;*************************************
proc  MoveVirusRight
	call putVirus ; delete at curret locatein
	inc [Xvirus]
	inc [XvirusB]
	call putVirus ; put it  at new location
	ret
endp MoveVirusRight

;*************************************
;proc info:
;input: none
;output: moves the virus one pixel up
;register usge: none
;functionality: moves the virus up using xor movement
;the proc expects: Xvirus and Yvirus to contain the x and y
;*************************************
proc  MoveVirusUp
	call putVirus ; delete at curret locatein
	dec [Yvirus]
	dec [YvirusB]
	call putVirus ; put it  at new location
	ret
endp MoveVirusUp

;*************************************
;proc info:
;input: none
;output: moves the virus one pixel down
;register usge: none
;functionality: moves the virus up using xor movement
;the proc expects: Xvirus and Yvirus to contain the x and y
;*************************************
proc  MoveVirusDown
	call putVirus ; delete at curret locatein
	inc [Yvirus]
	inc [YvirusB]
	call putVirus ; put it  at new location
	ret
endp MoveVirusDown

;*************************************
;proc info:
;input: none
;output: puts the shot on the screen
;register usge: none
;functionality: sets the shots at the virus
;the proc expects: none
;*************************************
proc StartV1shotUD
	cmp [VshotDExist], 1
	jnz @@n1
	call putVshotD
@@n1:
	cmp [VshotUExist], 1
	jnz @@n2
	call putVshotU
@@n2:
	call SetStartVshotD
	call SetStartVshotU
	call putVshotD
	call putVshotU
	mov [VshotDExist], 1
	mov [VshotUExist], 1
	mov [Vshoot], 0
	ret
endp StartV1shotUD

;*************************************
;proc info:
;input: none
;output: moves the shot on the screen
;register usge: none
;functionality: moves the shot
;the proc expects: none
;*************************************
proc MoveV1ShotUD
	cmp [VshotUExist], 1
	jnz @@n3
	call MoveVshotUUp
@@n3:
	cmp [VshotDExist], 1
	jnz @@n4
	call MoveVshotDDown
@@n4:
	ret
endp  MoveV1ShotUD

proc MoveV1LR
	cmp [left], 0
	jnz @@moveleft
	cmp [XvirusB], 320 
	jz @@rightt
	call MoveVirusRight
	jmp @@ret
@@rightt:
	mov [left], 1
@@moveleft:
	cmp [Xvirus], 0
	jz @@leftt
	call MoveVirusLeft
	jmp @@ret
@@leftt:
	mov [left], 0
@@ret:
	cmp [Xvirus], 250
	 jnz @@Vdead
	 mov [Vshoot], 1
@@Vdead:
	 cmp [Xvirus], 50
	 jnz @@Vdead2
	 mov [Vshoot], 1
@@Vdead2:
	 cmp [Xvirus], 100
	 jnz @@Vdead3
	 mov [Vshoot], 1
@@Vdead3:
	ret
endp MoveV1LR
;==============================================================================================================================

; virus2:
;*************************************
;proc info:
;input: Xvirus2, Yvirus2, VIRUS_HIGHT, VIRUS_WIDTH
;output: puts or deletes virus2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the virus2 at the location set by the x and y varibels
;the proc expects: the varibels Xvirus2 and Yvirus2 to contain the x and y
;				   the consts VIRUS_HIGHT and VIRUS_WIDTH to contain the length and width
;*************************************
proc putvirus2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[Yvirus2]
@@nextR:
	
		mov di,0
		mov cx,[Xvirus2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte virus + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,VIRUS_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, VIRUS_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putvirus2

;*************************************
;proc info:
;input: cx, dx
;output: Xvirus2, Yvirus2, Xvirus2B, Yvirus2B
;register usge: cx, dx
;functionality: sets the virus2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y
;*************************************
proc SetStartvirus2
	push cx
	push dx
	mov [Xvirus2], cx
	mov [Yvirus2], dx
	add cx, VIRUS_WIDTH
	mov [Xvirus2B], cx
	add dx, VIRUS_HIGHT
	mov [Yvirus2B], dx
	mov [virus2Alive], 1
	pop dx
	pop cx
	ret
endp SetStartvirus2

;*************************************
;proc info:
;input: none
;output: moves the virus2 one pixel left
;register usge: none
;functionality: moves the virus2 up using xor movement
;the proc expects: Xvirus2 and Yvirus2 to contain the x and y
;*************************************
proc  Movevirus2Left
	call putvirus2 ; delete at curret locatein
	dec [Xvirus2]
	dec [Xvirus2B]
	call putvirus2 ; put it  at new location
	ret
endp Movevirus2Left

;*************************************
;proc info:
;input: none
;output: moves the virus2 one pixel right
;register usge: none
;functionality: moves the virus2 up using xor movement
;the proc expects: Xvirus2 and Yvirus2 to contain the x and y
;*************************************
proc  Movevirus2Right
	call putvirus2 ; delete at curret locatein
	inc [Xvirus2]
	inc [Xvirus2B]
	call putvirus2 ; put it  at new location
	ret
endp Movevirus2Right

;*************************************
;proc info:
;input: none
;output: moves the virus2 one pixel up
;register usge: none
;functionality: moves the virus2 up using xor movement
;the proc expects: Xvirus2 and Yvirus2 to contain the x and y
;*************************************
proc  Movevirus2Up
	call putvirus2 ; delete at curret locatein
	dec [Yvirus2]
	dec [Yvirus2B]
	call putvirus2 ; put it  at new location
	ret
endp Movevirus2Up

;*************************************
;proc info:
;input: none
;output: moves the virus2 one pixel down
;register usge: none
;functionality: moves the virus2 up using xor movement
;the proc expects: Xvirus2 and Yvirus2 to contain the x and y
;*************************************
proc  Movevirus2Down
	call putvirus2 ; delete at curret locatein
	inc [Yvirus2]
	inc [Yvirus2B]
	call putvirus2 ; put it  at new location
	ret
endp Movevirus2Down


;*************************************
;proc info:
;input: none
;output: puts the shot on the screen
;register usge: none
;functionality: sets the shots at the virus
;the proc expects: none
;*************************************
proc StartV2shotUD
	cmp [VshotD2Exist], 1
	jnz @@n1
	call putVshotD2
@@n1:
	cmp [VshotU2Exist], 1
	jnz @@n2
	call putVshotU2
@@n2:
	call SetStartVshotD2
	call SetStartVshotU2
	call putVshotD2
	call putVshotU2
	mov [VshotD2Exist], 1
	mov [VshotU2Exist], 1
	mov [V2shoot], 0
	ret
endp StartV2shotUD

;*************************************
;proc info:
;input: none
;output: moves the shot on the screen
;register usge: none
;functionality: moves the shot
;the proc expects: none
;*************************************
proc MoveV2ShotUD
	cmp [VshotU2Exist], 1
	jnz @@n3
	call MoveVshotU2Up
@@n3:
	cmp [VshotD2Exist], 1
	jnz @@n4
	call MoveVshotD2Down
@@n4:
	ret
endp  MoveV2ShotUD

proc MoveV2LR
	cmp [left2], 0
	jnz @@moveleft
	cmp [Xvirus2B], 320 
	jz @@rightt
	call MoveVirus2Right
	jmp @@ret
@@rightt:
	mov [left2], 1
@@moveleft:
	cmp [Xvirus2], 0
	jz @@leftt
	call MoveVirus2Left
	jmp @@ret
@@leftt:
	mov [left2], 0
@@ret:
	cmp [Xvirus2], 250
	 jnz @@Vdead
	 mov [V2shoot], 1
@@Vdead:
	cmp [Xvirus2], 50
	 jnz @@Vdead2
	 mov [V2shoot], 1
@@Vdead2:
	 cmp [Xvirus2], 100
	 jnz @@Vdead3
	 mov [V2shoot], 1
@@Vdead3:
	ret
endp MoveV2LR
;==============================================================================================================================



; bug
;*************************************
;proc info:
;input: Xbug, Ybug, BUG_SIZE
;output: puts or deletes bug of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the bug at the location set by the x and y varibels
;the proc expects: the varibels Xbug and Ybug to contain the x and y
;				   the const BUG_SIZE to contain the length and width
;*************************************
proc putBug
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[Ybug]
@@nextR:
	
		mov di,0
		mov cx,[Xbug]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte bug + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,BUG_SIZE
		jb @@nextC
		inc dx
		inc si
	
	cmp si, BUG_SIZE
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putBug

;*************************************
;proc info:
;input: cx, dx
;output: Xbug, Ybug, XbugB, YbugB
;register usge: cx, dx
;functionality: sets the bug start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartBug
	push cx
	push dx
	mov [Xbug], cx
	mov [Ybug], dx
	add cx, BUG_SIZE
	mov [XbugB], cx
	add dx, BUG_SIZE
	mov [YbugB], dx
	mov [bug1Alive], 1
	pop dx
	pop cx
	ret
endp SetStartBug


;*************************************
;proc info:
;input: none
;output: moves the bug one pixel left
;register usge: none
;functionality: moves the bug up using xor movement
;the proc expects: Xbug and Ybug to contain the x and y
;*************************************
proc  MoveBugLeft
	call putBug ; delete at curret locatein
	dec [Xbug]
	dec [XbugB]
	call putBug ; put it  at new location
	ret
endp MoveBugLeft

;*************************************
;proc info:
;input: none
;output: moves the bug one pixel right
;register usge: none
;functionality: moves the bug up using xor movement
;the proc expects: Xbug and Ybug to contain the x and y
;*************************************
proc  MoveBugRight
	call putBug ; delete at curret locatein
	inc [Xbug]
	inc [XbugB]
	call putBug ; put it  at new location
	ret
endp MoveBugRight

;*************************************
;proc info:
;input: none
;output: moves the bug one pixel up
;register usge: none
;functionality: moves the bug up using xor movement
;the proc expects: Xbug and Ybug to contain the x and y
;*************************************
proc  MoveBugUp
	call putBug ; delete at curret locatein
	dec [Ybug]
	dec [YbugB]
	call putBug ; put it  at new location
	ret
endp MoveBugUp

;*************************************
;proc info:
;input: none
;output: moves the bug one pixel down
;register usge: none
;functionality: moves the bug up using xor movement
;the proc expects: Xbug and Ybug to contain the x and y
;*************************************
proc  MoveBugDown
	call putBug ; delete at curret locatein
	inc [Ybug]
	inc [YbugB]
	call putBug ; put it  at new location
	ret
endp MoveBugDown

;*************************************
;proc info:
;input: none
;output: puts the shot on the screen
;register usge: none
;functionality: sets the shots at the bug
;the proc expects: none
;*************************************
proc StartB1shotRL
	cmp [BshotRExist], 1
	jnz @@n1
	call putBshotR
@@n1:
	cmp [BshotLExist], 1
	jnz @@n2
	call putBshotL
@@n2:
	call SetStartBshotR
	call SetStartBshotL
	call putBshotR
	call putBshotL
	mov [BshotRExist], 1
	mov [BshotLExist], 1
	mov [Bshoot], 0
	ret
endp StartB1shotRL

;*************************************
;proc info:
;input: none
;output: moves the shot on the screen
;register usge: none
;functionality: moves the shot
;the proc expects: none
;*************************************
proc MoveB1ShotRL
	cmp [BshotRExist], 1
	jnz @@n3
	call MoveBshotRRight
@@n3:
	cmp [BshotLExist], 1
	jnz @@n4
	call MoveBshotLLeft
@@n4:
	ret
endp  MoveB1ShotRL

proc MoveB1UD
	cmp [down], 0
	jnz moveDown
	cmp [Ybug], 20
	jz top
	call MoveBugUp
	jmp @@ret
top:
	mov [down], 1
moveDown:
	cmp [YbugB], 200
	jz buttom
	call MoveBugDown
	jmp @@ret
buttom:
	mov [down], 0
@@ret:
	 cmp [Ybug], 150
	 jnz @@Bdead
	 mov [Bshoot], 1
@@Bdead:
	 cmp [Ybug], 50
	 jnz @@Bdead2
	 mov [Bshoot], 1
@@Bdead2:
	cmp [Ybug], 100
	 jnz @@Bdead3
	 mov [Bshoot], 1
@@Bdead3:
	ret
endp MoveB1UD
;==============================================================================================================================

; bug 2
;*************************************
;proc info:
;input: Xbug2, Ybug2, BUG_SIZE
;output: puts or deletes bug2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the bug2 at the location set by the x and y varibels
;the proc expects: the varibels Xbug2 and Ybug2 to contain the x and y
;				   the const BUG_SIZE to contain the length and width
;*************************************
proc putbug2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[Ybug2]
@@nextR:
	
		mov di,0
		mov cx,[Xbug2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte bug + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,BUG_SIZE
		jb @@nextC
		inc dx
		inc si
	
	cmp si, BUG_SIZE
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putbug2

;*************************************
;proc info:
;input: cx, dx
;output: Xbug2, Ybug2, Xbug2B, Ybug2B
;register usge: cx, dx
;functionality: sets the bug2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartbug2
	push cx
	push dx
	mov [Xbug2], cx
	mov [Ybug2], dx
	add cx, BUG_SIZE
	mov [Xbug2B], cx
	add dx, BUG_SIZE
	mov [Ybug2B], dx
	mov [bug2Alive], 1
	pop dx
	pop cx
	ret
endp SetStartbug2

;*************************************
;proc info:
;input: none
;output: moves the bug2 one pixel left
;register usge: none
;functionality: moves the bug2 up using xor movement
;the proc expects: Xbug2 and Ybug2 to contain the x and y
;*************************************
proc  Movebug2Left
	call putbug2 ; delete at curret locatein
	dec [Xbug2]
	dec [Xbug2B]
	call putbug2 ; put it  at new location
	ret
endp Movebug2Left

;*************************************
;proc info:
;input: none
;output: moves the bug2 one pixel right
;register usge: none
;functionality: moves the bug2 up using xor movement
;the proc expects: Xbug2 and Ybug2 to contain the x and y
;*************************************
proc  Movebug2Right
	call putbug2 ; delete at curret locatein
	inc [Xbug2]
	inc [Xbug2B]
	call putbug2 ; put it  at new location
	ret
endp Movebug2Right

;*************************************
;proc info:
;input: none
;output: moves the bug2 one pixel up
;register usge: none
;functionality: moves the bug2 up using xor movement
;the proc expects: Xbug2 and Ybug2 to contain the x and y
;*************************************
proc  Movebug2Up
	call putbug2 ; delete at curret locatein
	dec [Ybug2]
	dec [Ybug2B]
	call putbug2 ; put it  at new location
	ret
endp Movebug2Up

;*************************************
;proc info:
;input: none
;output: moves the bug2 one pixel down
;register usge: none
;functionality: moves the bug2 up using xor movement
;the proc expects: Xbug2 and Ybug2 to contain the x and y
;*************************************
proc  Movebug2Down
	call putbug2 ; delete at curret locatein
	inc [Ybug2]
	inc [Ybug2B]
	call putbug2 ; put it  at new location
	ret
endp Movebug2Down

;*************************************
;proc info:
;input: none
;output: puts the shot on the screen
;register usge: none
;functionality: sets the shots at the bug
;the proc expects: none
;*************************************
proc StartB2shotRL
	cmp [BshotR2Exist], 1
	jnz @@n1
	call putBshotR2
@@n1:
	cmp [BshotL2Exist], 1
	jnz @@n2
	call putBshotL2
@@n2:
	call SetStartBshotR2
	call SetStartBshotL2
	call putBshotR2
	call putBshotL2
	mov [BshotR2Exist], 1
	mov [BshotL2Exist], 1
	mov [B2shoot], 0
	ret
endp StartB2shotRL

;*************************************
;proc info:
;input: none
;output: moves the shot on the screen
;register usge: none
;functionality: moves the shot
;the proc expects: none
;*************************************
proc MoveB2ShotRL
	cmp [BshotR2Exist], 1
	jnz @@n3
	call MoveBshotR2Right
@@n3:
	cmp [BshotL2Exist], 1
	jnz @@n4
	call MoveBshotL2Left
@@n4:
	ret
endp  MoveB2ShotRL

proc MoveB2UD
	cmp [down2], 0
	jnz @@moveDown
	cmp [Ybug2], 20
	jna @@top
	call MoveBug2Up
	jmp @@ret
@@top:
	mov [down2], 1
@@moveDown:
	cmp [Ybug2B], 200
	jz @@buttom
	call MoveBug2Down
	jmp @@ret
@@buttom:
	mov [down2], 0
@@ret:
	 cmp [Ybug2], 150
	 jnz @@Bdead
	 mov [B2shoot], 1
@@Bdead:
	 cmp [Ybug2], 50
	 jnz @@Bdead2
	 mov [B2shoot], 1
@@Bdead2:
	 cmp [Ybug2], 100
	 jnz @@Bdead3
	 mov [B2shoot], 1
@@Bdead3:
	ret
endp MoveB2UD
;==============================================================================================================================




;chapt3
;*************************************
;proc info:
;input: Xchapt3, Ychapt3, CHAPT3_SIZE
;output: puts or deletes chapt3 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the chapt3 at the location set by the x and y varibels
;the proc expects: the varibels Xchapt3 and Ychapt3 to contain the x and y
;				   the const CHAPT3_SIZE to contain the length and width
;*************************************
proc putChapt3
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[Ychapt3]
@@nextR:
	
		mov di,0
		mov cx,[Xchapt3]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte chapt3 + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,CHAPT3_SIZE
		jb @@nextC
		inc dx
		inc si
	
	cmp si, CHAPT3_SIZE
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putChapt3

;*************************************
;proc info:
;input: cx, dx
;output: Xchapt3, Ychapt3, Xchapt3B, Ychapt3B
;register usge: cx, dx
;functionality: sets the chapt3 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartChapt3
	push cx
	push dx
	mov [Xchapt3], cx
	mov [Ychapt3], dx
	add cx, CHAPT3_SIZE
	mov [Xchapt3B], cx
	add dx, CHAPT3_SIZE
	mov [Ychapt3B], dx
	mov [chapt31Alive], 1
	pop dx
	pop cx
	ret
endp SetStartChapt3


;*************************************
;proc info:
;input: none
;output: moves the chapt3 one pixel left
;register usge: none
;functionality: moves the chapt3 up using xor movement
;the proc expects: Xchapt3 and Ychapt3 to contain the x and y
;*************************************
proc  MoveChapt3Left
	call putChapt3 ; delete at curret locatein
	dec [Xchapt3]
	dec [Xchapt3B]
	call putChapt3 ; put it  at new location
	ret
endp MoveChapt3Left

;*************************************
;proc info:
;input: none
;output: moves the chapt3 one pixel right
;register usge: none
;functionality: moves the chapt3 up using xor movement
;the proc expects: Xchapt3 and Ychapt3 to contain the x and y
;*************************************
proc  MoveChapt3Right
	call putChapt3 ; delete at curret locatein
	inc [Xchapt3]
	inc [Xchapt3B]
	call putChapt3 ; put it  at new location
	ret
endp MoveChapt3Right

;*************************************
;proc info:
;input: none
;output: moves the chapt3 one pixel up
;register usge: none
;functionality: moves the chapt3 up using xor movement
;the proc expects: Xchapt3 and Ychapt3 to contain the x and y
;*************************************
proc  MoveChapt3Up
	call putChapt3 ; delete at curret locatein
	dec [Ychapt3]
	dec [Ychapt3B]
	call putChapt3 ; put it  at new location
	ret
endp MoveChapt3Up

;*************************************
;proc info:
;input: none
;output: moves the chapt3 one pixel down
;register usge: none
;functionality: moves the chapt3 up using xor movement
;the proc expects: Xchapt3 and Ychapt3 to contain the x and y
;*************************************
proc  MoveChapt3Down
	call putChapt3 ; delete at curret locatein
	inc [Ychapt3]
	inc [Ychapt3B]
	call putChapt3 ; put it  at new location
	ret
endp MoveChapt3Down

;*************************************
;proc info:
;input: none
;output: puts the shot on the screen
;register usge: none
;functionality: sets the shots at the chapt3
;the proc expects: none
;*************************************
proc StartCshot
	cmp [CshotVUExist], 1
	jnz @@n1
	call putCshotVU
@@n1:
	cmp [CshotVDExist], 1
	jnz @@n2
	call putCshotVD
@@n2:
	cmp [CshotHRExist], 1
	jnz @@n3
	call putCshotHR
@@n3:
	cmp [CshotHLExist], 1
	jnz @@n4
	call putCshotHL
@@n4:
	call SetStartCshotHR
	call SetStartCshotHL
	call SetStartCshotVU
	call SetStartCshotVD
	call putCshotHR
	call putCshotHL
	call putCshotVU
	call putCshotVD
	mov [CshotHRExist], 1
	mov [CshotHLExist], 1
	mov [CshotVUExist], 1
	mov [CshotVDExist], 1
	mov [Cshoot], 0
	ret
endp StartCshot

;*************************************
;proc info:
;input: none
;output: moves the shot on the screen
;register usge: none
;functionality: moves the shot
;the proc expects: none
;*************************************
proc MoveCShot
	cmp [CshotHRExist], 1
	jnz @@n1
	call MoveCshotHRRight
@@n1:
	cmp [CshotHLExist], 1
	jnz @@n2
	call MoveCshotHLLeft
@@n2:
	cmp [CshotVUExist], 1
	jnz @@n3
	call MoveCshotVUUp
@@n3:
	cmp [CshotVDExist], 1
	jnz @@n4
	call MoveCshotVDDown
@@n4:
	ret
endp  MoveCShot


proc MoveC31LURD
	cmp [upLeft], 0
	jnz @@moveleft
	cmp [Ychapt3B], 200 
	jz @@rightt
	cmp [Xchapt3B], 320
	jz @@rightt
	call MoveChapt3Right
	call MoveChapt3Down
	jmp @@ret
@@rightt:
	mov [UpLeft], 1
@@moveleft:
	cmp [Ychapt3], 20 
	jz @@leftt
	cmp [Xchapt3], 0
	jz @@leftt
	call MoveChapt3Left
	call MoveChapt3Up
	jmp @@ret
@@leftt:
	mov [UpLeft], 0
@@ret:
	cmp [chapt3Lives], 0
	jna @@Cdead2
	 cmp [Ychapt3], 175
	 jnz @@Cdead
	 mov [Cshoot], 1
@@Cdead:
	 cmp [Ychapt3], 100
	 jnz @@Cdead1
	 mov [Cshoot], 1
@@Cdead1:
	 cmp [Ychapt3], 25
	 jnz @@Cdead2
	 mov [Cshoot], 1
@@Cdead2:
	ret
endp MoveC31LURD
;==============================================================================================================================

;chapt32
;*************************************
;proc info:
;input: Xchapt32, Ychapt32, chapt3_SIZE
;output: puts or deletes chapt322 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the chapt32 at the location set by the x and y varibels
;the proc expects: the varibels Xchapt32 and Ychapt32 to contain the x and y
;				   the const chapt32_SIZE to contain the length and width
;*************************************
proc putchapt32
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[Ychapt32]
@@nextR:
	
		mov di,0
		mov cx,[Xchapt32]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte chapt3 + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,chapt3_SIZE
		jb @@nextC
		inc dx
		inc si
	
	cmp si, chapt3_SIZE
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putchapt32

;*************************************
;proc info:
;input: cx, dx
;output: Xchapt32, Ychapt32, Xchapt32B, Ychapt32B
;register usge: cx, dx
;functionality: sets the chapt32 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartchapt32
	push cx
	push dx
	mov [Xchapt32], cx
	mov [Ychapt32], dx
	add cx, CHAPT3_SIZE
	mov [Xchapt32B], cx
	add dx, CHAPT3_SIZE
	mov [Ychapt32B], dx
	mov [chapt32Alive], 1
	pop dx
	pop cx
	ret
endp SetStartchapt32

;*************************************
;proc info:
;input: none
;output: moves the chapt32 one pixel left
;register usge: none
;functionality: moves the chapt32 up using xor movement
;the proc expects: Xchapt32 and Ychapt32 to contain the x and y
;*************************************
proc  Movechapt32Left
	call putchapt32 ; delete at curret locatein
	dec [Xchapt32]
	dec [Xchapt32B]
	call putchapt32 ; put it  at new location
	ret
endp Movechapt32Left

;*************************************
;proc info:
;input: none
;output: moves the chapt32 one pixel right
;register usge: none
;functionality: moves the chapt32 up using xor movement
;the proc expects: Xchapt32 and Ychapt32 to contain the x and y
;*************************************
proc  Movechapt32Right
	call putchapt32 ; delete at curret locatein
	inc [Xchapt32]
	inc [Xchapt32B]
	call putchapt32 ; put it  at new location
	ret
endp Movechapt32Right

;*************************************
;proc info:
;input: none
;output: moves the chapt32 one pixel up
;register usge: none
;functionality: moves the chapt32 up using xor movement
;the proc expects: Xchapt32 and Ychapt32 to contain the x and y
;*************************************
proc  Movechapt32Up
	call putchapt32 ; delete at curret locatein
	dec [Ychapt32]
	dec [Ychapt32B]
	call putchapt32 ; put it  at new location
	ret
endp Movechapt32Up

;*************************************
;proc info:
;input: none
;output: moves the chapt32 one pixel down
;register usge: none
;functionality: moves the chapt32 up using xor movement
;the proc expects: Xchapt32 and Ychapt32 to contain the x and y
;*************************************
proc  Movechapt32Down
	call putchapt32 ; delete at curret locatein
	inc [Ychapt32]
	inc [Ychapt32B]
	call putchapt32 ; put it  at new location
	ret
endp Movechapt32Down

;*************************************
;proc info:
;input: none
;output: puts the shot on the screen
;register usge: none
;functionality: sets the shots at the chapt3
;the proc expects: none
;*************************************
proc StartC2shot
	cmp [CshotVU2Exist], 1
	jnz @@n1
	call putCshotVU2
@@n1:
	cmp [CshotVD2Exist], 1
	jnz @@n2
	call putCshotVD2
@@n2:
	cmp [CshotHR2Exist], 1
	jnz @@n3
	call putCshotHR2
@@n3:
	cmp [CshotHL2Exist], 1
	jnz @@n4
	call putCshotHL2
@@n4:
	call SetStartCshotHR2
	call SetStartCshotHL2
	call SetStartCshotVU2
	call SetStartCshotVD2
	call putCshotHR2
	call putCshotHL2
	call putCshotVU2
	call putCshotVD2
	mov [CshotHR2Exist], 1
	mov [CshotHL2Exist], 1
	mov [CshotVU2Exist], 1
	mov [CshotVD2Exist], 1
	mov [C2shoot], 0
	ret
endp StartC2shot

;*************************************
;proc info:
;input: none
;output: moves the shot on the screen
;register usge: none
;functionality: moves the shot
;the proc expects: none
;*************************************
proc MoveC2Shot
	cmp [CshotHR2Exist], 1
	jnz @@n1
	call MoveCshotHR2Right
@@n1:
	cmp [CshotHL2Exist], 1
	jnz @@n2
	call MoveCshotHL2Left
@@n2:
	cmp [CshotVU2Exist], 1
	jnz @@n3
	call MoveCshotVU2Up
@@n3:
	cmp [CshotVD2Exist], 1
	jnz @@n4
	call MoveCshotVD2Down
@@n4:
	ret
endp  MoveC2Shot

proc MoveC32LURD
	cmp [upLeft2], 0
	jnz @@moveleft
	cmp [Ychapt32B], 200 
	jz @@rightt
	cmp [Xchapt32B], 320
	jz @@rightt
	call MoveChapt32Right
	call MoveChapt32Down
	jmp @@ret
@@rightt:
	mov [UpLeft2], 1
@@moveleft:
	cmp [Ychapt32], 20 
	jz @@leftt
	cmp [Xchapt32], 0
	jz @@leftt
	call MoveChapt32Left
	call MoveChapt32Up
	jmp @@ret
@@leftt:
	mov [UpLeft2], 0
@@ret:
	 cmp [Ychapt32], 175
	 jnz @@Cdead
	 mov [C2shoot], 1
@@Cdead:
	 cmp [Ychapt32], 100
	 jnz @@Cdead1
	 mov [C2shoot], 1
@@Cdead1:
	 cmp [Ychapt32], 25
	 jnz @@Cdead2
	 mov [C2shoot], 1
@@Cdead2:
	ret
endp MoveC32LURD
;==============================================================================================================================




; boss
;*************************************
;proc info:
;input: Xboss, Yboss, BOSS_WIDTH, BOSS_HIGHT
;output: puts or deletes boss of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the boss at the location set by the x and y varibels
;the proc expects: the varibels Xboss and Yboss to contain the x and y
;				   the const BOSS_WIDTH and BOSS_HIGHT to contain the length and width
;*************************************
proc putBoss
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[Yboss]
@@nextR:
	
		mov di,0
		mov cx,[Xboss]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte boss + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,BOSS_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, BOSS_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putBoss

;*************************************
;proc info:
;input: cx, dx
;output: Xboss, Yboss, XbossB, YbossB
;register usge: cx, dx
;functionality: sets the boss start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartBoss
	push cx
	push dx
	mov [Xboss], cx
	mov [Yboss], dx
	add cx, BOSS_WIDTH
	mov [XbossB], cx
	add dx, BOSS_HIGHT
	mov [YbossB], dx
	mov [boss1Alive], 1
	pop dx
	pop cx
	ret
endp SetStartBoss

;*************************************
;proc info:
;input: none
;output: moves the boss one pixel left
;register usge: none
;functionality: moves the boss up using xor movement
;the proc expects: Xboss and Yboss to contain the x and y
;*************************************
proc  MoveBossLeft
	call putBoss ; delete at curret locatein
	dec [Xboss]
	dec [XbossB]
	call putBoss ; put it  at new location
	ret
endp MoveBossLeft

;*************************************
;proc info:
;input: none
;output: moves the boss one pixel right
;register usge: none
;functionality: moves the boss up using xor movement
;the proc expects: Xboss and Yboss to contain the x and y
;*************************************
proc  MoveBossRight
	call putBoss ; delete at curret locatein
	inc [Xboss]
	inc [XbossB]
	call putBoss ; put it  at new location
	ret
endp MoveBossRight

;*************************************
;proc info:
;input: none
;output: moves the boss one pixel up
;register usge: none
;functionality: moves the boss up using xor movement
;the proc expects: Xboss and Yboss to contain the x and y
;*************************************
proc  MoveBossUp
	call putBoss ; delete at curret locatein
	dec [Yboss]
	dec [YbossB]
	call putBoss ; put it  at new location
	ret
endp MoveBossUp

;*************************************
;proc info:
;input: none
;output: moves the boss one pixel down
;register usge: none
;functionality: moves the boss up using xor movement
;the proc expects: Xboss and Yboss to contain the x and y
;*************************************
proc  MoveBossDown
	call putBoss ; delete at curret locatein
	inc [Yboss]
	inc [YbossB]
	call putBoss ; put it  at new location
	ret
endp MoveBossDown

;*************************************
;proc info:
;input: none
;output: puts the shot on the screen
;register usge: none
;functionality: sets the shots at the bug
;the proc expects: none
;*************************************
proc StartBossShots
	cmp [boss1shoot], 1
	jnz @@n1
	cmp [boss1Alive], 1
	jnz @@n1
	cmp [B1shotExist], 1
	jnz @@n1
	call putB1shot
@@n1:
	cmp [boss2shoot], 1
	jnz @@n2
	cmp [boss2Alive], 1
	jnz @@n2
	cmp [B2shotExist], 1
	jnz @@n2
	call putB2shot
@@n2:
	cmp [boss1shoot], 1
	jnz @@n3
	cmp [boss1Alive], 1
	jnz @@n3
	call SetStartB1shot ;blue shot
	mov [B1shotExist], 1
	call putB1shot
	mov [boss1shoot], 0
@@n3:
	cmp [boss2shoot], 1
	jnz @@ret
	cmp [boss2Alive], 1
	jnz @@ret
	call SetStartB2shot ;red shot
	call putB2shot
	mov [B2shotExist], 1
	mov [boss2shoot], 0
@@ret:
	ret
endp StartBossShots

;*************************************
;proc info:
;input: none
;output: moves the shot on the screen
;register usge: none
;functionality: moves the shot
;the proc expects: none
;*************************************
proc MoveBossShots
	cmp [B1shotExist], 1
	jnz @@n3
	call MoveB1shotLeft
@@n3:
	cmp [B2shotExist], 1
	jnz @@n4
	call MoveB2shotRight
@@n4:
	ret
endp  MoveBossShots

proc MoveBosses
	cmp [boss1Alive], 1
	jnz @@boss1Dead
	cmp [Yboss], 100
	jnz @@noshot1
	mov [boss1shoot], 1
@@noshot1:
	cmp [bup], 0
	jnz @@up
	cmp [YbossB], 200
	jz upb1
	call MoveBossDown
	jmp @@boss1Dead
upb1:
	mov [bup], 1
@@up:
	cmp [Yboss], 20
	jz downb1
	call MoveBossUp
	jmp @@boss1Dead
downb1:
	mov [bup], 0
@@boss1Dead:
	cmp [boss2Alive], 1
	jnz @@boss2Dead
	cmp [Yboss2], 100
	jnz @@noshot2
	mov [boss2shoot], 1
@@noshot2:
	cmp [bup2], 0
	jnz @@up2
	cmp [Yboss2B], 200
	jz upb2
	call MoveBoss2Down
	jmp @@boss2Dead
upb2:
	mov [bup2], 1
@@up2:
	cmp [Yboss2], 20
	jz downb2
	call MoveBoss2Up
	jmp @@boss2Dead
downb2:
	mov [bup2], 0
@@boss2Dead:
	ret
endp MoveBosses
;==============================================================================================================================


; boss2
;*************************************
;proc info:
;input: Xboss2, Yboss2, BOSS_WIDTH, BOSS_HIGHT
;output: puts or deletes boss2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the boss2 at the location set by the x and y varibels
;the proc expects: the varibels Xboss2 and Yboss2 to contain the x and y
;				   the const BOSS_WIDTH and BOSS_HIGHT to contain the length and width
;*************************************
proc putBoss2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[Yboss2]
@@nextR:
	
		mov di,0
		mov cx,[Xboss2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte boss2 + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,BOSS_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, BOSS_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putBoss2

;*************************************
;proc info:
;input: cx, dx
;output: Xboss2, Yboss2, Xboss2B, Yboss2B
;register usge: cx, dx
;functionality: sets the boss2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartBoss2
	push cx
	push dx
	mov [Xboss2], cx
	mov [Yboss2], dx
	add cx, BOSS_WIDTH
	mov [Xboss2B], cx
	add dx, BOSS_HIGHT
	mov [Yboss2B], dx
	mov [boss2Alive], 1
	pop dx
	pop cx
	ret
endp SetStartBoss2

;*************************************
;proc info:
;input: none
;output: moves the boss2 one pixel left
;register usge: none
;functionality: moves the boss2 up using xor movement
;the proc expects: Xboss2 and Yboss2 to contain the x and y
;*************************************
proc  MoveBoss2Left
	call putBoss2 ; delete at curret locatein
	dec [Xboss2]
	dec [Xboss2B]
	call putBoss2 ; put it  at new location
	ret
endp MoveBoss2Left

;*************************************
;proc info:
;input: none
;output: moves the boss2 one pixel right
;register usge: none
;functionality: moves the boss2 up using xor movement
;the proc expects: Xboss2 and Yboss2 to contain the x and y
;*************************************
proc  MoveBoss2Right
	call putBoss2 ; delete at curret locatein
	inc [Xboss2]
	inc [Xboss2B]
	call putBoss2 ; put it  at new location
	ret
endp MoveBoss2Right

;*************************************
;proc info:
;input: none
;output: moves the boss2 one pixel up
;register usge: none
;functionality: moves the boss2 up using xor movement
;the proc expects: Xboss2 and Yboss2 to contain the x and y
;*************************************
proc  MoveBoss2Up
	call putBoss2 ; delete at curret locatein
	dec [Yboss2]
	dec [Yboss2B]
	call putBoss2 ; put it  at new location
	ret
endp MoveBoss2Up

;*************************************
;proc info:
;input: none
;output: moves the boss2 one pixel down
;register usge: none
;functionality: moves the boss2 up using xor movement
;the proc expects: Xboss2 and Yboss2 to contain the x and y
;*************************************
proc  MoveBoss2Down
	call putBoss2 ; delete at curret locatein
	inc [Yboss2]
	inc [Yboss2B]
	call putBoss2 ; put it  at new location
	ret
endp MoveBoss2Down

;==============================================================================================================================


;player shot
; Player shot horizontal
;*************************************
;proc info:
;input: XPshotH, YPshotH, PSHOTH_HIGHT, PSHOTH_WIDTH
;output: puts or deletes PshotH of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the PshotH at the location set by the x and y varibels
;the proc expects: the varibels XPshotH and YPshotH to contain the x and y
;				   the const PSHOTH_HIGHT, PSHOTH_WIDTH to contain the length and width
;*************************************
proc putPshotH
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	

    
	xor si,si
	xor bx,bx
	mov dx,[YPshotH]
@@nextR:
	
		mov di,0
		mov cx,[XPshotH]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte PshotH + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,PSHOTH_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, PSHOTH_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putPshotH

;*************************************
;proc info:
;input: cx, dx
;output: XPshotH, YPshotH
;register usge: cx, dx
;functionality: sets the PshotH start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartPshotHLeft
	push cx
	push dx
	mov cx, [Xplayer]
	mov dx, [Yplayer]
	add dx, PLAYER_HIGHT_MIDDLE
	inc dx
	sub cx, PSHOTH_WIDTH
	add cx, 3
	mov [XPshotH], cx
	mov [YPshotH], dx
	
	pop dx
	pop cx
	ret
endp SetStartPshotHLeft

;*************************************
;proc info:
;input: cx, dx
;output: XPshotH, YPshotH
;register usge: cx, dx
;functionality: sets the PshotH start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartPshotHRight
	push cx
	push dx
	mov cx, [XplayerB]
	mov dx, [YplayerB]
	sub dx, PLAYER_HIGHT_MIDDLE
	dec dx
	sub cx, 2
	mov [XPshotH], cx
	mov [YPshotH], dx
	
	pop dx
	pop cx
	ret
endp SetStartPshotHRight

;*************************************
;proc info:
;input: none
;output: moves the PshotH one pixel left
;register usge: none
;functionality: moves the PshotH up using xor movement
;the proc expects: XPshotH and YPshotH to contain the x and y
;*************************************
proc  MovePshotHLeft
	push cx
	push dx
	mov cx, [XPshotH]
	mov dx, [YPshotH]
	cmp [XPshotH], 0
	jnz @@bug1
	call putPshotH
	mov [ShotExist], 0
	jmp far @@ret
@@bug1:
	cmp [bug1Alive], 1
	jnz @@bug2
	cmp cx, [XbugB]
	jnz @@bug2
	cmp dx, [YbugB]
	ja @@bug2
	cmp dx, [Ybug]
	jb @@bug2
	call putPshotH
	mov [ShotExist], 0
	dec [bugLives]
	cmp [bugLives], 0
	ja @@aft
	mov [bug1Alive], 0
	call putBug
@@aft:
	jmp @@ret
@@bug2:
	cmp [bug2Alive], 1
	jnz @@virus1
	cmp cx, [Xbug2B]
	jnz @@virus1
	cmp dx, [Ybug2B]
	ja @@virus1
	cmp dx, [Ybug2]
	jb @@virus1
	call putPshotH
	mov [ShotExist], 0
	dec [bugLives2]
	cmp [bugLives2], 0
	ja @@aft2
	mov [bug2Alive], 0
	call putbug2
@@aft2:
	jmp @@ret
@@virus1:
	cmp [virus1Alive], 1
	jnz @@virus2
	cmp cx, [XvirusB]
	jnz @@virus2
	cmp dx, [YvirusB]
	ja @@virus2
	cmp dx, [Yvirus]
	jb @@virus2
	call putPshotH
	dec [virusLives]
	mov [ShotExist], 0
	cmp [virusLives], 0
	ja @@aft3
	mov [virus1Alive], 0
	call putvirus
@@aft3:
	jmp @@ret
@@virus2:
	cmp [virus2Alive], 1
	jnz @@chapt31
	cmp cx, [Xvirus2B]
	jnz @@chapt31
	cmp dx, [Yvirus2B]
	ja @@chapt31
	cmp dx, [Yvirus2]
	jb @@chapt31
	call putPshotH
	dec [virusLives2]
	mov [ShotExist], 0
	cmp [virusLives2], 0
	ja @@aft4
	mov [virus2Alive], 0
	call putvirus2
@@aft4:
	jmp @@ret
@@chapt31:
	cmp [chapt31Alive], 1
	jnz @@chapt32
	cmp cx, [Xchapt3B]
	jnz @@chapt32
	cmp dx, [Ychapt3B]
	ja @@chapt32
	cmp dx, [Ychapt3]
	jb @@chapt32
	call putPshotH
	dec [chapt3Lives]
	mov [ShotExist], 0
	cmp [chapt3Lives], 0
	ja @@aft5
	mov [chapt31Alive], 0
	call putChapt3
@@aft5:
	jmp @@ret
@@chapt32:
	cmp [chapt32Alive], 1
	jnz @@boss1
	cmp cx, [Xchapt32B]
	jnz @@boss1
	cmp dx, [Ychapt32B]
	ja @@boss1
	cmp dx, [Ychapt32]
	jb @@boss1
	call putPshotH
	dec [chapt3Lives2]
	mov [ShotExist], 0
	cmp [chapt3Lives2], 0
	ja @@aft6
	mov [chapt32Alive], 0
	call putChapt32
@@aft6:
	jmp @@ret
@@boss1:
	cmp [boss1Alive], 1
	jnz @@boss2
	cmp cx, [XbossB]
	jnz @@boss2
	cmp dx, [YbossB]
	ja @@boss2
	cmp dx, [Yboss]
	jb @@boss2
	call putPshotH
	dec [bossLives]
	mov [ShotExist], 0
	cmp [bossLives], 0
	ja @@aft7
	mov [boss1Alive], 0
	call putBOSS
@@aft7:
	jmp @@ret
@@boss2:
	cmp [boss2Alive], 1
	jnz @@c1
	cmp cx, [Xboss2B]
	jnz @@c1
	cmp dx, [Yboss2B]
	ja @@c1
	cmp dx, [Yboss2]
	jb @@c1
	call putPshotH
	dec [bossLives2]
	mov [ShotExist], 0
	cmp [bossLives2], 0
	ja @@aft8
	mov [boss2Alive], 0
	call putBoss2
@@aft8:
	jmp @@ret
@@c1:
	call putPshotH ; delete at curret locatein
	dec [XPshotH]
	call putPshotH ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MovePshotHLeft

;*************************************
;proc info:
;input: none
;output: moves the PshotH one pixel right
;register usge: none
;functionality: moves the PshotH up using xor movement
;the proc expects: XPshotH and YPshotH to contain the x and y
;*************************************
proc  MovePshotHRight
	push cx
	push dx
	mov cx, [XPshotH]
	add cx, PSHOTH_WIDTH
	mov dx, [YPshotH]
	cmp [XPshotH], 306
	jnz @@bug1
	call putPshotH
	mov [ShotExist], 0
	jmp far @@ret
@@bug1:
	cmp [bug1Alive], 1
	jnz @@bug2
	cmp cx, [Xbug]
	jnz @@bug2
	cmp dx, [YbugB]
	ja @@bug2
	cmp dx, [Ybug]
	jb @@bug2
	call putPshotH
	mov [ShotExist], 0
	dec [bugLives]
	cmp [bugLives], 0
	ja @@aft
	mov [bug1Alive], 0
	call putBug
@@aft:
	jmp @@ret
@@bug2:
	cmp [bug2Alive], 1
	jnz @@virus1
	cmp cx, [Xbug2]
	jnz @@virus1
	cmp dx, [Ybug2B]
	ja @@virus1
	cmp dx, [Ybug2]
	jb @@virus1
	call putPshotH
	mov [ShotExist], 0
	dec [bugLives2]
	cmp [bugLives2], 0
	ja @@aft2
	mov [bug2Alive], 0
	call putbug2
@@aft2:
	jmp @@ret
@@virus1:
	cmp [virus1Alive], 1
	jnz @@virus2
	cmp cx, [Xvirus]
	jnz @@virus2
	cmp dx, [YvirusB]
	ja @@virus2
	cmp dx, [Yvirus]
	jb @@virus2
	call putPshotH
	dec [virusLives]
	mov [ShotExist], 0
	cmp [virusLives], 0
	ja @@aft3
	mov [virus1Alive], 0
	call putvirus
@@aft3:
	jmp @@ret
@@virus2:
	cmp [virus2Alive], 1
	jnz @@chapt31
	cmp cx, [Xvirus2]
	jnz @@chapt31
	cmp dx, [Yvirus2B]
	ja @@chapt31
	cmp dx, [Yvirus2]
	jb @@chapt31
	call putPshotH
	dec [virusLives2]
	mov [ShotExist], 0
	cmp [virusLives2], 0
	ja @@aft4
	mov [virus2Alive], 0
	call putvirus2
@@aft4:
	jmp @@ret
@@chapt31:
	cmp [chapt31Alive], 1
	jnz @@chapt32
	cmp cx, [Xchapt3]
	jnz @@chapt32
	cmp dx, [Ychapt3B]
	ja @@chapt32
	cmp dx, [Ychapt3]
	jb @@chapt32
	call putPshotH
	dec [chapt3Lives]
	mov [ShotExist], 0
	cmp [chapt3Lives], 0
	ja @@aft5
	mov [chapt31Alive], 0
	call putChapt3
@@aft5:
	jmp @@ret
@@chapt32:
	cmp [chapt32Alive], 1
	jnz @@boss1
	cmp cx, [Xchapt32]
	jnz @@boss1
	cmp dx, [Ychapt32B]
	ja @@boss1
	cmp dx, [Ychapt32]
	jb @@boss1
	call putPshotH
	dec [chapt3Lives2]
	mov [ShotExist], 0
	cmp [chapt3Lives2], 0
	ja @@aft6
	mov [chapt32Alive], 0
	call putChapt32
@@aft6:
	jmp @@ret
@@boss1:
	cmp [boss1Alive], 1
	jnz @@boss2
	cmp cx, [Xboss]
	jnz @@boss2
	cmp dx, [YbossB]
	ja @@boss2
	cmp dx, [Yboss]
	jb @@boss2
	call putPshotH
	dec [bossLives]
	mov [ShotExist], 0
	cmp [bossLives], 0
	ja @@aft7
	mov [boss1Alive], 0
	call putBOSS
@@aft7:
	jmp @@ret
@@boss2:
	cmp [boss2Alive], 1
	jnz @@c1
	cmp cx, [Xboss2]
	jnz @@c1
	cmp dx, [Yboss2B]
	ja @@c1
	cmp dx, [Yboss2]
	jb @@c1
	call putPshotH
	dec [bossLives2]
	mov [ShotExist], 0
	cmp [bossLives2], 0
	ja @@aft8
	mov [boss2Alive], 0
	call putBoss2
@@aft8:
	jmp @@ret
@@c1:
	call putPshotH ; delete at curret locatein
	inc [XPshotH]
	call putPshotH ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MovePshotHRight

;==============================================================================================================================



; Player shot vertical
;*************************************
;proc info:
;input: XPshotV, YPshotV, PSHOTV_HIGHT, PSHOTV_WIDTH
;output: puts or deletes PshotV of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the PshotV at the location set by the x and y varibels
;the proc expects: the varibels XPshotV and YPshotV to contain the x and y
;				   the const PSHOTV_HIGHT, PSHOTV_WIDTH to contain the length and width
;*************************************
proc putPshotV
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YPshotV]
@@nextR:
	
		mov di,0
		mov cx,[XPshotV]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte PshotV + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,PSHOTV_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, PSHOTV_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putPshotV

;*************************************
;proc info:
;input: cx, dx
;output: XPshotV, YPshotV
;register usge: cx, dx
;functionality: sets the PshotV start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartPshotVUp
	push cx
	push dx
	mov cx, [Xplayer]
	mov dx, [Yplayer]
	add cx, PLAYER_WIDTH_MIDDLE
    dec cx
	sub dx, PSHOTH_HIGHT
	sub dx, 8
	mov [XPshotV], cx
	mov [YPshotV], dx
	
	pop dx
	pop cx
	ret
endp SetStartPshotVUp

;*************************************
;proc info:
;input: cx, dx
;output: XPshotH, YPshotv
;register usge: cx, dx
;functionality: sets the PshotV start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartPshotVDown
	push cx
	push dx
	mov cx, [XplayerB]
	mov dx, [YplayerB]
	sub cx, PLAYER_WIDTH_MIDDLE
	sub cx, 2
	sub dx, 2
	mov [XPshotV], cx
	mov [YPshotV], dx
	
	pop dx
	pop cx
	ret
endp SetStartPshotVDown


;*************************************
;proc info:
;input: none
;output: moves the PshotV one pixel up
;register usge: none
;functionality: moves the PshotV up using xor movement
;the proc expects: XPshotV and YPshotV to contain the x and y
;*************************************
proc  MovePshotVUp
	push cx
	push dx
	mov cx, [XPshotV]
	mov dx, [YPshotV]
	cmp [YPshotV], 0
	jnz @@bug1
	call putPshotV
	mov [ShotExist], 0
	jmp far @@ret
@@bug1:
	cmp [bug1Alive], 1
	jnz @@bug2
	cmp dx, [YbugB]
	jnz @@bug2
	cmp cx, [XbugB]
	ja @@bug2
	cmp cx, [Xbug]
	jb @@bug2
	call putPshotV
	mov [ShotExist], 0
	dec [bugLives]
	cmp [bugLives], 0
	ja @@aft
	mov [bug1Alive], 0
	call putBug
@@aft:
	jmp @@ret
@@bug2:
	cmp [bug2Alive], 1
	jnz @@virus1
	cmp dx, [Ybug2B]
	jnz @@virus1
	cmp cx, [Xbug2B]
	ja @@virus1
	cmp cx, [Xbug2]
	jb @@virus1
	call putPshotV
	mov [ShotExist], 0
	dec [bugLives2]
	cmp [bugLives2], 0
	ja @@aft2
	mov [bug2Alive], 0
	call putbug2
@@aft2:
	jmp @@ret
@@virus1:
	cmp [virus1Alive], 1
	jnz @@virus2
	cmp dx, [YvirusB]
	jnz @@virus2
	cmp cx, [XvirusB]
	ja @@virus2
	cmp cx, [Xvirus]
	jb @@virus2
	call putPshotV
	dec [virusLives]
	mov [ShotExist], 0
	cmp [virusLives], 0
	ja @@aft3
	mov [virus1Alive], 0
	call putvirus
@@aft3:
	jmp @@ret
@@virus2:
	cmp [virus2Alive], 1
	jnz @@chapt31
	cmp dx, [Yvirus2B]
	jnz @@chapt31
	cmp cx, [Xvirus2B]
	ja @@chapt31
	cmp cx, [Xvirus2]
	jb @@chapt31
	call putPshotV
	dec [virusLives2]
	mov [ShotExist], 0
	cmp [virusLives2], 0
	ja @@aft4
	mov [virus2Alive], 0
	call putvirus2
@@aft4:
	jmp @@ret
@@chapt31:
	cmp [chapt31Alive], 1
	jnz @@chapt32
	cmp dx, [Ychapt3B]
	jnz @@chapt32
	cmp cx, [Xchapt3B]
	ja @@chapt32
	cmp cx, [Xchapt3]
	jb @@chapt32
	call putPshotV
	dec [chapt3Lives]
	mov [ShotExist], 0
	cmp [chapt3Lives], 0
	ja @@aft5
	mov [chapt31Alive], 0
	call putChapt3
@@aft5:
	jmp @@ret
@@chapt32:
	cmp [chapt32Alive], 1
	jnz @@boss1
	cmp dx, [Ychapt32B]
	jnz @@boss1
	cmp cx, [Xchapt32B]
	ja @@boss1
	cmp cx, [Xchapt32]
	jb @@boss1
	call putPshotV
	dec [chapt3Lives2]
	mov [ShotExist], 0
	cmp [chapt3Lives2], 0
	ja @@aft6
	mov [chapt32Alive], 0
	call putChapt32
@@aft6:
	jmp @@ret
@@boss1:
	cmp [boss1Alive], 1
	jnz @@boss2
	cmp dx, [YbossB]
	jnz @@boss2
	cmp cx, [XbossB]
	ja @@boss2
	cmp cx, [Xboss]
	jb @@boss2
	call putPshotV
	dec [bossLives]
	mov [ShotExist], 0
	cmp [bossLives], 0
	ja @@aft7
	mov [boss1Alive], 0
	call putBoss
@@aft7:
	jmp @@ret
@@boss2:
	cmp [boss2Alive], 1
	jnz @@c1
	cmp dx, [Yboss2B]
	jnz @@c1
	cmp cx, [Xboss2B]
	ja @@c1
	cmp cx, [Xboss2]
	jb @@c1
	call putPshotV
	dec [bossLives2]
	mov [ShotExist], 0
	cmp [bossLives2], 0
	ja @@aft8
	mov [boss2Alive], 0
	call putBoss2
@@aft8:
	jmp @@ret
@@c1:
	call putPshotV ; delete at curret locatein
	dec [YPshotV]
	call putPshotV ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MovePshotVUp

;*************************************
;proc info:
;input: none
;output: moves the PshotV one pixel down
;register usge: none
;functionality: moves the PshotV up using xor movement
;the proc expects: XPshotV and YPshotV to contain the x and y
;*************************************
proc  MovePshotVDown
	push cx
	push dx
	mov cx, [XPshotV]
	mov dx, [YPshotV]
	add dx, PSHOTV_HIGHT
	cmp [YPshotV], 186
	jna @@bug1
	call putPshotV
	mov [ShotExist], 0
	jmp far @@ret
@@bug1:
	cmp [bug1Alive], 1
	jnz @@bug2
	cmp dx, [Ybug]
	jnz @@bug2
	cmp cx, [XbugB]
	ja @@bug2
	cmp cx, [Xbug]
	jb @@bug2
	call putPshotV
	mov [ShotExist], 0
	dec [bugLives]
	cmp [bugLives], 0
	ja @@aft
	mov [bug1Alive], 0
	call putBug
@@aft:
	jmp @@ret
@@bug2:
	cmp [bug2Alive], 1
	jnz @@virus1
	cmp dx, [Ybug2]
	jnz @@virus1
	cmp cx, [Xbug2B]
	ja @@virus1
	cmp cx, [Xbug2]
	jb @@virus1
	call putPshotV
	mov [ShotExist], 0
	dec [bugLives2]
	cmp [bugLives2], 0
	ja @@aft2
	mov [bug2Alive], 0
	call putbug2
@@aft2:
	jmp @@ret
@@virus1:
	cmp [virus1Alive], 1
	jnz @@virus2
	cmp dx, [Yvirus]
	jnz @@virus2
	cmp cx, [XvirusB]
	ja @@virus2
	cmp cx, [Xvirus]
	jb @@virus2
	call putPshotV
	dec [virusLives]
	mov [ShotExist], 0
	cmp [virusLives], 0
	ja @@aft3
	mov [virus1Alive], 0
	call putvirus
@@aft3:
	jmp @@ret
@@virus2:
	cmp [virus2Alive], 1
	jnz @@chapt31
	cmp dx, [Yvirus2]
	jnz @@chapt31
	cmp cx, [Xvirus2B]
	ja @@chapt31
	cmp cx, [Xvirus2]
	jb @@chapt31
	call putPshotV
	dec [virusLives2]
	mov [ShotExist], 0
	cmp [virusLives2], 0
	ja @@aft4
	mov [virus2Alive], 0
	call putvirus2
@@aft4:
	jmp @@ret
@@chapt31:
	cmp [chapt31Alive], 1
	jnz @@chapt32
	cmp dx, [Ychapt3]
	jnz @@chapt32
	cmp cx, [Xchapt3B]
	ja @@chapt32
	cmp cx, [Xchapt3]
	jb @@chapt32
	call putPshotV
	dec [chapt3Lives]
	mov [ShotExist], 0
	cmp [chapt3Lives], 0
	ja @@aft5
	mov [chapt31Alive], 0
	call putChapt3
@@aft5:
	jmp @@ret
@@chapt32:
	cmp [chapt32Alive], 1
	jnz @@boss1
	cmp dx, [Ychapt32]
	jnz @@boss1
	cmp cx, [Xchapt32B]
	ja @@boss1
	cmp cx, [Xchapt32]
	jb @@boss1
	call putPshotV
	dec [chapt3Lives2]
	mov [ShotExist], 0
	cmp [chapt3Lives2], 0
	ja @@aft6
	mov [chapt32Alive], 0
	call putChapt32
@@aft6:
	jmp @@ret
@@boss1:
	cmp [boss1Alive], 1
	jnz @@c1
	cmp dx, [Yboss]
	jnz @@c1
	cmp cx, [XbossB]
	ja @@c1
	cmp cx, [Xboss]
	jb @@c1
	call putPshotV
	dec [bossLives]
	mov [ShotExist], 0
	cmp [bossLives], 0
	ja @@aft7
	mov [boss1Alive], 0
	call putBoss
@@aft7:
	jmp @@ret
@@boss2:
	cmp [boss2Alive], 1
	jnz @@c1
	cmp dx, [Yboss2]
	jnz @@c1
	cmp cx, [Xboss2B]
	ja @@c1
	cmp cx, [Xboss2]
	jb @@c1
	call putPshotV
	dec [bossLives2]
	mov [ShotExist], 0
	cmp [bossLives2], 0
	ja @@aft8
	mov [boss2Alive], 0
	call putBoss2
@@aft8:
	jmp @@ret
@@c1:
	call putPshotV ; delete at curret locatein
	inc [YPshotV]
	call putPshotV ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MovePshotVDown

;bug shot
; Bug shot right
;*************************************
;proc info:
;input: XBshotR, YBshotR, BSHOTH_HIGHT, BSHOT_WIDTH
;output: puts or deletes BshotR of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the BshotR at the location set by the x and y varibels
;the proc expects: the varibels XBshotR and YBshotR to contain the x and y
;				   the const BSHOTH_HIGHT, BSHOT_WIDTH to contain the length and width
;*************************************
proc putBshotR
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YBshotR]
@@nextR:
	
		mov di,0
		mov cx,[XBshotR]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte Bshot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,BSHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, BSHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putBshotR

;*************************************
;proc info:
;input: cx, dx
;output: XBshotR, YBshotR
;register usge: cx, dx
;functionality: sets the BshotR start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartBshotR
	push cx
	push dx
	mov cx, [Xbug]
	mov dx, [Ybug]
	add dx, BUG_SIZE_MIDDLE
	add cx, BUG_SIZE
	mov [XBshotR], cx
	mov [YBshotR], dx
	pop dx
	pop cx
	ret
endp SetStartBshotR

;*************************************
;proc info:
;input: none
;output: moves the BshotR one pixel right
;register usge: none
;functionality: moves the BshotR up using xor movement
;the proc expects: XBshotR and YBshotR to contain the x and y
;*************************************
proc  MoveBshotRRight
	push cx
	push dx
	mov cx, [XBshotR]
	mov dx, [YBshotR]
	cmp [XBshotR], 306
	jnz @@player
	mov [BshotRExist], 0
	call putBshotR
@@player:
	cmp [BshotRExist], 1
	jnz @@ret
	cmp cx, [Xplayer]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [Yplayer]
	jb @@c1
	call putBshotR
	mov [BShotRExist], 0
	dec [Lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putBshotR ; delete at curret locatein
	inc [XBshotR]
	call putBshotR ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveBshotRRight
;==============================================================================================================================



; Bug shot left
;*************************************
;proc info:
;input: XBshotL, YBshotL, BSHOTH_HIGHT, BSHOT_WIDTH
;output: puts or deletes BshotL of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the BshotL at the location set by the x and y varibels
;the proc expects: the varibels XBshotL and YBshotL to contain the x and y
;				   the const BSHOTH_HIGHT, BSHOT_WIDTH to contain the length and width
;*************************************
proc putBshotL
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YBshotL]
@@nextR:
	
		mov di,0
		mov cx,[XBshotL]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte Bshot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,BSHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, BSHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putBshotL

;*************************************
;proc info:
;input: cx, dx
;output: XBshotL, YBshotL
;register usge: cx, dx
;functionality: sets the BshotL start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartBshotL
	push cx
	push dx
	mov cx, [Xbug]
	mov dx, [Ybug]
	add dx, BUG_SIZE_MIDDLE
	sub cx, BSHOT_WIDTH
	mov [XBshotL], cx
	mov [YBshotL], dx
	pop dx
	pop cx
	ret
endp SetStartBshotL

;*************************************
;proc info:
;input: none
;output: moves the BshotL one pixel left
;register usge: none
;functionality: moves the BshotL up using xor movement
;the proc expects: XBshotL and YBshotL to contain the x and y
;*************************************
proc  MoveBshotLLeft
	push cx
	push dx
	mov cx, [XBshotL]
	mov dx, [YBshotL]
	cmp [XBshotL], 0
	ja @@Player
	mov [BshotLExist], 0
	call putBshotL
	jmp @@ret
@@Player:
	cmp cx, [XplayerB]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [YPlayer]
	jb @@c1
	call putBshotL
	mov [BshotLExist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putBshotL ; delete at curret locatein
	dec [XBshotL]
	call putBshotL ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveBshotLLeft
;==============================================================================================================================


; Bug shot right 2
;*************************************
;proc info:
;input: XBshotR2, YBshotR2, BSHOTH_HIGHT, BSHOT_WIDTH
;output: puts or deletes BshotR2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the BshotR2 at the location set by the x and y varibels
;the proc expects: the varibels XBshotR2 and YBshotR2 to contain the x and y
;				   the const BSHOTH_HIGHT, BSHOT_WIDTH to contain the length and width
;*************************************
proc putBshotR2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YBshotR2]
@@nextR:
	
		mov di,0
		mov cx,[XBshotR2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte Bshot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,BSHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, BSHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putBshotR2

;*************************************
;proc info:
;input: cx, dx
;output: XBshotR2, YBshotR2
;register usge: cx, dx
;functionality: sets the BshotR2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartBshotR2
	push cx
	push dx
	mov cx, [Xbug2]
	mov dx, [Ybug2]
	add dx, BUG_SIZE_MIDDLE
	add cx, BUG_SIZE
	mov [XBshotR2], cx
	mov [YBshotR2], dx
	pop dx
	pop cx
	ret
endp SetStartBshotR2

;*************************************
;proc info:
;input: none
;output: moves the BshotR2 one pixel right
;register usge: none
;functionality: moves the BshotR2 up using xor movement
;the proc expects: XBshotR2 and YBshotR2 to contain the x and y
;*************************************
proc  MoveBshotR2Right
	push cx
	push dx
	mov cx, [XBshotR2]
	mov dx, [YBshotR2]
	cmp [XBshotR2], 306
	jnz @@player
	mov [BshotR2Exist], 0
	call putBshotR2
@@player:
	cmp [BshotR2Exist], 1
	jnz @@ret
	cmp cx, [Xplayer]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [Yplayer]
	jb @@c1
	call putBshotR2
	mov [BShotR2Exist], 0
	dec [Lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putBshotR2 ; delete at curret locatein
	inc [XBshotR2]
	call putBshotR2 ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveBshotR2Right
;==============================================================================================================================




; Bug shot left 2
;*************************************
;proc info:
;input: XBshotL2, YBshotL2, BSHOTH_HIGHT, BSHOT_WIDTH
;output: puts or deletes BshotL2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the BshotL2 at the location set by the x and y varibels
;the proc expects: the varibels XBshotL2 and YBshotL2 to contain the x and y
;				   the const BSHOTH_HIGHT, BSHOT_WIDTH to contain the length and width
;*************************************
proc putBshotL2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YBshotL2]
@@nextR:
	
		mov di,0
		mov cx,[XBshotL2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte Bshot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,BSHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, BSHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putBshotL2

;*************************************
;proc info:
;input: cx, dx
;output: XBshotL2, YBshotL2
;register usge: cx, dx
;functionality: sets the BshotL2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartBshotL2
	push cx
	push dx
	mov cx, [Xbug2]
	mov dx, [Ybug2]
	add dx, BUG_SIZE_MIDDLE
	sub cx, BSHOT_WIDTH
	mov [XBshotL2], cx
	mov [YBshotL2], dx
	pop dx
	pop cx
	ret
endp SetStartBshotL2

;*************************************
;proc info:
;input: none
;output: moves the BshotL2 one pixel left
;register usge: none
;functionality: moves the BshotL2 up using xor movement
;the proc expects: XBshotL2 and YBshotL2 to contain the x and y
;*************************************
proc  MoveBshotL2Left
	push cx
	push dx
	mov cx, [XBshotL2]
	mov dx, [YBshotL2]
	cmp [XBshotL2], 0
	ja @@Player
	mov [BshotL2Exist], 0
	call putBshotL2
	jmp @@ret
@@Player:
	cmp cx, [XplayerB]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [YPlayer]
	jb @@c1
	call putBshotL2
	mov [BshotL2Exist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putBshotL2 ; delete at curret locatein
	dec [XBshotL2]
	call putBshotL2 ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveBshotL2Left
;==============================================================================================================================


;virus shot
; Virus shot up
;*************************************
;proc info:
;input: XVshotU, YVshotU, VSHOTV_HIGHT, VSHOTV_WIDTH
;output: puts or deletes VshotU of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the VshotU at the location set by the x and y varibels
;the proc expects: the varibels XVshotU and YVshotU to contain the x and y
;				   the const VSHOTV_HIGHT, VSHOTV_WIDTH to contain the length and width
;*************************************
proc putVshotU
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YVshotU]
@@nextR:
	
		mov di,0
		mov cx,[XVshotU]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte Vshot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,VSHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, VSHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putVshotU

;*************************************
;proc info:
;input: cx, dx
;output: XVshotU, YVshotU
;register usge: cx, dx
;functionality: sets the VshotU start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartVshotU
	push cx
	push dx
	mov cx, [Xvirus]
	mov dx, [Yvirus]
	sub dx, VSHOT_HIGHT
	add cx, VIRUS_WIDTH_MIDDLE
	mov [XVshotU], cx
	mov [YVshotU], dx
	pop dx
	pop cx
	ret
endp SetStartVshotU


;*************************************
;proc info:
;input: none
;output: moves the VshotU one pixel up
;register usge: none
;functionality: moves the VshotU up using xor movement
;the proc expects: XVshotU and YVshotU to contain the x and y
;*************************************
proc  MoveVshotUUp
	push cx
	push dx
	mov cx, [XVshotU]
	mov dx, [YVshotU]
	cmp [YVshotU], 0
	ja @@Player
	mov [VshotUExist], 0
	call putVshotU
	jmp @@ret
@@Player:
	cmp dx, [YplayerB]
	jnz @@c1
	cmp cx, [XplayerB]
	ja @@c1
	cmp cx, [XPlayer]
	jb @@c1
	call putVshotU
	mov [VshotUExist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putVshotU ; delete at curret locatein
	dec [YVshotU]
	call putVshotU ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveVshotUUp
;==============================================================================================================================


; Virus shot down
;*************************************
;proc info:
;input: XVshotD, YVshotD, VSHOTV_HIGHT, VSHOTV_WIDTH
;output: puts or deletes VshotD of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the VshotD at the location set by the x and y varibels
;the proc expects: the varibels XVshotD and YVshotD to contain the x and y
;				   the const VSHOTV_HIGHT, VSHOTV_WIDTH to contain the length and width
;*************************************
proc putVshotD
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YVshotD]
@@nextR:
	
		mov di,0
		mov cx,[XVshotD]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte Vshot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,VSHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, VSHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putVshotD

;*************************************
;proc info:
;input: cx, dx
;output: XVshotD, YVshotD, XVshotDB, YVshotDB
;register usge: cx, dx
;functionality: sets the VshotD start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartVshotD
	push cx
	push dx
	mov cx, [Xvirus]
	mov dx, [Yvirus]
	add dx, VSHOT_HIGHT
	add cx, VIRUS_WIDTH_MIDDLE
	mov [XVshotD], cx
	mov [YVshotD], dx
	pop dx
	pop cx
	ret
endp SetStartVshotD

;*************************************
;proc info:
;input: none
;output: moves the VshotD one pixel down
;register usge: none
;functionality: moves the VshotD up using xor movement
;the proc expects: XVshotD and YVshotD to contain the x and y
;*************************************
proc MoveVshotDDown
	push cx
	push dx
	mov cx, [XVshotD]
	mov dx, [YVshotD]
	add dx, VSHOT_HIGHT
	cmp [YVshotD], 186
	jnz @@player
	mov [VshotDExist], 0
	call putVshotD
	jmp @@ret
@@player:
	cmp dx, [Yplayer]
	jnz @@c1
	cmp cx, [XplayerB]
	ja @@c1
	cmp cx, [Xplayer]
	jb @@c1
	call putVshotD
	mov [VShotDExist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putVshotD ; delete at curret locatein
	inc [YVshotD]
	call putVshotD ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveVshotDDown
;==============================================================================================================================




; Virus shot up 2
;*************************************
;proc info:
;input: XVshotU2, YVshotU2, VSHOTV_HIGHT, VSHOTV_WIDTH
;output: puts or deletes VshotU2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the VshotU2 at the location set by the x and y varibels
;the proc expects: the varibels XVshotU2 and YVshotU2 to contain the x and y
;				   the const VSHOTV_HIGHT, VSHOTV_WIDTH to contain the length and width
;*************************************
proc putVshotU2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YVshotU2]
@@nextR:
	
		mov di,0
		mov cx,[XVshotU2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte Vshot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,VSHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, VSHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putVshotU2

;*************************************
;proc info:
;input: cx, dx
;output: XVshotU2, YVshotU2
;register usge: cx, dx
;functionality: sets the VshotU2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartVshotU2
	push cx
	push dx
	mov cx, [Xvirus2]
	mov dx, [Yvirus2]
	sub dx, VSHOT_HIGHT
	add cx, VIRUS_WIDTH_MIDDLE
	mov [XVshotU2], cx
	mov [YVshotU2], dx
	pop dx
	pop cx
	ret
endp SetStartVshotU2


;*************************************
;proc info:
;input: none
;output: moves the VshotU2 one pixel up
;register usge: none
;functionality: moves the VshotU2 up using xor movement
;the proc expects: XVshotU2 and YVshotU2 to contain the x and y
;*************************************
proc  MoveVshotU2Up
	push cx
	push dx
	mov cx, [XVshotU2]
	mov dx, [YVshotU2]
	cmp [YVshotU2], 0
	ja @@Player
	mov [VshotU2Exist], 0
	call putVshotU2
	jmp @@ret
@@Player:
	cmp dx, [YplayerB]
	jnz @@c1
	cmp cx, [XplayerB]
	ja @@c1
	cmp cx, [XPlayer]
	jb @@c1
	call putVshotU2
	mov [VshotU2Exist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putVshotU2 ; delete at curret locatein
	dec [YVshotU2]
	call putVshotU2 ; put it  at new location
@@ret:	
	pop dx
	pop cx
	ret
endp MoveVshotU2Up
;==============================================================================================================================



; Virus shot down 2
;*************************************
;proc info:
;input: XVshotD2, YVshotD2, VSHOTV_HIGHT, VSHOTV_WIDTH
;output: puts or deletes VshotD2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the VshotD2 at the location set by the x and y varibels
;the proc expects: the varibels XVshotD2 and YVshotD2 to contain the x and y
;				   the const VSHOTV_HIGHT, VSHOTV_WIDTH to contain the length and width
;*************************************
proc putVshotD2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YVshotD2]
@@nextR:
	
		mov di,0
		mov cx,[XVshotD2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte Vshot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,VSHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, VSHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putVshotD2

;*************************************
;proc info:
;input: cx, dx
;output: XVshotD2, YVshotD2, XVshotD2B, YVshotD2B
;register usge: cx, dx
;functionality: sets the VshotD2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartVshotD2
	push cx
	push dx
	mov cx, [Xvirus2]
	mov dx, [Yvirus2]
	add dx, VSHOT_HIGHT
	add cx, VIRUS_WIDTH_MIDDLE
	mov [XVshotD2], cx
	mov [YVshotD2], dx
	pop dx
	pop cx
	ret
endp SetStartVshotD2

;*************************************
;proc info:
;input: none
;output: moves the VshotD2 one pixel down
;register usge: none
;functionality: moves the VshotD2 up using xor movement
;the proc expects: XVshotD2 and YVshotD2 to contain the x and y
;*************************************
proc  MoveVshotD2Down
	push cx
	push dx
	mov cx, [XVshotD2]
	mov dx, [YVshotD2]
	add dx, VSHOT_HIGHT
	cmp [YVshotD2], 186
	jnz @@player
	mov [VshotD2Exist], 0
	call putVshotD2
	jmp @@ret
@@player:
	cmp dx, [Yplayer]
	jnz @@c1
	cmp cx, [XplayerB]
	ja @@c1
	cmp cx, [Xplayer]
	jb @@c1
	call putVshotD2
	mov [VShotD2Exist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putVshotD2 ; delete at curret locatein
	inc [YVshotD2]
	call putVshotD2 ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveVshotD2Down
;==============================================================================================================================


;chapt3 shot
; chapt3 shot horizontal right 
;*************************************
;proc info:
;input: XCshotHR, YCshotHR, CSHOTH_HIGHT, CSHOTH_WIDTH
;output: puts or deletes CshotHR of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the CshotHR at the location set by the x and y varibels
;the proc expects: the varibels XCshotHR and YCshotHR to contain the x and y
;				   the const CSHOTH_HIGHT, CSHOTH_WIDTH to contain the length and width
;*************************************
proc putCshotHR
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YCshotHR]
@@nextR:
	
		mov di,0
		mov cx,[XCshotHR]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte CshotH + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,CSHOTH_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, CSHOTH_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putCshotHR

;*************************************
;proc info:
;input: cx, dx
;output: XCshotHR, YCshotHR
;register usge: cx, dx
;functionality: sets the CshotHR start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartCshotHR
	push cx
	push dx
	mov cx, [Xchapt3]
	mov dx, [Ychapt3]
	add dx, CHAPT3_SIZE_MIDDLE
	add cx, CHAPT3_SIZE
	mov [XCshotHR], cx
	mov [YCshotHR], dx
	pop dx
	pop cx
	ret
endp SetStartCshotHR


;*************************************
;proc info:
;input: none
;output: moves the CshotHR one pixel right
;register usge: none
;functionality: moves the CshotHR up using xor movement
;the proc expects: XCshotHR and YCshotHR to contain the x and y
;*************************************
proc  MoveCshotHRRight
	push cx
	push dx
	mov cx, [XCshotHR]
	mov dx, [YCshotHR]
	add cx, CSHOTH_WIDTH
	cmp [XCshotHR], 306
	jb @@Player
	mov [CshotHRExist], 0
	call putCshotHR
	jmp @@ret
@@Player:
	cmp cx, [Xplayer]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [YPlayer]
	jb @@c1
	call putCshotHR
	mov [CshotHRExist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putCshotHR ; delete at curret locatein
	inc [XCshotHR]
	call putCshotHR ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveCshotHRRight

;==============================================================================================================================



; chapt3 shot horizontal left
;*************************************
;proc info:
;input: XCshotHL, YCshotHL, CSHOTH_HIGHT, CSHOTH_WIDTH
;output: puts or deletes CshotHL of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the CshotHL at the location set by the x and y varibels
;the proc expects: the varibels XCshotHL and YCshotHL to contain the x and y
;				   the const CSHOTH_HIGHT, CSHOTH_WIDTH to contain the length and width
;*************************************
proc putCshotHL
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YCshotHL]
@@nextR:
	
		mov di,0
		mov cx,[XCshotHL]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte CshotH + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,CSHOTH_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, CSHOTH_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putCshotHL

;*************************************
;proc info:
;input: cx, dx
;output: XCshotHL, YCshotHL
;register usge: cx, dx
;functionality: sets the CshotHL start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartCshotHL
	push cx
	push dx
	mov cx, [Xchapt3]
	mov dx, [Ychapt3]
	add dx, CHAPT3_SIZE_MIDDLE
	sub cx, CSHOTH_WIDTH
	mov [XCshotHL], cx
	mov [YCshotHL], dx
	pop dx
	pop cx
	ret
endp SetStartCshotHL


;*************************************
;proc info:
;input: none
;output: moves the CshotHL one pixel left
;register usge: none
;functionality: moves the CshotHL up using xor movement
;the proc expects: XCshotHL and YCshotHL to contain the x and y
;*************************************
proc  MoveCshotHLLeft
	push cx
	push dx
	mov cx, [XCshotHL]
	mov dx, [YCshotHL]
	cmp [XCshotHL], 0
	ja @@Player
	mov [CshotHLExist], 0
	call putCshotHL
	jmp @@ret
@@Player:
	cmp cx, [XplayerB]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [YPlayer]
	jb @@c1
	call putCshotHL
	mov [CshotHLExist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putCshotHL ; delete at curret locatein
	dec [XCshotHL]
	call putCshotHL ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveCshotHLLeft
;==============================================================================================================================







; chapt3 shot vertical up
;*************************************
;proc info:
;input: XCshotVU, YCshotVU, CSHOTV_HIGHT, CSHOTV_WIDTH
;output: puts or deletes CshotVU of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the CshotVU at the location set by the x and y varibels
;the proc expects: the varibels XCshotVU and YCshotVU to contain the x and y
;				   the const CSHOTV_HIGHT, CSHOTV_WIDTH to contain the length and width
;*************************************
proc putCshotVU
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YCshotVU]
@@nextR:
	
		mov di,0
		mov cx,[XCshotVU]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte CshotV + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,CSHOTV_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, CSHOTV_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putCshotVU

;*************************************
;proc info:
;input: cx, dx
;output: XCshotVU, YCshotVU
;register usge: cx, dx
;functionality: sets the CshotVU start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartCshotVU
	push cx
	push dx
	mov cx, [Xchapt3]
	mov dx, [Ychapt3]
	sub dx, CSHOTV_HIGHT
	add cx, CHAPT3_SIZE_MIDDLE
	mov [XCshotVU], cx
	mov [YCshotVU], dx
	pop dx
	pop cx
	ret
endp SetStartCshotVU

;*************************************
;proc info:
;input: none
;output: moves the CshotVU one pixel up
;register usge: none
;functionality: moves the CshotVU up using xor movement
;the proc expects: XCshotVU and YCshotVU to contain the x and y
;*************************************
proc  MoveCshotVUUp
	push cx
	push dx
	mov cx, [XCshotVU]
	mov dx, [YCshotVU]
	cmp [YCshotVU], 0
	ja @@Player
	mov [CshotVUExist], 0
	call putCshotVU
	jmp @@ret
@@Player:
	cmp dx, [YplayerB]
	jnz @@c1
	cmp cx, [XplayerB]
	ja @@c1
	cmp cx, [XPlayer]
	jb @@c1
	call putCshotVU
	mov [CshotVUExist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putCshotVU ; delete at curret locatein
	dec [YCshotVU]
	call putCshotVU ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveCshotVUUp
;==============================================================================================================================


; chapt3 shot vertical down
;*************************************
;proc info:
;input: XCshotVD, YCshotVD, CSHOTV_HIGHT, CSHOTV_WIDTH
;output: puts or deletes CshotVD of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the CshotVD at the location set by the x and y varibels
;the proc expects: the varibels XCshotVD and YCshotVD to contain the x and y
;				   the const CSHOTV_HIGHT, CSHOTV_WIDTH to contain the length and width
;*************************************
proc putCshotVD
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YCshotVD]
@@nextR:
	
		mov di,0
		mov cx,[XCshotVD]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte CshotV + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,CSHOTV_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, CSHOTV_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putCshotVD

;*************************************
;proc info:
;input: cx, dx
;output: XCshotVD, YCshotVD
;register usge: cx, dx
;functionality: sets the CshotVD start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartCshotVD
	push cx
	push dx
	mov cx, [Xchapt3]
	mov dx, [Ychapt3]
	add dx, CHAPT3_SIZE
	add cx, CHAPT3_SIZE_MIDDLE
	mov [XCshotVD], cx
	mov [YCshotVD], dx
	pop dx
	pop cx
	ret
endp SetStartCshotVD


;*************************************
;proc info:
;input: none
;output: moves the CshotVD one pixel down
;register usge: none
;functionality: moves the CshotVD up using xor movement
;the proc expects: XCshotVD and YCshotVD to contain the x and y
;*************************************
proc  MoveCshotVDDown
	push cx
	push dx
	mov cx, [XCshotVD]
	mov dx, [YCshotVD]
	add dx, CSHOTV_HIGHT
	cmp [YCshotVD], 186
	jb @@Player
	mov [CshotVDExist], 0
	call putCshotVD
	jmp @@ret
@@Player:
	cmp dx, [Yplayer]
	jnz @@c1
	cmp cx, [XplayerB]
	ja @@c1
	cmp cx, [XPlayer]
	jb @@c1
	call putCshotVD
	mov [CshotVDExist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putCshotVD ; delete at curret locatein
	inc [YCshotVD]
	call putCshotVD ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveCshotVDDown
;==============================================================================================================================


;chapt32 shot
; chapt3 shot horizontal right 2
;*************************************
;proc info:
;input: XCshotHR2, YCshotHR2, CSHOTH_HIGHT, CSHOTH_WIDTH
;output: puts or deletes CshotHR2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the CshotHR2 at the location set by the x and y varibels
;the proc expects: the varibels XCshotHR2 and YCshotHR2 to contain the x and y
;				   the const CSHOTH_HIGHT, CSHOTH_WIDTH to contain the length and width
;*************************************
proc putCshotHR2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YCshotHR2]
@@nextR:
	
		mov di,0
		mov cx,[XCshotHR2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte CshotH + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,CSHOTH_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, CSHOTH_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putCshotHR2

;*************************************
;proc info:
;input: cx, dx
;output: XCshotHR2, YCshotHR2
;register usge: cx, dx
;functionality: sets the CshotHR2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartCshotHR2
	push cx
	push dx
	mov cx, [Xchapt32]
	mov dx, [Ychapt32]
	add dx, CHAPT3_SIZE_MIDDLE
	add cx, CHAPT3_SIZE
	mov [XCshotHR2], cx
	mov [YCshotHR2], dx
	pop dx
	pop cx
	ret
endp SetStartCshotHR2


;*************************************
;proc info:
;input: none
;output: moves the CshotHR2 one pixel right
;register usge: none
;functionality: moves the CshotHR2 up using xor movement
;the proc expects: XCshotHR2 and YCshotHR2 to contain the x and y
;*************************************
proc  MoveCshotHR2Right
	push cx
	push dx
	mov cx, [XCshotHR2]
	add cx, CSHOTH_WIDTH
	mov dx, [YCshotHR2]
	cmp [XCshotHR2], 306
	jb @@Player
	mov [CshotHR2Exist], 0
	call putCshotHR2
	jmp @@ret
@@Player:
	cmp cx, [Xplayer]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [YPlayer]
	jb @@c1
	call putCshotHR2
	mov [CshotHR2Exist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putCshotHR2 ; delete at curret locatein
	inc [XCshotHR2]
	call putCshotHR2 ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveCshotHR2Right

;==============================================================================================================================



; chapt3 shot horizontal left 2
;*************************************
;proc info:
;input: XCshotHL2, YCshotHL2, CSHOTH_HIGHT, CSHOTH_WIDTH
;output: puts or deletes CshotHL2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the CshotHL2 at the location set by the x and y varibels
;the proc expects: the varibels XCshotHL2 and YCshotHL2 to contain the x and y
;				   the const CSHOTH_HIGHT, CSHOTH_WIDTH to contain the length and width
;*************************************
proc putCshotHL2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YCshotHL2]
@@nextR:
	
		mov di,0
		mov cx,[XCshotHL2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte CshotH + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,CSHOTH_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, CSHOTH_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putCshotHL2

;*************************************
;proc info:
;input: cx, dx
;output: XCshotHL2, YCshotHL2
;register usge: cx, dx
;functionality: sets the CshotHL2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartCshotHL2
	push cx
	push dx
	mov cx, [Xchapt32]
	mov dx, [Ychapt32]
	add dx, CHAPT3_SIZE_MIDDLE
	sub cx, CSHOTH_WIDTH
	mov [XCshotHL2], cx
	mov [YCshotHL2], dx
	pop dx
	pop cx
	ret
endp SetStartCshotHL2


;*************************************
;proc info:
;input: none
;output: moves the CshotHL2 one pixel left
;register usge: none
;functionality: moves the CshotHL2 up using xor movement
;the proc expects: XCshotHL2 and YCshotHL2 to contain the x and y
;*************************************
proc  MoveCshotHL2Left
	push cx
	push dx
	mov cx, [XCshotHL2]
	mov dx, [YCshotHL2]
	cmp [XCshotHL2], 0
	ja @@Player
	mov [CshotHL2Exist], 0
	call putCshotHL2
	jmp @@ret
@@Player:
	cmp cx, [XplayerB]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [YPlayer]
	jb @@c1
	call putCshotHL2
	mov [CshotHL2Exist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putCshotHL2 ; delete at curret locatein
	dec [XCshotHL2]
	call putCshotHL2 ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveCshotHL2Left
;==============================================================================================================================


; chapt3 shot vertical up 2
;*************************************
;proc info:
;input: XCshotVU2, YCshotVU2, CSHOTV_HIGHT, CSHOTV_WIDTH
;output: puts or deletes CshotVU2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the CshotVU2 at the location set by the x and y varibels
;the proc expects: the varibels XCshotVU2 and YCshotVU2 to contain the x and y
;				   the const CSHOTV_HIGHT, CSHOTV_WIDTH to contain the length and width
;*************************************
proc putCshotVU2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YCshotVU2]
@@nextR:
	
		mov di,0
		mov cx,[XCshotVU2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte CshotV + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,CSHOTV_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, CSHOTV_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putCshotVU2

;*************************************
;proc info:
;input: cx, dx
;output: XCshotVU2, YCshotVU2
;register usge: cx, dx
;functionality: sets the CshotVU2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartCshotVU2
	push cx
	push dx
	mov cx, [Xchapt32]
	mov dx, [Ychapt32]
	sub dx, CSHOTV_HIGHT
	add cx, CHAPT3_SIZE_MIDDLE
	mov [XCshotVU2], cx
	mov [YCshotVU2], dx
	pop dx
	pop cx
	ret
endp SetStartCshotVU2

;*************************************
;proc info:
;input: none
;output: moves the CshotVU2 one pixel up
;register usge: none
;functionality: moves the CshotVU2 up using xor movement
;the proc expects: XCshotVU2 and YCshotVU2 to contain the x and y
;*************************************
proc  MoveCshotVU2Up
	push cx
	push dx
	mov cx, [XCshotVU2]
	mov dx, [YCshotVU2]
	cmp [YCshotVU2], 0
	ja @@Player
	mov [CshotVU2Exist], 0
	call putCshotVU2
	jmp @@ret
@@Player:
	cmp dx, [YplayerB]
	jnz @@c1
	cmp cx, [XplayerB]
	ja @@c1
	cmp cx, [XPlayer]
	jb @@c1
	call putCshotVU2
	mov [CshotVU2Exist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putCshotVU2 ; delete at curret locatein
	dec [YCshotVU2]
	call putCshotVU2 ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveCshotVU2Up
;==============================================================================================================================





; chapt3 shot vertical down 2
;*************************************
;proc info:
;input: XCshotVD2, YCshotVD2, CSHOTV_HIGHT, CSHOTV_WIDTH
;output: puts or deletes CshotVD2 of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the CshotVD2 at the location set by the x and y varibels
;the proc expects: the varibels XCshotVD2 and YCshotVD2 to contain the x and y
;				   the const CSHOTV_HIGHT, CSHOTV_WIDTH to contain the length and width
;*************************************
proc putCshotVD2
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YCshotVD2]
@@nextR:
	
		mov di,0
		mov cx,[XCshotVD2]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte CshotV + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,CSHOTV_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, CSHOTV_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putCshotVD2

;*************************************
;proc info:
;input: cx, dx
;output: XCshotVD2, YCshotVD2
;register usge: cx, dx
;functionality: sets the CshotVD2 start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartCshotVD2
	push cx
	push dx
	mov cx, [Xchapt32]
	mov dx, [Ychapt32]
	add dx, CHAPT3_SIZE
	add cx, CHAPT3_SIZE_MIDDLE
	mov [XCshotVD2], cx
	mov [YCshotVD2], dx
	pop dx
	pop cx
	ret
endp SetStartCshotVD2


;*************************************
;proc info:
;input: none
;output: moves the CshotVD2 one pixel down
;register usge: none
;functionality: moves the CshotVD2 up using xor movement
;the proc expects: XCshotVD2 and YCshotVD2 to contain the x and y
;*************************************
proc  MoveCshotVD2Down
	push cx
	push dx
	mov cx, [XCshotVD2]
	mov dx, [YCshotVD2]
	add dx, CSHOTV_HIGHT
	cmp [YCshotVD2], 186
	jb @@Player
	mov [CshotVD2Exist], 0
	call putCshotVD2
	jmp @@ret
@@Player:
	cmp dx, [Yplayer]
	jnz @@c1
	cmp cx, [XplayerB]
	ja @@c1
	cmp cx, [XPlayer]
	jb @@c1
	call putCshotVD2
	mov [CshotVD2Exist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putCshotVD2 ; delete at curret locatein
	inc [YCshotVD2]
	call putCshotVD2 ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveCshotVD2Down
;==============================================================================================================================






; Boss1 shot
;*************************************
;proc info:
;input: XB1shot, YB1shot, B1SHOT_HIGHT, B1SHOT_WIDTH
;output: puts or deletes B1shot of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the B1shot at the location set by the x and y varibels
;the proc expects: the varibels XB1shot and YB1shot to contain the x and y
;				   the const B1SHOT_HIGHT, B1SHOT_WIDTH to contain the length and width
;*************************************
proc putB1shot
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YB1shot]
@@nextR:
	
		mov di,0
		mov cx,[XB1shot]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte B1shot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,B1SHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, B1SHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putB1shot

;*************************************
;proc info:
;input: cx, dx
;output: XB1shot, YB1shot
;register usge: cx, dx
;functionality: sets the B1shot start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartB1shot
	push cx
	push dx
	mov cx, [Xboss]
	mov dx, [Yboss] 
	add dx, BOSS_HIGHT_MIDDLE
	sub dx, 2
	mov [XB1shot], cx
	mov [YB1shot], dx
	pop dx
	pop cx
	ret
endp SetStartB1shot

;*************************************
;proc info:
;input: none
;output: moves the B1shot one pixel left
;register usge: none
;functionality: moves the B1shot up using xor movement
;the proc expects: XB1shot and YB1shot to contain the x and y
;*************************************
proc  MoveB1shotLeft
	push cx
	push dx
	mov cx, [XB1shot]
	mov dx, [YB1shot]
	cmp [XB1shot], 0
	ja @@Player
	mov [B1shotExist], 0
	call putB1shot
	jmp @@ret
@@Player:
	cmp cx, [XplayerB]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [YPlayer]
	jb @@c1
	call putB1shot
	mov [B1shotExist], 0
	dec [lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putB1shot ; delete at curret locatein
	dec [XB1shot]
	call putB1shot ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveB1shotLeft

;==============================================================================================================================






; Boss2 shot
;*************************************
;proc info:
;input: XB2shot, YB2shot, B2SHOT_HIGHT, B2SHOT_WIDTH
;output: puts or deletes B2shot of the screen
;register usge: ax, bx, cx, dx, si, di (pushes and pops them)
;functionality: putting the B2shot at the location set by the x and y varibels
;the proc expects: the varibels XB2shot and YB2shot to contain the x and y
;				   the const B2SHOT_HIGHT, B2SHOT_WIDTH to contain the length and width
;*************************************
proc putB2shot
	
	
	push si
	push di
	push ax
	push bx
	push cx
	push dx
	
    
	xor si,si
	xor bx,bx
	mov dx,[YB2shot]
@@nextR:
	
		mov di,0
		mov cx,[XB2shot]
	@@nextC:
		 
			mov ah,0dh
			int 10h ; al got one pixell from screen
			
			xor al,[byte B2shot + bx ]
			
			mov ah,0ch	
			int 10h    ; put pixel	
			
		
			inc cx
			inc di
			inc bx

		cmp di,B2SHOT_WIDTH
		jb @@nextC
		inc dx
		inc si
	
	cmp si, B2SHOT_HIGHT
	jb @@nextR
 
	 
	pop dx
	pop cx
	pop bx
	pop ax
	pop di
	pop si
	


	ret
endp putB2shot

;*************************************
;proc info:
;input: cx, dx
;output: XB2shot, YB2shot
;register usge: cx, dx
;functionality: sets the B2shot start location in the varibels
;the proc expects: cx and dx to contain the start x and y 
;*************************************
proc SetStartB2shot
	push cx
	push dx
	mov cx, [Xboss2]
	mov dx, [Yboss2]
	add dx, BOSS_HIGHT_MIDDLE
	add cx, BOSS_WIDTH
    sub dx, 2
	mov [XB2shot], cx
	mov [YB2shot], dx
	pop dx
	pop cx
	ret
endp SetStartB2shot

;*************************************
;proc info:
;input: none
;output: moves the B2shot one pixel right
;register usge: none
;functionality: moves the B2shot up using xor movement
;the proc expects: XB2shot and YB2shot to contain the x and y
;*************************************
proc  MoveB2shotRight
	push cx
	push dx
	mov cx, [XB2shot]
	mov dx, [YB2shot]
	add cx, B2SHOT_WIDTH
	cmp [XB2shot], 306
	jnz @@player
	mov [B2shotExist], 0
	call putB2shot
@@player:
	cmp [B2shotExist], 1
	jnz @@ret
	cmp cx, [Xplayer]
	jnz @@c1
	cmp dx, [YplayerB]
	ja @@c1
	cmp dx, [Yplayer]
	jb @@c1
	call putB2shot
	mov [B2ShotExist], 0
	dec [Lives]
	mov [playerHit], 1
	cmp [Lives], 0
	ja @@aft
	mov [playerAlive], 0
@@aft:
	jmp @@ret
@@c1:
	call putB2shot ; delete at curret locatein
	inc [XB2shot]
	call putB2shot ; put it  at new location
@@ret:
	pop dx
	pop cx
	ret
endp MoveB2shotRight

;backgrounds:

proc OpenShowBmp near
	mov [ErrorFile],0
	 
	call OpenBmpFile
	cmp [ErrorFile],1
	je @@ExitProc
	
	call ReadBmpHeader
	
	
	call ReadBmpPalette
	call CopyBmpPalette
	
	
	
	call  ShowBmp
	
	 
	call CloseBmpFile

@@ExitProc:
	ret
endp OpenShowBmp

proc SaveVgaMemToFile near
	
	lea dx, [FileNameOut1]
	call CreateBmpFile
	cmp [ErrorFile],1
	je @@ExitProc
	
	call PutBmpHeader
	
	call PutBmpPalette
	
	call PutBmpDataIntoFile
	
	call CloseBmpFile

@@ExitProc:
	ret
endp SaveVgaMemToFile

	
; input dx filename to open
proc OpenBmpFile	near						 
	mov ah, 3Dh
	xor al, al
	int 21h
	jc @@ErrorAtOpen
	mov [FileHandle], ax
	jmp @@ExitProc
	
@@ErrorAtOpen:
	mov [ErrorFile],1
@@ExitProc:	
	ret
endp OpenBmpFile

	
; output file dx filename to open
proc CreateBmpFile	near						 
	 
	
CreateNewFile:
	mov ah, 3Ch 
	mov cx, 0 
	int 21h
	
	jnc Success
@@ErrorAtOpen:
	mov [ErrorFile],1
	jmp @@ExitProc
	
Success:
	mov [ErrorFile],0
	mov [FileHandle], ax
@@ExitProc:
	ret
endp CreateBmpFile


proc CloseBmpFile near
	mov ah,3Eh
	mov bx, [FileHandle]
	int 21h
	ret
endp CloseBmpFile


; Read 54 bytes the Header
proc ReadBmpHeader	near					
	push cx
	push dx
	
	mov ah,3fh
	mov bx, [FileHandle]
	mov cx,54
	mov dx,offset Header
	int 21h
	
	pop dx
	pop cx
	ret
endp ReadBmpHeader


proc ReadBmpPalette near ; Read BMP file color palette, 256 colors * 4 bytes (400h)
						 ; 4 bytes for each color BGR + null)			
	push cx
	push dx
	
	mov ah,3fh
	mov cx,400h
	mov dx,offset Palette
	int 21h
	
	pop dx
	pop cx
	
	ret
endp ReadBmpPalette


; Will move out to screen memory the colors
; video ports are 3C8h for number of first color
; and 3C9h for all rest
proc CopyBmpPalette		near					
										
	push cx
	push dx
	
	mov si,offset Palette
	mov cx,256
	mov dx,3C8h
	mov al,0  ; black first							
	out dx,al ;3C8h
	inc dx	  ;3C9h
@@CopyNextColor:
	mov al,[si+2] 		; Red				
	shr al,2 			; divide by 4 Max (cos max is 63 and we have here max 255 ) (loosing color resolution).				
	out dx,al 						
	mov al,[si+1] 		; Green.				
	shr al,2            
	out dx,al 							
	mov al,[si] 		; Blue.				
	shr al,2            
	out dx,al 							
	add si,4 			; Point to next color.  (4 bytes for each color BGR + null)				
								
	loop @@CopyNextColor
	
	pop dx
	pop cx
	
	ret
endp CopyBmpPalette


proc ShowBMP
; BMP graphics are saved upside-down.
; Read the graphic line by line (BmpHeight lines in VGA format),
; displaying the lines from bottom to top.
	push cx
	
	mov ax, 0A000h
	mov es, ax
	
 
	mov ax,[BmpWidth] ; row size must dived by 4 so if it less we must calculate the extra padding bytes
	mov bp, 0
	and ax, 3
	cmp ax, 0 
	jz @@row_ok
	mov bp,4
	sub bp,ax

@@row_ok:	
	mov cx,[BmpHeight]
    dec cx
	add cx,[BmpTop] ; add the Y on entire screen
	; next 5 lines  di will be  = cx*320 + dx , point to the correct screen line
	mov di,cx
	shl cx,6
	shl di,8
	add di,cx
	add di,[BmpLeft]
	cld ; Clear direction flag, for movsb forward
	
	mov cx, [BmpHeight]
@@NextLine:
	push cx
 
	; small Read one line
	mov ah,3fh
	mov cx,[BmpWidth]  
	add cx,bp  ; extra  bytes to each row must be divided by 4
	mov dx,offset ScrLine
	int 21h
	; Copy one line into video memory es:di
	mov cx,[BmpWidth]  
	mov si,offset ScrLine
	rep movsb ; Copy line to the screen
	sub di,[BmpWidth]            ; return to left bmp
	sub di,SCREEN_WIDTH  ; jump one screen line up
	
	pop cx
	loop @@NextLine
	
	pop cx
	ret
endp ShowBMP
	

; Read 54 bytes the Header
proc PutBmpHeader	near					
	mov ah,40h
	mov bx, [FileHandle]
	mov cx,54
	mov dx,offset Header
	int 21h
	ret
endp PutBmpHeader
 

proc PutBmpPalette near ; Read BMP file color palette, 256 colors * 4 bytes (400h)
						 ; 4 bytes for each color BGR + null)			
	mov ah,40h
	mov cx,400h
	mov dx,offset Palette
	int 21h
	ret
endp PutBmpPalette


 
proc PutBmpDataIntoFile near
			
    mov dx,offset ScrLine  ; read 320 bytes (line) from file to buffer
	
	mov ax, 0A000h ; graphic mode address for es
	mov es, ax
	
	mov cx,BMP_MAX_HEIGHT
	
	cld 		; forward direction for movsb
@@GetNextLine:
	push cx
	dec cx
										 
	mov si,cx    ; set si at the end of the cx line (cx * 320) 
	shl cx,6	 ; multiply line number twice by 64 and by 256 and add them (=320) 
	shl si,8
	add si,cx
	
	mov cx,BMP_MAX_WIDTH    ; line size
	mov di,dx
    
	 push ds 
     push es
	 pop ds
	 pop es
	 rep movsb
	 push ds 
     push es
	 pop ds
	 pop es
 
	
	
	 mov ah,40h
	 mov cx,BMP_MAX_WIDTH
	 int 21h
	
	 pop cx ; pop for next line
	 loop @@GetNextLine
	
	
	
	 ret 
endp PutBmpDataIntoFile


proc  RegisterAsyncMouse
	
;----- Define interrupt subroutine parameters
        mov ax, seg Handle
        mov es, ax
        mov dx, offset Handle  ; ES:DX ->Far routine
        mov cx,0000000000011110b ;
		mov ax,0Ch
        int 33h                 
       	ret
endp RegisterAsyncMouse


proc  RegisterAsyncMouse2
	
;----- Define interrupt subroutine parameters
        mov ax, seg nothingg
        mov es, ax
        mov dx, offset nothingg  ; ES:DX ->Far routine
        mov cx,0000000000011110b ;
		mov ax,14h
        int 33h                 
       	ret
endp RegisterAsyncMouse2


proc  RegisterAsyncMouse3
	
;----- Define interrupt subroutine parameters
        mov ax, seg Handle
        mov es, ax
        mov dx, offset Handle  ; ES:DX ->Far routine
        mov cx,0000000000011110b ;
		mov ax,14h
        int 33h                 
       	ret
endp RegisterAsyncMouse3

proc nothingg far
	ret
endp nothingg

PROC Handle far
		 
		 ; convert X from 0 - 640 to 0-320
		 shr cx,1
		 
		 
		
		 
	test bx,1
	jne @@nret
	jmp far @@right
@@nret:
	
	cmp dx, 63
	jb @@c1
	cmp dx, 107
	ja @@c1
	cmp cx, 135 
	jb @@c1
	cmp cx, 185
	ja @@c1
	HIDE_MOUSE	 
	call DrawButtonPressed2
	SHOW_MOUSE
	call _200MiliSecDelay
	HIDE_MOUSE
	call DrawButton2
	SHOW_MOUSE
	mov [bpressed], 2 
	jmp @@ret
@@c1:
	cmp dx, 63
	jb @@c2
	cmp dx, 107
	ja @@c2
	cmp cx, 210
	jb @@c2
	cmp cx, 260
	ja @@c2
	HIDE_MOUSE	 
	call DrawButtonPressed3
	SHOW_MOUSE
	call _200MiliSecDelay
	HIDE_MOUSE
	call DrawButton3
	SHOW_MOUSE
	mov [bpressed], 3 
	jmp @@ret
@@c2: 	
	cmp dx, 63
	jb @@right
	cmp dx, 107
	ja @@right
	cmp cx, 60
	jb @@right
	cmp cx, 110
	ja @@right
	HIDE_MOUSE	 
	call DrawButtonPressed1
	SHOW_MOUSE
	call _200MiliSecDelay
	HIDE_MOUSE
	call DrawButton1
	SHOW_MOUSE
	mov [bpressed], 1 
	jmp @@ret
@@right:
	cmp cx, 310
	jb @@ret
	cmp dx , 10
	ja @@erer
	mov [ForceExit],1
@@ret:
	
	mov al, [bpressed]
	cmp al, [correct_button]
	jnz eeee
	mov [ForceExit], 1
	jmp @@erer
eeee:
	cmp [bpressed], 0
	jz @@erer
	dec [lives]
	call WriteLives
	cmp [lives], 0
	ja @@erer
	mov [playerAlive], 0
	jmp far exit
@@erer:
	mov [bpressed], 0
@@final:
	retf
ENDP Handle

proc DrawVerticalLine	near
	push si
	push dx
 
DrawVertical:
	cmp si,0
	jz @@ExitDrawLine	
	 
    mov ah,0ch	
	int 10h    ; put pixel
	
	 
	
	inc dx
	dec si
	jmp DrawVertical
	
	
@@ExitDrawLine:
	pop dx
    pop si
	ret
endp DrawVerticalLine

proc DrawHorizontalLine	near
	push si
	push cx
DrawLine:
	cmp si,0
	jz ExitDrawLine	
	 
    mov ah,0ch	
	int 10h    ; put pixel
	 
	
	inc cx
	dec si
	jmp DrawLine
	
	
ExitDrawLine:
	pop cx
    pop si
	ret
endp DrawHorizontalLine

proc DrawRect
	push si ;width
	push cx ;x start
	push ax
	push dx ;y start
	push bx ;hight
nextLine:
	
	call DrawHorizontalLine
	inc dx
	dec bx
	cmp bx, 0
	ja nextLine
	
	pop bx
	pop dx
	pop ax
	pop cx
	pop si
	ret 
endp DrawRect

proc DrawButton1
	push ax
	push bx
	push cx
	push dx
	push si
	
	mov bx, [lengthY1]
	mov si, [lengthX1]
	mov cx, [Xstart1]
	mov dx, [Ystart1]
	mov al, 3
	call DrawRect
	push si
	push cx
	mov si, bx
	dec cx
	mov al, 29
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	inc si
	mov al, 29
	dec cx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	

	push si
	push cx
	mov si, bx
	add cx, si 
	add cx, 5
	mov al, 196
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	add si, 2
	mov al, 196
	dec cx
	add dx, bx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	
	
	
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp DrawButton1

proc DrawButtonPressed1
	push ax
	push bx
	push cx
	push dx
	push si
	
	mov bx, [lengthY1]
	mov si, [lengthX1]
	mov cx, [Xstart1]
	mov dx, [Ystart1]
	mov al, 3
	;call DrawRect
	push si
	push cx
	mov si, bx
	dec cx
	mov al, 196
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	inc si
	mov al, 196
	dec cx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	

	push si
	push cx
	mov si, bx
	add cx, si 
	add cx, 5
	mov al, 29
	inc dx
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	add si, 1
	dec dx
	mov al, 29
	
	add dx, bx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	
	
	
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp DrawButtonPressed1

proc DrawButton2
	push ax
	push bx
	push cx
	push dx
	push si
	
	mov bx, [lengthY2]
	mov si, [lengthX2]
	mov cx, [Xstart2]
	mov dx, [Ystart2]
	mov al, 3
	call DrawRect
	push si
	push cx
	mov si, bx
	dec cx
	mov al, 29
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	inc si
	mov al, 29
	dec cx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	

	push si
	push cx
	mov si, bx
	add cx, si 
	add cx, 5
	mov al, 196
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	add si, 2
	mov al, 196
	dec cx
	add dx, bx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	
	
	
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp DrawButton2

proc DrawButtonPressed2
	push ax
	push bx
	push cx
	push dx
	push si
	
	mov bx, [lengthY2]
	mov si, [lengthX2]
	mov cx, [Xstart2]
	mov dx, [Ystart2]
	mov al, 3
	;call DrawRect
	push si
	push cx
	mov si, bx
	dec cx
	mov al, 196
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	inc si
	mov al, 196
	dec cx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	

	push si
	push cx
	mov si, bx
	add cx, si 
	add cx, 5
	mov al, 29
	inc dx
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	add si, 1
	dec dx
	mov al, 29
	
	add dx, bx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	
	
	
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp DrawButtonPressed2

proc DrawButton3
	push ax
	push bx
	push cx
	push dx
	push si
	
	mov bx, [lengthY3]
	mov si, [lengthX3]
	mov cx, [Xstart3]
	mov dx, [Ystart3]
	mov al, 3
	call DrawRect
	push si
	push cx
	mov si, bx
	dec cx
	mov al, 29
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	inc si
	mov al, 29
	dec cx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	

	push si
	push cx
	mov si, bx
	add cx, si 
	add cx, 5
	mov al, 196
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	add si, 2
	mov al, 196
	dec cx
	add dx, bx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	
	
	
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp DrawButton3

proc DrawButtonPressed3
	push ax
	push bx
	push cx
	push dx
	push si
	
	mov bx, [lengthY3]
	mov si, [lengthX3]
	mov cx, [Xstart3]
	mov dx, [Ystart3]
	mov al, 3
	;call DrawRect
	push si
	push cx
	mov si, bx
	dec cx
	mov al, 196
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	inc si
	mov al, 196
	dec cx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	

	push si
	push cx
	mov si, bx
	add cx, si 
	add cx, 5
	mov al, 29
	inc dx
	call DrawVerticalLine
	pop cx
	pop si
	
	push si
	push dx
	push cx
	add si, 1
	dec dx
	mov al, 29
	
	add dx, bx
	call DrawHorizontalLine
	pop cx
	pop dx
	pop si
	
	
	
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret
endp DrawButtonPressed3


proc _400MiliSecDelay
	call _200MiliSecDelay
	call _200MiliSecDelay
	ret
endp _400MiliSecDelay

proc _200MiliSecDelay
	push cx
	
	mov cx ,1000 
@@Self1:
	
	push cx
	mov cx,600 

@@Self2:	
	loop @@Self2
	
	pop cx
	loop @@Self1
	
	pop cx
	ret
endp _200MiliSecDelay

proc Shoot
	
again1:
	mov dx,[HowManyTimes]
	push cx

	mov     bx,100        ; frequency value.
	 
	mov     al, 10110110b    ; 10110110b the magic number (use this binary number only)
	out     43h, al          ; init port 43h timer 2.
	 
next_frequency:               ; Dx times.
	 
	mov     ax, bx           
	 
	out     42h, al          ; lsb to port 42h.
	mov     al, ah            
	out     42h, al          ; send msb to port 42h.
	 
	in      al, 61h          ; get the value of port 61h.
	or      al, 00000011b    ; or al to this value, forcing first two bits high.
	out     61h, al          ; to turn on the speaker.
	 
	mov     cx, 100          ; just delay (bad delay)
delay_loop1:        
	loop    delay_loop1       

	inc     bx               ; inc requency 
		
	dec     dx   
	
	cmp     dx, 0          
	jnz     next_frequency  
	 
	in      al,61h           
	and     al,11111100b       ; turn speaker off
	out     61h,al           
	
	pop cx
	loop again1
	
	ret
endp Shoot

proc resetLives
	push CX
	
	mov bx, 0
	mov cx, 10
loops:
	mov al, [hearts2 + bx]
	mov [hearts + bx], al
	inc bx
	loop loops
	call WriteLives
	pop cx
	ret
endp resetLives

proc WriteLives
	push ax
	push bx
	push cx
	push dx
	push es
	push bp
	
	mov ax, seg hearts
	mov es, ax
	mov bp, offset hearts
	mov dh, 1
	mov dl, 1
	xor cx, cx
	xor bx, bx
	mov cx, 10
	mov bl, [lives]
	add bl, [Lives]
	mov [hearts + bx], ' '
	inc bx
	mov [hearts + bx], ' '
	mov bh, 0
	mov bl, 0001b
	mov al, 0
	mov ah, 13h
	int 10h
	
	pop bp
	pop es
	pop DX
	pop cx
	pop bx
	pop ax
	ret
endp WriteLives

proc WriteQuestion
	push ax
	push bx
	push cx
	push dx
	push es
	push bp
	
	mov ax, seg currentQ
	mov es, ax
	mov bp, offset currentQ
	mov dh, 4
	mov dl, 1
	xor cx, cx
	mov cl, [currentQLength]
	mov bh, 0
	mov bl, 0001b
	mov al, 0
	mov ah, 13h
	int 10h
	
	pop bp
	pop es
	pop DX
	pop cx
	pop bx
	pop ax
	ret
endp WriteQuestion

proc Write_answers
	push ax
	push bx
	push cx
	push dx
	push es
	push bp
	
	mov ax, seg currentA1
	mov es, ax
	mov bp, offset currentA1
	mov dh, 6 ; y
	mov dl, 4 ; x
	xor cx, cx
	mov cl, [currentA1Length]
	mov bh, 0
	mov bl, 0001b
	mov al, 0
	mov ah, 13h
	int 10h
	
	mov ax, seg currentA2
	mov es, ax
	mov bp, offset currentA2
	mov dh, 6
	mov dl, 17
	xor cx, cx
	mov cl, [currentA2Length]
	mov bh, 0
	mov bl, 0001b
	mov al, 0
	mov ah, 13h
	int 10h
	
	mov ax, seg currentA3
	mov es, ax
	mov bp, offset currentA3
	mov dh, 6
	mov dl, 28
	xor cx, cx
	mov cl, [currentA3Length]
	mov bh, 0
	mov bl, 0001b
	mov al, 0
	mov ah, 13h
	int 10h
	
	pop bp
	pop es
	pop DX
	pop cx
	pop bx
	pop ax
	ret
endp Write_answers

proc WriteLvl
	push ax
	push bx
	push cx
	push dx
	push es
	push bp
	
	mov ax, seg level
	mov es, ax
	mov bp, offset level
	mov dh, 1
	mov dl, 22
	add [stageNumber], '0'
	add [levelNumber], '0'
	xor cx, cx
	mov cl, 9
	mov bh, 0
	mov bl, 0110b
	mov al, 0
	mov ah, 13h
	int 10h
	
	sub [stageNumber], '0'
	sub [levelNumber], '0'
	
	pop bp
	pop es
	pop DX
	pop cx
	pop bx
	pop ax
	ret
endp WriteLvl

proc play
	call RegisterAsyncMouse
	call gameStart
	mov [startg], 0
	call level1
	
	call level2
	
	call Level3
	
	call Level4
	
	call Level5
	ret
endp play

proc Level1
	call ResetAll
	call RegisterAsyncMouse
	inc[ stageNumber]
	call RegisterAsyncMouse2
	call lv1st1
	call StageReset
	call lv1st2
	call StageReset
	call RegisterAsyncMouse3
	call lv1st3
	call RegisterAsyncMouse2
	call StageReset
	call lv1st4
	ret
endp Level1

proc Level2
	call ResetAll
	call resetLives
	inc [stageNumber]
	call RegisterAsyncMouse2
	call lv2st1
	call StageReset
	call lv2st2
	call StageReset
	call RegisterAsyncMouse3
	call lv2st3
	call StageReset
	call lv2st4
	call StageReset
	call RegisterAsyncMouse2
	call lv2st5
	call StageReset
	call lv2st6
	call RegisterAsyncMouse3
	ret
endp Level2

proc Level3
	call ResetAll
	call resetLives
	inc [stageNumber]
	call RegisterAsyncMouse2
	call lv3st1
	call StageReset
	call RegisterAsyncMouse3
	call lv3st2
	call StageReset
	call lv3st3
	call StageReset
	call lv3st4
	call StageReset
	call RegisterAsyncMouse2
	call lv3st5
	call StageReset
	call lv3st6
	call RegisterAsyncMouse3
	ret
endp Level3

proc Level4
	call ResetAll
	call resetLives
	inc [stageNumber]
	call lv4st1
	call StageReset
	call lv4st2
	call StageReset
	call lv4st3
	call StageReset
	call lv4st4
	call StageReset
	call lv4st5
	call StageReset
	call lv4st6
	ret
endp Level4

proc Level5
	call ResetAll
	call resetLives
	inc [stageNumber]
	call lv5st1
	call StageReset
	call lv5st2
	call StageReset
	call lv5st3
	call StageReset
	call lv5st4
	ret
endp Level5


proc lv1st1
	call WriteLives
	call WriteLvl
	xor ax, ax
	mov al, [blue]
	mov [StageColor], al
	mov dx, offset FileName12
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName12
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
	;jmp @@ret
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far @@ret
@@ndead:
	mov cx, PLAYER_HIGHT
	mov dx, [Yplayer]
	mov di, [Xplayer]
	inc di
	cmp [havesword], 0
	jnz check
@@keepChecking:
	xchg cx,di
	mov ah,0dh
	int 10h
	xchg cx,di
	inc dx
	cmp al, [PurpleB]
	jz takesword
	loop @@keepChecking
	jmp check
takesword:
	mov [havesword], 1
	jmp @@ag
check:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer],0
	 jnz @@ag
	 cmp [Yplayer], 100
	 ja @@ag
@@ret:	
	ret
endp lv1st1

proc lv1st2
	call WriteLives
	call WriteLvl
	xor ax, ax
	mov al, [blue]
	mov [StageColor], al
	mov dx, offset FileName1
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName1
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
	;jmp @@ret
@@cont:
		mov cx, 0
	mov dx, 20
	call SetStartPlayer
	mov cx, 160
	mov dx, 100
	 call SetStartBug
	 call SetStartVirus
	 
	 call putPlayer
	 call putBug
	 call putVirus
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@exittt
	 cmp [bug1Alive], 0
	 ja @@con
	 cmp [virus1Alive], 0
	 ja @@con
	 cmp [Xplayer],304
	 jb @@con
	 cmp [Yplayer], 40
	 ja @@con
@@exittt:
	mov ah, 7
	int 21h
	jmp far @@ret
@@con:	
	 cmp [Vshoot], 1
	 jnz @@c32
	 call StartV1shotUD
@@c32:
	 cmp [Bshoot], 1
	 jnz @@c31
	 call StartB1shotRL
@@c31:

	 cmp [moveVshots], 1000
	 jnz @@c6
	 push ax
	 call MoveV1ShotUD
	 cmp [playerHit], 1
	 jnz @@nhit1
	 call WriteLives
	 mov [playerHit], 0
@@nhit1:
	 call MoveB1ShotRL
	 cmp [playerHit], 1
	 jnz @@nhit3
	 call WriteLives
	  mov [playerHit], 0
@@nhit3:
	 MOV [moveVshots], 0
	 pop ax
@@c6:
	 cmp [shotShot], 1
	 jnz @@c3
	 call StartShot
	 
	 
	 
	 
@@c3: 
	 cmp [moveshots], 350
	 jnz @@c4
	 cmp [ShotExist], 1
	 jnz @@c4
	 call MoveShot
	 mov [moveshots], 0
;freeze
@@c4:
	 cmp [timeFreeze], 1
	 jnz @@c1
	 cmp [stoper], 60
	 jz @@c5
	 inc [stoper]
	 jmp @@else2
@@c5: 
	inc [froze]
	mov [stoper], 0
	cmp [froze], 50000
	jnz @@jf
	jmp @@njf
@@jf:
	jmp far @@else2
@@njf:
	mov [timeFreeze], 0
@@c1:	 
	 cmp [move], 10000
	 jb @@else1
	 mov [move], 0
	 
	 cmp [bug1Alive], 0
	 jz @@Bdead
	 call MoveB1UD
	
@@Bdead:
	 cmp [virus1Alive], 0
	 jz @@Vdead
	 call MoveV1LR
@@Vdead:

	
	
	
@@else1:
	 inc [move]
	
@@else2:	 
	 inc [MoveShots]
	 inc [moveVshots]

	 jmp @@ag
		
@@ret:
	ret
endp lv1st2

proc lv1st3
	mov dx, offset FileName0
	mov [BmpLeft],0
	mov [BmpTop],0
	mov [BmpWidth], 320
	mov [BmpHeight] ,200
	

	mov dx, offset FileName0
	call OpenShowBmp
	call WriteLives
	call WriteLvl
	;SHOW_MOUSE
	mov [correct_button], 3
	 call DrawButton1
	 call DrawButton2
	 call DrawButton3
	 
	 xor cx, cx
	 mov cl, [Q1_Length]
	 mov [currentQLength], cl
	 mov bx, 0
@@changequestion:
	 mov al, [Q1 + bx]
	 mov [currentQ + bx], al
	 inc Bx
	 loop @@changequestion
	 
	 xor cx, cx
	 mov cl, [Q1A1_Length]
	 mov [currentA1Length], cl
	 mov bx, 0
@@changeA1:
	 mov al, [Q1A1 + bx]
	 mov [currentA1 + bx], al
	 inc Bx
	 loop @@changeA1
	 
	 xor cx, cx
	 mov cl, [Q1A2_Length]
	 mov [currentA2Length], cl
	 mov bx, 0
@@changeA2:
	 mov al, [Q1A2 + bx]
	 mov [currentA2 + bx], al
	 inc Bx
	 loop @@changeA2
	 
	 xor cx, cx
	 mov cl, [Q1A3_Length]
	 mov [currentA3Length], cl
	 mov bx, 0
@@changeA3:
	 mov al, [Q1A3 + bx]
	 mov [currentA3 + bx], al
	 inc Bx
	 loop @@changeA3
	 
	 call WriteQuestion
	 call Write_answers
	 
@@next:
	SHOW_MOUSE
	cmp [ForceExit], 1
	je @@progend
	jmp @@next
@@progend:
	HIDE_MOUSE
	mov [ForceExit], 0
	ret
endp lv1st3

proc lv1st4
	call WriteLives
	call WriteLvl
	xor ax, ax
	mov [StageColor], 243
	mov dx, offset FileName6
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName6
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
	;jmp @@ret
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	mov cx, PLAYER_HIGHT
	mov dx, [Yplayer]
	mov di, [Xplayer]
	inc di
@@keepChecking:
	;xchg cx,di
	;mov ah,0dh
	;int 10h
	;xchg cx,di
	;inc dx
	;cmp al, 1
	;jz @@ret
	;loop @@keepChecking
	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer], 160
	 ja @@ag
@@ret:	
	ret
endp lv1st4



proc lv2st1
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov al, [Yellow]
	mov [StageColor], al
	mov dx, offset FileName15
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName15
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer],0
	 jnz @@ag
	 cmp [Yplayer], 100
	 ja @@ag
@@ret:	
	ret
endp lv2st1

proc lv2st2
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov al, [Yellow]
	mov [StageColor], al
	mov dx, offset FileName9
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName9
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	 mov cx, 0
	 mov dx, 20
	 call SetStartPlayer
	 mov cx, 160
	 mov dx, 100
	 call SetStartBug
	 call SetStartChapt3
	 call SetStartVirus
	 call putChapt3
	 call putPlayer
	 call putBug
	 call putVirus
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@exittt
	 cmp [bug1Alive], 0
	 ja @@con
	 cmp [virus1Alive], 0
	 ja @@con
	 cmp [chapt31Alive], 0
	 ja @@con
	 cmp [Xplayer],304
	 jb @@con
	 cmp [Yplayer], 40
	 ja @@con
@@exittt:
	jmp far @@ret
@@con:	
	 cmp [Vshoot], 1
	 jnz @@c32
	 call StartV1shotUD
@@c32:
	 cmp [Bshoot], 1
	 jnz @@c31
	 call StartB1shotRL
@@c31:
	cmp [Cshoot], 1
	jnz @@c33
	call StartCshot
@@c33:

	 cmp [moveVshots], 1000
	 jnz @@c6
	 push ax
	 call MoveV1ShotUD
	 cmp [playerHit], 1
	 jnz @@nhit1
	 call WriteLives
	 mov [playerHit], 0
@@nhit1:
	 call MoveB1ShotRL
	 cmp [playerHit], 1
	 jnz @@nhit3
	 call WriteLives
	 mov [playerHit], 0
@@nhit3:
	 call MoveCShot
	 cmp [playerHit], 1
	 jnz @@nhit4
	 call WriteLives
	 mov [playerHit], 0
@@nhit4:
	 mov [moveVshots], 0
	 pop ax
@@c6:
	 cmp [shotShot], 1
	 jnz @@c3
	 call StartShot
	 
	 
	 
	 
@@c3: 
	 cmp [moveshots], 350
	 jnz @@c4
	 cmp [ShotExist], 1
	 jnz @@c4
	 call MoveShot
	 mov [moveshots], 0
;freeze
@@c4:
	 cmp [timeFreeze], 1
	 jnz @@c1
	 cmp [stoper], 5
	 jz @@c5
	 inc [stoper]
	 jmp @@else2
@@c5: 
	inc [froze]
	mov [stoper], 0
	cmp [froze], 50000
	jnz @@jf
	jmp @@njf
@@jf:
	jmp far @@else2
@@njf:
	mov [timeFreeze], 0
@@c1:	 
	 cmp [move], 10000
	 jb @@else1
	 mov [move], 0
	 
	 cmp [bug1Alive], 0
	 jz @@Bdead
	 call MoveB1UD
@@Bdead:
	 cmp [virus1Alive], 0
	 jz @@Vdead
	 call MoveV1LR
@@Vdead:
	 cmp [chapt31Alive], 0
	 jz @@Cdead
	 call MoveC31LURD
@@Cdead:
	
	
	
@@else1:
	 inc [move]
	
@@else2:	 
	 inc [MoveShots]
	 inc [moveVshots]

	 jmp @@ag
		
@@ret:
	
	ret
endp lv2st2

proc lv2st3
	mov dx, offset FileName0
	mov [BmpLeft],0
	mov [BmpTop],0
	mov [BmpWidth], 320
	mov [BmpHeight] ,200
	

	mov dx, offset FileName0
	call OpenShowBmp
	call WriteLives
	 
	call WriteLvl

	mov [correct_button], 2
	 call DrawButton1
	 call DrawButton2
	 call DrawButton3
	 
	 xor cx, cx
	 mov cl, [Q2_Length]
	 mov [currentQLength], cl
	 mov bx, 0
@@changequestion:
	 mov al, [Q2 + bx]
	 mov [currentQ + bx], al
	 inc Bx
	 loop @@changequestion
	 
	 xor cx, cx
	 mov cl, [Q2A1_Length]
	 mov [currentA1Length], cl
	 mov bx, 0
@@changeA1:
	 mov al, [Q2A1 + bx]
	 mov [currentA1 + bx], al
	 inc Bx
	 loop @@changeA1
	 
	 xor cx, cx
	 mov cl, [Q2A2_Length]
	 mov [currentA2Length], cl
	 mov bx, 0
@@changeA2:
	 mov al, [Q2A2 + bx]
	 mov [currentA2 + bx], al
	 inc Bx
	 loop @@changeA2
	 
	 xor cx, cx
	 mov cl, [Q2A3_Length]
	 mov [currentA3Length], cl
	 mov bx, 0
@@changeA3:
	 mov al, [Q2A3 + bx]
	 mov [currentA3 + bx], al
	 inc Bx
	 loop @@changeA3
	 
	 call WriteQuestion
	 call Write_answers
	 
@@next:
	
	SHOW_MOUSE
	cmp [ForceExit], 1
	je @@progend
	jmp @@next
@@progend:
	HIDE_MOUSE
	mov [ForceExit], 0
	ret
endp lv2st3

proc lv2st4
	mov dx, offset FileName0
	mov [BmpLeft],0
	mov [BmpTop],0
	mov [BmpWidth], 320
	mov [BmpHeight] ,200
	

	mov dx, offset FileName0
	call OpenShowBmp
	call WriteLives
	 
	call WriteLvl
	
	
	 
	 xor cx, cx
	 mov cl, [Q3_Length]
	 mov [currentQLength], cl
	 mov bx, 0
@@changequestion:
	 mov al, [Q3 + bx]
	 mov [currentQ + bx], al
	 inc Bx
	 loop @@changequestion
	 
	 xor cx, cx
	 mov cl, [Q3A1_Length]
	 mov [currentA1Length], cl
	 mov bx, 0
@@changeA1:
	 mov al, [Q3A1 + bx]
	 mov [currentA1 + bx], al
	 inc Bx
	 loop @@changeA1
	 
	 xor cx, cx
	 mov cl, [Q3A2_Length]
	 ;add cl, 50
	 mov [currentA2Length], cl
	 mov bx, 0
@@changeA2:
	 mov al, [Q3A2 + bx]
	 mov [currentA2 + bx], al
	 inc Bx
	 loop @@changeA2
	 
	 xor cx, cx
	 mov cl, [Q3A3_Length]
	add cl, 50
	 mov [currentA3Length], cl
	 mov bx, 0
@@changeA3:
	 mov al, [Q3A3 + bx]
	 mov [currentA3 + bx], al
	 inc Bx
	 loop @@changeA3
	 
	 call WriteQuestion
	 call Write_answers
	 
	 mov [correct_button], 1
	 call DrawButton1
	 call DrawButton2
	 call DrawButton3
@@next:
	
	SHOW_MOUSE
	cmp [ForceExit], 1
	je @@progend
	jmp @@next
@@progend:
	HIDE_MOUSE
	mov [ForceExit], 0
	ret
	ret
endp lv2st4

proc lv2st5
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov al, [Yellow]
	mov [StageColor], al
	mov dx, offset FileName9
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName9
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	 mov cx, 0
	 mov dx, 20
	 call SetStartPlayer	 
	 mov cx, 160
	 mov dx, 20
	 call SetStartVirus
	 mov dx, 170
	 call SetStartVirus2
	 mov dx, 100
	 call SetStartBug
	 call putBug
	 call putPlayer
	 call putVirus
	 call putvirus2
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@exittt
	 cmp [virus1Alive], 0
	 ja @@con
	 cmp [virus2Alive], 0
	 ja @@con
	 cmp [bug1Alive], 0
	 ja @@con
	 cmp [Xplayer],304
	 jb @@con
	 cmp [Yplayer], 40
	 ja @@con
@@exittt:
	jmp far @@ret
@@con:	
	 cmp [Bshoot], 1
	 jnz @@c32
	 call StartB1shotRL
@@c32:
	 cmp [Vshoot], 1
	 jnz @@c31
	 call StartV1shotUD
@@c31:
	 cmp [V2shoot], 1
	 jnz @@c33
	 call StartV2shotUD
@@c33:

	 cmp [moveVshots], 1000
	 jnz @@c6
	 push ax
	 call MoveB1ShotRL
	 cmp [playerHit], 1
	 jnz @@nhit1
	 call WriteLives
	 mov [playerHit], 0
@@nhit1:
	 call MoveV1ShotUD
	 cmp [playerHit], 1
	 jnz @@nhit3
	 call WriteLives
	 mov [playerHit], 0
@@nhit3:
	 call MoveV2ShotUD
	 cmp [playerHit], 1
	 jnz @@nhit4
	 call WriteLives
	 mov [playerHit], 0
@@nhit4:
	 mov [moveVshots], 0
	 pop ax
@@c6:
	 cmp [shotShot], 1
	 jnz @@c3
	 call StartShot
	 
	 
	 
	 
@@c3: 
	 cmp [moveshots], 350
	 jnz @@c4
	 cmp [ShotExist], 1
	 jnz @@c4
	 call MoveShot
	 mov [moveshots], 0
;freeze
@@c4:
	 cmp [timeFreeze], 1
	 jnz @@c1
	 cmp [stoper], 5
	 jz @@c5
	 inc [stoper]
	 jmp @@else2
@@c5: 
	inc [froze]
	mov [stoper], 0
	cmp [froze], 50000
	jnz @@jf
	jmp @@njf
@@jf:
	jmp far @@else2
@@njf:
	mov [timeFreeze], 0
@@c1:	 
	 cmp [move], 10000
	 jb @@else1
	 mov [move], 0
	 
	 cmp [bug1Alive], 0
	 jz @@Bdead
	 call MoveB1UD
@@Bdead:
	 cmp [virus1Alive], 0
	 jz @@Vdead
	 call MoveV1LR
@@Vdead:
	 cmp [virus2Alive], 0
	 jz @@Vdead2
	 call MoveV2LR
@@Vdead2:
	
	
	
@@else1:
	 inc [move]
	
@@else2:	 
	 inc [MoveShots]
	 inc [moveVshots]

	 jmp @@ag
		
@@ret:
	ret
endp lv2st5

proc lv2st6
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov [StageColor], 243
	mov dx, offset FileName8
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName8
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
	;jmp @@ret
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	mov cx, PLAYER_HIGHT
	mov dx, [Yplayer]
	mov di, [Xplayer]
	inc di
	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer], 160
	 ja @@ag
@@ret:	
	ret
endp lv2st6


proc lv3st1
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov al, [Green]
	mov [StageColor], al
	mov dx, offset FileName14
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName14
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer],0
	 jnz @@ag
	 cmp [Yplayer], 100
	 ja @@ag
@@ret:	
	ret
endp lv3st1

proc lv3st2
	mov dx, offset FileName0
	mov [BmpLeft],0
	mov [BmpTop],0
	mov [BmpWidth], 320
	mov [BmpHeight] ,200
	

	mov dx, offset FileName0
	call OpenShowBmp
	call WriteLives
	 
	call WriteLvl

	mov [correct_button], 1
	 call DrawButton1
	 call DrawButton2
	 call DrawButton3
	 
	 xor cx, cx
	 mov cl, [Q4_Length]
	 mov [currentQLength], cl
	 mov bx, 0
@@changequestion:
	 mov al, [Q4 + bx]
	 mov [currentQ + bx], al
	 inc Bx
	 loop @@changequestion
	 
	 xor cx, cx
	 mov cl, [Q4A1_Length]
	 mov [currentA1Length], cl
	 mov bx, 0
@@changeA1:
	 mov al, [Q4A1 + bx]
	 mov [currentA1 + bx], al
	 inc Bx
	 loop @@changeA1
	 
	 xor cx, cx
	 mov cl, [Q4A2_Length]
	 mov [currentA2Length], cl
	 mov bx, 0
@@changeA2:
	 mov al, [Q4A2 + bx]
	 mov [currentA2 + bx], al
	 inc Bx
	 loop @@changeA2
	 
	 xor cx, cx
	 mov cl, [Q4A3_Length]
	 mov [currentA3Length], cl
	 mov bx, 0
@@changeA3:
	 mov al, [Q4A3 + bx]
	 mov [currentA3 + bx], al
	 inc Bx
	 loop @@changeA3
	 
	 call WriteQuestion
	 call Write_answers
	 
@@next:
	
	SHOW_MOUSE
	cmp [ForceExit], 1
	je @@progend
	jmp @@next
@@progend:
	HIDE_MOUSE
	mov [ForceExit], 0
	ret
endp lv3st2

proc lv3st3
	mov dx, offset FileName0
	mov [BmpLeft],0
	mov [BmpTop],0
	mov [BmpWidth], 320
	mov [BmpHeight] ,200
	

	mov dx, offset FileName0
	call OpenShowBmp
	call WriteLives
	 
	call WriteLvl

	mov [correct_button], 1
	 call DrawButton1
	 call DrawButton2
	 call DrawButton3
	 
	 xor cx, cx
	 mov cl, [Q5_Length]
	 mov [currentQLength], cl
	 mov bx, 0
@@changequestion:
	 mov al, [Q5 + bx]
	 mov [currentQ + bx], al
	 inc Bx
	 loop @@changequestion
	 
	 xor cx, cx
	 mov cl, [Q5A1_Length]
	 mov [currentA1Length], cl
	 mov bx, 0
@@changeA1:
	 mov al, [Q5A1 + bx]
	 mov [currentA1 + bx], al
	 inc Bx
	 loop @@changeA1
	 
	 xor cx, cx
	 mov cl, [Q5A2_Length]
	 mov [currentA2Length], cl
	 mov bx, 0
@@changeA2:
	 mov al, [Q5A2 + bx]
	 mov [currentA2 + bx], al
	 inc Bx
	 loop @@changeA2
	 
	 xor cx, cx
	 mov cl, [Q5A3_Length]
	 mov [currentA3Length], cl
	 mov bx, 0
@@changeA3:
	 mov al, [Q5A3 + bx]
	 mov [currentA3 + bx], al
	 inc Bx
	 loop @@changeA3
	 
	 call WriteQuestion
	 call Write_answers
	 
@@next:
	
	SHOW_MOUSE
	cmp [ForceExit], 1
	je @@progend
	jmp @@next
@@progend:
	HIDE_MOUSE
	mov [ForceExit], 0
	ret
endp lv3st3

proc lv3st4
	mov dx, offset FileName0
	mov [BmpLeft],0
	mov [BmpTop],0
	mov [BmpWidth], 320
	mov [BmpHeight] ,200
	

	mov dx, offset FileName0
	call OpenShowBmp
	call WriteLives
	 
	call WriteLvl
	
	mov [correct_button], 3
	 call DrawButton1
	 call DrawButton2
	 call DrawButton3
	 
	 xor cx, cx
	 mov cl, [Q6_Length]
	 mov [currentQLength], cl
	 mov bx, 0
@@changequestion:
	 mov al, [Q6 + bx]
	 mov [currentQ + bx], al
	 inc Bx
	 loop @@changequestion
	 
	 xor cx, cx
	 mov cl, [Q6A1_Length]
	 mov [currentA1Length], cl
	 mov bx, 0
@@changeA1:
	 mov al, [Q6A1 + bx]
	 mov [currentA1 + bx], al
	 inc Bx
	 loop @@changeA1
	 
	 xor cx, cx
	 mov cl, [Q6A2_Length]
	 mov [currentA2Length], cl
	 mov bx, 0
@@changeA2:
	 mov al, [Q6A2 + bx]
	 mov [currentA2 + bx], al
	 inc Bx
	 loop @@changeA2
	 
	 xor cx, cx
	 mov cl, [Q6A3_Length]
	 mov [currentA3Length], cl
	 mov bx, 0
@@changeA3:
	 mov al, [Q6A3 + bx]
	 mov [currentA3 + bx], al
	 inc Bx
	 loop @@changeA3
	 
	 call WriteQuestion
	 call Write_answers
	 
@@next:
	
	SHOW_MOUSE
	cmp [ForceExit], 1
	je @@progend
	jmp @@next
@@progend:
	HIDE_MOUSE
	mov [ForceExit], 0
	ret
	ret
endp lv3st4

proc lv3st5
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov al, [Green]
	mov [StageColor], al
	mov dx, offset FileName3
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName3
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	 mov cx, 0
	 mov dx, 20
	 call SetStartPlayer	 
	 mov cx, 160
	 mov dx, 100
	 call SetStartChapt3
	 mov cx, 211
	 call SetStartBug
	 mov cx, 34
	 call SetStartbug2
	 
	 call putPlayer
	 call putbug
	 call putbug2
	 call putChapt3
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@exittt
	 cmp [chapt31Alive], 0
	 ja @@con
	 cmp [bug1Alive], 0
	 ja @@con
	 cmp [bug2Alive], 0
	 ja @@con
	 cmp [Xplayer],304
	 jb @@con
	 cmp [Yplayer], 40
	 ja @@con
@@exittt:
	jmp far @@ret
@@con:	
	 cmp [Cshoot], 1
	 jnz @@c31
	 call StartCshot
@@c31:
	 cmp [Bshoot], 1
	 jnz @@c33
	 call StartB1shotRL
@@c33:
	 cmp [B2shoot], 1
	 jnz @@c32
	 call StartB2shotRL
@@c32:

	 cmp [moveVshots], 1000
	 jnz @@c6
	 push ax
	 
	 call MoveCShot
	 cmp [playerHit], 1
	 jnz @@nhit1
	 call WriteLives
	 mov [playerHit], 0
@@nhit1:
	 call MoveB1ShotRL
	 cmp [playerHit], 1
	 jnz @@nhit3
	 call WriteLives
	 mov [playerHit], 0
@@nhit3:
	 call MoveB2ShotRL
	 cmp [playerHit], 1
	 jnz @@nhit4
	 call WriteLives
	 mov [playerHit], 0
@@nhit4:
	 mov [moveVshots], 0
	 pop ax
@@c6:
	 cmp [shotShot], 1
	 jnz @@c3
	 call StartShot
	 
	 
	 
	 
@@c3: 
	 cmp [moveshots], 350
	 jnz @@c4
	 cmp [ShotExist], 1
	 jnz @@c4
	 call MoveShot
	 mov [moveshots], 0
;freeze
@@c4:
	 cmp [timeFreeze], 1
	 jnz @@c1
	 cmp [stoper], 5
	 jz @@c5
	 inc [stoper]
	 jmp @@else2
@@c5: 
	inc [froze]
	mov [stoper], 0
	cmp [froze], 50000
	jnz @@jf
	jmp @@njf
@@jf:
	jmp far @@else2
@@njf:
	mov [timeFreeze], 0
@@c1:	 
	 cmp [move], 10000
	 jb @@else1
	 mov [move], 0
	 
	 cmp [chapt31Alive], 0
	 jz @@Cdead
	 call MoveC31LURD
@@Cdead:
	 cmp [bug1Alive], 0
	 jz @@Bdead
	 call MoveB1UD
@@Bdead:
	 cmp [bug2Alive], 0
	 jz @@Bdead2
	 call MoveB2UD
@@Bdead2:
	
	
	
@@else1:
	 inc [move]
	
@@else2:	 
	 inc [MoveShots]
	 inc [moveVshots]

	 jmp @@ag
		
@@ret:
	ret
endp lv3st5

proc lv3st6
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov [StageColor], 243
	mov dx, offset FileName7
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName7
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
	;jmp @@ret
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	mov cx, PLAYER_HIGHT
	mov dx, [Yplayer]
	mov di, [Xplayer]
	inc di
	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer], 160
	 ja @@ag
@@ret:	
	ret
endp lv3st6


proc lv4st1
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov al, [Red]
	mov [StageColor], al
	mov dx, offset FileName13
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName13
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer],0
	 jnz @@ag
	 cmp [Yplayer], 100
	 ja @@ag
@@ret:	
	ret
endp lv4st1

proc lv4st2
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov al, [Red]
	mov [StageColor], al
	mov dx, offset FileName2
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName2
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	 mov cx, 0
	 mov dx, 20
	 call SetStartPlayer	 
	 mov cx, 160
	 mov dx, 100
	 mov cx, 211
	 call SetStartBug
	 mov cx, 34
	 call SetStartbug2
	 
	 call putPlayer
	 call putbug
	 call putbug2
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@exittt
	 cmp [bug1Alive], 0
	 jnz @@con
	 cmp [bug2Alive], 0
	 jnz @@con
	 cmp [Xplayer],304
	 jb @@con
	 cmp [Yplayer], 40
	 ja @@con
@@exittt:
	jmp far @@ret
@@con:	
	 cmp [Bshoot], 1
	 jnz @@c33
	 call StartB1shotRL
@@c33:
	 cmp [B2shoot], 1
	 jnz @@c32
	 call StartB2shotRL
@@c32:

	 cmp [moveVshots], 1000
	 jnz @@c6
	 push ax
	 
	 call MoveB1ShotRL
	 cmp [playerHit], 1
	 jnz @@nhit3
	 call WriteLives
	 mov [playerHit], 0
@@nhit3:
	 call MoveB2ShotRL
	 cmp [playerHit], 1
	 jnz @@nhit4
	 call WriteLives
	 mov [playerHit], 0
@@nhit4:
	 mov [moveVshots], 0
	 pop ax
@@c6:
	 cmp [shotShot], 1
	 jnz @@c3
	 call StartShot
	 
	 
	 
	 
@@c3: 
	 cmp [moveshots], 350
	 jnz @@c4
	 cmp [ShotExist], 1
	 jnz @@c4
	 call MoveShot
	 mov [moveshots], 0
;freeze
@@c4:
	 cmp [timeFreeze], 1
	 jnz @@c1
	 cmp [stoper], 5
	 jz @@c5
	 inc [stoper]
	 jmp @@else2
@@c5: 
	inc [froze]
	mov [stoper], 0
	cmp [froze], 50000
	jnz @@jf
	jmp @@njf
@@jf:
	jmp far @@else2
@@njf:
	mov [timeFreeze], 0
@@c1:	 
	 cmp [move], 10000
	 jb @@else1
	 mov [move], 0
	 
	 cmp [bug1Alive], 0
	 jz @@Bdead
	 call MoveB1UD
@@Bdead:
	 cmp [bug2Alive], 0
	 jz @@Bdead2
	 call MoveB2UD
@@Bdead2:
	
	
	
@@else1:
	 inc [move]
	
@@else2:	 
	 inc [MoveShots]
	 inc [moveVshots]

	 jmp @@ag
		
@@ret:
	ret
endp lv4st2

proc lv4st3
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov al, [Red]
	mov [StageColor], al
	mov dx, offset FileName2
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName2
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	 mov cx, 0
	 mov dx, 20
	 call SetStartPlayer	 
	 mov cx, 100
	 mov dx, 50
	 call SetStartVirus
	 mov dx, 150
	 call SetStartVirus2
	 call putPlayer
	 call putVirus
	 call putvirus2
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@exittt
	 cmp [virus1Alive], 0
	 ja @@con
	 cmp [virus2Alive], 0
	 ja @@con
	 cmp [Xplayer],304
	 jb @@con
	 cmp [Yplayer], 40
	 ja @@con
@@exittt:
	jmp far @@ret
@@con:	
	 cmp [Vshoot], 1
	 jnz @@c31
	 call StartV1shotUD
@@c31:
	 cmp [V2shoot], 1
	 jnz @@c33
	 call StartV2shotUD
@@c33:

	 cmp [moveVshots], 1000
	 jnz @@c6
	 push ax
	 
	 call MoveV1ShotUD
	 cmp [playerHit], 1
	 jnz @@nhit3
	 call WriteLives
	 mov [playerHit], 0
@@nhit3:
	 call MoveV2ShotUD
	 cmp [playerHit], 1
	 jnz @@nhit4
	 call WriteLives
	 mov [playerHit], 0
@@nhit4:
	 mov [moveVshots], 0
	 pop ax
@@c6:
	 cmp [shotShot], 1
	 jnz @@c3
	 call StartShot
	 
	 
	 
	 
@@c3: 
	 cmp [moveshots], 350
	 jnz @@c4
	 cmp [ShotExist], 1
	 jnz @@c4
	 call MoveShot
	 mov [moveshots], 0
;freeze
@@c4:
	 cmp [timeFreeze], 1
	 jnz @@c1
	 cmp [stoper], 5
	 jz @@c5
	 inc [stoper]
	 jmp @@else2
@@c5: 
	inc [froze]
	mov [stoper], 0
	cmp [froze], 50000
	jnz @@jf
	jmp @@njf
@@jf:
	jmp far @@else2
@@njf:
	mov [timeFreeze], 0
@@c1:	 
	 cmp [move], 10000
	 jb @@else1
	 mov [move], 0
	 
	
	 cmp [virus1Alive], 0
	 jz @@Vdead
	 call MoveV1LR
@@Vdead:
	 cmp [virus2Alive], 0
	 jz @@Vdead2
	 call MoveV2LR
@@Vdead2:
	
	
	
@@else1:
	 inc [move]
	
@@else2:	 
	 inc [MoveShots]
	 inc [moveVshots]

	 jmp @@ag
		
@@ret:
	ret
endp lv4st3

proc lv4st4
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov al, [Red]
	mov [StageColor], al
	mov dx, offset FileName2
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName2
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	 mov cx, 0
	 mov dx, 20
	 call SetStartPlayer	 
	 mov cx, 260
	 mov dx, 100
	 call SetStartChapt3
	 mov cx, 60
	 call SetStartChapt32
	 call putPlayer
	 call putChapt3
	 call putChapt32
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@exittt
	 cmp [chapt31Alive], 0
	 ja @@con
	 cmp [chapt32Alive], 0
	 ja @@con
	 cmp [Xplayer],304
	 jb @@con
	 cmp [Yplayer], 40
	 ja @@con
@@exittt:
	jmp far @@ret
@@con:	
	 cmp [Cshoot], 1
	 jnz @@c31
	 call StartCshot
@@c31:
	 cmp [C2shoot], 1
	 jnz @@c33
	 call StartC2shot
@@c33:

	 cmp [moveVshots], 1000
	 jnz @@c6
	 push ax
	 
	 call MoveC2Shot
	 cmp [playerHit], 1
	 jnz @@nhit3
	 call WriteLives
	 mov [playerHit], 0
@@nhit3:
	 call MoveCShot
	 cmp [playerHit], 1
	 jnz @@nhit4
	 call WriteLives
	 mov [playerHit], 0
@@nhit4:
	 mov [moveVshots], 0
	 pop ax
@@c6:
	 cmp [shotShot], 1
	 jnz @@c3
	 call StartShot
	 
	 
	 
	 
@@c3: 
	 cmp [moveshots], 350
	 jnz @@c4
	 cmp [ShotExist], 1
	 jnz @@c4
	 call MoveShot
	 mov [moveshots], 0
;freeze
@@c4:
	 cmp [timeFreeze], 1
	 jnz @@c1
	 cmp [stoper], 5
	 jz @@c5
	 inc [stoper]
	 jmp @@else2
@@c5: 
	inc [froze]
	mov [stoper], 0
	cmp [froze], 50000
	jnz @@jf
	jmp @@njf
@@jf:
	jmp far @@else2
@@njf:
	mov [timeFreeze], 0
@@c1:	 
	 cmp [move], 10000
	 jb @@else1
	 mov [move], 0
	 
	 cmp [chapt31Alive], 0
	 jz @@Cdead
	 call MoveC31LURD
@@Cdead:
	 cmp [chapt32Alive], 0
	 jz @@Cdead2
	 call MoveC32LURD
@@Cdead2:
	
	
	
@@else1:
	 inc [move]
	
@@else2:	 
	 inc [MoveShots]
	 inc [moveVshots]

	 jmp @@ag
		
@@ret:
	ret
endp lv4st4

proc lv4st5
	mov dx, offset FileName0
	mov [BmpLeft],0
	mov [BmpTop],0
	mov [BmpWidth], 320
	mov [BmpHeight] ,200
	

	mov dx, offset FileName0
	call OpenShowBmp
	call WriteLives
	 
	call WriteLvl
	
	mov [correct_button], 1
	 call DrawButton1
	 call DrawButton2
	 call DrawButton3
	 
	 xor cx, cx
	 mov cl, [Q7_Length]
	 mov [currentQLength], cl
	 mov bx, 0
@@changequestion:
	 mov al, [Q7 + bx]
	 mov [currentQ + bx], al
	 inc Bx
	 loop @@changequestion
	 
	 xor cx, cx
	 mov cl, [Q7A1_Length]
	 mov [currentA1Length], cl
	 mov bx, 0
@@changeA1:
	 mov al, [Q7A1 + bx]
	 mov [currentA1 + bx], al
	 inc Bx
	 loop @@changeA1
	 
	 xor cx, cx
	 mov cl, [Q7A2_Length]
	 mov [currentA2Length], cl
	 mov bx, 0
@@changeA2:
	 mov al, [Q7A2 + bx]
	 mov [currentA2 + bx], al
	 inc Bx
	 loop @@changeA2
	 
	 xor cx, cx
	 mov cl, [Q7A3_Length]
	 mov [currentA3Length], cl
	 mov bx, 0
@@changeA3:
	 mov al, [Q7A3 + bx]
	 mov [currentA3 + bx], al
	 inc Bx
	 loop @@changeA3
	 
	 call WriteQuestion
	 call Write_answers
	 
@@next:
	
	SHOW_MOUSE
	cmp [ForceExit], 1
	je @@progend
	jmp @@next
@@progend:
	HIDE_MOUSE
	mov [ForceExit], 0
	ret
endp lv4st5

proc lv4st6
	call WriteLives
	 
	call WriteLvl
	xor ax, ax
	mov [StageColor], 243
	mov dx, offset FileName5
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName5
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
	;jmp @@ret
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	mov cx, PLAYER_HIGHT
	mov dx, [Yplayer]
	mov di, [Xplayer]
	inc di
	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer], 160
	 ja @@ag
@@ret:	
	ret
endp lv4st6


proc lv5st1
	call WriteLives
	call WriteLvl
	xor ax, ax
	mov al, [PurpleB]
	mov [StageColor], al
	mov dx, offset FileName16
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName16
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
	;jmp @@ret
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	
	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer],0
	 jnz @@ag
	 cmp [Yplayer], 100
	 ja @@ag
@@ret:	
	ret
endp lv5st1

proc lv5st2
	call WriteLives
	call WriteLvl
	xor ax, ax
	mov al, [PurpleB]
	mov [StageColor], al
	mov dx, offset FileName18
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName18
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
		mov cx, 0
	mov dx, 20
	call SetStartPlayer
	mov cx, 51
	mov dx, 100
	 call SetStartBug
	 call SetStartVirus
	 call SetStartChapt3
	mov cx, 269
	 call SetStartbug2
	 call SetStartvirus2
	 call SetStartChapt32
	 
	 call putPlayer
	 call putBug
	 call putVirus
	 call putChapt3
	 call putbug2
	 call putvirus2
	 call putchapt32
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [exitt], 1
	 jz @@exittt
	 cmp [bug1Alive], 0
	 jnz @@con
	 cmp [virus1Alive], 0
	 jnz @@con
	 cmp [chapt31Alive], 0
	 jnz @@con
	 cmp [bug2Alive], 0
	 jnz @@con
	 cmp [virus2Alive], 0
	 jnz @@con
	 cmp [chapt32Alive], 0
	 jnz @@con
	
@@exittt:
	mov ah, 7
	int 21h
	jmp far @@ret
@@con:	
	 cmp [Vshoot], 1
	 jnz @@c31
	 call StartV1shotUD
@@c31:
	 cmp [Bshoot], 1
	 jnz @@c32
	 call StartB1shotRL
@@c32:
	 cmp [Cshoot], 1
	 jnz @@c33
	 call StartCshot
@@c33:
	 cmp [V2shoot], 1
	 jnz @@c34
	 call StartV2shotUD
@@c34:
	 cmp [B2shoot], 1
	 jnz @@c35
	 call StartB2shotRL
@@c35:
	 cmp [C2shoot], 1
	 jnz @@c36
	 call StartC2shot
@@c36:

	 cmp [moveVshots], 1000
	 jnz @@c6
	 push ax
	 call MoveV1ShotUD
	 cmp [playerHit], 1
	 jnz @@nhit1
	 call WriteLives
	 mov [playerHit], 0
@@nhit1:
	 call MoveB1ShotRL
	 cmp [playerHit], 1
	 jnz @@nhit2
	 call WriteLives
	  mov [playerHit], 0
@@nhit2:
	 
	 call MoveCShot
	 cmp [playerHit], 1
	 jnz @@nhit3
	 call WriteLives
	 mov [playerHit], 0
@@nhit3:
	call MoveV2ShotUD
	 cmp [playerHit], 1
	 jnz @@nhit4
	 call WriteLives
	 mov [playerHit], 0
@@nhit4:
	 call MoveB2ShotRL
	 cmp [playerHit], 1
	 jnz @@nhit5
	 call WriteLives
	  mov [playerHit], 0
@@nhit5:
	 call MoveC2Shot
	 cmp [playerHit], 1
	 jnz @@nhit6
	 call WriteLives
	 mov [playerHit], 0
@@nhit6:
	 MOV [moveVshots], 0
	 pop ax
@@c6:
	 cmp [shotShot], 1
	 jnz @@c3
	 call StartShot
	 
	 
	 
	 
@@c3: 
	 cmp [moveshots], 350
	 jnz @@c4
	 cmp [ShotExist], 1
	 jnz @@c4
	 call MoveShot
	 mov [moveshots], 0
;freeze
@@c4:
	 cmp [timeFreeze], 1
	 jnz @@c1
	 cmp [stoper], 60
	 jz @@c5
	 inc [stoper]
	 jmp @@else2
@@c5: 
	inc [froze]
	mov [stoper], 0
	cmp [froze], 50000
	jnz @@jf
	jmp @@njf
@@jf:
	jmp far @@else2
@@njf:
	mov [timeFreeze], 0
@@c1:	 
	 cmp [move], 10000
	 jb @@else1
	 mov [move], 0
	 
	 cmp [bug1Alive], 0
	 jna @@Bdead
	 call MoveB1UD
@@Bdead:
	 cmp [virus1Alive], 0
	 jz @@Vdead
	 call MoveV1LR
@@Vdead:
	 cmp [chapt31Alive], 0
	 jz @@Cdead
	 call MoveC31LURD
@@Cdead:
	 cmp [bug2Alive], 0
	 jz @@Bdead2
	 call MoveB2UD
@@Bdead2:
	 cmp [virus2Alive], 0
	 jz @@Vdead2
	 call MoveV2LR
@@Vdead2:
	 cmp [chapt32Alive], 0
	 jz @@Cdead2
	 call MoveC32LURD
@@Cdead2:
	
	
@@else1:
	 inc [move]
	
@@else2:	 
	 inc [MoveShots]
	 inc [moveVshots]

	 jmp @@ag
		
@@ret:
	ret
endp lv5st2

proc lv5st3
	call WriteLives
	call WriteLvl
	xor ax, ax
	mov al, [PurpleB]
	mov [StageColor], al
	mov dx, offset FileName18
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName18
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
@@cont:
	mov cx, 160
	mov dx, 20
	call SetStartPlayer
	mov cx, 271
	mov dx, 50
	call SetStartBoss
	mov cx, 0
	mov dx, 150
	call SetStartBoss2
	
	call putBOSS
	call putBoss2
	call putPlayer
	 
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	 call CheckKey
	 cmp [boss1Alive], 0
	 ja @@con
	 cmp [boss2Alive], 0
	 ja @@con
@@exittt:
	jmp far @@ret
@@con:	
	 cmp [boss1shoot], 1
	 jnz @@c32
	 call StartBossShots
	 jmp @@c31
@@c32:
	 cmp [boss2shoot], 1
	 jnz @@c31
	 call StartBossShots
@@c31:

	 cmp [moveVshots], 1000
	 jnz @@c6
	 push ax
	 call MoveBossShots
	 cmp [playerHit], 1
	 jnz @@nhit1
	 call WriteLives
	 mov [playerHit], 0
@@nhit1:
	 MOV [moveVshots], 0
	 pop ax
@@c6:
	 cmp [shotShot], 1
	 jnz @@c3
	 call StartShot
	 
	 
	 
	 
@@c3: 
	 cmp [moveshots], 350
	 jnz @@c4
	 cmp [ShotExist], 1
	 jnz @@c4
	 call MoveShot
	 mov [moveshots], 0
;freeze
@@c4:
	 cmp [timeFreeze], 1
	 jnz @@c1
	 cmp [stoper], 60
	 jz @@c5
	 inc [stoper]
	 jmp @@else2
@@c5: 
	inc [froze]
	mov [stoper], 0
	cmp [froze], 50000
	jnz @@jf
	jmp @@njf
@@jf:
	jmp far @@else2
@@njf:
	mov [timeFreeze], 0
@@c1:	 
	 cmp [move], 10000
	 jb @@else1
	 mov [move], 0
	 
	 call MoveBosses

	
	
	
@@else1:
	 inc [move]
	
@@else2:	 
	 inc [MoveShots]
	 inc [moveVshots]

	 jmp @@ag
		
@@ret:
	ret
endp lv5st3

proc lv5st4
	call WriteLives
	call WriteLvl
	xor ax, ax
	mov [StageColor], 243
	mov dx, offset FileName17
	mov [BmpLeft],0
	mov [BmpTop],20
	mov [BmpWidth], 320
	mov [BmpHeight] ,180
	

	mov dx, offset FileName17
	call OpenShowBmp
	cmp [ErrorFile],1
	jne @@cont 
	;jmp @@ret
@@cont:
	
	mov cx, 304
	mov dx, 100
	call SetStartPlayer
	call putPlayer
@@ag:
	cmp [playerAlive], 0
	jnz @@ndead
	jmp far exit
@@ndead:
	mov cx, PLAYER_HIGHT
	mov dx, [Yplayer]
	mov di, [Xplayer]
	inc di

	 call CheckKey
	 cmp [exitt], 1
	 jz @@ret
	 cmp [Xplayer], 160
	 ja @@ag
@@ret:	
	ret
endp lv5st4


;*************************************
;proc info:
;input: none
;output: none
;register usge: dx, ax
;functionality:
;the proc expects: FileName10 to contain the file name
;*************************************
proc gameStart
	mov dx, offset FileName10
	mov [BmpLeft],0
	mov [BmpTop],0
	mov [BmpWidth], 320
	mov [BmpHeight] ,200
	

	mov dx, offset FileName10
	call OpenShowBmp
	 
	 mov ah, 7
	 int 21h
	ret
endp gameStart

END start


;*************************************
;proc info:
;input:
;output:
;register usge:
;functionality:
;the proc expects: 
;*************************************