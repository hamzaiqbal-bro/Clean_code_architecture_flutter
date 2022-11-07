import 'package:clenacode/features/numbertrivals/domain/entities/number_trivia.dart';
import 'package:clenacode/features/numbertrivals/domain/repositories/number_trivia_repository.dart';
import 'package:clenacode/features/numbertrivals/domain/usecase/get_random_number_trivia_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class GetRandomNumberTriviaTest extends Mock
    implements NumberTriviarepository {}

void main() {
  late GetRandomNumberTriviaUseCase useCase;
  late GetRandomNumberTriviaTest mockNumberTriviatest;

  setUp(() {
    mockNumberTriviatest = GetRandomNumberTriviaTest();
    useCase = GetRandomNumberTriviaUseCase(mockNumberTriviatest);
  });

  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('Get Random Number Test', () async {
    when(mockNumberTriviatest.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));
    final result = await useCase(NoParams());
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviatest.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviatest);
  });
}