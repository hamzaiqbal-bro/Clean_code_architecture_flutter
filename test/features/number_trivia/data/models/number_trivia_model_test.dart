import 'dart:convert';
import 'package:clenacode/features/numbertrivals/data/models/number_trivia_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../fixtures/fixture_reader.dart';

void main(){
  final numberTriviaModel = NumbertriviaModel(text: '24 is the number of cycles in the Chinese solar year.', number: 24);

  group('Trivia Modle', () {
    test('Model test with integer', () async{
      final Map<String, dynamic> jsonMap = json.decode(fixture('trimvia.json'));
      final result = NumbertriviaModel.fromJson(jsonMap);
      expect(result, numberTriviaModel);
    });
    test('Model test with double', () async{
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia_double.json'));
      final result = NumbertriviaModel.fromJson(jsonMap);
      expect(result, numberTriviaModel);
    });
  });
}