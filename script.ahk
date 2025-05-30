#Persistent
#SingleInstance Force

toggle := false
turnCount := 0

Gui, Add, Text, vStatusText w200 Center, 🟥 Macro Desativado
Gui, Add, Button, gToggleMacro w200, Ativar / Desativar Macro
Gui, Show, w220 h100, Macro Minecraft

return

ToggleMacro:
toggle := !toggle
if (toggle) {
    GuiControl,, StatusText, 🟩 Macro Ativado
    SetTimer, MacroLoop, 0
} else {
    GuiControl,, StatusText, 🟥 Macro Desativado
    SetTimer, MacroLoop, Off
}
return

GuiClose:
ExitApp

MacroLoop:
turnCount++

; Anda com D + autoclick (com clique direito na 1ª e 3ª volta)
Send, {d down}
startTime := A_TickCount
rightClickDone := false
while (A_TickCount - startTime < 3706) {
    if (!rightClickDone && (turnCount = 1 || turnCount = 3) && A_TickCount - startTime >= 1500) {
        Click, Right
        rightClickDone := true
    }
    Click
    Sleep, 50
}
Send, {d up}

; Gira a câmera
MouseMove, 600, 0, 0, R
Sleep, 500

; Se for a 5ª volta
if (turnCount = 5) {
    ; Abre o menu e interage
    Send, 9
    Sleep, 200
    Click, Right
    Sleep, 1000
    MouseMove, 0, -100, 0, R
    Sleep, 200
    Click, Left
    Sleep, 200
    Send, 5
    Sleep, 200

    ; Anda novamente (sem clique direito aqui)
    Send, {d down}
    startTime := A_TickCount
    while (A_TickCount - startTime < 3706) {
        Click
        Sleep, 50
    }
    Send, {d up}
    MouseMove, 600, 0, 0, R
    Sleep, 500
    turnCount := 0
}

return
