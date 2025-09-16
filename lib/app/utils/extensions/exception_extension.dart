import 'package:treinamento_flutter/app/domain/exceptions/app_exception.dart';

extension ExceptionExtension on Exception {
  String get message {
    if(this is AppException){
      return (this as AppException).message;
    }
    return toString();
  }
}