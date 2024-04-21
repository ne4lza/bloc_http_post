import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ethernet_state.dart';

class EthernetCubit extends Cubit<EthernetState> {
  EthernetCubit() : super(EthernetInitial());
}
