import 'package:disenos_curso/src/theme/theme.dart';
import 'package:disenos_curso/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red,),
              CustomRadialProgress(porcentaje: porcentaje * 1.2, color: Colors.greenAccent,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje * 4, color: Colors.pink,),
              CustomRadialProgress(porcentaje: porcentaje * 6, color: Colors.purple,),
            ],
          )
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double porcentaje;
  final Color color;

  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
  });


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    return Container(
      width: 180.0,
      height: 180.0,
      // color: Colors.red,
      child: RadialProgress(porcentaje: porcentaje, colorPrimario: color, colorSecundario: appTheme.textTheme.bodyText1.color, grosorPrimario: 10, grosorSecundario: 4),
    );
  }
}
