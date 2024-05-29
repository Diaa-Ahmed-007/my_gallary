import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/pass_provider.dart';
import 'package:my_gallery/Presentation/views/login/widget/custom_text_field.dart';
import 'package:my_gallery/core/Utils/assets.dart';
import 'package:my_gallery/core/Utils/routes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordProvider passwordProvider = Provider.of<PasswordProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              Assets.loginBackground,
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SizedBox(
              height: 800.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "My",
                    style: GoogleFonts.rubik(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff4A4A4A),
                    ),
                  ),
                  Text(
                    "Gellary",
                    style: GoogleFonts.rubik(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff4A4A4A),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.r),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 70.h),
                      margin: EdgeInsets.all(20.w),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 1),
                        child: Column(
                          children: [
                            Text(
                              "LOG IN",
                              style: GoogleFonts.rubik(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff4A4A4A),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const CustomTextField(
                              hintName: "User Name",
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextField(
                              hintName: 'Password',
                              isSecure: passwordProvider.passSecure,
                              sufix: passwordProvider.passSecure
                                  ? IconButton(
                                      onPressed: () {
                                        passwordProvider.changePassSecure(
                                            !passwordProvider.passSecure);
                                      },
                                      icon: const Icon(
                                        Icons.visibility_off,
                                      ),
                                      enableFeedback: false,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        passwordProvider.changePassSecure(
                                            !passwordProvider.passSecure);
                                      },
                                      icon: const Icon(Icons.visibility),
                                      enableFeedback: false,
                                    ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 40.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff7BB3FF),
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.homeScreen);
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
