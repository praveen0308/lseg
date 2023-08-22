import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'purchase_content_screen_state.dart';

class PurchaseContentScreenCubit extends Cubit<PurchaseContentScreenState> {
  PurchaseContentScreenCubit() : super(PurchaseContentScreenInitial());
}
