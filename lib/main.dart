import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_first_get_x/app/modules/dashboard/views/dashboard_view.dart';
import 'package:my_first_get_x/app/modules/login/views/login_view.dart';
import 'package:my_first_get_x/constants/app_colors.dart';

import 'app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: Builder(
        builder: (context) {
          return GetMaterialApp(
            theme: ThemeData(

            
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.offWhite,
              ),
              useMaterial3: true,
            
                fontFamily: 'Inter',
                textTheme: TextTheme(
                    bodySmall: GoogleFonts.inter(
                        color:  AppColors.blue,
                        fontWeight: FontWeight.w800,
                        fontSize: 16))),
    
            // title: "Application",
            // initialRoute: AppPages.INITIAL,
            // getPages: AppPages.routes,
            home: DashboardView(),
          );
        }
      ),
    ),
  );
}
