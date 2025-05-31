toggle := false
return

F7:: ; Tecla para iniciar o macro
toggle := true
SetTimer, MacroLoop, 10
return

F8:: ; Tecla para parar o macro
toggle := false
SetTimer, MacroLoop, Off
Send, {d up}
Send, {a up}
return

MacroLoop:
if (!toggle)
    return

; Pressiona D com autoclick por 3,4 segundos
Send, {d down}
start := A_TickCount
while (A_TickCount - start < 3300) {
    Click
    Sleep, 50
}
Send, {d up}

Sleep, 100

; Pressiona A com autoclick por 3,4 segundos
Send, {a down}
start := A_TickCount
while (A_TickCount - start < 3300) {
    Click
    Sleep, 50
}
Send, {a up}

Sleep, 100
return
