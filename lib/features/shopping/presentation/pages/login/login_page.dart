import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigator_example/features/shopping/presentation/pages/login/widgets/login_button.dart';
import 'package:navigator_example/features/shopping/presentation/pages/login/widgets/username_and_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.h, left: 20.w, right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UserNameAndPassword(
              labelText: 'UserName',
            ),
            const UserNameAndPassword(
              labelText: 'Password',
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const Text('Forgot Password?'),
            ),
            const LoginButton(),
          ],
        ),
      ),
    );
  }
}
