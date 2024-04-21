part of 'ethernet_cubit.dart';

enum EthernetConnectivityStatus {
  ethernetConnected,
  ethernetDissconnected,
}

class EthernetStatus {
  final EthernetConnectivityStatus status;
  const EthernetStatus(this.status);
}
