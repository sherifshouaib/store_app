import 'package:flutter/material.dart';

import 'about_us_item.dart';

class AboutUsListView extends StatelessWidget {
  AboutUsListView({super.key});

  final List aboutTextArr1 = [
    "Our Story",
    "Our Mission",
    "Our Values",
    " ",
    " ",
    " ",
    "Our Team",
    'Looking Ahead',
  ];

  final List aboutTextArr2 = [
    "Founded in 2021, Our Store began with a simple mission: to provide customers with a curated selection of top-quality products at competitive prices. What started as a small venture has grown into a trusted name in online retail, serving customers across Egypt.",
    "Our mission is to make shopping convenient, enjoyable, and accessible for everyone. We strive to offer a diverse range of products that cater to various tastes and preferences, ensuring that every customer finds something they love.",
    'Customer-Centric Approach: We prioritize our customers\' needs and satisfaction, aiming to exceed expectations with every purchase.',
    'Quality Assurance: We are committed to providing products that meet high-quality standards, ensuring durability and value.',
    'Innovation: We continuously seek innovative solutions to enhance the shopping experience, from user-friendly app features to exclusive deals.',
    'Community Engagement: We believe in giving back to the community and support various local initiatives and charities.',
    "Our dedicated team comprises professionals passionate about retail and technology. From product curators and customer service representatives to tech developers and logistics experts, each member plays a vital role in delivering an exceptional shopping experience.",
    "As we continue to grow, we remain focused on our core values and mission. We are excited about future expansions, new product lines, and innovative features that will further enhance your shopping journey.",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: aboutTextArr1.length,
      itemBuilder: ((context, index) {
        var txtt1 = aboutTextArr1[index] as String? ?? "";
        var txtt2 = aboutTextArr2[index] as String? ?? "";

        return AboutUsItem(
          indexNotificationItem: index,
          txt1: txtt1,
          txt2: txtt2,
        );
      }),
    );
  }
}
