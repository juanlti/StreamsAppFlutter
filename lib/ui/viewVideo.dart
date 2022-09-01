import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:up_movi_devep/config/constants.dart';
import 'package:up_movi_devep/layouts/app_layout.dart';
import 'package:up_movi_devep/ui/movie_slider_ui.dart';
import 'package:up_movi_devep/ui/playView.dart';

class ViewVideo extends StatelessWidget {
  const ViewVideo({Key? key, required this.categories, required this.id})
      : super(key: key);
  final String categories;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.go('/Home');
 
      },
      child: Column(
        children: [
          Categories(categories),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.red,
            height: 400,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Swiper(
              itemBuilder: (context, index) {
                return FadeInImage(
                    fit: BoxFit.cover,
                    placeholder:
                        AssetImage('https://via.placeholder.com/300x400'),
                    image: NetworkImage('https://via.placeholder.com/300x400'));
              },
              autoplay: false,
              itemCount: 5,
              pagination: const SwiperPagination(),
              control: const SwiperControl(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Movie_Slider(context, 'Movies'),
          Movie_Slider(context, 'Movies'),
          Movie_Slider(context, 'Movies'),
        ],
      ),
    );
  }
}
