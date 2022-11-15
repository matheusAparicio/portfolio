import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_state.g.dart';

class HomeState = _HomeStateBase with _$HomeState;

HomeState homeState = HomeState();

abstract class _HomeStateBase with Store {
  
  @observable
  double gifBoxWidth = 0;

  @observable
  double gifBoxHeight = 0;

  @observable
  ScrollController scrollController = ScrollController();
}