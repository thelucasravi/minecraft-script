toggle := false
cycleCount := 0
rightCount := 0
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

; ======== Pressionar D com autoclick + ação 9 + botão direito ========
rightCount += 1
Send, {d down}
startTime := A_TickCount
didAction := false

while (A_TickCount - startTime < 3300) {
    if (!toggle)
        break

    ; Executa 9 + clique direito uma vez no início do movimento
    if (!didAction && A_TickCount - startTime > 100) {
        Send, 9
        Sleep, 30
        Click, right
        didAction := true
    }

    Click
    Sleep, 50
}
Send, {d up}
Sleep, 100

; ======== Pressionar A com autoclick + ação 9 + botão direito ========
Send, {a down}
startTime := A_TickCount
didAction := false

while (A_TickCount - startTime < 3300) {
    if (!toggle)
        break

    ; Executa 9 + clique direito uma vez no início do movimento
    if (!didAction && A_TickCount - startTime > 100) {
        Send, 9
        Sleep, 30
        Click, right
        didAction := true
    }

    Click
    Sleep, 50
}
Send, {a up}
Sleep, 100

cycleCount += 1

if (cycleCount >= 3) {
    ; ======== Extra ida para direita (sem ação 9) ========
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

    ; ======== Sequência especial ========
    Send, 2
    Sleep, 50
    Click, right
    Sleep, 500
    MouseMove, 0, -50, 0, R
    Sleep, 50
    Click, right
    Sleep, 20

    ; Pressionar 9 após o último clique direito
    Sleep, 30
    Send, 9

    ; Resetar contadores
    cycleCount := 0
    rightCount := 0
}
return
