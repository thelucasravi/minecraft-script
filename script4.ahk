toggle := false
return

F7:: ; Ativa ou desativa o macro
toggle := !toggle

if (toggle) {
    SetTimer, MainLoop, 10
} else {
    SetTimer, MainLoop, Off
}
return

MainLoop:
; ===== Início do ciclo =====
Send, 9
startTime := A_TickCount
lastRightClick := A_TickCount

Loop {
    if (!toggle)
        return

    ; Clique esquerdo constante
    Click

    ; Clique direito a cada 2 segundos
    if (A_TickCount - lastRightClick >= 2000) {
        Click, right
        lastRightClick := A_TickCount
    }

    Sleep, 10

    ; Dura 10 minutos (600000 ms)
    if (A_TickCount - startTime >= 600000)
        break
}

; ===== Ações após 10 minutos =====
Send, 1
Sleep, 100
Click, right
Sleep, 100

; Movimento pra cima (50px)
CoordMode, Mouse, Screen
MouseGetPos, x, y
MouseMove, x, y - 50, 10
Sleep, 100

Click, right
Sleep, 100
Send, 9

; Reinicia ciclo automaticamente
return
