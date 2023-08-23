import 'package:web_responsive/routes.dart';
import 'package:web_responsive/routes.dart';

class NavigationController extends GetxController {
  final Rx<SelectedScreen> selectedScreen = SelectedScreen.Home.obs;
  final Rx<String> currentLayoutWidget = ''.obs;
  final Rx<double> screenWidth = 0.00.obs;
  String updateCurrentLayoutWidget() {
    if (screenWidth.value > 580) {
      currentLayoutWidget.value = 'Row';
    } else {
      currentLayoutWidget.value = 'Column';
    }
    return currentLayoutWidget.value;
  }
}
