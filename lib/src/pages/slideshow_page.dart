import 'package:disenos_curso/src/theme/theme.dart';
import 'package:disenos_curso/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // final layoutModel = Provider.of<LayoutModel>(context);

    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow())
        ];

    return Scaffold(
      // backgroundColor: Colors.black,
      body: isLarge ? Column(
        children: children,
      ) : Row(
        children: children,
      )
    );
  }
}

class MiSlideshow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme =  Provider.of<ThemeCharger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      bulletPrimario: 20.0,
      bulletSecundario: 12.0,
      // puntosArriba: true,
      colorPrimario: appTheme.darkTheme ? accentColor : Color(0xffFF5A7E),
      // colorSecundario: Colors.black,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-1.svg'),
      ],
    );
  }
}