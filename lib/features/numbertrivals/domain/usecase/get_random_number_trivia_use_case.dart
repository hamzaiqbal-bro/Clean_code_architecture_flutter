import 'package:clenacode/core/erros/failure.dart';
import 'package:clenacode/features/numbertrivals/domain/entities/number_trivia.dart';
import 'package:clenacode/features/numbertrivals/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/usecases/usecase_core.dart';

class GetRandomNumberTriviaUseCase implements UseCaseCore<NumberTrivia,NoParams>{
  final NumberTriviarepository numberTriviarepository;

  GetRandomNumberTriviaUseCase(this.numberTriviarepository);

  @override
  Future<Either<Failure?, NumberTrivia?>?> call(NoParams noParams) async{
    return await numberTriviarepository.getRandomNumberTrivia();
  }
}

class NoParams extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}