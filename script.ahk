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
; Pressiona D
Send, {d down}

; Tempo total de movimento: 3720 ms
startTime := A_TickCount
while (A_TickCount - startTime < 3720) {
    Click
    Sleep, 50  ; Ajuste a velocidade do autoclick aqui
}

; Solta D
Send, {d up}

; Gira a câmera para a direita (ajuste o valor se necessário)
MouseMove, 600, 0, 0, R
Sleep, 500  ; Pequeno intervalo antes de repetir

return
