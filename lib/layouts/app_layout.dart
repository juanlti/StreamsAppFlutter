import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:up_movi_devep/config/constants.dart';
import 'package:up_movi_devep/config/responsive.dart';
import 'package:up_movi_devep/pages/app/movies/movies_page.dart';
import 'package:up_movi_devep/pages/home_page.dart';

import 'package:up_movi_devep/ui/custom_navigator_bar.dart';

class AppView extends StatefulWidget {
  const AppView({required this.selectContenido, Key? key, required this.index})
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
      appBar: Tab(
        text: ('donde estoy ? ${widget.selectContenido.name}'),
      ),
      body: Stack(
        children: [
          Container(
              constraints: const BoxConstraints.expand(),
              child: Row(children: [
                if (isDesktop || isTablet)
                  //tablet o computadora

                  Container(
                    width: 200,
                    height: 500,
                    child: Text('ESTOY EN PC O TABLET'),
                  ),
              ])),

          //row o column para varios componentes, caso contrario ninguno

          //fin si

          //Pagina contenido compartido (row, column, etc, menos scallfold)
          Container(child: widget.selectContenido.unWiget),
          if (isMobile)
            //telefono
            Container(
              //row o column para varios componentes, caso contrario ninguno
              width: 300,
              height: 300,
              child: Text('ESTOY EN CELULAR'),
            ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        initialIndex: indexPage,
        items: [
          customIcons(IconDownHome),
          customIcons(IconDownMovie),
          customIcons(IconDownSeries),
          customIcons(IconDownFragme),
          customIcons(IconDownUser),
        ],
        onTabChanged: (int value) {
          setState(() {
            print('pagina => $value');
            _tap(context, value);
          });
        },
      ),
    );
  }

  void _tap(BuildContext context, int index) =>
      context.go('/app/${All.data[index].id}');
}

class Contenido {
  Contenido({
    required this.id,
    required this.name,
    required this.unWiget,
  });

  final String id;
  final String name;
  final Widget unWiget;
}

class All {
  static final data = [
    Contenido(
      id: '0',
      name: 'HomePage',
      unWiget: HomePage(),
    ),
    Contenido(
      id: '1',
      name: 'Peliculas',
      unWiget: MoviesPage(),
      //unWiget: PageMovies(),
    ),
    Contenido(
      id: '2',
      name: 'Series',
      unWiget: MoviesPage(),
    ),
    Contenido(
      id: '3',
      name: 'TvOnline',
      unWiget: MoviesPage(),
    ),
    Contenido(
      id: '4',
      name: 'Perfil',
      unWiget: MoviesPage(),
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
  Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    height: 50,
    width: 350,
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
