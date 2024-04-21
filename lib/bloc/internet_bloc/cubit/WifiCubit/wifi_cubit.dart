import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetStatus> {
  InternetCubit()
      : super(const InternetStatus(ConnectivityStatus.disconnected));

  void checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult);
  }

  void _updateConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi) {
      emit(const InternetStatus(ConnectivityStatus.wifiConnected));
    }
    if(result != ConnectivityResult.wifi){
      emit(const InternetStatus(ConnectivityStatus.wifiDissconnected));
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