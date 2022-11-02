import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigator_example/features/shopping/presentation/pages/home/widgets/home_button.dart';
import 'package:navigator_example/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.currentPage}) : super(key: key);
  final ValueChanged<AppPages> currentPage;
  static const valueKey = ValueKey('HomePage') ;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          HomeButtons(
            label: 'Cart',
            index: 0,
            currentPage: currentPage,
          ),
          HomeButtons(
            label: 'Profile',
            index: 1,
            currentPage: currentPage,
          ),
          HomeButtons(
            label: 'Checkout',
            index: 2,
            currentPage: currentPage,
          ),
        ]),
      ),
    );
  }
}
