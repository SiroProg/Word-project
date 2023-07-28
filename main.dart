class Word {
  String _word;

  String get word => _word;
  set word(String text) {
    try {
      if (RegExp(r'[a-z]').hasMatch(text)) {
        _word = text;
        return;
      }
      throw Exception('Invalid word!');
    } catch (e) {
      print(e);
    }
  }

  Word(this._word);

  factory Word.replace({required String newWord}) {
    try {
      if (!RegExp(r'[A-Z0-9]').hasMatch(newWord)) {
        return Word(newWord);
      }
      throw Exception('InvalidWord');
    } catch (e) {
      throw e;
    }
  }
}
