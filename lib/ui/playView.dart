import 'package:flutter/material.dart';

import 'package:up_movi_devep/config/constants.dart';
import 'package:up_movi_devep/ui/movie_slider_ui.dart';

class PlayView extends StatelessWidget {
  const PlayView(
      {Key? key,
      this.categories,
      this.title,
      this.subTitle,
      this.resenia,
      this.id})
      : super(key: key);
  final String? categories;
  final String? title;
  final String? subTitle;
  final String? resenia;
  final int? id;

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeigth = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Categories(categories),
        Container(
          height: sizeHeigth * 0.4,
          width: sizeWidth,
          color: Colors.green,
          child: Stack(
            children: [
              Center(
                child: IconsButtonPlay(IconPlay),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        aling(Text(
          title ?? 'unTitulo',
          style: textStyle(),
        )),
        SizedBox(
          height: 10,
        ),
        aling(Text(
          subTitle ?? 'unSubtitulo',
          style: textStyle(),
        )),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: const BoxDecoration(
              color: Color(0xff16041C),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Flexible(
              flex: 2,
              child: overView(),
            ),
          ),
          width: sizeWidth * 0.8,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 200,
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: ((_, index) {
                  return listStart();
                })),
          ),
        ),
        aling(
          Container(
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Text(
              'Tambien puedes ver',
              style: textStyle(),
            ),
          ),
        ),
        Movie_Slider(context, 'Una Categoria'),
      ],
    );
  }

  Text overView() {
    return Text(
      'Magna culpa adipisicing labore eiusmod est non eu sunt. Non voluptate cupidatat Lorem in exercitation pariatur sint velit sunt minim sit cupidatat cillum. Adipisicing laborum commodo ullamco deserunt. Ea deserunt est enim proident cupidatat minim sint incididunt dolore tempor. Nisi consectetur irure cillum ea aute cillum. Consectetur nostrud nostrud sint eu magna mollit labore veniam amet minim mollit anim mollit e Magna culpa adipisicing labore eiusmod est non eu sunt. Non voluptate cupidatat Lorem in exercitation pariatur sint velit sunt minim sit cupidatat cillum. Adipisicing laborum commodo ullamco deserunt. Ea deserunt est enim proident cupidatat minim sint incididunt dolore tempor. Nisi consectetur irure cillum ea aute cillum. Consectetur nostrud nostrud sint eu magna mollit labore veniam amet minim mollit anim mollit e Magna culpa adipisicing labore eiusmod est non eu sunt. Non voluptate cupidatat Lorem in exercitation pariatur sint velit sunt minim sit cupidatat cillum. Adipisicing laborum commodo ullamco deserunt. Ea deserunt est enim proident cupidatat minim sint incididunt dolore tempor. Nisi consectetur irure cillum ea aute cillum. Consectetur nostrud nostrud sint eu magna mollit labore veniam amet minim mollit anim mollit e Magna culpa adipisicing labore eiusmod est non eu sunt. Non voluptate cupidatat Lorem in exercitation pariatur sint velit sunt minim sit cupidatat cillum. Adipisicing laborum commodo ullamco deserunt. Ea deserunt est enim proident cupidatat minim sint incididunt dolore tempor. Nisi consectetur irure cillum ea aute cillum. Consectetur nostrud nostrud sint eu magna mollit labore veniam amet minim mollit anim mollit e Magna culpa adipisicing labore eiusmod est non eu sunt. Non voluptate cupidatat Lorem in exercitation pariatur sint velit sunt minim sit cupidatat cillum. Adipisicing laborum commodo ullamco deserunt. Ea deserunt est enim proident cupidatat minim sint incididunt dolore tempor. Nisi consectetur irure cillum ea aute cillum. Consectetur nostrud nostrud sint eu magna mollit labore veniam amet minim mollit anim mollit e Magna culpa adipisicing labore eiusmod est non eu sunt. Non voluptate cupidatat Lorem in exercitation pariatur sint velit sunt minim sit cupidatat cillum. Adipisicing laborum commodo ullamco deserunt. Ea deserunt est enim proident cupidatat minim sint incididunt dolore tempor. Nisi consectetur irure cillum ea aute cillum. Consectetur nostrud nostrud sint eu magna mollit labore veniam amet minim mollit anim mollit e',
      style: textStyle(),
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
      textAlign: TextAlign.left,
    );
  }
}

@override
Widget aling(Widget aWidget) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: aWidget,
    ),
  );
}

Align alignTitleAndSub(String info) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Text(
        '${info}',
        style: textStyle(),
      ),
    ),
  );
}

Widget listStart() {
  return Icon(
    Icons.star_outline,
    size: 30,
    color: Colors.grey,
  );
}
