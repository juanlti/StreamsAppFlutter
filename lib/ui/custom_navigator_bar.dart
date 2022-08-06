import 'package:flutter/material.dart';
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
  }) : super(key: key);
  Color backGroundColor;
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

            return Center(
              child: Container(
                width: currenteWidth,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    )),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: List.generate(widget.items.length, (index) {
                    final Widget childItem = widget.items[index];

                    if (index == _currentIndex) {
                      return CustomPaint(
                        foregroundPainter:
                            CustomCircleItemPainter(_animCircleItem!.value),
                        child: Transform.translate(
                          offset: Offset(0.0, currentElevation),
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
                            radius: 30.0,
                            backgroundColor: primaryColor,
                            child: childItem),
                      );
                    }
                  }),
                ),
              ),
            );
          }),
    );
  }
}
