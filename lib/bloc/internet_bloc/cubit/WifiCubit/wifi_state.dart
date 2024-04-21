part of 'internet_cubit.dart';

enum ConnectivityStatus {
   connected, 
   disconnected ,
   wifiConnected,
   wifiDissconnected,
   mobileConnected,
   mobileDisconnected,
   }

class InternetStatus {
  final ConnectivityStatus status;
  const InternetStatus(this.status);
}
