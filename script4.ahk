toggle := false
return

F7:: ; Tecla para ativar/desativar
toggle := !toggle

if (toggle) {
    SetTimer, MainLoop, 10
} else {
    SetTimer, MainLoop, Off
}
return

MainLoop:
; ===== Etapa 1: Ativar autoclicks por 10 minutos =====
Send, 9
startTime := A_TickCount
lastRightClick := A_TickCount

Loop {
    if (!toggle)
        return

    Click ; botão esquerdo (autoclick)

    ; Clique direito a cada 2 segundos
    if (A_TickCount - lastRightClick >= 2000) {
        Click, right
        lastRightClick := A_TickCount
    }

    Sleep, 10

    ; Sai após 10 minutos (600.000 ms)
    if (A_TickCount - startTime >= 1080000)
        break
}

; ===== Etapa 2: Pausa e ações =====
Send, 1
Sleep, 50
Click, right
Sleep, 100
MouseMove, 0, -50, 0, R
Sleep, 100
Click, right
Sleep, 100

; Reinicia ciclo automaticamente
return
