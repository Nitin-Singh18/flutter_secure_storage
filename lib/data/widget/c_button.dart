import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const CButton({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        )),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
