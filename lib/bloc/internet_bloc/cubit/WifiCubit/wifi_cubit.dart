import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'wifi_state.dart';

class WifiCubit extends Cubit<WifiStatus> {
  WifiCubit()
      : super(const WifiStatus(WifiConnectivityStatus.wifiDissconnected));

  void checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult);
  }

  void _updateConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi) {
      emit(const WifiStatus(WifiConnectivityStatus.wifiConnected));
    }
    if(result != ConnectivityResult.wifi){
      emit(const WifiStatus(WifiConnectivityStatus.wifiDissconnected));
    }


    
  }

  late StreamSubscription<ConnectivityResult?> _subscription;

  void trackConnectivityChanges() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      _updateConnectivityStatus(result);
    });
  }

  void dispose() {
    _subscription.cancel();
  }
}