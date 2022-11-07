import '../models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource{
  Future<NumbertriviaModel>? getLastNumberTrivia();
  Future<void>? cacheNumberTrivia(NumbertriviaModel? triviaToCache);
}