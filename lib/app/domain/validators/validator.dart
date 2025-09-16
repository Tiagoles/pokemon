import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/domain/exceptions/app_validation_exception.dart';

abstract class Validator<T extends Object>{

  Map<String, FormFieldValidator> get rules;

  FutureOr<Map<String, dynamic>> toMap(T model);

  List<String> _validate(Map<String, dynamic> value){
    final errors = <String>[];
    for (var key in rules.keys) {
      final validator = rules[key];
      if (validator != null) {
        final result = validator(value[key]);
        if (result != null) errors.add(result);
      }
    }
    return errors;
  }
  AsyncResult<T> validateResult(T model) async {

    final result = _validate(await toMap(model));

    if(result.isEmpty) return Success(model);
    return Failure(AppValidationException(result.first));
  }
}