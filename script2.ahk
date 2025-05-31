toggle := false
cycleCount := 0
specialActionToggle := 0
return

F7:: ; Iniciar macro
toggle := true
SetTimer, MacroLoop, 10
return

F8:: ; Parar macro
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
}
Send, {d up}

; ======== Pressionar A com autoclick ========
Send, {a down}
startTime := A_TickCount
while (A_TickCount - startTime < 3300) {
    if (!toggle)
        break
    Click
}
Send, {a up}

cycleCount += 1

if (cycleCount >= 3) {
    ; ======== Extra ida para direita ========
    Send, {d down}
    startTime := A_TickCount
    didSpecial := false

    while (A_TickCount - startTime < 3300) {
        if (!toggle)
            break
        Click

        ; Executa a ação especial apenas se for a vez correta e ainda não executou
        if (!didSpecial && specialActionToggle = 0 && A_TickCount - startTime < 100) {
            Send, 9
            Sleep, 30
            Click, right
            didSpecial := true
        }
    }
    Send, {d up}

    ; ======== Sequência especial ========
    Send, 2
    Sleep, 50
    Click, right
    Sleep, 500
    MouseMove, 0, -50, 0, R
    Sleep, 50
    Click, right
    Sleep, 20

    ; Alterna a flag da ação especial para fazer 1 vez a cada 2 voltas
    specialActionToggle := !specialActionToggle

    ; Resetar ciclo
    cycleCount := 0
}
return