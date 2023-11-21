import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:my_first_get_x/constants/app_colors.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);

  //DashboardController controller = Get.put<DashboardController>();

  @override
  Widget build(BuildContext context) {
    //   var height = MediaQuery.of(context).size.height;
    //   var width = MediaQuery.of(context).size.width;
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              // actions: [
              //   PopupMenuButton(
              //     onSelected: (value) {
              //       // your logic
              //     },
              //     itemBuilder: (BuildContext bc) {
              //       return const [
              //         PopupMenuItem(
              //           child: Text("Hello"),
              //           value: '/hello',
              //         ),
              //         PopupMenuItem(
              //           child: Text("About"),
              //           value: '/about',
              //         ),
              //         PopupMenuItem(
              //           child: Text("Contact"),
              //           value: '/contact',
              //         )
              //       ];
              //     },
              //   )
              // ],
              backgroundColor: AppColors.blue,
              title: const Text('DashboardView'),
              centerTitle: true,
            ),
            body: Center(
              child: Container(
                alignment: Alignment.center,
                // height: MediaQuery.sizeOf(context).height * 0.3,
                height: 198.h,
                width: 375.w,
                color: AppColors.offWhite,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                            top: 16, right: 30, left: 30, bottom: 17)
                        .r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Statistics | ',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'This Month',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // controller.popUpForFilter(context);
                            controller.isFilterApply.value = false;

                            controller.checkBoxDialog();
                            // controller.dialogToFilter();
                            // //
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/Vector.svg',
                                height: 10.8.h,
                                width: 12.w,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ).r,
                        itemCount: controller.data.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20.w,
                          // childAspectRatio: width * 0.003,
                          childAspectRatio: 1.18,
                          // childAspectRatio: ScreenUtil().setWidth(114) /
                          // ScreenUtil().setHeight(133),
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (context, index) {
                          controller.getData(index);
                          return Container(
                            margin: const EdgeInsets.only(
                              // top: 10,
                              bottom: 21,
                              left: 10,
                              right: 0,
                            ).r,

                            // height: 400,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ).r,
                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 20,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                      color: Color.fromARGB(34, 0, 0, 38))
                                ],
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                controller.data[index]['circle']
                                    ? Container(
                                        width: 50.w,
                                        alignment: Alignment.center,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              height: 50.h,
                                              width: 50.w,
                                              child: RotatedBox(
                                                quarterTurns: -10,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 8,

                                                  strokeCap: StrokeCap.butt,

                                                  color: AppColors.blue,
                                                  backgroundColor:
                                                      AppColors.offWhite,
                                                  value: 12 / 22,
                                                  strokeAlign:
                                                      CircularProgressIndicator
                                                          .strokeAlignOutside,
                                                  //  valueColor: Animacolor,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${controller.title1}',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColors.blue,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  '/${controller.title2}',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColors.grey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Text("${controller.title1}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: AppColors.blue,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16.sp)),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                                "${controller.title2}34346366",

                                                // overflow: TextOverflow.ellipsis,
                                                // textScaleFactor: ,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: AppColors.blue,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 22.62.sp)),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: controller.data[index]['circle']
                                      ? 18
                                      : 8.08,
                                ),
                                Text(
                                    '${controller.subTitle1}\n${controller.subTitle2}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp)),
                              ],
                            ),
                          );
                        }),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
