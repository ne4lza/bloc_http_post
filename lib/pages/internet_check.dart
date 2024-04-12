import 'package:bloc_http_post/bloc/internet_bloc/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCheck extends StatelessWidget {
  const InternetCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InternetCubit>(
      create: (context) => InternetCubit(),
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
  late InternetCubit internetCubit;
  @override
  void initState() {
    internetCubit = context.read<InternetCubit>();
    internetCubit.checkConnectivity();
    internetCubit.trackConnectivityChanges();
    super.initState();
  }

  @override
  void dispose() {
    internetCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(),
              body:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<InternetCubit, InternetStatus>(
                    builder: (context, state) {
                      if (state.status == ConnectivityStatus.connected) {
                        return const Text("Bağlantı var..");
                      }if (state.status == ConnectivityStatus.disconnected) {
                        return const Text("Bağlantı yok...");
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
    );
  }
}