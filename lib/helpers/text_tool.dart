class TextTool {
  static String breakLine(String text) {
    if(text.length < 50) {
      return text;
    }
    return text.replaceRange(49, text.length, '...');
  }
}