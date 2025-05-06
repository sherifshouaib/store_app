import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/styles.dart';

AppBar buildAppBar({ final String? title}) {
    return AppBar(
      leading: Center(
        child: SvgPicture.asset(
          'assets/images/arrow.svg',
          height: 20,
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

