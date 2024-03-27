import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FacAnnouncementSlider extends StatefulWidget {
  const FacAnnouncementSlider({
    super.key,
    required this.announcements,
  });

  final List<String> announcements;

  @override
  State<FacAnnouncementSlider> createState() => _FacAnnouncementSliderState();
}

class _FacAnnouncementSliderState extends State<FacAnnouncementSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: MediaQuery.of(context).size.width / 185,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
      ),
      items: widget.announcements.map(
        (announcement) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0x999B9B9B)),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        announcement,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0D6858),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
