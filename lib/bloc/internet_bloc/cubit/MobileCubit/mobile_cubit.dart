import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'mobile_state.dart';

class MobileCubit extends Cubit<MobileStatus> {
  MobileCubit() : super(const MobileStatus(MobileConnectivityStatus.mobileDissconnected));

  void checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult);
  }

  void _updateConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile) {
      emit(const MobileStatus(MobileConnectivityStatus.mobileConnected));
    }
    if(result != ConnectivityResult.mobile){
      emit(const MobileStatus(MobileConnectivityStatus.mobileDissconnected));
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

