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
; ===== Etapa 1: Ativar autoclicks por 15s =====
Send, 9
startTime := A_TickCount

Loop {
    if (!toggle)
        return

    Click ; botão esquerdo
    if ((A_TickCount - startTime) >= 1500 * (rightCount := Mod((A_TickCount - startTime) // 1000, 16))) {
        Click, right ; botão direito a cada 1 segundo
    }

    Sleep, 10

    if ((A_TickCount - startTime) >= 600000)
        break
}

; ===== Etapa 2: Parar autoclicks e executar ações =====
; (Nada pra desligar explicitamente, pois é controlado pelo loop acima)

Send, 1
Sleep, 300
Click, right
Sleep, 500
MouseMove, 0, -75, 0, R
Sleep, 300
Click, right
Sleep, 300
Send, 9
Sleep, 300

; Recomeça o ciclo
return
