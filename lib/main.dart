import 'package:bloc_http_post/bloc/internet_bloc/cubit/WifiCubit/wifi_cubit.dart';
import 'package:bloc_http_post/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:bloc_http_post/pages/home.dart';
import 'package:bloc_http_post/repository/transaction_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent)),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TransactionBloc>(
            create: (context) => TransactionBloc(TransactionRepo()),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}
