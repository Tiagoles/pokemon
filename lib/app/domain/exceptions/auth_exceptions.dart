import 'package:treinamento_flutter/app/domain/exceptions/app_exception.dart';

class AuthValidationException extends AppException {
  AuthValidationException(super.message, [super.stackTrace]);
}