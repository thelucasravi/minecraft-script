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
turnCount++

; Etapa 1: Anda com D + autoclick por 3,72s
Send, {d down}
startTime := A_TickCount
while (A_TickCount - startTime < 3720) {
    Click
    Sleep, 50
}
Send, {d up}

; Etapa 2: Gira a câmera 90 graus
MouseMove, 600, 0, 0, R
Sleep, 500

; Se for o 5º ciclo, executa a ação especial
if (turnCount = 5) {
    ; Etapa 3: Executa ação especial
    Send, 9
    Sleep, 200

    Click, Right
    Sleep, 1000  ; Espera 1 segundo

    MouseMove, 0, -50, 0, R
    Sleep, 200

    Click, Left
    Sleep, 200

    ; Retoma o autoclick e o movimento normal
    Send, {d down}
    startTime := A_TickCount
    while (A_TickCount - startTime < 3720) {
        Click
        Sleep, 50
    }
    Send, {d up}

    ; Gira a câmera novamente
    MouseMove, 600, 0, 0, R
    Sleep, 500

    ; Reinicia contador
    turnCount := 0
}

return
