class TextTool {
  static String breakLine(String text) {
    if(text.length < 30) {
      return text;
    }
    return text.replaceRange(29, text.length, '...');
  }
}