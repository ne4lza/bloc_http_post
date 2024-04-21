import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mobile_state.dart';

class MobileCubit extends Cubit<MobileState> {
  MobileCubit() : super(MobileInitial());
}
