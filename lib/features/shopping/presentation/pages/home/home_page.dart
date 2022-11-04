import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigator_example/features/shopping/presentation/pages/home/widgets/home_button.dart';
import 'package:navigator_example/routes/pages_config.dart';
import 'package:navigator_example/routes/pages_delegate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const valueKey = ValueKey('HomePage');

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
            onTap: () {
              Provider.of<PageDelegate>(context, listen: false)
                  .setNewRoutePath(cartConfig);
            },
          ),
          HomeButtons(
            label: 'Profile',
            index: 1,
            onTap: () {
              Provider.of<PageDelegate>(context, listen: false)
                  .setNewRoutePath(profileConfig);
            },
          ),
          HomeButtons(
            label: 'Checkout',
            index: 2,
            onTap: () {
              Provider.of<PageDelegate>(context, listen: false)
                  .setNewRoutePath(checkoutConfig);
            },
          ),
        ]),
      ),
    );
  }
}
