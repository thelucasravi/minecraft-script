#Persistent
#SingleInstance Force

toggle := false

,::
toggle := !toggle
if (toggle) {
    Send, {w down}
    TrayTip, Macro Minecraft, Andando para frente..., 3
} else {
    Send, {w up}
    TrayTip, Macro Minecraft, Parou de andar., 3
}
return
