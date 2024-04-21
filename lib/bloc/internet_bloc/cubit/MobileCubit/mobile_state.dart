part of 'mobile_cubit.dart';

enum MobileConnectivityStatus {
  mobileConnected,
  mobileDissconnected,
}

class MobileStatus {
  final MobileConnectivityStatus status;
  const MobileStatus(this.status);
}
