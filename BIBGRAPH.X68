SET_PEN_COLOR:
    MOVE #80,D0
    TRAP #15
    RTS

SET_FILL_COLOR:
    MOVE #81,D0
    TRAP #15
    RTS

DRAW_PIX:
    MOVE #82,D0
    TRAP #15
    RTS
    
GET_PIX_COLOR:
    MOVE #83,D0
    TRAP #15
    RTS
    
DRAW_LINE:
    MOVE #84,D0
    TRAP #15
    RTS
 
DRAW_TO:
    MOVE #85,D0
    TRAP #15
    RTS
    
MOVE_TO:
    MOVE #86,D0
    TRAP #15
    RTS
 
DRAW_FILL_RECT:
    MOVE #87,D0
    TRAP #15
    RTS
    
DRAW_FILL_ELLIPSE:
    MOVE #88,D0
    TRAP #15
    RTS
    
POT_DE_PEINTURE:
    MOVE #89,D0
    TRAP #15
    RTS
    
DRAW_STRING:
    MOVE #95,D0
    TRAP #15
    RTS

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
