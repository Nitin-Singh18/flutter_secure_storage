// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../modules/home/controller/home_controller.dart';
// import 'c_textfield.dart';

// Widget dialog(BuildContext context, TextEditingController key,
//     TextEditingController value, WidgetRef ref) {
//   final HomeController _homeController = HomeController(ref);
//   return AlertDialog(
//     content: CTextfield(
//       hintText: 'Enter',
//       controller: key,
//     ),
//     title: CTextfield(
//       hintText: 'Enter',
//       controller: value,
//     ),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(5.r),
//     ),
//     actions: <Widget>[
//       TextButton(
//         onPressed: () {
//           _homeController.set();

//           Navigator.pop(context, 'Save');
//         },
//         child: const Text(
//           'Save',
//           style: TextStyle(color: Colors.red),
//         ),
//       ),
//       TextButton(
//         onPressed: () {
//           Navigator.pop(context, 'Cancel');
//         },
//         child: const Text(
//           'Cancel',
//         ),
//       ),
//     ],
//   );
// }
