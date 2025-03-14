import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import 'custom_headline_details.dart';
import 'custom_main_headline.dart';

class AboutUsItem extends StatelessWidget {
  const AboutUsItem({
    super.key,
    required this.indexNotificationItem,
    required this.txt1,
    required this.txt2,
  });

  final int indexNotificationItem;
  final String txt1, txt2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMainHeadline(txt1: txt1,),
        CustomHeadlineDetails(txt2: txt2),
      ],
    );
  }
}

