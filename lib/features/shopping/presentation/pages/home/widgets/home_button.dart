import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({
    Key? key,
    required this.label,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final int index;
  final Function() onTap;

  // AppPages _getCurrentPage() {
  //   switch (index) {
  //     case 0:
  //       return AppPages.cart;
  //     case 1:
  //       return AppPages.profile;
  //     case 2:
  //       return AppPages.checkout;
  //     default:
  //       return AppPages.home;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.amber[100],
          width: double.infinity,
          height: 50.h,
          child: Center(
              child: Text(
            label,
          )),
        ),
      ),
    );
  }
}
