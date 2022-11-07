import 'package:clenacode/features/numbertrivals/domain/entities/number_trivia.dart';
import 'package:clenacode/features/numbertrivals/domain/repositories/number_trivia_repository.dart';
import 'package:clenacode/features/numbertrivals/domain/usecase/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class GetConcreateNumberTriviaTest extends Mock
    implements NumberTriviarepository {}

void main() {
  late GetConcreteNumberTriviaUseCase useCase;
  late GetConcreateNumberTriviaTest mockNumberTriviatest;

  setUp(() {
    mockNumberTriviatest = GetConcreateNumberTriviaTest();
    useCase = GetConcreteNumberTriviaUseCase(mockNumberTriviatest);
  });
  const tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('Get Concrete Number Test', () async {
    when(mockNumberTriviatest.getConcreteNumberTrivia(tNumber))
        .thenAnswer((_) async => Right(tNumberTrivia));
    final result = await useCase(Params(tNumber));
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviatest.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviatest);
  });
}
