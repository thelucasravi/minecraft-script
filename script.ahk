#Persistent
#SingleInstance Force
SetTitleMatchMode, 2
toggle := false

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
; Anda para a direita (D)
Send, {d down}

clicking := true

Loop
{
    if (!clicking)
        break
    Click
    Sleep, 50  ; Velocidade do auto click, ajuste se quiser mais rápido/lento
}
return

; Aguarda os 3,72 segundos durante o loop de clique
Sleep, 3720

; Para movimento e clique
Send, {d up}
clicking := false

; Gira a tela 90 graus para a direita
MouseMove, 600, 0, 0, R
Sleep, 500

return