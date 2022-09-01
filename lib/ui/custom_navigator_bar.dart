import 'package:flutter/material.dart';
import 'package:up_movi_devep/config/responsive.dart';
import 'package:up_movi_devep/layouts/app_layout.dart';
import 'package:up_movi_devep/ui/buttomUi.dart';
import 'package:up_movi_devep/config/constants.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({
    Key? key,
    this.backGroundColor = primaryColor,
    required this.items,
    required this.onTabChanged,
    this.initialIndex,
    this.movement = 75,
    required this.isMobil,
  }) : super(key: key);
  Color backGroundColor;
  late final bool isMobil;
  final List<Widget> items;
  final ValueChanged<int> onTabChanged;
  final initialIndex;
  double movement;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  AnimationController? _controller = null;
  Animation? _animTabBarIn;
  Animation? _animTabBarOut;
  Animation? _animCircleItem;
  Animation? _animElevationInt;
  Animation? _animElevationOut;

  double sizeHeight = 50;
  final double sizeCircular = 20;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    
    _currentIndex = widget.initialIndex ?? 0;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animTabBarIn =
        CurveTween(curve: Interval(0.1, 0.6, curve: Curves.decelerate))
            .animate(_controller!);
    _animTabBarOut =
        CurveTween(curve: Interval(0.6, 1.0, curve: Curves.bounceInOut))
            .animate(_controller!);
    _animCircleItem =
        CurveTween(curve: Interval(0.0, 0.5)).animate(_controller!);
    _animElevationInt =
        CurveTween(curve: Interval(0.3, 0.5, curve: Curves.decelerate))
            .animate(_controller!);
    _animElevationOut =
        CurveTween(curve: Interval(0.55, 1.0, curve: Curves.bounceInOut))
            .animate(_controller!);
    _controller!.forward(from: 1.0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    double currenteWidth = sizeWidth;
    double currentElevation = 0.0;
    /*
    final isMobileTest = Responsive.isMobile(context);
    widget.isMobil = isMobileTest;
*/

    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: AnimatedBuilder(
          animation: _controller!,
          builder: (context, _) {
            currenteWidth = sizeWidth -
                ((widget.movement * _animTabBarIn!.value) -
                    (widget.movement * _animTabBarOut!.value));

            currentElevation = (-widget.movement * _animElevationInt!.value) +
                ((widget.movement - kBottomNavigationBarHeight / 3) *
                    _animElevationOut!.value);

            return Wrap(
              alignment: WrapAlignment.center,
              direction: widget.isMobil ? Axis.vertical : Axis.horizontal,
              children: [
                if (!widget.isMobil) avatar(),
                change(currentElevation)
              ],
            );
          }),
    );
  }

  Center change(double currentElevation) {
    return Center(
        child: Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 25,
      direction: widget.isMobil ? Axis.horizontal : Axis.vertical,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.items.length, (index) {
        final Widget childItem = widget.items[index];

        if (index == _currentIndex) {
          var offset2 = jumpDireccion(currentElevation, widget.isMobil);

          return CustomPaint(
            foregroundPainter: CustomCircleItemPainter(_animCircleItem!.value),
            child: Transform.translate(
              // offset: Offset(0.0, currentElevation), modificar segun corresponga
              //si es computadora mover eje x, y valor cero para y
              //ejemplo
              //offset: Offset(currentElevation, 0.0),
              //si es un celular mover eje  y, y valor cero para x
              //ejemplo
              // offset: Offset(0.0, currentElevation),
              offset: jumpDireccion(currentElevation, widget.isMobil),
              //Offset(-currentElevation, 0.0), //offset2,
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: primaryColor,
                  child: CircleAvatar(
                    child: childItem,
                    radius: 28,
                    backgroundColor: backGround,
                  )),
            ),
          );
        } else {
          return GestureDetector(
            onTap: (() {
              widget.onTabChanged(index);
              print('valor de boton $index');
              setState(() {
                _currentIndex = index;
              });
              _controller!.forward(from: 0.0);
              print('que boton? $_currentIndex');
            }),
            child: CircleAvatar(
                radius: 30.0, backgroundColor: primaryColor, child: childItem),
          );
        }
      }),
    ));
  }

  Offset jumpDireccion(double currentElevation, bool soyMobile) {
    print('estoy en veriicacion .. resultado entrante? ${soyMobile}');
    if (soyMobile) {
      print('soy telefono debe ser true == ${soyMobile}');
      return Offset(0.0, currentElevation);
    } else {
      return Offset(-currentElevation, 0.0);
    }
  }
}
