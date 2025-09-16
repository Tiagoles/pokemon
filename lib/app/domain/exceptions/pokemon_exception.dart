import 'package:treinamento_flutter/app/domain/exceptions/app_exception.dart';

class PokemonException extends AppException{
  PokemonException(super.message, [super.stackTrace]);
}