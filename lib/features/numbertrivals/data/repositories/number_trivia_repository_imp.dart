import 'package:clenacode/core/erros/failure.dart';
import 'package:clenacode/features/numbertrivals/domain/entities/number_trivia.dart';
import 'package:clenacode/features/numbertrivals/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/platform/netwrokinfo.dart';
import '../datasource/number_remote_data_source.dart';
import '../datasource/number_trivia_local_data_source.dart';

class NumberTriviaRespoImpl implements NumberTriviarepository{
  final NumberTriviaRemoteSource remoteDataSoure;
  final NumberTriviaLocalDataSource localDataSoure;
  final NetworkInfo networkInfo;

  NumberTriviaRespoImpl(this.remoteDataSoure, this.localDataSoure, this.networkInfo);

  @override
  Future<Either<Failure?, NumberTrivia?>>? getConcreteNumberTrivia(int number) async{
    // TODO: implement getConcreteNumberTrivia
    networkInfo.isConnected;
    final result  = await remoteDataSoure.getConcreteNumberTrivia(number);
    localDataSoure.cacheNumberTrivia(result);
    return Right(result);
  }

  @override
  Future<Either<Failure?, NumberTrivia?>>? getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
  
}