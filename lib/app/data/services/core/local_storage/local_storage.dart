import 'package:result_dart/result_dart.dart';

abstract class LocalStorage{

  ///Returns the value if the key was written successfully
  AsyncResult<String> write({required String key, required String value});

  ///Returns the value if the key exists, if does not exist returns a LocalStorageException
  AsyncResult<String> read({required String key});

  ///Returns the key if the key was deleted successfully
  AsyncResult<String> delete({required String key});

}