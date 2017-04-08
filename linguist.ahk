#Include, <read>
#Include, <translate>
#NoEnv
#SingleInstance, Force
return

~*MButton::
  KeyWait, MButton, T0.5
  if % ErrorLevel
    protectClipboard("read")
return

:*:/tr::
  protectClipboard("translate")
return

