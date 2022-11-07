import 'package:clenacode/core/erros/failure.dart';
import 'package:clenacode/features/numbertrivals/domain/entities/number_trivia.dart';
import 'package:clenacode/features/numbertrivals/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/usecases/usecase_core.dart';

class GetConcreteNumberTriviaUseCase implements UseCaseCore<NumberTrivia,Params>{
  final NumberTriviarepository numberTriviarepository;

  GetConcreteNumberTriviaUseCase(this.numberTriviarepository);

  @override
  Future<Either<Failure?, NumberTrivia?>?> call(Params params) async{
    return await numberTriviarepository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable{
  final int number;

  Params(this.number):super();

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}