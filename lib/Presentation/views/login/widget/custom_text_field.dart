import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ValidationFieled = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintName,
    this.isSecure,
    this.sufix,
    required this.validator,
    required this.controller,
  });
  final String hintName;
  final bool? isSecure;
  final Widget? sufix;
  final ValidationFieled validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      //basic styles
      cursorWidth: 2,
      cursorHeight: 22,
      style: Theme.of(context).textTheme.labelSmall,
      obscureText: isSecure ?? false,
      cursorColor: Colors.deepPurple[500]!,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        //colors
        fillColor: const Color(0xffF7F7F7),
        filled: true,
        //hint
        hintText: hintName,
        hintStyle: Theme.of(context).textTheme.bodySmall,
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
