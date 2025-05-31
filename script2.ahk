toggle := false
cycleCount := 0
return

F7:: ; Iniciar
toggle := true
SetTimer, MacroLoop, 10
return

F8:: ; Parar
toggle := false
SetTimer, MacroLoop, Off
Send, {d up}
Send, {a up}
return

MacroLoop:
if (!toggle)
    return

; ======== Pressionar D com autoclick ========
Send, {d down}
startTime := A_TickCount
while (A_TickCount - startTime < 3300) {
    if (!toggle)
        break
    Click
    Sleep, 50
}
Send, {d up}
Sleep, 100

; ======== Pressionar A com autoclick ========
Send, {a down}
startTime := A_TickCount
while (A_TickCount - startTime < 3300) {
    if (!toggle)
        break
    Click
    Sleep, 50
}
Send, {a up}
Sleep, 100

; ======== Contador de ciclos ========
cycleCount += 1
if (cycleCount >= 3) {
    cycleCount := 0

    ; ======== Sequência especial ========
    Send, 9
    Sleep, 50
    Click, right
    Sleep, 50
    Send, 2
    Sleep, 50
    Click, right

    ; Espera 0.5s antes de mover o mouse
    Sleep, 500
    MouseMove, 0, -50, 0, R
    Sleep, 50
    Click, right
    Sleep, 20
}
return
