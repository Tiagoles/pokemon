import 'package:treinamento_flutter/app/domain/exceptions/app_exception.dart';

class LocalStorageException extends AppException {
  LocalStorageException(super.message, [super.stackTrace]);
}

class ConnectivityException extends AppException {
  ConnectivityException(super.message, [super.stackTrace]);
}

class GeolocatorException extends AppException {
  GeolocatorException(super.message, [super.stackTrace]);
}

class AppSocketException extends AppException {
  AppSocketException([StackTrace? stackTrace]) : super('Não foi possível conectar ao servidor. Verifique sua conexão com a internet e tente novamente.', stackTrace);
}

class LocalDatabaseException extends AppException {
  LocalDatabaseException(super.message, [super.stackTrace]);
}

class OfflineFirstException extends AppException {
  OfflineFirstException(super.message, [StackTrace? stackTrace]);
}

class ProcessingException extends AppException {
  ProcessingException(super.message, [super.stackTrace]);
}

class NotificationException extends AppException {
  NotificationException(super.message, [super.stackTrace]);
}