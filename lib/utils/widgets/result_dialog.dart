import 'package:bloc_http_post/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
Future<dynamic> resultShowDialog(BuildContext context, TransactionSended state, IconData icon, Color iconColor) {

  return showDialog(context: context, builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: 100,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.data.message ?? "",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 20,),
                  Icon(
                    icon,
                    color: iconColor,
                    size: 40,
                  ),
                ],
              ),
            ),
          );
        },);
}