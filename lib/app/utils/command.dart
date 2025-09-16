import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/utils/extensions/exception_extension.dart';

typedef CommandAction0<T extends Object> = AsyncResult<T> Function();
typedef CommandAction1<T extends Object, A> = AsyncResult<T> Function(A);
typedef CommandAction2<T extends Object, A, B> = AsyncResult<T> Function(A, B);

abstract class Command<T extends Object> extends ChangeNotifier {
  bool _running = false;

  bool get running => _running;

  Result<T>? _result;

  bool get error => _result is Failure;
  String? get errorMessage => _result?.exceptionOrNull()?.message;

  bool get completed => _result is Success;

  Result<T>? get result => _result;

  void clearResult() {
    _result = null;
    notifyListeners();
  }
  
  Future<void> _execute(CommandAction0<T> action) async {

    if (_running) return;
    
    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

final class Command0<T extends Object> extends Command<T> {
  Command0(this._action);

  final CommandAction0<T> _action;

  Future<void> execute() async {
    await _execute(() => _action());
  }
}

final class Command1<T extends Object, A> extends Command<T> {
  Command1(this._action);

  final CommandAction1<T, A> _action;

  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}

final class Command2<T extends Object, A, B> extends Command<T> {
  Command2(this._action);

  final CommandAction2<T, A, B> _action;

  Future<void> execute(A argument1, B argument2) async {
    await _execute(() => _action(argument1, argument2));
  }
}