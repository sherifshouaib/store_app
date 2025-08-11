import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/styles.dart';

AppBar buildAppBar({final String? title, required BuildContext context}) {
  return AppBar(
    leading: Center(
      child: TextButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        child: Image.asset(
          'assets/images/btn_back.png',
          height: 20,
        ),
      ),
    ),
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.textStylecheckout25,
    ),
  );
}
