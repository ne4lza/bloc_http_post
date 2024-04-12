import 'package:bloc_http_post/pages/internet_check.dart';
import 'package:bloc_http_post/utils/bloc_utils/bloc_listener_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/transaction_bloc/transaction_bloc.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ETİSAN ÖDEME NOKTASI"),
        backgroundColor: Colors.amber[300],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(context: context, builder: (context) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const InternetCheck(),));
                          }, child: Text("İNTERNET DURUMU"))
                        ],
                      ),
                    ),
                  );
                },);
              },
              child: Image.asset("assets/images/Etisan-Proje-Logo.png")
              ),
            Expanded(
              child: Row(
              
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  "LÜTFEN KARTINIZI OKUTUNUZ",
                  style: Theme.of(context).textTheme.titleLarge,
                  ),
                IconButton(
                  onPressed: () => BlocProvider.of<TransactionBloc>(context).add(SendTransaction()),
                  icon: const Icon(Icons.send),
                ),
                ],
              ),
            ),



            stateListener(),
          ],
        ),
      ),
      
    );
  }

  
}