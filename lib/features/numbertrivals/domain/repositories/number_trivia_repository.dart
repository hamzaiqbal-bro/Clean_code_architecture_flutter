import 'package:clenacode/core/erros/failure.dart';
import 'package:clenacode/features/numbertrivals/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviarepository{
  Future<Either<Failure?,NumberTrivia?>>? getConcreteNumberTrivia(int number);
  Future<Either<Failure?,NumberTrivia?>>?  getRandomNumberTrivia();
}