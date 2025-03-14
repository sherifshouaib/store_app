import 'package:flutter/material.dart';

import 'about_us_list_view.dart';
import 'custom_main_headline.dart';
import 'upper_body_of_about_us.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 46,
            ),
            const UpperBodyOfAboutUs(),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: CustomMainHeadline(
                txt1:
                    'Welcome to our App, your premier destination for a diverse selection of high-quality products. Whether you\'re seeking the latest gadgets, stylish apparel, or unique home decor, our app offers a seamless shopping experience tailored to your needs.',
              ),
            ),
            AboutUsListView(),
            const CustomMainHeadline(txt1: 'Thank you for choosing Our App. We look forward to serving you and making your shopping experience memorable.')
          ],
        ),
      ),
    );
  }
}
