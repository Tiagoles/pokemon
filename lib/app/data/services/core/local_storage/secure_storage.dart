import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/exceptions/core_exceptions.dart';
import 'local_storage.dart';

class SecureStorage implements LocalStorage{
  final FlutterSecureStorage _flutterSecureStorage;

  SecureStorage(this._flutterSecureStorage);

  @override
  AsyncResult<String> write({required String key, required String value}) async {
    try{
      await _flutterSecureStorage.write(key: key, value: value);
      return Success(value);
    }catch (e,s){
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

  @override
  AsyncResult<String> read({required String key}) async {
    try{
      final value = await _flutterSecureStorage.read(key: key);
      return value != null ? Success(value) : Failure(LocalStorageException('Nenhum registro encontrado'));
    }catch (e,s){
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

  @override
  AsyncResult<String> delete({required String key}) async {
    try{
      await _flutterSecureStorage.delete(key: key);
      return Success(key);
    }catch (e,s){
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

}