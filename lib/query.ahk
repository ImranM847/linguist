query(prompt = "") {
  Gui, +AlwaysOnTop +LastFound +OwnDialogs
  InputBox, query,, %prompt%,,, 123
  Send, !{Esc}
  return [query, ErrorLevel]
}