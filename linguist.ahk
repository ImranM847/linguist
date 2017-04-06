#Include, <read>
#Include, <translate>
#NoEnv
#SingleInstance, Force
return

~MButton::
  protectClipboard("read")
return

:*:/tr::
  protectClipboard("translate")
return