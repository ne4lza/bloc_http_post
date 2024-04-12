import 'package:flutter/material.dart';

Future<dynamic> proccessingShowDialog(BuildContext context) {
  return showDialog(context: context, builder: (context) {
          return const SizedBox(
            width: double.infinity,
            height: 100,
            child: AlertDialog(
              title:  Text("İşleminiz Yapılıyor..."),
              content: LinearProgressIndicator(
              ),
            ),
          );
        },);
}