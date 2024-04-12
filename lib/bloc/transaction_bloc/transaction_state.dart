part of 'transaction_bloc.dart';

@immutable
sealed class TransactionState {}

final class TransactionInitial extends TransactionState {}

class TransactionSending extends TransactionState {}

class TransactionSended extends TransactionState {
  final TransactionModel data;
  TransactionSended(this.data);
}

class TransactionSendingError extends TransactionState {
  final String error;
  TransactionSendingError(this.error);
}