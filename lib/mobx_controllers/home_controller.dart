import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

HomeController homeController = HomeController();

abstract class _HomeControllerBase with Store {
  double gifBoxWidth = 0;
  double gifBoxHeight = 0;
}