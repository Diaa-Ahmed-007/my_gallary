import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/upload/upload_provider.dart';
import 'package:my_gallery/Presentation/views/home/widget/custom_button.dart';
import 'package:my_gallery/Presentation/views/home/widget/upload_buttons_widget.dart';
import 'package:my_gallery/core/Utils/assets.dart';
import 'package:my_gallery/core/Utils/routes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UploadProvider uploadProvider = Provider.of<UploadProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.homeBackground), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 70.h,
          title: Text(
            "Welcome\nMina",
            style: GoogleFonts.baloo2(
                color: const Color(0xff4A4A4A),
                fontSize: 24.sp,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 24.w,
              ),
              //user will upload his/her avatar photo here
              child: Image.asset("assets/home_images/Ellipse 1641.png"),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                uploadProvider.changeIsShown(false);
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        imagePath: Assets.logoutIcon,
                        title: "log out",
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.loginScreen);
                        },
                        shadowColor: Colors.red,
                      ),
                      CustomButton(
                        imagePath: Assets.uploadIcon,
                        title: "Upload",
                        onTap: () {
                          uploadProvider.changeIsShown(true);
                        },
                        shadowColor: Colors.orange,
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                            "assets/home_images/listview/${index + 1}.png");
                      },
                      itemCount: 18,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: uploadProvider.isShown,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  height: 250.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UploadButtonsWidget(
                        image: SvgPicture.asset(
                            "assets/home_images/gallery.svg"),
                        title: "Gellary",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      UploadButtonsWidget(
                        image: Image.asset(
                          "assets/home_images/camera.png",
                        ),
                        title: "Camera",
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
