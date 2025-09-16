import 'package:brasil_fields/brasil_fields.dart';
import 'package:result_dart/result_dart.dart';

extension UtilBrasilFieldsExtension on UtilBrasilFields{
  Result<String> obterCpfCnpj(String? value){
    if (value == null || value.isEmpty) {
      return const Failure(FormatException('O valor não pode ser nulo ou vazio.'));
    }
    if(value.length < 11 || value.length > 14) {
      return const Failure(FormatException('O valor deve ter entre 11 e 14 caracteres.'));
    }
    if (value.length == 11) return Success(UtilBrasilFields.obterCpf(value));
    return Success(UtilBrasilFields.obterCnpj(value));
  }
}