import 'package:dartz/dartz.dart';
import '../../features/numbertrivals/domain/entities/number_trivia.dart';
import '../erros/failure.dart';

abstract class UseCaseCore<Type, Params>{
  Future<Either<Failure?, Type?>?> call(Params params);
}