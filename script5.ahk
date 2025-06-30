toggleKit := false
return

F7:: ; Ativa ou desativa o macro do /kit senzu
toggleKit := !toggleKit

if (toggleKit) {
    SetTimer, KitMacro, 605000 ; Executa a cada 10 minutos (605000 ms)
    ToolTip, 🟢 Macro /kit senzu ATIVADO
} else {
    SetTimer, KitMacro, Off
    ToolTip, 🔴 Macro /kit senzu DESATIVADO
}

SetTimer, RemoveToolTip, -1500 ; Remove após 1,5s
return

KitMacro:
Send, t
Sleep, 200
Send, /kit senzu
Sleep, 100
Send, {Enter}
return

RemoveToolTip:
ToolTip
return
