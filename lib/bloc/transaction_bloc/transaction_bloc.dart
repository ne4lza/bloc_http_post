// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_http_post/models/transaction_model.dart';
import 'package:flutter/material.dart';

import '../../repository/transaction_repo.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  late TransactionModel data;
  final TransactionRepo repo;
  TransactionBloc(this.repo) : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if(event is SendTransaction) {
        emit(TransactionSending());
        await Future.delayed(const Duration(seconds: 1),() async{
          data = await repo.fetchDetails();
          emit(TransactionSended(data));
        });
      }
    });
  }
}
