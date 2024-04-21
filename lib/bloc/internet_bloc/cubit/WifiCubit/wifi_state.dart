part of 'wifi_cubit.dart';

enum WifiConnectivityStatus {
   wifiConnected,
   wifiDissconnected,
   }

class WifiStatus {
  final WifiConnectivityStatus status;
  const WifiStatus(this.status);
}
