import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:up_movi_devep/config/constants.dart';
import 'package:up_movi_devep/config/responsive.dart';
import 'package:up_movi_devep/pages/app/movies/movie_provider.dart';
import 'package:up_movi_devep/pages/app/movies/movies_page.dart';

import 'package:up_movi_devep/pages/home_page.dart';
import 'package:up_movi_devep/ui/custom_Page_data.dart';
import 'package:up_movi_devep/ui/custom_navigator_bar.dart';

import 'package:up_movi_devep/ui/logo.dart';
import 'package:up_movi_devep/ui/playView.dart';

class AppView extends StatefulWidget {
  const AppView({required this.selectContenido, Key? key, required this.index, required PlayView child})
      : super(key: key);

  final Contenido selectContenido;
  final String index;
  @override
  State<AppView> createState() => _AppViewState();
}

/// Use the [AutomaticKeepAliveClientMixin] to keep the state, like scroll
/// position and text fields when switching tabs, as well as when popping back
/// from sub screens. To use the mixin override [wantKeepAlive] and call
/// `super.build(context)` in build.
///

class _AppViewState extends State<AppView> with AutomaticKeepAliveClientMixin {
  // Override `wantKeepAlive` when using `AutomaticKeepAliveClientMixin`.

  @override
  bool get wantKeepAlive => true;
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    // Call `super.build` when using `AutomaticKeepAliveClientMixin`.
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);

    super.build(context);
    return Scaffold(
      backgroundColor: backGround,
      drawer: testMenuLateral(false),

      ///testMenuLateral(false): null,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Row(children: [
                //tablet o computadora
                if (isTablet || isDesktop)
                  Expanded(
                    flex: 1,
                    child: SizedBox(width: 100, child: testMenuLateral(false)),
                  ),
                Expanded(
                  flex: 12,
                  child: Column(
                    children: [
                      Center(
                        child: Logo(200),
                      ),
                      Expanded(
                        flex: 1,
                        child: pageContents(),
                      ),
                      SizedBox(
                        height: 16,
                        width: 30,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {}, child: Text('Genero')),
                                TextButton(
                                    onPressed: () {},
                                    child: Text('Ultimas vistas')),
                                TextButton(
                                    onPressed: () {}, child: Text('Favoritos')),
                                TextButton(
                                    onPressed: () {}, child: Text('Popular')),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 12,
                          child: SingleChildScrollView(
                            child: widget.selectContenido.unWiget,
                          )),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),

                //row o column para varios componentes, caso contrario ninguno

                //fin si

                //Pagina contenido compartido (row, column, etc, menos scallfold)
                // Container(child: widget.selectContenido.unWiget),

                //row o column para varios componentes, caso contrario ninguno
              ]),
            ),
            if (isMobile)
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: testMenuLateral(isMobile))
          ],
        ),
      ),
    );
  }

  Drawer testMenuLateral(bool isMobile) => Drawer(
      backgroundColor: Colors.red,
      child: buttonNavigationAndDrawer(
        isMobil: isMobile,
        avatar: avatar(),
      ));

  void _tap(BuildContext context, int index) =>
      context.go('/app/${All.data[index].id}');
}

class buttonNavigationAndDrawer extends StatelessWidget {
  const buttonNavigationAndDrawer({
    Key? key,
    required this.isMobil,
    required this.avatar,
  }) : super(key: key);
  final bool isMobil;
  final Padding avatar;
  @override
  Widget build(BuildContext context) {
    //final movieProvider =Provider.of<MovieProvider>(context, listen: false).movie;
    return CustomNavigationBar(
      onTabChanged: (int value) {
        print('cual botton ? $value');
        switch (value) {
          case 0:
            return context.go('/app/${'Home'}');
          case 1:
            return context.go('/app/${'Movie'}');
          case 2:
            return context.go('/app/${'Serie'}');
          case 3:
            return context.go('/app/${'TvOnline'}');
          case 4:
            return context.go('/app/${'Perfil'}');
          default:
            return context.go('/app/${'HomePage'}');
        }
      },
      items: [
        customIcons(IconDownHome),
        customIcons(IconDownMovie),
        customIcons(IconDownSeries),
        customIcons(IconDownFragme),
        customIcons(IconDownUser),
        customIcons(IconArrowOut),
      ],
      isMobil: isMobil,
    );
  }
}

class Contenido {
  Contenido({
    required this.id,
    required this.name,
    required this.unWiget,
    this.aVideo,
  });

  final String id;
  final String name;
  final Widget unWiget;
  final List<Video>? aVideo;

  Video unVideo(int ide) => aVideo!.singleWhere(
        (element) => element.id == ide,
        orElse: () => throw Exception('unknown person $ide for family $id'),
      );
}

class All {
  static final data = [
    Contenido(
      id: 'Home',
      name: 'HomePage',
      unWiget: PlayView(),
    ),
    Contenido(
      
      id: 'Movie',
      name: 'Peliculas',
      unWiget: MoviesPage(id: 88,),
      aVideo: [
        Video(id: '88', name: 'Gladiador'),
        Video(id: '89', name: 'Batman'),
        Video(id: '90', name: 'RapidoYfurioso10'),
        Video(id: '91', name: 'Titanic'),
      ],
      //unWiget: PageMovies(),
    ),
    Contenido(
      id: 'Serie',
      name: 'Series',
      unWiget: PlayView(
        categories: 'UnaCategoria',
        resenia: 'informacion',
        title: 'unTitulo',
        subTitle: 'unSubtitulo',
      ),
    ),
    Contenido(
      id: 'TvOnline',
      name: 'TvOnline',
      unWiget: MoviesPage(),
    ),
    Contenido(
      id: 'Perfil',
      name: 'Perfil',
      unWiget: CustomPageData(), //PerfilPage(),
    ),
  ];
  static Contenido unContenido(String fid) {
    print('pagina home ? $fid');
    return data.unContenido(fid);
  }
}

extension on List<Contenido> {
  Contenido unContenido(String fid) => singleWhere(
        (f) => f.id == fid,
        orElse: () => throw Exception('unknown family $fid'),
      );
}

pageContents() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    height: 10,
    width: 300,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextFormField(
      autofocus: true,
      style: textStyle(),
      decoration: InputDecoration(
        prefixIcon: customIcons(IconSearch),
        suffixIcon: customIcons(IconMicrophone),
      ),
    ),
  );
}

class Video {
  Video({required this.id, required this.name});

  final String id;
  final String name;

  Widget? unTest;
}

Padding avatar() {
  return Padding(
    padding: const EdgeInsets.only(top: 40, bottom: 20, left: 10, right: 10),
    child: Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      direction: Axis.vertical,
      children: [
        CircleAvatar(
          child: T(IconAvatar),
        ),
        Text('UnUser'),
        Divider(
          color: Colors.black,
          thickness: 2,
        )
      ],
    ),
  );
}
