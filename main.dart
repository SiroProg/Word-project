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

  String reverseVowels() {
    List<String> reverseList = [];
    List<String> resultList = word.split('');
    String result = '';
    for (String i in resultList) {
      if (RegExp(r'[aeiou]').hasMatch(i)) {
        reverseList.add(i);
        resultList[resultList.indexOf(i)] = '-';
      }
    }
    resultList.forEach((element) {
      if (element == '-') {
        result += reverseList.last.toString();
        reverseList.removeLast();
      } else {
        result += element;
      }
    });
    return result;
  }

  @override
  bool operator ==(Object? other) {
    return other is Word && other.word == word;
  }

  @override
  int get hashCode => word.hashCode;

  @override
  String toString() => 'Word(word: $word)';

  Word copyWith({String? word}) {
    return Word(word ?? this.word);
  }

  @override
  noSuchMethod(Invocation invocation) {
    throw Exception('${invocation.memberName} - dont have this metod!');
  }
}
