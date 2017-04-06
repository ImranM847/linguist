query(prompt = "") {
  InputBox, query,, %prompt%,,, 123
  return [query, ErrorLevel]
}