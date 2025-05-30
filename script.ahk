#Persistent
#SingleInstance Force
SetTitleMatchMode, 2

toggle := false
turnCount := 0

dragaoPath := A_ScriptDir . "C:\Users\lucas\OneDrive\Área de Trabalho\macrofarmredemastery\dragao.png"  ; Caminho da imagem

; GUI moderna com imagem
Gui, +AlwaysOnTop -SysMenu +MinimizeBox
Gui, Color, 1E1E1E
Gui, Font, s12 Bold, Segoe UI

Gui, Add, Picture, x10 y10 w32 h32 vIconImg, %dragaoPath%
Gui, Add, Text, x50 y10 w200 h30 cFFFFFF vStatusText, Macro Desativado

Gui, Font, s11 Bold, Segoe UI
Gui, Add, Button, x10 y50 w240 h40 gToggleMacro cFFFFFF Background2ECC71 vToggleButton, Ativar Macro

Gui, Show, w260 h110, Macro Minecraft
return

ToggleMacro:
toggle := !toggle

if (toggle) {
    GuiControl,, StatusText, Macro Ativado
    GuiControl,, ToggleButton, Desativar Macro
    Gui, Minimize
    SetTimer, MacroLoop, 0
} else {
    GuiControl,, StatusText, Macro Desativado
    GuiControl,, ToggleButton, Ativar Macro
    Gui, Show
    SetTimer, MacroLoop, Off
}
return

GuiClose:
ExitApp

MacroLoop:
turnCount++

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

MouseMove, 600, 0, 0, R
Sleep, 500

if (turnCount = 5) {
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
