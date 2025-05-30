#Persistent
#SingleInstance Force
SetTitleMatchMode, 2

; Caminho da imagem do dragão
imagePath := "C:\Users\lucas\OneDrive\Área de Trabalho\macrofarmredemastery\dragao.png"

; Inicializa toggle e contador
macroAtivo := false
loopCount := 0

; GUI Principal
Gui, +AlwaysOnTop -SysMenu +ToolWindow
Gui, Font, s12 Bold cWhite, Segoe UI
Gui, Color, 1E1E1E
Gui, Add, Picture, x10 y10 w40 h40 vIcone, %imagePath%
Gui, Add, Text, x60 y10 w300 h40 vStatusText, ❌ Macro Desativado
Gui, Font, s10 Bold
Gui, Add, Button, x20 y60 w240 h40 gToggleMacro vToggleButton, Ativar Macro
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