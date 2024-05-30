import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/Presentation/view_models/bloc_observer.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/upload/upload_provider.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/pass_provider.dart';
import 'package:my_gallery/core/DI/di.dart';
import 'package:my_gallery/core/api/api_manger.dart';
import 'package:my_gallery/my_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
   ApiManager.init();
   
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PasswordProvider()),
      ChangeNotifierProvider(create:  (context) => UploadProvider(),),
    ],
    child: const MyApp()));
 
}
// "email": "naufderhar@example.com",
// "password": "password"