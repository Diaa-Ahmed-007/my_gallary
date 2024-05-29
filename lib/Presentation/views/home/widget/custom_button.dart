import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    required this.shadowColor,
  });
  final String imagePath;
  final String title;
  final Function() onTap;
  final Color shadowColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: onTap,
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 8,
                          offset:
                              const Offset(-5, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(imagePath)),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff4A4A4A),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
