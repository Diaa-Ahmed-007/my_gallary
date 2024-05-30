import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/display/display_view_model_cubit.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/display/display_view_model_state.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/upload/upload_provider.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/upload/upload_view_model_cubit.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/upload/upload_view_model_state.dart';
import 'package:my_gallery/Presentation/views/home/widget/custom_button.dart';
import 'package:my_gallery/Presentation/views/home/widget/upload_buttons_widget.dart';
import 'package:my_gallery/core/Utils/assets.dart';
import 'package:my_gallery/core/Utils/routes.dart';
import 'package:my_gallery/data/models/login/LoginResponse.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    File? file;
    late LoginResponse loginResponse =
        ModalRoute.of(context)?.settings.arguments as LoginResponse;
    UploadProvider uploadProvider = Provider.of<UploadProvider>(context);
    DisplayViewModel.get(context).display(token: loginResponse.token ?? "");
    return BlocListener<UploadViewModel, UploadViewModelState>(
      listener: (context, state) {
        if (state is UploadViewModeSuccess) {
          uploadProvider.changeIsShown(false);
        }
        if (state is UploadViewModeError) {
          log("error");
        }
        showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        Navigator.pop(context);
      },
      child: Container(
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
              "Welcome\n${loginResponse.user?.name ?? ""}",
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
                    BlocBuilder<DisplayViewModel, DisplayViewModelState>(
                      builder: (context, state) {
                        if (state is DisplayViewModeSuccess) {
                          List<String> images =
                              state.galleryResponse.data?.images ?? [];
                          return Expanded(
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Image.network(images[index]);
                              },
                              itemCount: images.length,
                            ),
                          );
                        }
                        if (state is DisplayViewModeError) {
                          log(state.error);
                        }
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        );
                      },
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
                          onTap: () async {
                            XFile? xfile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            file = File(xfile?.path ?? "");
                            log(file.toString());
                            UploadViewModel.get(context).upload(
                                filePath: xfile?.path ?? "",
                                token: loginResponse.token ?? "");
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        UploadButtonsWidget(
                          image: Image.asset(
                            "assets/home_images/camera.png",
                          ),
                          title: "Camera",
                          onTap: () async {
                            XFile? xfile = await ImagePicker()
                                .pickImage(source: ImageSource.camera);
                            file = File(xfile?.path ?? "");
                            log(file.toString());
                            UploadViewModel.get(context).upload(
                                filePath: xfile?.path ?? "",
                                token: loginResponse.token ?? "");
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
