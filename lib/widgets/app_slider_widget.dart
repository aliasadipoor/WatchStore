import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/res/dimens.dart';

final List<String> imgList = [
  "https://tiktakgallery.com/wp-content/uploads/2022/02/TICWATCH-PRO.jpg",
  "https://tiktakgallery.com/wp-content/uploads/2018/10/A1.391.14.838...jpg",
  "https://tiktakgallery.com/wp-content/uploads/2018/10/CATERPILLAR-LE.111.27.137...jpg",
  "https://tiktakgallery.com/wp-content/uploads/2022/03/GARMIN-Garmin-FORERUNNER-45S-LRIS-01.jpg",
];

class AppSliderWidget extends StatefulWidget {
  const AppSliderWidget({
    super.key,
    required this.imgList,
  });
  final List<String> imgList;
  @override
  State<AppSliderWidget> createState() => _AppSliderWidgetState();
}

class _AppSliderWidgetState extends State<AppSliderWidget> {
  final CarouselController _controller = CarouselController();
  final List<Widget> items = imgList
      .map((e) => Padding(
            padding: const EdgeInsets.all(AppDimens.medium),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.medium),
                child: Image.network(
                  e,
                  fit: BoxFit.cover,
                )),
          ))
      .toList();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            items: items,
            options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList
                  .asMap()
                  .entries
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => _controller.animateToPage(e.key),
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == e.key
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
