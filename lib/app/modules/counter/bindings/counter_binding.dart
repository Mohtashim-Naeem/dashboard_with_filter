import 'package:get/get.dart';
import 'package:my_first_get_x/app/modules/counter/controller/counter_view_model.dart';

class CounterBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CounterViewModel>(
      () => CounterViewModel(),
    );
  }
}
