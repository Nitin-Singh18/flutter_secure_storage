import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CTextfield extends StatefulWidget {
  final String hintText;

  final TextEditingController controller;
  const CTextfield({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<CTextfield> createState() => _CTextfieldState();
}

class _CTextfieldState extends State<CTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: false,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2),
        ),
      ),
    );
  }
}
