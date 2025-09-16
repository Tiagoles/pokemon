import 'package:flutter_modular/flutter_modular.dart';

BindConfig<T> autoDisposeConfig<T extends Disposable>(){
  return BindConfig(
    onDispose: (o) => o.dispose(),
  );
}