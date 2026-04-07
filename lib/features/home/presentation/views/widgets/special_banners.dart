import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/widgets/animation_slider_dot.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_banner.dart';

class SpecialBanners extends StatefulWidget {
  const SpecialBanners({super.key});

  @override
  State<SpecialBanners> createState() => _SpecialBannersState();
}

class _SpecialBannersState extends State<SpecialBanners> {
  int currentIndex = 0;

  void _preloadImages(List<String> banners) {
    for (final banner in banners) {
      precacheImage(CachedNetworkImageProvider(banner), context);
    }
  }

  final List<String> banners = [
    'assets/images/banners_images/banner1.webp',
    'assets/images/banners_images/banner2.webp',
    'assets/images/banners_images/banner3.webp',
    'assets/images/banners_images/banner4.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((banner) {
            return CustomBanner(banner: banner);
          }).toList(),
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 3),
            // autoPlayAnimationDuration: const Duration(milliseconds: 600),
            // enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        AnimationSliderDot(banners: banners, currentIndex: currentIndex)
      ],
    );
  }
}
