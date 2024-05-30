import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/display/display_view_model_cubit.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/upload/upload_view_model_cubit.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/login_view_model_cubit.dart';
import 'package:my_gallery/Presentation/views/home/home_screen.dart';
import 'package:my_gallery/Presentation/views/login/login_screen.dart';
import 'package:my_gallery/config/theme.dart';
import 'package:my_gallery/core/DI/di.dart';
import 'package:my_gallery/core/Utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 800),
      builder: (context, child) {
        return MaterialApp(
          routes: {
            Routes.loginScreen: (_) => BlocProvider(
                  create: (context) => getIt<LoginViewModel>(),
                  child: const LoginScreen(),
                ),
            Routes.homeScreen: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create:(context) => getIt<DisplayViewModel>(),
                    ),
                    BlocProvider(
                      create:  (context) => getIt<UploadViewModel>(),
                    ),
                  ],
                  child: HomeScreen(),
                )
          },
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.loginScreen,
          theme: ThemeDataMode.themeData,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
