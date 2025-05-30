#Persistent
#SingleInstance Force
SetTitleMatchMode, 2

; Caminho da imagem do dragão
imagePath := "C:\macro\dragao.png"

; Inicializa toggle e contador
macroAtivo := false
loopCount := 0

; GUI Principal
Gui, +AlwaysOnTop +SysMenu +ToolWindow  ; Barra normal com botão fechar
Gui, Font, s12 Bold cWhite, Segoe UI
Gui, Color, 1E1E1E

; Texto verde no topo, para simular título colorido
Gui, Font, s14 Bold c00FF00, Segoe UI
Gui, Add, Text, x10 y10 w270 h30 vTituloText, Macro Minecraft

; Ícone dragão ao lado do texto título
Gui, Add, Picture, x290 y10 w40 h40 vIcone, %imagePath%

; Status texto abaixo do título
Gui, Font, s12 Bold cWhite
Gui, Add, Text, x10 y60 w300 h40 vStatusText, ❌ Macro Desativado

; Botão ativar/desativar macro
Gui, Font, s10 Bold
Gui, Add, Button, x20 y110 w240 h40 gToggleMacro vToggleButton, Ativar Macro

Gui, Show,, Macro Minecraft
return

ToggleMacro:
macroAtivo := !macroAtivo

if (macroAtivo) {
    GuiControl,, StatusText, ✅ Macro Ativado
    GuiControl,, ToggleButton, Desativar Macro
    Gui, Hide
    SetTimer, MacroLoop, 0
} else {
    GuiControl,, StatusText, ❌ Macro Desativado
    GuiControl,, ToggleButton, Ativar Macro
    SetTimer, MacroLoop, Off
}
return

MacroLoop:
; Pressiona D
Send, {d down}
startTime := A_TickCount

; Determina se deve clicar com o botão direito na 1ª e 3ª volta
fazerCliqueEspecial := (loopCount = 0 || loopCount = 2)

while (A_TickCount - startTime < 3520) {
    if (fazerCliqueEspecial && (A_TickCount - startTime > 1500) && (A_TickCount - startTime < 1600)) {
        Click, right
        Sleep, 50
        fazerCliqueEspecial := false
    } else {
        Click
    }
    Sleep, 50
}

; Solta D
Send, {d up}

loopCount++

if (loopCount < 4) {
    MouseMove, 600, 0, 0, R
    Sleep, 500
    return
}

; Após 4 voltas, executa interação especial
MouseMove, 600, 0, 0, R
Sleep, 500
Send, 9
Sleep, 100
Click, right
Sleep, 1000
MouseMove, 0, -100, 10, R
Sleep, 100
Click
Sleep, 200
Send, 5

; Reinicia contagem
loopCount := 0
return

; Tray Menu
Menu, Tray, NoStandard
Menu, Tray, Add, Mostrar Macro, ShowGUI
Menu, Tray, Add, Sair, ExitApp
Menu, Tray, Tip, Macro Minecraft
return

ShowGUI:
Gui, Show
return

ExitApp:
ExitApp
