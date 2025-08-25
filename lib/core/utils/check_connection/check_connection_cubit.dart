import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'check_connection_state.dart';

class CheckConnectionCubit extends Cubit<CheckConnectionState> {
  final Connectivity _connectivity = Connectivity();

  CheckConnectionCubit() : super(CheckConnectionLoading()) {
    checkInitialConnectivity();
    monitorConnectivityChanges();
  }

  Future<void> checkInitialConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    await checkFullConnectivity(connectivityResult.first);
  }

  void monitorConnectivityChanges() {
    _connectivity.onConnectivityChanged.listen((connectivityResult) async {
      await checkFullConnectivity(connectivityResult.first);
    });
  }

  Future<void> checkFullConnectivity(
      ConnectivityResult connectivityResult) async {
    if (connectivityResult == ConnectivityResult.none) {
      emit(CheckConnectionNoInternet());
      return;
    }

    final hasInternet = await hasRealInternetConnection();
    if (hasInternet) {
      emit(CheckConnectionHasInternet());
    } else {
      emit(CheckConnectionNoInternet());
    }
  }

  Future<bool> hasRealInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
