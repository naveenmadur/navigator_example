import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UserNameAndPassword extends StatelessWidget {
  const UserNameAndPassword({
    Key? key,
    required this.labelText
  }) : super(key: key);
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 10.h),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
