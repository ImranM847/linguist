translate() {
  query := query("<ISO-639-1 Code>!@<Query>")
  if % query[2] == 0 && InStr(query[1], "!@") {
    Array := StrSplit(query[1], "!@")
    if % Array[1] != "" && Array[2] != "" {
      Loop, 3 {
        tr := GoogleTranslate(Array[2], Array[1])
        if % !tr
          break
        if % tr[1] != "" {
          Clipboard := tr[1] . (tr[2] != "" ? " " . tr[2] : "")
          paste()
          break
        }
      }
    }
  }
}