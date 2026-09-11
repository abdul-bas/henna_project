import 'package:bloc/bloc.dart';
import 'package:todo_app/state_management/home_view/event.dart';
import 'package:todo_app/state_management/home_view/initial.dart';
import 'package:todo_app/state_management/home_view/state.dart';


class BlocManagement extends Bloc<ManageEvent, ManageState> {
  BlocManagement() : super(Initial()) {
    on<ViewSelection>((event, emit) {
      List<bool> updatedSelection = [false, false];
      updatedSelection[event.index] = true;
      

      return emit(ManageState(isSelect: updatedSelection));
    });
  }
}
