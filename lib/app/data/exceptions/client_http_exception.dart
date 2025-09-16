import 'dart:io';

import 'package:dio/dio.dart';
import 'package:treinamento_flutter/app/domain/exceptions/app_exception.dart';

class ClientHttpException extends AppException {

  ClientHttpException(super.message, [super.stackTrace]);

  factory ClientHttpException.fromDioException(DioException exception){
    final response = exception.response;
    if((response != null && response.data is Map<String, dynamic> &&
        (response.data as Map<String, dynamic>).containsKey('mensagemErro'))){
     return ClientHttpException((response.data as Map<String, dynamic>)['mensagemErro']);
    }
    final message = clientHttpExceptions[exception.type] ?? clientHttpExceptions[DioExceptionType.unknown];
    return ClientHttpException(message!, exception.stackTrace);
  }

  factory ClientHttpException.fromSocketException(SocketException exception){
    return ClientHttpException('Não foi possível conectar ao servidor. Verifique sua conexão com a internet e tente novamente.');
  }

}

const clientHttpExceptions = {
  DioExceptionType.connectionTimeout:
      'O tempo de conexão com o servidor esgotou. Verifique sua conexão com a internet e tente novamente.',
  DioExceptionType.sendTimeout:
      'O envio de dados para o servidor demorou mais do que o esperado. Por favor, tente novamente.',
  DioExceptionType.receiveTimeout:
      'A resposta do servidor demorou muito para ser recebida. Tente novamente mais tarde.',
  DioExceptionType.badCertificate:
      'Houve um problema com o certificado de segurança do servidor. Verifique as configurações de segurança ou tente acessar o serviço mais tarde.',
  DioExceptionType.badResponse:
      'Recebemos uma resposta inesperada do servidor. Por favor, tente novamente.',
  DioExceptionType.cancel:
      'A requisição foi cancelada. Se isso não foi intencional, por favor, tente novamente.',
  DioExceptionType.connectionError:
      'Não foi possível estabelecer uma conexão com o servidor. Verifique sua conexão com a internet e tente novamente.',
  DioExceptionType.unknown:
      'Ocorreu um erro inesperado. Por favor, tente novamente mais tarde ou entre em contato com o suporte técnico.',
};
