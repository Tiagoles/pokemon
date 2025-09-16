import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treinamento_flutter/app/data/exceptions/core_exceptions.dart';
import 'local_storage.dart';

class SharedPreferencesStorage implements LocalStorage{

  @override
  AsyncResult<String> delete({required String key}) async {
    try{
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.remove(key);
      return Success(key);
    }catch (e,s){
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

  @override
  AsyncResult<String> read({required String key}) async {
    try{
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        final value = sharedPreferences.getString(key);
        return value != null ? Success(value) : Failure(LocalStorageException('Nenhum registro encontrado'));
    }catch (e,s){
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

  @override
  AsyncResult<String> write({required String key, required String value}) async {
    try{
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(key, value);
      return Success(value);
    }catch (e,s){
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

}