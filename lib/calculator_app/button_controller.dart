import 'package:get/get.dart';

class ButtonController extends GetxController {
  var result;

  //add

  add(String x, String y) {
    int num1 = int.tryParse(x) ?? 0;
    int num2 = int.tryParse(y) ?? 0;
    result = num1 + num2;
  }

  sub(String x, String y) {
    int num1 = int.tryParse(x) ?? 0;
    int num2 = int.tryParse(y) ?? 0;
    result = num1 - num2;
  }

  div(String x, String y) {
    int num1 = int.tryParse(x) ?? 0;
    int num2 = int.tryParse(y) ?? 0;
    result = num1 / num2;
  }

  mul(String x, String y) {
    int num1 = int.tryParse(x) ?? 0;
    int num2 = int.tryParse(y) ?? 0;
    result = num1 * num2;
  }
}
