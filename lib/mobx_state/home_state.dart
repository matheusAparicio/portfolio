import 'package:mobx/mobx.dart';
part 'home_state.g.dart';

class HomeState = _HomeStateBase with _$HomeState;

HomeState homeState = HomeState();

abstract class _HomeStateBase with Store {
  double gifBoxWidth = 0;
  double gifBoxHeight = 0;
}