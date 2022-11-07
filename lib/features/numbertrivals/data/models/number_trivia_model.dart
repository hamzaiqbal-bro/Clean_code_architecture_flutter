import 'dart:convert';
import 'package:clenacode/features/numbertrivals/domain/entities/number_trivia.dart';


class NumbertriviaModel extends NumberTrivia{
  NumbertriviaModel({required super.text, required super.number});

  factory NumbertriviaModel.fromJson(Map<String, dynamic> json){
    return NumbertriviaModel(text: json['text'], number: (json['number'] as num).toInt());
  }
}