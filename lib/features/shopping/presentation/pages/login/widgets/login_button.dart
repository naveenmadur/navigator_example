import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.isLogin
  }) : super(key: key);
  final ValueChanged<bool> isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: GestureDetector(
        onTap: () {
          isLogin(true);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.teal[200],
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 80.w),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
