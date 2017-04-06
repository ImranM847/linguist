read() {
  Send, ^c
  Sleep, 500
  tr := GoogleTranslate(Clipboard, "en")
  if % tr
    EditBox(tr[1],,,, "Resize MaximizeBox Minsize375x189", "VScroll W355 H169")
}