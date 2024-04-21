import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'ethernet_state.dart';

class EthernetCubit extends Cubit<EthernetStatus> {
  EthernetCubit() : super(EthernetStatus(EthernetConnectivityStatus.ethernetDissconnected));

  void checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult);
  }

  void _updateConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.ethernet) {
      emit(const EthernetStatus(EthernetConnectivityStatus.ethernetConnected));
    }
    if(result != ConnectivityResult.ethernet){
      emit(const EthernetStatus(EthernetConnectivityStatus.ethernetDissconnected));
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
