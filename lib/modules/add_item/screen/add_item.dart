import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secure_storage_demo/modules/add_item/controller/add_item_controller.dart';

import '../../../data/widget/c_button.dart';
import '../../../data/widget/c_textfield.dart';

class AddIitemScreen extends ConsumerStatefulWidget {
  const AddIitemScreen({super.key});

  @override
  ConsumerState<AddIitemScreen> createState() => _AddIitemScreenState();
}

class _AddIitemScreenState extends ConsumerState<AddIitemScreen> {
  late final AddItemController addItemController;
  @override
  void initState() {
    super.initState();
    addItemController = AddItemController(ref: ref);
    addItemController.key = TextEditingController();
    addItemController.value = TextEditingController();
  }

  @override
  void dispose() {
    addItemController.key.dispose();
    addItemController.value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              CTextfield(
                hintText: 'Key',
                controller: addItemController.key,
              ),
              SizedBox(
                height: 16.h,
              ),
              CTextfield(
                hintText: 'Value',
                controller: addItemController.value,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          bottom: 14.h,
        ),
        child: CButton(
          title: 'ADD',
          ontap: () {
            addItemController.set();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
