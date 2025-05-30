#Persistent
#SingleInstance Force
SetTitleMatchMode, 2
toggle := false
turnCount := 0

F7::
toggle := !toggle

if (toggle) {
    TrayTip, Macro Minecraft, Macro Ativado, 5
    SetTimer, MacroLoop, 0
} else {
    TrayTip, Macro Minecraft, Macro Desativado, 5
    SetTimer, MacroLoop, Off
}
return

MacroLoop:
turnCount++

; Etapa 1: Anda com D + autoclick por 3,4s
Send, {d down}
startTime := A_TickCount
rightClickDone := false
while (A_TickCount - startTime < 3400) {
    if (!rightClickDone && (turnCount = 1 || turnCount = 3) && A_TickCount - startTime >= 1500) {
        Click, Right
        rightClickDone := true
    }
    Click
    Sleep, 50
}
Send, {d up}

; Etapa 2: Gira a câmera 90 graus
MouseMove, 600, 0, 0, R
Sleep, 500

; Etapa 3: Se for o 5º ciclo, executa ação especial
if (turnCount = 5) {
    ; Abre menu com tecla 2
    Send, 2
    Sleep, 200

    ; Clica com botão direito
    Click, Right
    Sleep, 1000

    ; Move mouse para cima e clica com botão esquerdo
    MouseMove, 0, -50, 0, R
    Sleep, 200
    Click, Left
    Sleep, 200

    ; Pressiona tecla 9
    Send, 9
    Sleep, 200

    ; Retoma autoclick + movimento (sem giro final)
    Send, {d down}
    startTime := A_TickCount
    while (A_TickCount - startTime < 3400) {
        Click
        Sleep, 50
    }
    Send, {d up}

    ; Reinicia o contador
    turnCount := 0
}

return
