import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // RxList newData = [].obs;
  // updateData(index) {
  //   data[index]['selected'] = false;
  //   print(data[index]['selected']);
  //   // controller.data[2]['selected'] = false;
  //   Get.back();
  //   update();
  // }

  updateData(index) {
    data[index]['selected'] = false;
    print(data[index]['selected']);
    // controller.data[2]['selected'] = false;
    Get.back();
    update();
  }

  filter(index) {
    data.value = staticData.toList();
    Map selectedElement = data[index];

    data.clear();
    data.add(selectedElement);
    Get.back();
    update();
  }

  // print(controller.data[index]['circle']);
  String? title1;
  String? title2;
  String? subTitle1;
  String? subTitle2;

  getData(index) {
    List<String> splitTitles = data[index]['title'].split('\n');
    List<String> splitSubTitles = data[index]['subTitle'].split('\n');

    title1 = splitTitles[0];
    title2 = splitTitles[1];
    subTitle1 = splitSubTitles[0];
    subTitle2 = splitSubTitles[1];
  }

  RxList data = [
    {
      'title': 'PKR\n36000',
      'subTitle': 'Monthly\nOrder Value',
      'circle': false,
      'selected': true,
    },
    {
      'title': 'Units\n546',
      'subTitle': 'Number\nof orders',
      'circle': false,
      'selected': true,
    },
    {
      'title': '12\n22',
      'subTitle': 'Working Days\n ',
      'circle': true,
      'selected': true,
    },
  ].obs;

  clear() {
    data.value = staticData.toList();
    update();
  }

  RxList staticData = [
    {
      'title': 'PKR\n36000',
      'subTitle': 'Monthly\nOrder Value',
      'circle': false
    },
    {
      'title': 'Units\n546',
      'subTitle': 'Number\nof orders',
      'circle': false,
    },
    {
      'title': '12\n22',
      'subTitle': 'Working Days\n ',
      'circle': true,
    },
  ].obs;
  //TODO: Implement DashboardController
  popUpForFilter(BuildContext context) {
    // showMenu(
    //   context: context,
    //   position: RelativeRect.fromLTRB(100, 350, 0, 0),
    //   items: [
    //     const PopupMenuItem(
    //       child: Text('Monthly Order Value'),
    //       value: 'pkr',
    //     ),
    //     PopupMenuItem(
    //       child: Text('Number of orders'),
    //       value: 'units',
    //     ),
    //     PopupMenuItem(
    //       child: Text('Working Days'),
    //       value: 'Days',
    //     ),
    //   ],
    // );
  }

  dialogToFilter() {
    Get.defaultDialog(
        title: 'Filter',
        middleText: 'Apply filter to see',
        actions: [
          ElevatedButton(
            onPressed: () {
              // controller.data[0]['selected'] = true;
              // controller.updateData(0);

              filter(0);
            },
            child: Text('Monthly Order Value'),
          ),
          ElevatedButton(
            onPressed: () {
              filter(1);
              // controller.updateData(1);

              // controller.data[1]['selected'] = true;
              // controller.data[2]['selected'] = false;
            },
            child: Text('Number of orders'),
          ),
          ElevatedButton(
            onPressed: () {
              // Obx(() => controller.filter(2));
              filter(2);
              // controller.data[0]['selected'] = false;
              // controller.data[1]['selected'] = false;
              // controller.updateData(2);
            },
            child: Text('Working Days'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                clear();
                Get.back();
              },
              child: Text('Clear'),
            ),
          )
        ]);
  }

  checkBoxFunctionallity() async {
    data.value = staticData.toList();

    Map? selectedElement = tile1.value == true ? data[0] : null;
    Map? selectedElement2 = tile2.value == true ? data[1] : null;
    Map? selectedElement3 = tile3.value == true ? data[2] : null;
    data.clear();
    if (selectedElement != null) {
      data.add(selectedElement);
    }
    if (selectedElement2 != null) {
      data.add(selectedElement2);
    }
    if (selectedElement3 != null) {
      data.add(selectedElement3);
    }
    await Future.delayed(Duration(seconds: 1));
    Get.back();
    update();
  }

  RxBool tile1 = true.obs;
  RxBool tile2 = true.obs;
  RxBool tile3 = true.obs;
  RxBool isFilterApply = false.obs;
  checkBoxDialog() {
    //
    Get.defaultDialog(
        title: 'Filter',
        middleText: 'monthly orders | order numbers | days',
        actions: [
          Obx(
            () => Checkbox(
                value: tile1.value,
                onChanged: (value) {
                  tile1.value = value!;
                  // if (tile1.value == true) {
                  //   filter(index: 0);
                  // } else {}
                  print(tile1.value);
                  update();
                }),
          ),
          Obx(
            () => Checkbox(
                value: tile2.value,
                onChanged: (value) {
                  tile2.value = value!;
                  update();
                }),
          ),
         
          Obx(() => Checkbox(
              value: tile3.value,
              onChanged: (value) {
                tile3.value = value!;
                update();
              })),
          Obx(()=>SizedBox(
            height: 50.h,
            width: 200.w,
            child: ElevatedButton(
                onPressed: () {
                  checkBoxFunctionallity();
                  isFilterApply.value = true;
                },
                child: isFilterApply.value
                    ? CircularProgressIndicator(
                      
                    )
                    : Text('Apply filter')),
          ))
        ]);
  }

  final count = 0.obs;
  @override
  void onInit() {
    // for (var i = 0; i < data.length; i++) {
    //                 getData(i);
    // }
    data = [
      {
        'title': 'PKR\n36000',
        'subTitle': 'Monthly\nOrder Value',
        'circle': false,
        'selected': true,
      },
      {
        'title': 'Units\n546',
        'subTitle': 'Number\nof orders',
        'circle': false,
        'selected': true,
      },
      {
        'title': '12\n22',
        'subTitle': 'Working Days\n ',
        'circle': true,
        'selected': true,
      },
    ].obs;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
