import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/login_view_model_cubit.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/login_view_model_state.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/pass_provider.dart';
import 'package:my_gallery/Presentation/views/login/widget/custom_text_field.dart';
import 'package:my_gallery/Presentation/views/login/widget/password_text_field.dart';
import 'package:my_gallery/core/Utils/assets.dart';
import 'package:my_gallery/core/Utils/routes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formfkey = GlobalKey();
    return BlocListener<LoginViewModel, LoginViewModelState>(
      listener: (context, state) {
        if (state is LoginViewModeSuccess) {
          Navigator.pushReplacementNamed(context, Routes.homeScreen,
              arguments: state.loginResponse);
        }
        if (state is LoginViewModeError) {
          Navigator.pop(context);
          Future.delayed(
            const Duration(seconds: 1),
            () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.error),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black26),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("try again"),
                      ),
                    ],
                  );
                },
              );
            },
          );
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
              image: AssetImage(
                Assets.loginBackground,
              ),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Form(
            key: formfkey,
            child: ListView(
              children: [
                SizedBox(
                  height: 800.h,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "Gellary",
                        style: Theme.of(context).textTheme.bodyLarge,
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
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomTextField(
                                  hintName: "User Name",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "this field can't be empty";
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                PasswordTextFieldWidget(passwordController: passwordController),
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
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (formfkey.currentState?.validate() ??
                                          false) {
                                        LoginViewModel login =
                                            LoginViewModel.get(context);
                                        login.login(emailController.text,
                                            passwordController.text);
                                      }
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
        ),
      ),
    );
  }
}
