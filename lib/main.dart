import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:treinamento_flutter/app/app_widget.dart';
import 'package:treinamento_flutter/app/configs/modules/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  runApp(ModularApp(
      module: AppModule(),
      child: const AppWidget()
  ));
}