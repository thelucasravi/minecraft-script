toggleKit := false
return

F7:: ; Ativa ou desativa o macro do /kit senzu
toggleKit := !toggleKit

if (toggleKit) {
    SetTimer, KitMacro, 10000 ; Executa a cada 10 segundos
} else {
    SetTimer, KitMacro, Off
}
return

KitMacro:
Send, t
Sleep, 200
Send, /kit senzu
Sleep, 100
Send, {Enter}
return
