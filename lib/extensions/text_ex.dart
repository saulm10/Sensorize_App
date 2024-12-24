extension TextEx on String {
  String getInitials() {
    List<String> words = trim().split(' ');

    if (words.length < 2) {
      return words[0][0].toUpperCase() + words[0][1].toUpperCase();
    } else {
      return words[0][0].toUpperCase() + words[1][0].toUpperCase();
    }
  }
}
