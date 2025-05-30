#Persistent
#SingleInstance Force
SetTitleMatchMode, 2
toggle := false

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
; Anda para a direita (D)
Send, {d down}
Sleep, 3800
Send, {d up}

; Gira a tela 90 graus para a direita (ajuste o valor conforme necessário)
; Exemplo: move o mouse 300 pixels para a direita
MouseMove, 500, 0, 0, R
Sleep, 500

return
