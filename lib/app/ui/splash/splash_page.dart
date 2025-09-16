import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:treinamento_flutter/app/ui/core/load_page.dart';
import 'package:treinamento_flutter/app/ui/splash/viewmodels/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  final SplashViewModel viewModel;
  const SplashPage({super.key, required this.viewModel});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadCommand.addListener(_onCommandChanged);
  }

  _onCommandChanged(){
    if(widget.viewModel.loadCommand.completed) return Modular.to.navigate('/home/');
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.viewModel.loadCommand,
        builder: (context, _){
          return const LoadPage();
        }
    );
  }
}
