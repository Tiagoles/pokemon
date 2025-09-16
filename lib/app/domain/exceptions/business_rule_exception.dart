import 'package:treinamento_flutter/app/domain/exceptions/app_exception.dart';

class BusinessRuleException extends AppException{
  BusinessRuleException(super.message, [super.stackTrace]);
}