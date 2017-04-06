translate() {
  query := query("<ISO-639-1 Code>!@<Query>")
  if % query[2] == 0 && InStr(query[1], "!@") {
    Array := StrSplit(query[1], "!@")
    tr := GoogleTranslate(Array[2], Array[1])
    if % tr {
      Clipboard := tr[1] . (tr[2] != "" ? " " . tr[2] : "")
      paste()
    }
  }
}