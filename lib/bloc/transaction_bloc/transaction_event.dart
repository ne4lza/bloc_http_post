part of 'transaction_bloc.dart';

@immutable
sealed class TransactionEvent {}

class SendTransaction extends TransactionEvent{
}
