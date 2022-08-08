import 'package:flutter/material.dart';

class ColorStyles {
  Color blue90, blue40, blue5;
  Color black90, black70, black50, black30, black10;
  Color grey50, grey10, grey5;
  Color accentPink, accentPurple;
  Color blueLink;

  ColorStyles({
    required this.blue90,
    required this.blue40,
    required this.blue5,
    required this.black90,
    required this.black70,
    required this.black50,
    required this.black30,
    required this.black10,
    required this.grey50,
    required this.grey10,
    required this.grey5,
    required this.accentPink,
    required this.accentPurple,
    required this.blueLink,
  });
}

var colorStyles = ColorStyles(
  blue90: const Color(0xff0078D4),
  blue40: const Color(0xff5FC9E3),
  blue5: const Color(0xffEFF6FC),
  black90: const Color(0xff212121),
  black70: const Color(0xff484848),
  black50: const Color(0xff5B5B5B),
  black30: const Color(0xff7D7D7D),
  black10: const Color(0xffC4C4C4),
  grey50: const Color(0xffE0E0E0),
  grey10: const Color(0xffF1F1F1),
  grey5: const Color(0xffECEFF4),
  accentPink: const Color(0xffC697A1),
  accentPurple: const Color(0xff5C43F9),
  blueLink: const Color(0xff3EA6FF),
);

class DecorationLanding {
  String img1, img2, img3;
  String map;
  DecorationLanding({
    required this.img1,
    required this.img2,
    required this.img3,
    required this.map,
  });
}

var decorImg = DecorationLanding(
  img1: 'assets/imgs/r1.png',
  img2: 'assets/imgs/r2.png',
  img3: 'assets/imgs/r3.png',
  map: 'assets/imgs/map.png',
);
Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
    MaterialState.selected
  };
  if (states.any(interactiveStates.contains)) {
    return colorStyles.blue40;
  }
  return colorStyles.grey50;
}
