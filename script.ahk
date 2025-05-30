#Requires AutoHotkey v1.1+
#Persistent
#SingleInstance Force
SetTitleMatchMode, 2
Menu, Tray, Icon

; Caminho da imagem
imgPath := "C:\Users\lucas\OneDrive\Área de Trabalho\macrofarmredemastery\dragao.png"

Gui, +AlwaysOnTop -SysMenu +ToolWindow
Gui, Font, s10 cWhite, Segoe UI
Gui, Color, 0x1E1E1E

Gui, Add, Picture, x10 y10 w40 h40 vStatusImg, %imgPath%
Gui, Add, Text, x60 y15 vStatusText cWhite Bold, 🛑 Macro Desativado
Gui, Add, Button, x20 y60 w240 h40 gToggleMacro vToggleBtn, ▶ Ativar Macro

Gui, Show, w280 h120, Macro Minecraft
return

ToggleMacro:
toggle := !toggle

if (toggle) {
    GuiControl,, StatusText, ✅ Macro Ativado
    GuiControl,, ToggleBtn, ⏸ Desativar Macro
    WinMinimize, Macro Minecraft
    TrayTip, Macro Minecraft, Macro Ativado, 5
    SetTimer, MacroLoop, 0
} else {
    GuiControl,, StatusText, 🛑 Macro Desativado
    GuiControl,, ToggleBtn, ▶ Ativar Macro
    TrayTip, Macro Minecraft, Macro Desativado, 5
    SetTimer, MacroLoop, Off
}
return

MacroLoop:
; Exemplo de macro
Send, {d down}
Sleep, 3520
Send, {d up}
return

GuiClose:
ExitApp
