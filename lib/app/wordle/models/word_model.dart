import 'package:equatable/equatable.dart';
import 'package:wordle_flutter/app/wordle/wordle.dart';


class Word extends Equatable {
  const Word({
    required this.letters
  });

  factory Word.fromString(String word) =>
      Word(letters: word.split('').map((e) => Letter(val: e)).toList());

  String get wordString => letters.map((e) => e.val).join();

  void addLetter(String val) {
    final currentIndex = letters.indexWhere((e) => e.val.isEmpty);
    if (currentIndex != -1) {
      letters[currentIndex] = Letter(val: val);
    }
  }

  void removeLetter() {
    final recentLetterIndex = letters.length - 1;
    if (recentLetterIndex != -1) {
      letters[recentLetterIndex] = Letter.empty();
    }
  }

  final List<Letter> letters;

  @override
  List<Object?> get props => [letters];
}