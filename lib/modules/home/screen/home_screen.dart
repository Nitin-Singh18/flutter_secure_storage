import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secure_storage_demo/data/model/model.dart';
import 'package:secure_storage_demo/modules/add_item/screen/add_item.dart';
import 'package:secure_storage_demo/modules/home/controller/home_controller.dart';
import 'package:secure_storage_demo/riverpod/state.dart';

import '../../../data/widget/c_button.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final HomeController homeController;
  @override
  void initState() {
    super.initState();

    homeController = HomeController(ref);
    homeController.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    List<Item> items = ref.watch(itemProvider).item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: items.isEmpty
          ? const Center(child: Text('Nothing to show'))
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = items[index];
                          return Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: ListTile(
                              title: Text(item.title),
                              subtitle: Text(item.des),
                              trailing: IconButton(
                                onPressed: () {
                                  homeController.deleteItem(item);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
          ontap: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AddIitemScreen()));
          },
        ),
      ),
    );
  }
}
