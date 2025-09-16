import 'package:treinamento_flutter/app/domain/exceptions/app_exception.dart';

class ConfigValidationException extends AppException{
  ConfigValidationException(super.message, [super.stackTrace]);
}