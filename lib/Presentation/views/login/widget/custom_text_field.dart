import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/pass_provider.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintName,
    this.isSecure,
    this.sufix,
  });
  final String hintName;
  final bool? isSecure;
  final Widget? sufix;
  @override
  Widget build(BuildContext context) {
    PasswordProvider passwordProvider = Provider.of<PasswordProvider>(context);
    return TextFormField(
      //basic styles
      cursorWidth: 2,
      cursorHeight: 22,
      style: const TextStyle(),
      obscureText: isSecure ?? false,
      cursorColor: Colors.deepPurple[500]!,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        //colors
        fillColor: const Color(0xffF7F7F7),
        filled: true,
        //hint
        hintText: hintName,
        hintStyle: const TextStyle(fontSize: 18, color: Colors.grey),
        //suffixIcon widget
        suffixIcon: sufix,
        suffixIconColor: Colors.grey,
        //borders
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.r),
          borderSide: const BorderSide(color: Color(0xffF7F7F7), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.r),
          borderSide: const BorderSide(color: Color(0xffF7F7F7), width: 2),
        ),
      ),
    );
  }
}
