toggle := false
cycleCount := 0
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

; Pressiona D com autoclick por 3,3 segundos
Send, {d down}
start := A_TickCount
while (A_TickCount - start < 3300) {
    Click
    Sleep, 50
}
Send, {d up}
Sleep, 100

; Pressiona A com autoclick por 3,3 segundos
Send, {a down}
start := A_TickCount
while (A_TickCount - start < 3300) {
    Click
    Sleep, 50
}
Send, {a up}
Sleep, 100

; Incrementa o contador de ciclos
cycleCount++

if (cycleCount >= 3) {
    cycleCount := 0

    ; Executa a sequência após 3 idas e voltas
    Send, 9
    Click, right
    Sleep, 50
    Send, 2
    Click, right
    Sleep, 50
    MouseMove, 0, -50, 0, R
    Click, right
    Sleep, 20
}
return
