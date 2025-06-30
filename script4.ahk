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
    if (A_TickCount - startTime >= 602000) ; <-- Está com valor de 10,2 segundos, se quiser 10 minutos, troque por 600000
        break
}

; ===== Ações após tempo definido =====
Send, 1
Sleep, 100
Click, right
Sleep, 100

; Movimento pra cima (50px)
CoordMode, Mouse, Screen
MouseGetPos, startX, startY
MouseMove, startX, startY - 50, 10
Sleep, 100
Click, right
Sleep, 100

; Volta pra tecla 9
Send, 9
Sleep, 100

; ===== Novo bloco: autoclick rápido por 1 segundo =====
startAuto := A_TickCount
While (A_TickCount - startAuto < 6000) {
    Click
    Sleep, 10
}

; ===== Sequência da /loja =====
Send, t
Sleep, 200
Send, /loja
Sleep, 100
Send, {Enter}
Sleep, 100

; 1º movimento e clique
MouseGetPos, x, y
MouseMove, x, y - 50, 10
Sleep, 100
Click
Sleep, 100

; 2º movimento
MouseMove, x, y - 100, 10
Sleep, 100

; Três cliques com intervalo de 200ms (corrigido para não repetir movimento)
Loop, 3 {
    MouseMove, x, y - 50, 10
    Click
    Sleep, 200
}

; Pressiona ESC uma vez
Send, {Esc}
Sleep, 100

; Reinicia ciclo automaticamente
return