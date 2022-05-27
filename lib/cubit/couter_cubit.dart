import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'couter_state.dart';

class CouterCubit extends Cubit<CouterState> {
  CouterCubit() : super(CouterState(counterNumber: 0));

  void increment() => emit(
    CouterState(counterNumber: state.counterNumber + 1)
  );

  void decrement() => {
    CouterState(counterNumber: state.counterNumber - 100)
  };
}
