import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonGordo(
      {this.icon = FontAwesomeIcons.circle,
      @required this.texto,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: <Widget>[
          _BotonGordoBackground(icon, color1, color2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 140.0,
                width: 40.0,
              ),
              FaIcon(icon, color: Colors.white, size: 40.0),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: Text(
                texto,
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(
                width: 40.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground(this.icon, this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
                right: -20.0,
                top: -20.0,
                child: FaIcon(icon,
                    size: 150, color: Colors.white.withOpacity(0.2)))
          ],
        ),
      ),
      width: double.infinity,
      height: 100.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          // color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: <Color>[color1, color2])),
    );
  }
}
