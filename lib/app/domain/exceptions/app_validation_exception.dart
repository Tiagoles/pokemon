
import 'package:treinamento_flutter/app/domain/exceptions/app_exception.dart';

class AppValidationException extends AppException {
  AppValidationException(super.message, [super.stackTrace]);
}