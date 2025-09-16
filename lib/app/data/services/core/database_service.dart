import 'dart:async';
import 'package:objectbox/objectbox.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/configs/database/objectbox/objectbox.dart';
import 'package:treinamento_flutter/app/data/exceptions/core_exceptions.dart';

class DatabaseService{

  late final ObjectBox _objectBox;

  Future<void> init() async {
    _objectBox = await ObjectBox.create();
  }

  Result<Unit> close() {
    try{
      _objectBox.store.close();
      return const Success(unit);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<T> put<T extends Object>(T object) async {
    try{
      return Success(await getBox<T>().putAndGetAsync(object));
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<List<int>> putMany<T>(List<T> objects) async {
    try{
      return Success(await getBox<T>().putManyAsync(objects));
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<List<T>> putAndGetMany<T>(List<T> objects) async {
    try{
      return Success(await getBox<T>().putAndGetManyAsync(objects));
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<bool> remove<T>(int id) async {
    try{
      return Success(await getBox<T>().removeAsync(id));
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<List<T>> getAll<T>() async {
    try{
      return Success(await getBox<T>().getAllAsync());
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<List<T?>> getMany<T>(List<int> ids) async {
    try{
      final results = await getBox<T>().getManyAsync(ids);
      if(results.isEmpty){
        return Failure(LocalDatabaseException('Nenhum registro encontrado para os IDs fornecidos', StackTrace.current));
      }
      return Success(results);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<T> getById<T extends Object>(int id) async {
    try{
      final result = await getBox<T>().getAsync(id);
      if(result == null){
        return Failure(LocalDatabaseException('Registro não encontrado', StackTrace.current));
      }
      return Success(result);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<QueryBuilder<T>> query<T>(Condition<T> conditions) async {
    try{
      return Success(getBox<T>().query(conditions));
    } on ObjectBoxException catch (e,s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  Result<Unit> reset<T>() {
    try{
      getBox<T>().removeAll();
      return const Success(unit);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  AsyncResult<Unit> dropDatabase() async {
    try{
      await Future.wait([]);
      return const Success(unit);
    } on ObjectBoxException catch(e, s){
      return Failure(LocalDatabaseException(e.message, s));
    }
  }

  ObjectBox get objectBox => _objectBox;
  Store get store => _objectBox.store;
  Admin? get admin => _objectBox.admin;
  Box<T> getBox<T>() => _objectBox.store.box<T>();

}