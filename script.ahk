#Persistent
#SingleInstance Force
SetTitleMatchMode, 2
toggle := false
turnCount := 0

F7::
toggle := !toggle

if (toggle) {
    TrayTip, Macro Minecraft, 🟢 Macro Ativado, 5
    SetTimer, MacroLoop, 0
} else {
    TrayTip, Macro Minecraft, 🔴 Macro Desativado, 5
    SetTimer, MacroLoop, Off
}
return

MacroLoop:
; Verifica se é o 5º ciclo
turnCount++
if (turnCount = 5) {
    ; Vira a câmera
    MouseMove, 600, 0, 0, R
    Sleep, 300

    ; Executa ação especial
    Send, 9
    Sleep, 200

    Click, Right
    Sleep, 200

    MouseMove, 0, -30, 0, R
    Sleep, 100

    Click, Left
    Sleep, 200

    ; Reinicia o contador
    turnCount := 0
} else {
    ; Pressiona D e faz autoclick por 3,72s
    Send, {d down}
    startTime := A_TickCount
    while (A_TickCount - startTime < 3720) {
        Click
        Sleep, 50
    }
    Send, {d up}

    ; Gira a câmera para a direita
    MouseMove, 600, 0, 0, R
    Sleep, 500
}

return
