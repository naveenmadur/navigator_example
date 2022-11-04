import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigator_example/routes/pages_config.dart';
import 'package:navigator_example/routes/pages_delegate.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: GestureDetector(
        onTap: () {
          Provider.of<PageDelegate>(context, listen: false).setNewRoutePath(homeConfig);
          // isLogin(true);
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
