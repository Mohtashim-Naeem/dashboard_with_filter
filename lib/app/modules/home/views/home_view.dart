import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          // Get.to(const CounterView());
          controller.addData();
        }),
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: controller.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        leading: IconButton(
                            onPressed: () {
                              controller.updateData(index);
                              print('$index');
                            },
                            icon: Icon(Icons.edit)),
                        trailing: IconButton(
                            onPressed: () {
                              controller.deleteData(index);
                              print('$index');
                            },
                            icon: Icon(Icons.delete)),
                        title: Text('${snapshot.data?[index].name ?? 'Nan'}'),
                      ));
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
