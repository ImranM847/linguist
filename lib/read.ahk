read() {
  Send, ^c
  Sleep, 500
  Loop, 3 {
    tr := GoogleTranslate(Clipboard, "en")
    if % tr && tr[1] != "" {
      EditBox(tr[1],,,, "Resize MaximizeBox Minsize375x189", "VScroll W355 H169")
      break
    }
  }
}