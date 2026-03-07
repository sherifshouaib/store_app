import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/manager/banners_firestore_cubit/banners_firestore_cubit.dart';
import 'package:store_app/features/home/presentation/manager/banners_firestore_cubit/banners_firestore_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersFirestoreCubit, BannersFirestoreState>(
      listener: (context, state) {
        if (state is BannersFirestoreSuccess) {
          _preloadImages(state.banners);
        }
      },
      builder: (context, state) {
        if (state is BannersFirestoreLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is BannersFirestoreFailure) {
          return Center(child: Text(state.errmessage));
        }

        if (state is BannersFirestoreSuccess) {
          final banners = state.banners;

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

        return const SizedBox();
      },
    );
  }
}
