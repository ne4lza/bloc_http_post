import 'package:bloc_http_post/bloc/internet_bloc/cubit/EthernetCubit/ethernet_cubit.dart';
import 'package:bloc_http_post/bloc/internet_bloc/cubit/MobileCubit/mobile_cubit.dart';
import 'package:bloc_http_post/bloc/internet_bloc/cubit/WifiCubit/wifi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCheck extends StatelessWidget {
  const InternetCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WifiCubit>(
          create: (context) => WifiCubit(),
        ),
        BlocProvider(
          create: (context) => MobileCubit(),
        ),

        BlocProvider(
          create: (context) => EthernetCubit(),
        ),
      ],
      child: const myWidget(),
    );
  }
}

class myWidget extends StatefulWidget {
  const myWidget({super.key});

  @override
  State<myWidget> createState() => _myWidgetState();
}

class _myWidgetState extends State<myWidget> {
  late WifiCubit wifiCubit;
  late MobileCubit mobileCubit;
  late EthernetCubit ethernetCubit;
  @override
  void initState() {
    wifiCubit = context.read<WifiCubit>();
    wifiCubit.checkConnectivity();
    wifiCubit.trackConnectivityChanges();

    mobileCubit = context.read<MobileCubit>();
    mobileCubit.checkConnectivity();
    mobileCubit.trackConnectivityChanges();

    ethernetCubit = context.read<EthernetCubit>();
    ethernetCubit.checkConnectivity();
    ethernetCubit.trackConnectivityChanges();




    super.initState();
  }

  @override
  void dispose() {
    wifiCubit.dispose();
    mobileCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<MobileCubit, MobileStatus>(
            builder: (context, state) {
              if (state.status == MobileConnectivityStatus.mobileConnected) {
                return _buildConnectionCard(
                    title: "SIM DURUMU:", isConnected: true);
              }
              if (state.status == MobileConnectivityStatus.mobileDissconnected) {
                return _buildConnectionCard(
                    title: "SIM DURUMU:", isConnected: false);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          BlocBuilder<WifiCubit, WifiStatus>(
            builder: (context, state) {
              if (state.status == WifiConnectivityStatus.wifiConnected) {
                return _buildConnectionCard(
                    title: "WIFI DURUMU:", isConnected: true);
              }
              if (state.status == WifiConnectivityStatus.wifiDissconnected) {
                return _buildConnectionCard(
                    title: "WIFI DURUMU:", isConnected: false);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          BlocBuilder<EthernetCubit, EthernetStatus>(
            builder: (context, state) {
              if (state.status == EthernetConnectivityStatus.ethernetConnected) {
                return _buildConnectionCard(
                    title: "ETHERNET DURUMU:", isConnected: true);
              }
              if (state.status == EthernetConnectivityStatus.ethernetDissconnected) {
                return _buildConnectionCard(
                    title: "ETHERNET DURUMU:", isConnected: false);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildConnectionCard(
    {required String title, required bool isConnected}) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 10),
          isConnected
              ? Icon(Icons.check_circle, color: Colors.green, size: 40)
              : Icon(Icons.cancel, color: Colors.red, size: 40),
          SizedBox(width: 10),
          Center(
            child: isConnected
                ? Text('Bağlı', style: TextStyle(color: Colors.green))
                : Text('Bağlı Değil', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    ),
  );
}
