read() {
  Clipboard =
  Send, ^c
  ClipWait, 0.5
  Loop, 3 {
    tr := GoogleTranslate(Clipboard)
    if % !tr
      break
    if % tr[1] != "" {
      EditBox(tr[1] . (tr[3] == "" ? "" : "`n`n" . tr[3]),,,, "Resize MaximizeBox Minsize375x189 AlwaysOnTop", "VScroll W355 H169")
      break
    }
  }
}