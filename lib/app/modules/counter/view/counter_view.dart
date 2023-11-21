import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_get_x/app/modules/counter/controller/counter_view_model.dart';

class CounterView extends GetView<CounterViewModel> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder(
                init: CounterViewModel(),
                builder: (context, ) {
                  return Text("${controller.count.toString()}");
                }),
            ElevatedButton(
                onPressed: () {
                  controller.increament();
                },
                child: Text('Add Value'))
          ],
        ),
      ),
    );
  }
}
