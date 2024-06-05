; Сохраняем начальное имя файла
InitialFileName := A_AutoSignal A_Now
RandomFileName := "STALCRAFT-DATA,,,,,,,,,,,,," . A_Now


; Генерируем случайное число для нового имени файла

Result := "Finish"

loopActive = false ; 
F5::
  InitialFileName := A_AutoSignal
  FileMove, %A_ScriptFullPath%, %A_ScriptDir%\%InitialFileName%.ahk
  MsgBox, %Result%
  ExitApp
F4::
  loopActive = true
  SetTimer, AutoSignal, On ; 
  
return

F3::
  
  loopActive = false ; 
  SetTimer, AutoSignal, Off
  
return

AutoSignal:
  if (loopActive) ; 
  { 
    RandomFileName := "STALCRAFT-DATA,,,,,,,,,,,,," . A_Now
    FileMove, %A_ScriptFullPath%, %A_ScriptDir%\%RandomFileName%.ahk
    
    Send, {x}
    Sleep, 100
    MouseMove, nX, nY
    Click
    CoordMode, Mouse, Screen
    x = 689
    y = 406
    nX = 1087
    nY = 810
    PixelGetColor, targetColor, %x%, %y%
    Sleep, 100
    
    PixelGetColor, currentColor, %x%, %y%

    if (currentColor != targetColor)
    {
      PixelGetColor, S, %x%, %y%
      PixelGetColor, F, %x%, %y%
      
      newX = 1354
      newY = 793
      X = 635
      Y = 580
      MouseMove, newX, newY
      Click
      Sleep, 10500
      Click
      MouseMove, X, Y
      Click
      if (S != F)
      {
      SetTimer, AutoSignal, Off ; 
      SetTimer, AutoSignal, On ; 
      }
      loopActive = false ; 
      SetTimer, AutoSignal, Off ; 
    }
    else
    {
      Sleep, 100
      Send, {x}
      
    }
  }

return
