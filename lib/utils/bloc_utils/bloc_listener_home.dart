import 'package:bloc_http_post/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:bloc_http_post/utils/widgets/proccess_dialog.dart';
import 'package:bloc_http_post/utils/widgets/result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

BlocListener<TransactionBloc, TransactionState> stateListener() {
    return BlocListener<TransactionBloc,TransactionState>(
      listener: (context, state) {
        if(state is TransactionSending){
          proccessingShowDialog(context);
        }
        if(state is TransactionSended){
          Navigator.of(context).popUntil((route) => route.isFirst);
          IconData icon = state.data.status! ? Icons.check : Icons.close;
          Color iconColor = state.data.status! ? Colors.green : Colors.red;
          resultShowDialog(context, state, icon, iconColor);
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });
        }
        if(state is TransactionSendingError){
          Navigator.of(context).pop();
          showDialog(context: context, builder: (context) {
            return const AlertDialog(
              title:  Text("Hata Oluştu"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red,
                  ),
                ],
              ),
            );
          },);

        }
      },
      child: const SizedBox(),
    );
  }



