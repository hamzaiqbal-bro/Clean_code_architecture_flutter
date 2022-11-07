import 'dart:convert';

import 'package:clenacode/core/erros/exceptions..dart';
import 'package:clenacode/core/platform/netwrokinfo.dart';
import 'package:clenacode/features/numbertrivals/data/datasource/number_remote_data_source.dart';
import 'package:clenacode/features/numbertrivals/data/datasource/number_trivia_local_data_source.dart';
import 'package:clenacode/features/numbertrivals/data/models/number_trivia_model.dart';
import 'package:clenacode/features/numbertrivals/data/repositories/number_trivia_repository_imp.dart';
import 'package:clenacode/features/numbertrivals/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockRemoteDataSource extends Mock implements NumberTriviaRemoteSource{}
class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource{}
class MockNetworkInfo extends Mock implements NetworkInfo{}


main(){
  late NumberTriviaRespoImpl numberTriviarepository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mocklocalDataSource;
  late MockNetworkInfo moclnetworkInfo;

  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mocklocalDataSource = MockLocalDataSource();
    moclnetworkInfo = MockNetworkInfo();
    numberTriviarepository = NumberTriviaRespoImpl(mockRemoteDataSource, mocklocalDataSource, moclnetworkInfo);
  });

  group('Test Apis and internet check', () {
    const tNumber = 1;
    final tNumberModel  = NumbertriviaModel(text: 'test drive', number: tNumber);
    final NumberTrivia tNumberTrivia = tNumberModel;
    test('if device have internet', () async{
      when(moclnetworkInfo.isConnected).thenAnswer((_) async => true);
      numberTriviarepository.getConcreteNumberTrivia(tNumber);
      verify(moclnetworkInfo.isConnected);
    });

    group('Device Online', () {
      setUp(() {
        when(moclnetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test('Remote  data when device is connected', () async{
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber)).thenAnswer((_) async{
           tNumberModel;
        });
        final result = await numberTriviarepository.getConcreteNumberTrivia(tNumber);
        verify(await mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        expect(result, equals(Right(tNumberTrivia)));
      });

      test('cached data locally', () async{
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber)).thenAnswer((_) async{
          tNumberModel;
        });
        await numberTriviarepository.getConcreteNumberTrivia(tNumber);
        verify(await mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        verify(mocklocalDataSource.cacheNumberTrivia(tNumberModel));
      });

      test('Remote  data Server Failure', () async{
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber)).thenThrow(
          ServerExceptions()
        );
        final result = await numberTriviarepository.getConcreteNumberTrivia(tNumber);
        verify(await mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        verifyZeroInteractions(mocklocalDataSource);
        expect(result, equals(Left(ServerExceptions())));
      });
    });

    group('Device offline', () {
      setUp(() {
        when(moclnetworkInfo.isConnected).thenAnswer((_) async => false);
      });

    });
  });
}