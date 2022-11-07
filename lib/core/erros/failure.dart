import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
    Failure([List properties = const <dynamic>[]]):super();
}

abstract class ServerFailure extends Failure{}
abstract class CacheFailure extends Failure{}


