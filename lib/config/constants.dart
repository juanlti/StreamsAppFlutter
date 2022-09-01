import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const backendUrl = 'http://localhost:4000';
const apName = 'UpMovil';
const primaryColor = Color(0xFFDD50055);
const backGround = Color(0xff131031);
final backInput = Color(0xFFDD50055).withOpacity(0.1);

const logo = 'assets/svg/logo-upmovi-blanco.svg';
const IconLock = 'assets/svg/icono-de-candado.svg';
const IconEmail = 'assets/svg/icono-de-email.svg';
const IconPhone = 'assets/svg/icono-de-telefoo.svg';
const IconUser = 'assets/svg/icono-de-usuario.svg';
const IconCheckBox = 'assets/svg/Rectangle791.svg';
const IconGoogle = 'assets/svg/icono-de-google.svg';
const IconFacebook = 'assets/svg/icono-de-facebook.svg';
const IconDownMovie = 'assets/svg/peliculas.svg';
const IconDownSeries = 'assets/svg/series.svg';
const IconDownHome = 'assets/svg/home.svg';
const IconDownFragme = 'assets/svg/Frame.svg';
const IconDownUser = 'assets/svg/usuario.svg';
const IconNoImage = 'assets/svg/no-image.jpg';
const IconHeart = 'assets/svg/heartIcon.svg';
const IconMicrophone = 'assets/svg/microphone.svg';
const IconSearch = 'assets/svg/buscador.svg';
const IconArrowOut = 'assets/svg/ArrowOut.svg';
const IconPlay = 'assets/svg/play.svg';
const IconAvatar = 'assets/svg/Ellipse269.svg';

const ColorBackgroundTextFieldSearch = Color(0xffD9D9D9 % 20);
const defaultPadding = 24.0;

const colorTextInput = Colors.white;
const double widthInpuField = 350;
const logoSeeKey = 'assets/svg/Rectangle791.svg';

const urlFontRoboto =
    'https://fonts.googleapis.com/css2?family=Roboto&display=swap';
const IconData visibilityLogin = IconData(0xe6bd, fontFamily: 'MaterialIcons');
const IconData visibility_offLogin =
    IconData(0xe6be, fontFamily: 'MaterialIcons');

//consultar, como hacer para que textStyle sepa quien lo llama y asi cambiar la fondWeight
// default fondWeight all 700
TextStyle textStyle() {
  return TextStyle(
    color: Colors.white,
    fontFamily: urlFontRoboto,
    fontWeight: FontWeight.w700,
  );
}

class WidgetLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 82,
      child: SvgPicture.asset(logo, height: 40, semanticsLabel: 'logo'),
    );
  }
}

SizedBox customIcons(String aIcon) {
  return SizedBox(
    child: SvgPicture.asset(
      height: 30,
      width: 30,
      aIcon,
    ),
  );
}

SvgPicture IconsButton(String aIcon) {
  return SvgPicture.asset(
    height: 30,
    width: 30,
    aIcon,
  );
}

SvgPicture T(String aIcon) {
  return SvgPicture.asset(
    height: 50,
    width: 50,
    aIcon,
  );
}

Padding Categories(categories) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        '$categories',
        style: textStyle(),
      ),
    ),
  );
}

SvgPicture IconsButtonPlay(String aIcon) {
  return SvgPicture.asset(
    height: 250 / 2,
    width: 250 / 2,
    aIcon,
  );
}
