import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadButtonsWidget extends StatelessWidget {
  const UploadButtonsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final Widget image;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        onPressed: onTap,
        child: Row(
          children: [
            image,
            Text(title),
          ],
        ),
      ),
    );
  }
}
