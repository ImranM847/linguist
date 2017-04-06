protectClipboard(func) {
  if % IsFunc(func) {
    ClipSaved := ClipboardAll
    %func%()
    Clipboard := ClipSaved
    ; ClipSaved =
  } else {
    MsgBox, % 16 + 4096,, Error: The function "%func%" does not exist in the script. Exiting application.
    ExitApp
  }
}