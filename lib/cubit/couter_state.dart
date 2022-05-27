part of 'couter_cubit.dart';

class CouterState {
  int counterNumber;
  CouterState({required this.counterNumber});

  CouterState changeCouter({
    required int counterNumber,
  }){
    return CouterState(
      counterNumber: counterNumber,
    );
  }
}
