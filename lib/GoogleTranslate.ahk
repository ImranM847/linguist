; dependency on UriEncode
; https://cloud.google.com/translate/docs/languages for langOut and langIn
GoogleTranslate(query, langOut = "en", langIn = "auto") {
  url := "https://translate.google.com.tw/#" . langIn . "/" . langOut . "/" . UriEncode(query, "!'()*-._~")
  ; https://support.microsoft.com/en-us/help/208427/maximum-url-length-is-2,083-characters-in-internet-explorer
  if % StrLen(url) >= 2084 {
    MsgBox, % 16 + 4096,, % "Error: The maximum url length allowed for Navigate is 2083 characters. Entered url length is " . StrLen(url) . "."
    return false
  }
  ie := ComObjCreate("InternetExplorer.Application")
  ; ie.Visible := true
  ie.Navigate(url)
  while % ie.readyState != 4 || ie.document.readyState != "complete" || ie.busy
    Sleep, 50
  translationOut := ie.document.getElementbyId("result_box").innerText
  transcriptionOut := ie.document.getElementById("res-translit").innerText
  transcriptionIn := ie.document.getElementById("src-translit").innerText
  ie.Quit
  return [translationOut, transcriptionOut, transcriptionIn]
}