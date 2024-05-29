import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/upload/upload_provider.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/pass_provider.dart';
import 'package:my_gallery/Presentation/views/home/home_screen.dart';
import 'package:my_gallery/Presentation/views/login/login_screen.dart';
import 'package:my_gallery/core/Utils/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 800),
      builder: (context, child) {
        return MaterialApp(
          routes: {
            Routes.loginScreen: (_) => ChangeNotifierProvider(
              create: (context) => PasswordProvider(),
              child: const LoginScreen()),
            Routes.homeScreen: (_) => ChangeNotifierProvider(
              create: (context) => UploadProvider(),
              child: const HomeScreen()),
          },
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.loginScreen,
        );
      },
    );
  }
}
