import '../models/number_trivia_model.dart';

abstract class NumberTriviaRemoteSource{
  Future<NumbertriviaModel?>? getConcreteNumberTrivia(int number);
  Future<NumbertriviaModel?>?  getRandomNumberTrivia();
}