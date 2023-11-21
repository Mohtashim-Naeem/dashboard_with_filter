import 'package:get/get.dart';

class CounterViewModel extends GetxController{
  RxInt count = 0.obs;
  increament(){
    count++;
    update();
  }
}