import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/exceptions/core_exceptions.dart';

class ConnectivityService {
  final Connectivity _connectivity;
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];

  ConnectivityService(this._connectivity) {
    _initConnectivity();
    _subscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  AsyncResult<List<ConnectivityResult>> _initConnectivity() async {
    try {
      _connectionStatus = await _connectivity.checkConnectivity();
      return Success(_connectionStatus);
    } catch (e, s) {
      _connectionStatus = [ConnectivityResult.none];
      return Failure(ConnectivityException(e.toString(), s));
    }
  }

  Result<List<ConnectivityResult>> _updateConnectionStatus(List<ConnectivityResult> result) {
    try{
      _connectionStatus = result;
      return Success(_connectionStatus);
    }catch (e,s){
      return Failure(ConnectivityException(e.toString(), s));
    }
  }

  AsyncResult<bool> isConnected() async {
    if(_connectionStatus.contains(ConnectivityResult.mobile) || _connectionStatus.contains(ConnectivityResult.wifi)) {
      return await hasInternetConnection();
    }
    return const Success(false);
  }

  AsyncResult<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return Success(result.isNotEmpty && result[0].rawAddress.isNotEmpty);
    } on SocketException catch (e,s) {
      return Failure(AppSocketException(s));
    }
  }

  List<ConnectivityResult> get connectionStatus => _connectionStatus;

  Stream<List<ConnectivityResult>> get onConnectivityChanged => _connectivity.onConnectivityChanged;

  void dispose() {
    _subscription.cancel();
  }
}
